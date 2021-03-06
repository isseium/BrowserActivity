# BrowserActivity

[![Version](https://img.shields.io/cocoapods/v/BrowserActivity.svg?style=flat)](http://cocoapods.org/pods/BrowserActivity)
[![License](https://img.shields.io/cocoapods/l/BrowserActivity.svg?style=flat)](http://cocoapods.org/pods/BrowserActivity)
[![Platform](https://img.shields.io/cocoapods/p/BrowserActivity.svg?style=flat)](http://cocoapods.org/pods/BrowserActivity)

Custom `UIActivity` implementations to show "Open in Safari" and "Open in Chrome" options in the list of activities, implemented in Swift 3.0.

![Screenshot](/Example/screenshot.png)

## Usage:
```swift
	let sharingURL = URL(string: "https://www.google.com/search?q=swift")
	let activityViewController = UIActivityViewController(
	    activityItems: [sharingURL],
	    applicationActivities: BrowserActivity.compatibleActivities
	)
	present(activityViewController, animated: true, completion: nil)
```
#### Helper:
```
BrowserActivity.compatibleActivities
```
Returns an Array of `UIActivity` instances to open the given URL in Safari and/or Google Chrome (if Google Chrome is installed in the device).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.



## Installation

BrowserActivity is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "BrowserActivity"
```
Add/append `googlechrome` and `googlechromes` schemes in your `Info.plist` under `LSApplicationQueriesSchemes`. For example:
```xml
    <key>LSApplicationQueriesSchemes</key>
	<array>
		<string>googlechrome</string>
		<string>googlechromes</string>
	</array>
```


## Author

Raxit Majithiya ([@raxityo](https://twitter.com/raxityo))

## License

BrowserActivity is available under the MIT license. See the LICENSE file for more info.
