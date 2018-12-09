// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "CommandRegistry",
    products: [
        .library(name: "CommandRegistry", targets: ["CommandRegistry"])
    ],
    dependencies: [
       .package(url: "https://github.com/apple/swift-package-manager.git", from: "0.3.0")
    ],
    targets: [
        .target(
            name: "CommandRegistry",
            dependencies: [
				"Utility"
			]
		),
        .testTarget(
            name: "CommandRegistryTests",
            dependencies: ["CommandRegistry"]),
    ]
)
