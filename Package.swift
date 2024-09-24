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
        .package(url: "https://github.com/dzenbot/DZNEmptyDataSet.git", .branch("master"))
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
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS]))
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
                "Source/Classes/UIImagePickerController",
                "Source/Classes/DZNPhotoService",
                
            ],
            sources: [
                "Source/Classes"
            ],
            resources: [
                .process("Source/Resources")
            ],
            publicHeadersPath: "Source/Classes",
            cSettings: [
                .headerSearchPath("Source/Classes"),
                .define("MOBILE_CORESERVICES_IMPORT", to: "<MobileCoreServices/MobileCoreServices.h>"),
                .define("SYSTEM_CONFIGURATION_IMPORT", to: "<SystemConfiguration/SystemConfiguration.h>")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("MobileCoreServices", .when(platforms: [.iOS])),
                .linkedFramework("SystemConfiguration", .when(platforms: [.iOS]))
            ]

        )
    ]
)
