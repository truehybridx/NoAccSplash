# Depreciated
This project has not been touched since 2013. Apple finally released a fix to allow playback controls when connected to these types of accessories.

# NoAccSplash
This MobileSubstrate Extension removes the Accessory Connected splash screen from the iPod/Music/Video applications to allow playback controls to be accessed.

## Motivation
iOS Versions 3 through 6 introduced a feature where playback controls were disabled when certain accessories are connected to the device, such as some music docks and car stereos. NoAccSplash’s aim is to allow playback controls to remain active on an iOS device when connected to an external accessory that ordinarily locks playback controls because the manufacture thinks you would be using the accessories built in controls instead. This tweak should at minimum allow you to use Music playback controls found in the Music app, SpringBoard’s AppSwitching bar, and the lock screen. The original incarnation of this tweak was called NoAccessorySplash which currently works for iOS 3.x and 4.x and was made by a developer named Jack Norris. I have no affiliation with him and merely took over this tweak to further its development to get it iOS 5.x ready.

## Features
* Allows Playback controls in SpringBoard and Music app (when otherwise blocked)
* Works for iPod/iPhone/iPad on iOS 4.x ,5.x and 6.x
* Allows viewing of Videos with the audio routed through the accessory
* Preference panel to switch some features off

## Frameworks
* [Theos](https://github.com/theos/theos/wiki/Installation)

## Installation
1. Install and Setup [Theos](https://github.com/theos/theos/wiki/Installation)
2. Clone this repository
3. Build the project
    ```
    make
    ```

## License

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
