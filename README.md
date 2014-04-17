BlindsidedStoryboard
-----

Storyboards make dependency injection of view controllers challenging, because they insist on instantiating the view controllers internally. This restriction can be worked around by subclassing UIStoryboard and overriding the `-instantiateViewControllerWithIdentifier:` method to perform configuration work immediately following the instantiation. The same storyboard instance that is used to create the initial view controller will be used to instantiate further view controllers accessed via segues.

This repo contains a `BlindsidedStoryboard` subclass of UIStoryboard which exemplifies this technique, integrating with the [Blindside](https://github.com/jbsf/blindside) DI framework. It is a part of a small sample app demonstrating how this could be used.