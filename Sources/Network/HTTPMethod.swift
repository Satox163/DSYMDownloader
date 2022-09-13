//
//  HTTPMethod.swift
//  
//
//  Created by Dmitriy Anokhin on 12.09.2022.
//

struct HTTPMethod: RawRepresentable, Equatable, Hashable {
    /// `CONNECT` method.
    static let connect = HTTPMethod(rawValue: "CONNECT")
    /// `DELETE` method.
    static let delete = HTTPMethod(rawValue: "DELETE")
    /// `GET` method.
    static let get = HTTPMethod(rawValue: "GET")
    /// `HEAD` method.
    static let head = HTTPMethod(rawValue: "HEAD")
    /// `OPTIONS` method.
    static let options = HTTPMethod(rawValue: "OPTIONS")
    /// `PATCH` method.
    static let patch = HTTPMethod(rawValue: "PATCH")
    /// `POST` method.
    static let post = HTTPMethod(rawValue: "POST")
    /// `PUT` method.
    static let put = HTTPMethod(rawValue: "PUT")
    /// `QUERY` method.
    static let query = HTTPMethod(rawValue: "QUERY")
    /// `TRACE` method.
    static let trace = HTTPMethod(rawValue: "TRACE")

    let rawValue: String

    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
