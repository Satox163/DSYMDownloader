//
//  BuildsDTO.swift
//  
//
//  Created by Dmitriy Anokhin on 12.09.2022.
//

import Foundation

struct BuildsDTO: Codable {
    let data: [Datum]
    let included: [Included]
}

extension BuildsDTO {
    struct Datum: Codable {
        let type: String
        let id: String
        let attributes: DatumAttributes
    }
    struct Included: Codable {
        let type: String
        let id: String
        let attributes: IncludedAttributes
    }
}

extension BuildsDTO.Datum {
    enum ProcessingState: String, Codable {
        case processing = "PROCESSING"
        case failed = "FAILED"
        case invalid = "INVALID"
        case valid = "VALID"
    }

    struct DatumAttributes: Codable {
        let processingState: ProcessingState
    }
}

extension BuildsDTO.Included {
    struct IncludedAttributes: Codable {
        let bundleId: String
        let bundleType: String
        let sdkBuild: String
        let platformBuild: String
        let fileName: String
        let hasSirikit: Bool
        let hasOnDemandResources: Bool
        let hasPrerenderedIcon: Bool
        let usesLocationServices: Bool
        let isIosBuildMacAppStoreCompatible: Bool
        let includesSymbols: Bool
        let dSYMUrl: URL?
        let supportedArchitectures: [String]
        let requiredCapabilities: [String]
        let locales: [String]
    }
}
