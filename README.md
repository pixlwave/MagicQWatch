# MagicQWatch
A proof of concept for remote control of MagicQ on an Apple Watch via voice commands. Made with RubyMotion. The majority of functionality is provided by my [crep](https://github.com/pixlwave/crep) gem.

## Usage
In order to use this project, you'll need to set up provisioning profiles for the iPhone App, WatchKit Extension and WatchKit App. The profiles for the iPhone App and the WatchKit Extension both need to have access to an App Group which is referenced by id in both Rakefiles, the App Delegate and the watch's Inferface Controller.

## Preview
There is a video of this code running on [Vimeo](https://vimeo.com/126852871)
