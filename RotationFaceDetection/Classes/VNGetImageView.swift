//
//  VNGetImageView.swift
//  RotationFaceDetection
//
//  Created by 永田大祐 on 2020/12/06.
//

import UIKit

public class VNGetImageView: UIView, UIGestureRecognizerDelegate {

    open var v: VNImageRequest?
    open var tap = UITapGestureRecognizer()
    open var addView: UIView?

    open func tapped(view: UIView, v: VNImageRequest?) {
        tap = UITapGestureRecognizer(target: self, action:#selector(getImage))
        tap.delegate = self
        self.frame = view.frame
        self.addGestureRecognizer(tap)
        self.addView = view
        self.v = v
    }

    @objc open func getImage()  {

        let rect = addView?.bounds
        UIGraphicsBeginImageContextWithOptions(rect?.size ?? CGSize(), false, 0.0)
        guard let context : CGContext = UIGraphicsGetCurrentContext() else { return }
        addView?.layer.render(in: context)
        guard let image : UIImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()

        v?.checkFace(image.cgImage!)
    }
}
