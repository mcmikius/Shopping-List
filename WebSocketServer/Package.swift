// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebSocketServer",
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
.package(url: "https://github.com/vapor/http.git", from: "3.0.0"),
.package(url: "https://github.com/vapor/sockets.git", from: "2.1.0"),
.package(url: "https://github.com/vapor/websocket.git", from: "1.0.0"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "WebSocketServer",
            dependencies: ["Vapor", "HTTP", "WebSockets", "WebSocket"]),
        .testTarget(
            name: "WebSocketServerTests",
            dependencies: ["WebSocketServer"]),
    ]
)
