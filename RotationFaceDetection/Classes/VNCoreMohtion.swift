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
    
    open func checkMothionStart(interval: Double, v: VNImageRequest, images: [UIImage?]) {
        var duration = ""
        var image: UIImage?

        motionManager.accelerometerUpdateInterval = interval
        motionManager.startAccelerometerUpdates( to: OperationQueue() ) {  p, _ in
            if p != nil {
                if let acceleration = p?.acceleration {
                    duration =
                        fabs( acceleration.y ) < fabs( acceleration.x )
                        ?   acceleration.x > 0 ? VNMothionType.Left.rawValue : VNMothionType.Right.rawValue : VNMothionType.Up.rawValue
                }
            }

            switch duration {
            case VNMothionType.Left.rawValue : image = images[0]
            case VNMothionType.Right.rawValue : image = images[0]
            case VNMothionType.Up.rawValue : image = images[1]
            default: break
            }

            guard let c = image?.cgImage else { return }
            v.checkFace(c, type: VNMothionType(rawValue: duration))
        }
    
    }

    open func checkMothionStop() {
        motionManager.stopAccelerometerUpdates()
    }
}

