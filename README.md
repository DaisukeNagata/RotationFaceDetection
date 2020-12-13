# RotationFaceDetection

<p align="center">
<img width="600" height="400" src="https://user-images.githubusercontent.com/16457165/102008909-32f12880-3d77-11eb-9cb9-250099eb5f45.png">
</p>
<p align="center">
<img width="600" height="550" src="https://user-images.githubusercontent.com/16457165/102009032-1b666f80-3d78-11eb-9c94-da411134479a.png">
</p>

<p align="center">
<img src="https://user-images.githubusercontent.com/16457165/102008823-a0508980-3d76-11eb-89fd-37b53c37eb14.gif" width="285" height="680">
</p>


[![CI Status](https://img.shields.io/travis/dbank0208@gmail.com/RotationFaceDetection.svg?style=flat)](https://travis-ci.org/dbank0208@gmail.com/RotationFaceDetection)
[![Version](https://img.shields.io/cocoapods/v/RotationFaceDetection.svg?style=flat)](https://cocoapods.org/pods/RotationFaceDetection)
[![License](https://img.shields.io/cocoapods/l/RotationFaceDetection.svg?style=flat)](https://cocoapods.org/pods/RotationFaceDetection)
[![Platform](https://img.shields.io/cocoapods/p/RotationFaceDetection.svg?style=flat)](https://cocoapods.org/pods/RotationFaceDetection)

## What is this?
```
The above gif video uses the skyway library to enable remote calling.

This library corrects the angle when the remote destination locks the screen and changes the orientation of the screen.

Set the View to tap in the first argument of VNGetImageView.

Tap and repeat the rotation.

```

## Example

```
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(g)
        /* 
        Please set the rotating screen.
        Set the screen to be displayed in the second argument.
        */
        a = VNAngularStructure(v: VNImageRequest(), view: imageView)
    }

    override func viewDidAppear(_ animeted: Bool) {
        super.viewDidAppear(animeted)
　　　　　/* 
        Please set the rotating screen
        A face photo is a material for face recognition.
        The first argument is the screen for tap setting.
        The second argument is the screen for setting the image, and it is OK without displaying it on the screen.
        */
        g.tapped(view: imageView, addView: imageView, up: "dbank", left: "dbank2", down: "dbank3", right: "dbank4", v: a?.v)
        a?.frame = imageView.frame
    }
```

## Requirements

## Installation

RotationFaceDetection is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'RotationFaceDetection'
```

## Author

dbank0208@gmail.com

## License

RotationFaceDetection is available under the MIT license. See the LICENSE file for more info.
