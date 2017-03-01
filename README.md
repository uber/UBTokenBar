# UBTokenBar

[![CI Status](http://img.shields.io/travis/Maxwell Elliott/UBTokenBar.svg?style=flat)](https://travis-ci.org/Maxwell Elliott/UBTokenBar)
[![Version](https://img.shields.io/cocoapods/v/UBTokenBar.svg?style=flat)](http://cocoapods.org/pods/UBTokenBar)
[![License](https://img.shields.io/cocoapods/l/UBTokenBar.svg?style=flat)](http://cocoapods.org/pods/UBTokenBar)
[![Platform](https://img.shields.io/cocoapods/p/UBTokenBar.svg?style=flat)](http://cocoapods.org/pods/UBTokenBar)

UBTokenBar is a UICollectionView based token bar written in Swift. It uses UICollectionViewFlow layout objects to layout and render its tokens, which allows for a high level of layout customizability. Also since it is powered via a UICollectionView you can register your own cell classes to customize the token appearance and behavior. Right To Left language is supported out of the box!

If you have any questions, feel free to ask on [Stack Overflow](http://stackoverflow.com/questions/tagged/ubtokenbar) (tag "ubtokenbar").

## Features

- [x] Easy to get started
- [x] Extensible architecture
- [x] Swift-compatible
- [x] Full RTL support

## Installation

*UBTokenBar requires iOS 10+*

#### CocoaPods

To integrate UBTokenBar into your project using [CocoaPods](http://cocoapods.org), add the following line to your Podfile:

```ruby
pod 'UBTokenBar'
```

#### Carthage

To consume UBTokenBar using [Carthage](https://github.com/Carthage/Carthage) add this to your Cartfile:

```
github "uber/ubtokenbar"
```

## Running the Examples App

* Clone the repo `git clone git@github.com:uber/ubtokenbar.git`
* Open the Example directory `cd UBTokenBar/Example`
* run `pod install`
* `open UBTokenBar.xcworkspace`
* Run the `UBTokenBar-Example` scheme in Xcode. Run the `UBTokenBar_ExampleRTL` to test Right To Left langauge

## Quickstart

[See the UBTokenBar Quickstart here!](https://github.com/maxwellE/UBTokenBar/wiki/Quickstart)

## Authors

* Maxwell Elliott (maxwelle@uber.com, [@maxwellE](https://github.com/maxwellE))

## Screenshots

### Default UBTokenBar

![default](https://uber.box.com/shared/static/we2u789mbwsufkgust3ikcjejh66v0td.gif)

### RTL UBTokenBar (Works out of the box!)

![rlt](https://uber.box.com/shared/static/lzu8afq7km422ehbh013pv994fbg7xls.gif)

## Contributions

We'd love for you to contribute to our open source projects. Before we can accept your contributions, we kindly ask you to sign our [Uber Contributor License Agreement](https://docs.google.com/a/uber.com/forms/d/1pAwS_-dA1KhPlfxzYLBqK6rsSWwRwH95OCCZrcsY5rk/viewform).

- If you **find a bug**, open an issue or submit a fix via a pull request.
- If you **have a feature request**, open an issue or submit an implementation via a pull request
- If you **want to contribute**, submit a pull request.

Check out the [Contribution Guidelines](https://github.com/uber/UBTokenBar/wiki/Contribution-Guidelines) for more information.

## License

UBTokenBar is released under the MIT license. See the LICENSE file for more info.
