<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/logo.png" width="700" />
</div>

<p align="center">
  <a>
    <img src="https://img.shields.io/github/languages/top/prasad1120/ElegantPopover" alt="Top Language">
  </a>
  <a href="https://cocoapods.org/pods/ElegantPopover">
    <img src="https://img.shields.io/cocoapods/p/ElegantPopover.svg" alt="Platform" />
  </a>
  <a href="https://cocoapods.org/pods/ElegantPopover">
    <img src="https://img.shields.io/cocoapods/v/ElegantPopover.svg?style=flat" alt="Version" />
  </a>
  <a href="https://cocoapods.org/pods/ElegantPopover">
    <img src="https://img.shields.io/cocoapods/l/ElegantPopover.svg?style=flat" alt="License" />
  </a>
</p>

# Elegant Popover

Highly customisable popovers with different shapes, borders, arrow styles and gradient in iOS.

## Features
- [x] Border with Color or Gradient (Any layer).
- [x] Multiple Borders for a Popover.
- [x] Customisable Arrow shape.
- [x] Solid and Outlined Arrow.

<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_1.png" height="600" hspace="30"/>
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_2.png" height="600" hspace="30"/>
</div>

## Requirements 
- Swift 4
- iOS 11 and above

## Installation
ElegantPopover is available on [CocoaPods](https://cocoapods.org/pods/ElegantPopover).

Add this line to your `Podfile`.
~~~
pod 'ElegantPopover'
~~~
Run `pod install`.

## Dependencies
This library depends on [ClippingBezier](https://github.com/adamwulf/ClippingBezier) library.

## Usage

```swift
// In your view controller
let arrow = PSArrow(height: 25, base: 35, baseCornerRadius: 0, direction: .up)
var design = PSDesign()
design.backGroundColor = UIColor.white

// 'contentView' is the UIView which contains 'Elegant Popover' UILabel
let popoverController = ElegantPopoverController(contentView: contentView,
                                                design: design,
                                                arrow: arrow,
                                                sourceView: view,
                                                sourceRect: CGRect(origin: CGPoint(x: 100, y: 170), size:CGSize.zero))
    
present(popoverController, animated: true)
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_3.png" width="600" />
</div>

<br/>

## Customisations
**Note**: The following customisations are to be done before creating an instance of `ElegantPopoverController`

<br/>

### Gradient border
```swift
let gradient = CAGradientLayer()
gradient.colors = [UIColor(red: CGFloat(222/255.0),
                           green: CGFloat(98/255.0),
                           blue: CGFloat(98/255.0),
                           alpha: CGFloat(1.0)).cgColor,
                   UIColor(red: CGFloat(255/255.0),
                           green: CGFloat(184/255.0),
                           blue: CGFloat(140/255.0),
                           alpha: CGFloat(1.0)).cgColor]
gradient.startPoint = CGPoint(x: 0, y: 0)
gradient.endPoint = CGPoint(x: 1, y: 1)

design.borders = [PSBorder(filling: .layer(gradient), width: 12)]
```

<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_4.png" width="600" />
</div>

<br/><br/>

### Insets of popover
```swift
design.insets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_5.png" width="600" />
</div>

<br/><br/>

### Corner radius of popover
```swift
design.cornerRadius = 15
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_6.png" width="600" />
</div>

<br/><br/>

### Arrow direction
Can be set as `.any` for the popover to figure out appropriate direction on its own
```swift
arrow.direction = .left
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_7.png" width="600" />
</div>

<br/><br/>

### Customise arrow shape
```swift
arrow.height = 60
arrow.base = 140
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_8.png" width="600" />
</div>

<br/><br/>

### Multiple borders
Multiple borders consisting of either `UIColor` or `CALayer` can be added in any combination
```swift
design.borders = [PSBorder(filling: .layer(gradient), width: 12),
                  PSBorder(filling: .pureColor(UIColor(red: CGFloat(255/255.0),
                                                       green: CGFloat(184/255.0),
                                                       blue: CGFloat(140/255.0),
                                                       alpha: CGFloat(1.0))), width: 8)]
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_9.png" width="600" />
</div>

<br/><br/>

### Solid Arrow
The index of border required to take the shape of a solid arrow and not outline it. Indices go from outermost border starting with `0` to innermost. Default value is `nil` which means all the borders will outline the arrow.
```swift
design.solidArrowBorderIndex = 1
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_10.png" width="600" />
</div>

<br/><br/>

### Anchor to UIBarButtonItem
```swift
let popoverController = ElegantPopoverController(contentView: contentView,
                                                design: design,
                                                arrow: arrow,
                                                barButtonItem: barButtonItem)
```

To adjust the arrow position to barButtonItem
```swift                                                
arrow.height = 25
arrow.base = 45
```
<div align = "center">
  <img src="https://github.com/prasad1120/ElegantPopover/blob/master/Assets/screen_11.png" width="600" />
</div>

<br/><br/>

## License
This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details
