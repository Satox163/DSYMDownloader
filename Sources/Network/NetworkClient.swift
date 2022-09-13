//
//  NetworkClient.swift
//  
//
//  Created by Dmitriy Anokhin on 12.09.2022.
//

import Foundation
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

final class NetworkClient {
    private let config: APIConfiguration
    private let session = URLSession(configuration: .default)

    private let decoder = JSONDecoder()
    private let requestsAuthenticator: JWTRequestsAuthenticator

    private lazy var dsymURLRequest: URLRequest? = {
        var components = URLComponents(string: "https://api.appstoreconnect.apple.com/v1/builds")
        components?.queryItems = [
            .init(name: "filter[app]", value: config.appID),
            .init(name: "fields[builds]", value: "processingState"),
            .init(name: "include", value: "buildBundles"),
            .init(name: "limit", value: "5")
        ]
        var request = components?.url.map { URLRequest(url: $0) }
        request?.httpMethod = HTTPMethod.get.rawValue
        return request
    }()

    init(config: APIConfiguration) {
        self.config = config
        self.requestsAuthenticator = JWTRequestsAuthenticator(apiConfiguration: config)
    }

    func getLatestDSYMUrl() async throws -> BuildsDTO {
        guard let dsymURLRequest = dsymURLRequest else {
            fatalError()
        }
        let request = try requestsAuthenticator.adapt(dsymURLRequest)
        let (data, _) = try await session.data(for: request)
        return try decoder.decode(BuildsDTO.self, from: data)
    }

    func downloadArchive(url: URL) async throws -> URL {
        let (localURL, _) = try await session.download(from: url)
        return localURL
    }
}
