// swift-tools-version:5.1

import PackageDescription

let package = Package(name: "CardPresentationController",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v10),
                                  .tvOS(.v10),
                                  .watchOS(.v3)],
                      products: [.library(name: "CardPresentationController",
                                          targets: ["CardPresentationController"])],
                      targets: [.target(name: "CardPresentationController",
                                        path: "Source",
                                        linkerSettings: [.linkedFramework("UIKit",
                                                                          .when(platforms: [.iOS,
                                                                                            .macOS,
                                                                                            .tvOS,
                                                                                            .watchOS]))]),
                                ],
                      swiftLanguageVersions: [.v5])