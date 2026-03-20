// swift-tools-version: 6.2
// Copyright Ryan Francesconi. All Rights Reserved. Revision History at https://github.com/ryanfrancesconi

import PackageDescription

let package = Package(
    name: "spfk-metadata-base",
    defaultLocalization: "en",
    platforms: [.macOS(.v13), .iOS(.v16)],
    products: [
        .library(
            name: "SPFKMetadataBase",
            targets: ["SPFKMetadataBase"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ryanfrancesconi/spfk-audio-base", from: "0.0.4"),
        .package(url: "https://github.com/ryanfrancesconi/spfk-raw-codable", from: "1.0.0"),
        .package(url: "https://github.com/ryanfrancesconi/spfk-utils", from: "0.0.8"),
        .package(url: "https://github.com/ryanfrancesconi/spfk-testing", from: "0.0.9"),
    ],
    targets: [
        .target(
            name: "SPFKMetadataBase",
            dependencies: [
                .product(name: "SPFKAudioBase", package: "spfk-audio-base"),
                .product(name: "RawCodable", package: "spfk-raw-codable"),
                .product(name: "SPFKUtils", package: "spfk-utils"),
            ]
        ),
        .testTarget(
            name: "SPFKMetadataBaseTests",
            dependencies: [
                "SPFKMetadataBase",
                .product(name: "SPFKTesting", package: "spfk-testing"),
            ]
        ),
    ]
)
