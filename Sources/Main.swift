//
//  Main.swift
//  
//
//  Created by Dmitriy Anokhin on 10.09.2022.
//
import ArgumentParser
import TOMLKit
import PathKit
import Foundation

@main
struct Main: AsyncParsableCommand {
    @Option(name: .customLong("configFilePath"), help: "config toml file path")
    var configFilePath: String

    @Option(name: .customLong("outputPath"))
    var outputPath: String

    private struct Config: Codable {
        let issuer_id: String
        let private_key_id: String
        let private_key: String
        let app_id: String
    }

    mutating func run() async throws {
        let path = (Path.current + Path(configFilePath))
        let content = try String(contentsOfFile: path.string)
        let config = try TOMLDecoder().decode(Config.self, from: content)

        let configuration = APIConfiguration(
            issuerID: config.issuer_id,
            privateKeyID: config.private_key_id,
            privateKey: config.private_key,
            appID: config.app_id
        )
        let networkClient = NetworkClient(config: configuration)
        
        let builds = try await networkClient.getLatestDSYMUrl()
        var urls = [URL]()
        urls.reserveCapacity(builds.included.count)

        zip(builds.data, builds.included).forEach { data, included in
            if data.attributes.processingState == .valid,
               let dSYMUrl = included.attributes.dSYMUrl {
                urls.append(dSYMUrl)
            }
        }
        guard urls.isEmpty == false else {
            return
        }
        await saveArchives(
            networkClient: networkClient,
            outputhPath: outputPath,
            urls: urls
        )
    }

    func saveArchives(
        networkClient: NetworkClient,
        outputhPath: String,
        urls: [URL]
    ) async {
        await withThrowingTaskGroup(of: Void.self, body: { group in
            for (index, url) in urls.enumerated() {
                group.addTask {
                    let localURL = try await networkClient.downloadArchive(url: url)
                    let destionationPath = URL(fileURLWithPath: outputhPath).appendingPathComponent("appDSYM_\(index).zip")
                    try FileManager.default.moveItem(at: localURL, to: destionationPath)
                }
            }
        })
    }
}
