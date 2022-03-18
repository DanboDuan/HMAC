// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HMAC",
    products: [
        .library(
            name: "HMAC",
            targets: ["HMAC"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "HMAC",
            dependencies: []
        ),
        .testTarget(
            name: "HMACTests",
            dependencies: ["HMAC"]
        ),
    ]
)
