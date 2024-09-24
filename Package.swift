let package = Package(
    name: "DZNPhotoPickerController",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "DZNPhotoPickerController",
            targets: ["DZNPhotoPickerController"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "DZNPhotoPickerController",
            dependencies: [],
            path: "Framework/Sources"
        ),
        .testTarget(
            name: "UnitTests",
            dependencies: [
                .byName(name: "DZNPhotoPickerController"),
            ],
            path: "Tests/Sources"
        ),
    ]
)
