// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
// This gets copied over from the dev repo over to the staging repo, then we push the staging repo to production during a release

import PackageDescription

let package = Package(
    name: "Personalization",
    platforms: [
            .iOS(.v13)
        ],
    products: [
        .library(
            name: "Personalization",
            targets: ["PersonalizationSdkWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/salesforce-marketingcloud/mobile-sdk-cdp-ios.git", from: "3.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "Personalization",
            path: "Frameworks/Personalization.xcframework"
        ),
        .target(
            name: "PersonalizationSdkWrapper",
            dependencies: [
                .target(name: "Personalization"),
                // CDP pulls in the transitive SFMC dependency
                .product(name: "Cdp", package: "mobile-sdk-cdp-ios")
            ],
            path: "PersonalizationSdkWrapper"
        )
    ]
)
