// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "AlexandersPortfolio",
    products: [
        .executable(
            name: "AlexandersPortfolio",
            targets: ["AlexandersPortfolio"]
        )
    ],
    dependencies: [
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0")
    ],
    targets: [
        .target(
            name: "AlexandersPortfolio",
            dependencies: ["Publish"]
        )
    ]
)