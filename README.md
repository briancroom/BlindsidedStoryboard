# BlindsidedStoryboard

[![CI Status](http://img.shields.io/travis/briancroom/BlindsidedStoryboard.svg?style=flat)](https://travis-ci.org/briancroom/BlindsidedStoryboard)
[![Version](https://img.shields.io/cocoapods/v/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)
[![License](https://img.shields.io/cocoapods/l/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)
[![Platform](https://img.shields.io/cocoapods/p/BlindsidedStoryboard.svg?style=flat)](http://cocoapods.org/pods/BlindsidedStoryboard)

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Storyboards make dependency injection of view controllers challenging, because they insist on instantiating the view controllers internally. This restriction can be worked around by subclassing UIStoryboard and overriding the `-instantiateViewControllerWithIdentifier:` method to perform configuration work immediately following the instantiation. The same storyboard instance that is used to create the initial view controller will be used to instantiate further view controllers accessed via segues.

This library provides a `BlindsidedStoryboard` subclass of UIStoryboard which utilizes this technique, integrating with the [Blindside](https://github.com/jbsf/blindside) DI framework. It includes a small sample app demonstrating how it can be used.

The `BlindsidedStoryboard(CrossStoryboardSegues)` category can be included to allow for seamless integration with [Cross Storyboard Segues](https://github.com/briancroom/CrossStoryboardSegues). Xcode 7's native storyboard references are also supported, and the same injector will continue to be used when switching storyboards.

## Usage

When you create a storyboard instance to show a view controller, just do it like this:

```objective-c
id<BSInjector> injector = [Blindside injectorWithModule:[[MyBlindsideModule alloc] init]];
UIStoryboard *storyboard = [BlindsidedStoryboard storyboardWithName:@"Main" bundle:nil injector:injector];
UIViewController *viewController = [storyboard instantiateInitialViewController];
```

```swift
let injector = Blindside.injectorWithModule(MyBlindsideModule)
let storyboard = BlindsidedStoryboard("Main", bundle: nil, injector: injector)
let viewController = storyboard.instantiateInitialViewController()
```

`BlindsidedStoryboard` will ensure that viewController has its dependencies injected before it is returned to you. There are a few things to note:

* Because the storyboard instantiates the view controller via `-initWithCoder:`, it is necessary to use `+bsProperties` to specify the class' dependencies.
* Dependencies won't be available until *after* `-awakeFromNib` has been called.
* You can use `-bsAwakeFromPropertyInjection` as a place to put work that needs to occur after dependencies have been injected.

## Installation

BlindsidedStoryboard is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BlindsidedStoryboard"
```

It can also be installed as a framework using [Carthage](https://github.com/Carthage/Carthage) if you are targeting iOS 8.0 or above. To get it this way, add the following line to your Cartfile:

```ruby
github "briancroom/BlindsidedStoryboard"
```

## Author

Brian Croom, brian.s.croom@gmail.com

## License

BlindsidedStoryboard is available under the MIT license. See the LICENSE file for more info.
