//
//  VNImageRequest.swift
//  RotationFaceDetection
//
//  Created by 永田大祐 on 2020/12/06.
//

import UIKit
import Vision

public class VNImageRequest {

    open var a: VNAngularStructure?
    open var c: VNCoreMohtion?

    public init(c: VNCoreMohtion?) {
        self.a?.v = self
        self.c = c
    }

    func radianFrom(_ roll: Double) -> CGFloat {
        return  CGFloat(roll * -1)
    }

    public func checkFace(_ cgImage: CGImage) {
        var pi: Double = 0
        let faceDetectionRequest = VNDetectFaceRectanglesRequest(completionHandler: { [self] (request, error) in
            
            if error != nil {
                print("FaceDetection error: \(String(describing: error)).")
            }
            guard let faceDetectionRequest = request as? VNDetectFaceRectanglesRequest,
                  let results = faceDetectionRequest.results as? [VNFaceObservation] else {
                return
            }
            results.compactMap{ observation in
                switch c?.durationHandOver {
                case VNMothionType.Left.rawValue : pi =  3
                case VNMothionType.Right.rawValue: pi =  1
                case VNMothionType.Up.rawValue   : pi =  1
                case VNMothionType.Down.rawValue : pi =  3
                case .none : pi =  1
                case .some(_): pi =  1
                }
                a?.angle = radianFrom(Double(truncating: observation.roll!) * pi)

            }.first
        })
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([faceDetectionRequest])
    }
}
