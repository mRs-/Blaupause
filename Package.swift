import PackageDescription

let packe = Package(
    name: "Blaupause",
    dependencies: [
        .Package(url: "https://github.com/JohnSundell/Files.git", majorVersion: 1),
        .Package(url: "https://github.com/Carthage/Commandant.git", majorVersion: 0)
        ]
)
