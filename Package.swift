// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "swift-sentencepiece",
    products: [
        .library(
            name: "SentencePiece",
            targets: ["SentencePiece"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weiyanlin117/swift-package-support-sentencepiece", revision: "94f570ef7d05340333ad4be7b3084f434db6bd1b"),
    ],
    targets: [
        .target(
            name: "SentencePiece",
            dependencies: ["C_sentencepiece"],
            path: "Sources",
            exclude: ["BUILD.bazel", "C_sentencepiece"],
            sources: ["SentencePiece.swift"]
        ),
        .target(
            name: "C_sentencepiece",
            dependencies: [
                .product(name: "sentencepiece_cpp", package: "swift-package-support-sentencepiece"),
            ],
            path: "Sources/C_sentencepiece",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("."),
            ]
        ),
    ],
    cxxLanguageStandard: .cxx17
)
