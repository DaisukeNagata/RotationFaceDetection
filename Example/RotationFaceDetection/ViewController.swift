//
//  ViewController.swift
//  RotationFaceDetection
//
//  Created by dbank0208@gmail.com on 12/06/2020.
//  Copyright (c) 2020 dbank0208@gmail.com. All rights reserved.
//

import UIKit
import RotationFaceDetection

class ViewController: UIViewController {

    var a: VNAngularStructure?

    var g = VNGetImageView()

    @IBOutlet weak var imageView: UIImageView!
    
    override var shouldAutorotate: Bool {
        if UIDevice.current.orientation.isPortrait {
            UIDevice.current.setValue(0, forKey: "orientation")
        }
        return D.orientationFlg
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.orientation.isLandscape {
            UIDevice.current.setValue(0, forKey: "orientation")
        }
        return D.duration
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if D.orientationFlg == false {
            UIDevice.current.setValue(1, forKey: "orientation")
        } else {
            UIDevice.current.setValue(3, forKey: "orientation")
        }
    }

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
}
