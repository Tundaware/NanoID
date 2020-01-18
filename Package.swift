// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "NanoID",
  platforms: [
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "NanoID",
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
