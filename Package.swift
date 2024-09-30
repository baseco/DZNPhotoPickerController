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
        .package(url: "https://github.com/baseco/AFNetworking.git", .revision("75441a7d92ac7c37e705d4c744f279b639081253")),
        .package(url: "https://github.com/baseco/SDWebImage.git", .revision("3aa7d98cc59e327fc5ac220f98fb128544a9d54f")),
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
            path: ".",
            // exclude: [
            //     "Source/Classes/UIImagePickerController",
            //     "Source/Classes/DZNPhotoService",
                
            // ],
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
