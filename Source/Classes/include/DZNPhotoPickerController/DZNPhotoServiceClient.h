//
//  DZNPhotoServiceClient.h
//  DZNPhotoPickerController
//  https://github.com/dzenbot/DZNPhotoPickerController
//
//  Created by Ignacio Romero Zurbuchen on 2/12/14.
//  Copyright (c) 2014 DZN Labs. All rights reserved.
//  Licence: MIT-Licence
//

#import <AFNetworking/AFNetworking.h>
#ifndef SWIFTPM
#import <DZNPhotoPickerController/DZNPhotoServiceClientProtocol.h>
#else
#import "DZNPhotoServiceClientProtocol.h"
#endif
#ifndef SWIFTPM
#import <DZNPhotoPickerController/DZNPhotoPickerControllerConstants.h>
#else
#import "DZNPhotoPickerControllerConstants.h"
#endif

UIKIT_EXTERN NSString *const DZNPhotoServiceClientConsumerKey;
UIKIT_EXTERN NSString *const DZNPhotoServiceClientConsumerSecret;
UIKIT_EXTERN NSString *const DZNPhotoServiceClientSubscription;

/**
 The HTTP service client used to interact with multiple RESTful APIs for photo search services.
 */
@interface DZNPhotoServiceClient : AFHTTPRequestOperationManager <DZNPhotoServiceClientProtocol>

/**
 Initializes a new HTTP service client.
 
 @param service The specific photo search service.
 @param subscription The photo search service subscription.
 @return A new instance of an HTTP service client.
 */
- (instancetype)initWithService:(DZNPhotoPickerControllerServices)service subscription:(DZNPhotoPickerControllerSubscription)subscription;

@end
