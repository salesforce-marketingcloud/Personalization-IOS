// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// This gets copied over from the dev repo over to the staging repo, then the staging repo gets pushed to production

import PackageDescription

let package = Package(
    name: "Personalization",
    products: [
        .library(
            name: "Personalization",
            targets: ["Personalization"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/salesforce-marketingcloud/sfmc-sdk-ios",
                "2.0.2"..."2.0.2"),
        .package(url: "https://github.com/salesforce-marketingcloud/mobile-sdk-cdp-ios.git",
                "2.0.6"..."2.0.6")
    ],
    targets: [
        .binaryTarget(
            name: "Personalization",
            path: "Frameworks/Personalization.xcframework"
        )
    ]
)
