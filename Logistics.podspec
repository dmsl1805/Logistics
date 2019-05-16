#
# Be sure to run `pod lib lint Logistics.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Logistics'
  s.version          = '0.0.11'
  s.swift_version    = '5.0'
  s.summary          = 'TBD. Under development.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
TBD. The whole architecture framework. Creates defined way to communicate parts of the app.
                       DESC

  s.homepage         = 'https://github.com/dmsl1805/Logistics'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dmitry Shulzhenko' => 'dmsl1805@gmail.com' }
  s.source           = { :git => 'https://github.com/dmsl1805/Logistics.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Logistics/Classes/**/*'
  
  # s.resource_bundles = {
  #   'Logistics' => ['Logistics/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  
  s.script_phase = { :name => 'Logistics', :script => '${PODS_ROOT}/Sourcery/bin/sourcery --sources ${PODS_ROOT}/Logistics/Logistics/Classes --sources ${SRCROOT} --templates ${PODS_ROOT}/Logistics/Logistics/Classes --output ${SRCROOT}/Logistics/Autogenerated' }

  s.dependency 'Sourcery'
  s.dependency 'RxSwift', '~> 4'
end
