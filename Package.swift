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
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.6.0"),
        .package(name: "CasperishTheme", url: "https://github.com/sowenjub/CasperishTheme.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "AlexandersPortfolio",
            dependencies: ["Publish",
                           "CasperishTheme"]
        )
    ]
)
