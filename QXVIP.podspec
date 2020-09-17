#
# Be sure to run `pod lib lint QXVIP.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QXVIP'
  s.version          = '0.1.0'
  s.summary          = 'my short description of QXVIP.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/aloow/QXVIP'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'aloow' => 'xuesq@pvc123.com' }
  s.source           = { :git => 'https://github.com/aloow/QXVIP.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'QXVIP/Classes/**/*'
  
#  s.resource_bundles = {
#   'QXVIP' => ['QXVIP/Assets/*']
#  }
  s.resources = 'QXVIP/Assets/*.{xcassets}'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.dependency 'MGJRouter', '~> 0.10.0' # 中间件
  
  s.dependency 'MJRefresh','~> 3.1.15.3'
  s.dependency 'MJExtension','~> 3.0.15.1'
  s.dependency 'Masonry','~> 1.1.0'
  s.dependency 'AFNetworking', '~> 4.0'
  s.dependency 'JXBWebKit', '~> 1.2.0' # WebKit
  s.dependency 'LEEAlert', '~> 1.4.1' # AlterView
  s.dependency 'YYCategories','~> 1.0.4'
  s.dependency 'JXCategoryView', '~> 1.5.6' # 标签滚动
  s.dependency 'SDCycleScrollView','>= 1.80' # 图片、文字轮播器
  s.dependency 'DZNEmptyDataSet', '~> 1.8.1'# TableView 空数据处理
  
  
end
