#
# Be sure to run `pod lib lint TKDataStorage.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKDataStorage'
  s.version          = '0.0.11'
  s.summary          = '数据存储'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
基本的数据存储，包括基本的文件写入，iOS安全数据存储，文件操作，sqlite数据库操作.
                       DESC

  s.homepage         = 'https://github.com/ThinkWind'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '512869343@qq.com' => '512869343@qq.com' }
  s.source           = { :git => 'https://github.com/myiOSComponent/TKDataStorage.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
  s.source_files = 'TKDataStorage/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TKDataStorage' => ['TKDataStorage/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'Security'
  s.libraries = 'sqlite3'
  s.dependency 'TKModelCategory', '~> 0.0.13'
end
