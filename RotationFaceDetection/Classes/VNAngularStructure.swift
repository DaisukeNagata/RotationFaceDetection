//
//  VNAngularStructure.swift
//  RotationFaceDetection
//
//  Created by 永田大祐 on 2020/12/06.
//

import UIKit

public class VNAngularStructure {

    open var v: VNImageRequest?
    var view: UIImageView?

    public init(v: VNImageRequest?, view: UIImageView?) {
        self.v = v
        self.v?.a = self
        self.view = view
    }

    var angle = CGFloat() {
        didSet {
            DispatchQueue.main.async { [self] in
                view?.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
            }
        }
    }
}
