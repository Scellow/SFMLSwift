import PackageDescription

let package = Package(
        name: "SFMLSwift",
        targets: [
                Target(name: "SFML", dependencies: []),
                Target(name: "Sample", dependencies:["SFML"]),
        ],
        dependencies: [
                .Package(url: "https://github.com/Scellow/CSFMLSwiftModule.git", majorVersion: 4, minor: 0),
        ]
)
