// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "CommandRegistry",
    products: [
        .library(name: "CommandRegistry", targets: ["CommandRegistry"])
    ],
    dependencies: [
       .package(url: "https://github.com/apple/swift-package-manager.git", .exact("0.3.0"))
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
