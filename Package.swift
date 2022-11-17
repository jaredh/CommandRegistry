// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "CommandRegistry",
    products: [
        .library(name: "CommandRegistry", targets: ["CommandRegistry"])
    ],
    dependencies: [
		.package(url: "https://github.com/apple/swift-tools-support-core.git", .exact("0.2.7"))
    ],
    targets: [
        .target(
            name: "CommandRegistry",
            dependencies: [
				"SwiftToolsSupport-auto"
			]
		),
        .testTarget(
            name: "CommandRegistryTests",
            dependencies: ["CommandRegistry"]),
    ]
)
