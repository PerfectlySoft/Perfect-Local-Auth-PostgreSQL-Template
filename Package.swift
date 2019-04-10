// swift-tools-version:4.1
// Generated automatically by Perfect Assistant Application
// Date: 2017-10-04 19:42:40 +0000

import PackageDescription
let package = Package(
	name: "PerfectLocalAuthPostgreSQLTemplate",
	dependencies: [
		.package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", from: "3.0.0"),
		.package(url: "https://github.com/iamjono/JSONConfig.git", from: "3.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-Mustache.git", from: "3.0.0"),
		.package(url: "https://github.com/SwiftORM/StORM.git", from: "3.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-CURL.git", from: "3.0.0"),
		.package(url: "https://github.com/iamjono/SwiftString.git", from: "2.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-RequestLogger.git", from: "3.0.0"),
		.package(url: "https://github.com/PerfectlySoft/Perfect-LocalAuthentication-PostgreSQL.git", from: "3.0.0"),
	],
    targets: [
        .target(name: "PerfectLocalAuthPostgreSQLTemplate", dependencies: [
        "PerfectHTTPServer", "PerfectMustache","JSONConfig", "StORM",
        "PerfectRequestLogger", "SwiftString", "PerfectCURL", "Perfect-LocalAuthentication-PostgreSQL"
        ]),
    ]
)
