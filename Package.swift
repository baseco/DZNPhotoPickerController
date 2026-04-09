// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "DZNPhotoPickerController",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v13) // specify the minimum iOS version
    ],
    products: [
        .library(
            name: "DZNPhotoPickerController",
            targets: ["DZNPhotoPickerController"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/baseco/AFNetworking.git", .revision("c89d2f5207c0721cbb1f3dd5ac54000c34dafcab")),
        .package(url: "https://github.com/baseco/FLAnimatedImage.git", .revision("a57dae359597c89e49a2095de79a15709916a694")),
        .package(url: "https://github.com/SDWebImage/SDWebImage.git", from: "5.21.1"),
        .package(url: "https://github.com/dzenbot/DZNEmptyDataSet.git", .branch("master"))
    ],
    targets: [
    //     .target(
    //         name: "DZNPhotoService",
    //         dependencies: [
    //             "AFNetworking"
    //         ],
    //         path: "Source/Classes",
    //         sources: [
    //             "DZNPhotoService",
    //             "DZNPhotoPickerControllerConstants.h"
    //         ],
    //         publicHeadersPath: ".",
    //         cSettings: [
    //             .headerSearchPath(".")
    //         ],
    //         linkerSettings: [
    //             .linkedFramework("UIKit", .when(platforms: [.iOS]))
    //         ]

    //     ),
        .target(
            name: "DZNPhotoPickerController",
            dependencies: [
                // "DZNPhotoService",
                "AFNetworking",
                "SDWebImage",
                "DZNEmptyDataSet"
            ],
            path: "Source/Classes",
            // exclude: [
            //     "Source/Classes/UIImagePickerController",
            //     "Source/Classes/DZNPhotoService",
                
            // ],
            resources: [
                .process("../Resources")
            ],
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include/DZNPhotoPickerController"),
                .define("MOBILE_CORESERVICES_IMPORT", to: "<MobileCoreServices/MobileCoreServices.h>"),
                .define("SYSTEM_CONFIGURATION_IMPORT", to: "<SystemConfiguration/SystemConfiguration.h>"),
                .define("SWIFTPM", to: "1")
            ],
            linkerSettings: [
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("MobileCoreServices", .when(platforms: [.iOS])),
                .linkedFramework("SystemConfiguration", .when(platforms: [.iOS]))
            ]

        )
    ]
)
