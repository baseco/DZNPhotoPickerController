// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DZNPhotoPickerController",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v9) // SPM supports iOS 9 and above
    ],
    products: [
        .library(
            name: "DZNPhotoPickerController",
            targets: ["DZNPhotoPickerController"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AFNetworking/AFNetworking.git", from: "4.0.1"),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.0.0"),
        .package(url: "https://github.com/dzenbot/DZNEmptyDataSet.git", from: "1.8.1")
    ],
    targets: [
        .target(
            name: "DZNPhotoService",
            dependencies: [
                "AFNetworking"
            ],
            path: "Source/Classes",
            sources: [
                "DZNPhotoService",
                "DZNPhotoPickerControllerConstants.h"
            ],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath(".")
            ]
        ),
        .target(
            name: "DZNPhotoPickerController",
            dependencies: [
                "DZNPhotoService",
                "AFNetworking",
                "SDWebImage",
                "DZNEmptyDataSet"
            ],
            path: ".",
            exclude: [
                "Source/Classes/UIImagePickerController"
            ],
            sources: [
                "Classes",
                "Source/Classes"
            ],
            resources: [
                .process("Resources"),
                .process("Source/Resources")
            ],
            publicHeadersPath: "Source",
            cSettings: [
                .headerSearchPath("Source"),
                .define("MOBILE_CORESERVICES_IMPORT", to: "<MobileCoreServices/MobileCoreServices.h>"),
                .define("SYSTEM_CONFIGURATION_IMPORT", to: "<SystemConfiguration/SystemConfiguration.h>")
            ]
        )
    ]
)
