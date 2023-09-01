// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIx",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIx",
            targets: ["UIx"]),
    ],
    dependencies: [
        .package(url: "https://github.com/DanielMandea/swiftui-loading-view", .upToNextMajor(from: "1.1.7")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UIx",
            dependencies: [
                .product(name: "LoadingView", package: "swiftui-loading-view"),
            ]
        ),
        .testTarget(
            name: "UIxTests",
            dependencies: ["UIx"]),
    ]
)
