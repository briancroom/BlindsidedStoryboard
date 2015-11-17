#
# Be sure to run `pod lib lint BlindsidedStoryboard.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "BlindsidedStoryboard"
  s.version          = "0.4.0"
  s.summary          = "A storyboard subclass which enables injecting dependencies into view controllers using Blindside."
  s.description      = <<-DESC
                            Storyboards make dependency injection of view controllers challenging, because they insist on instantiating the view controllers internally. This restriction can be worked around by subclassing UIStoryboard and overriding the -instantiateViewControllerWithIdentifier: method to perform configuration work immediately following the instantiation. The same storyboard instance that is used to create the initial view controller will be used to instantiate further view controllers accessed via segues.

                            This pod provides a BlindsidedStoryboard subclass of UIStoryboard which exemplifies this technique, integrating with the Blindside DI framework. It also contains a small sample app demonstrating how this could be used.
                       DESC
  s.homepage         = "https://github.com/briancroom/BlindsidedStoryboard"
  s.license          = 'MIT'
  s.author           = { "Brian Croom" => "brian.s.croom@gmail.com" }
  s.social_media_url = 'https://twitter.com/aikoniv'
  s.source           = { :git => "https://github.com/briancroom/BlindsidedStoryboard.git", :tag => s.version.to_s }

  s.ios.deployment_target = '5.0'
  s.tvos.deployment_target = '9.0'

  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'

  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'Blindside', '~> 1.1'
end
