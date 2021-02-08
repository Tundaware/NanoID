// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NanoID",
  platforms: [
    .iOS(.v10),
    .tvOS(.v10),
    .macOS(.v10_11),
    .watchOS(.v4)
  ],
  products: [
    .library(
      name: "NanoID",
      type: .dynamic,
      targets: ["NanoID"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "NanoID",
      dependencies: []),
    .testTarget(
      name: "NanoIDTests",
      dependencies: ["NanoID"]),
  ])
