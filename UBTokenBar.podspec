#
# Be sure to run `pod lib lint UBTokenBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UBTokenBar'
  s.version          = '0.1.0'
  s.summary          = 'A powerful and extensible UICollectionView based token bar'
  s.description      = <<-DESC
  UBTokenBar is a simple and easy to use token bar implementation for iOS. Based on the existing logic of UICollectionView and UICollectionViewFlow layout this token bar can be easily extended and customized for anyone with knowladge of UICollectionViews.
                       DESC

  s.homepage         = 'https://github.com/uber'
  s.screenshots      = 'https://uber.box.com/shared/static/we2u789mbwsufkgust3ikcjejh66v0td.gif', 'https://uber.box.com/shared/static/lzu8afq7km422ehbh013pv994fbg7xls.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maxwell Elliott' => 'maxwelle@uber.com' }
  s.source           = { :git => 'https://github.com/Maxwell Elliott/UBTokenBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '10.0'
  s.source_files = 'UBTokenBar/Classes/**/*'
  s.resources = 'UBTokenBar/Assets/*.png'
  s.frameworks = 'UIKit'
end
