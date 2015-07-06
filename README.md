# BlindsidedStoryboard

[![CI Status](http://img.shields.io/travis/Brian Croom/BlindsidedStoryboard.svg?style=flat)](https://travis-ci.org/briancroom/BlindsidedStoryboard)
[![Version](https://img.shields.io/cocoapods/v/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)
[![License](https://img.shields.io/cocoapods/l/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)
[![Platform](https://img.shields.io/cocoapods/p/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Storyboards make dependency injection of view controllers challenging, because they insist on instantiating the view controllers internally. This restriction can be worked around by subclassing UIStoryboard and overriding the `-instantiateViewControllerWithIdentifier:` method to perform configuration work immediately following the instantiation. The same storyboard instance that is used to create the initial view controller will be used to instantiate further view controllers accessed via segues.

This pod provides a `BlindsidedStoryboard` subclass of UIStoryboard which exemplifies this technique, integrating with the [Blindside](https://github.com/jbsf/blindside) DI framework. It includes a small sample app demonstrating how this could be used.

The BlindsidedStoryboard(CrossStoryboardSegues) category can be included to allow for seamless integration with [Cross Storyboard Segues](https://github.com/briancroom/CrossStoryboardSegues)

## Usage

When you create a storyboard instance to show a view controller, just do it like this:

```objective-c
id injector = [Blindside injectorWithModule:[[MyBlindsideModule alloc] init]];
UIStoryboard *storyboard = [BlindsidedStoryboard storyboardWithName:@"Main" bundle:nil injector:self.injector];
UIViewController *viewController = [storyboard instantiateInitialViewController];
```

`BlindsidedStoryboard` will ensure that viewController has its dependencies injected before it is returned to you. Note that, because the storyboard instantiates the view controller via `-initWithCoder:`, it is necessary to use `-bsProperties` to specify the class' dependencies. Also keep in mind that the dependencies won't be available until *after* `-awakeFromNib` has been called.

## Installation

BlindsidedStoryboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BlindsidedStoryboard"
```

## Author

Brian Croom, brian.s.croom@gmail.com

## License

BlindsidedStoryboard is available under the MIT license. See the LICENSE file for more info.
