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

    var g = VNGetImageView()

    var a: VNAngularStructure?

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

        // set the screen to rotate.
        a = VNAngularStructure(v: VNImageRequest(), view: imageView)
        a?.frame = imageView.frame

        self.view.addSubview(g)
    }

    override func viewDidAppear(_ animeted: Bool) {
        super.viewDidAppear(animeted)
        imageView.image = UIImage(named: "dbank")
        // tap to detect the angle of rotation.
        g.tapped(view: imageView, addView: imageView, name: "dbank", changeName: "dbank3", v: a?.v)
    }
}
