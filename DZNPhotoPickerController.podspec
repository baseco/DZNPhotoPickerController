@dznversion = "1.5"
@afversion = "~> 2.3.1"
@sdversion = "~> 3.7"

Pod::Spec.new do |s|
  s.name         	= "DZNPhotoPickerController"
  s.version      	= @dznversion
  s.summary      	= "A photo search/picker for iOS using popular providers like 500px, Flickr, Intagram, Google Images, etc."
  s.description  	= "This framework tries to mimic as close as possible the native UIImagePickerController API for iOS7, in terms of features, appearance and behaviour."
  s.homepage   		= "https://github.com/dzenbot/DZNPhotoPickerController"
  s.screenshots 	= "https://dl.dropboxusercontent.com/u/2452151/Permalink/DZNPhotoPickerController_screenshots.png"
  s.license     	= { :type => 'MIT', :file => 'LICENSE' }
  s.author       	= { "Ignacio Romero Z." => "iromero@dzen.cl" }
  s.platform    	= :ios, '7.0'
  s.source       	= { :git => "https://github.com/dzenbot/UIPhotoPickerController.git", :tag => "v#{s.version}" }
  s.source_files  = 'Classes', 'Source/Classes/*.{h,m}'
  s.exclude_files = 'Source/Classes/UIImagePickerController/*.{h,m}'
  s.resources     = 'Resources', 'Source/Resources/**/*.*'
  s.requires_arc 	= true
  s.prefix_header_contents =  '#import <MobileCoreServices/MobileCoreServices.h>',
                              '#import <SystemConfiguration/SystemConfiguration.h>'

  s.header_mappings_dir = 'Source'
  s.dependency 'AFNetworking/NSURLConnection', @afversion
  s.dependency 'AFNetworking/NSURLSession', @afversion
  s.dependency 'AFNetworking/Reachability', @afversion
  s.dependency 'AFNetworking/Security', @afversion
  s.dependency 'SDWebImage', @sdversion
  s.dependency 'DZNEmptyDataSet', '1.3.3'

  s.subspec 'DZNPhotoService' do |service|
    service.source_files     =  'Source/Classes/DZNPhotoService/*.{h,m}',
                                'Source/Classes/DZNPhotoPickerControllerConstants.h'
    service.dependency 'AFNetworking/NSURLConnection', @afversion
    service.dependency 'AFNetworking/NSURLSession', @afversion
    service.dependency 'AFNetworking/Reachability', @afversion
    service.dependency 'AFNetworking/Security', @afversion
  end

  s.subspec 'UIImagePickerControllerExtended' do |extension|
    extension.source_files     =  'Source/Classes/UIImagePickerController/*.{h,m}',
                                  'Source/Classes/DZNPhotoPickerControllerConstants.h'
  end
end
