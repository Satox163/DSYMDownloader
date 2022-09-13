// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DsymDownloader",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "DsymDownloader",
            targets: ["DsymDownloader"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.0.0"),
        .package(url: "https://github.com/LebJe/TOMLKit.git", from: "0.5.0"),
        .package(url: "https://github.com/kylef/PathKit.git", from: "1.0.1"),
    ],
    targets: [
        .executableTarget(
            name: "DsymDownloader",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "TOMLKit", package: "TOMLKit"),
                .product(name: "PathKit", package: "PathKit"),
            ],
            path: "Sources"
        )
    ]
)
