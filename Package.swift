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
        .package(url: "https://github.com/baseco/FLAnimatedImage.git", .revision("a57dae359597c89e49a2095de79a15709916a694")),
        .package(url: "https://github.com/baseco/SDWebImage.git", .revision("cc560d6836bae982037ff1f57a11b96935764bab")),
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
