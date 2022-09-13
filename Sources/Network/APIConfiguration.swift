//
//  APIConfiguration.swift
//  
//
//  Created by Dmitriy Anokhin on 12.09.2022.
//

struct APIConfiguration {
    /// Your private key ID from App Store Connect (Ex: 2X9R4HXF34)
    let privateKeyID: String

    let privateKey: String

    /// Your issuer ID from the API Keys page in App Store Connect (Ex: 57246542-96fe-1a63-e053-0824d011072a)
    let issuerID: String

    /// Your app ID
    let appID: String

    /// Creates a new API configuration to use for initialising the API Provider.
    ///
    /// - Parameters:
    ///   - privateKeyID: Your private key ID from App Store Connect (Ex: 2X9R4HXF34)
    ///   - issuerID: Your issuer ID from the API Keys page in App Store Connect (Ex: 57246542-96fe-1a63-e053-0824d011072a)
    init(issuerID: String, privateKeyID: String, privateKey: String, appID: String) {
        self.privateKeyID = privateKeyID
        self.privateKey = privateKey
        self.issuerID = issuerID
        self.appID = appID
    }
}
