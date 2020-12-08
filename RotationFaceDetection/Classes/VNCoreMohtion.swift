//
//  VNCoreMohtion.swift
//  RotationFaceDetection
//
//  Created by 永田大祐 on 2020/12/06.
//

import UIKit
import CoreMotion

public enum VNMothionType: String {
    case Left, Right, Up
}

public class VNCoreMohtion {
    
    public init() { }

    private var motionManager = CMMotionManager()

    open var durationHandOver = "" {
        didSet {
            return
        }
    }

    open func checkMothionStart(interval: Double, v: VNImageRequest, images: [UIImage?]) {
        var image: UIImage?

        motionManager.accelerometerUpdateInterval = interval
        motionManager.startAccelerometerUpdates( to: OperationQueue() ) { [self]  p, _ in
            if p != nil {
                if let acceleration = p?.acceleration {
                    durationHandOver =
                        fabs( acceleration.y ) < fabs( acceleration.x )
                        ?   acceleration.x > 0 ? VNMothionType.Left.rawValue : VNMothionType.Right.rawValue : VNMothionType.Up.rawValue
                }
            }
            switch durationHandOver {
            case VNMothionType.Left.rawValue : image = images[3]
            case VNMothionType.Right.rawValue : image = images[1]
            case VNMothionType.Up.rawValue : image = images[0]
            default: break
            }

            guard let c = image?.cgImage else { return }
            v.checkFace(c, images: images, type: VNMothionType(rawValue: durationHandOver))
        }
    
    }

    open func checkMothionStop() {
        motionManager.stopAccelerometerUpdates()
    }
}

