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

    public init() {
        self.a?.v = self
    }

    func radianFrom(_ roll: Double) -> CGFloat {
        return  CGFloat(roll)
    }

    public func checkFace(_ cgImage: CGImage, count: Int) {
        let faceDetectionRequest = VNDetectFaceRectanglesRequest(completionHandler: { [self] (request, error) in
            
            if error != nil {
                print("FaceDetection error: \(String(describing: error)).")
            }
            guard let faceDetectionRequest = request as? VNDetectFaceRectanglesRequest,
                  let results = faceDetectionRequest.results as? [VNFaceObservation] else {
                return
            }
            results.compactMap{ observation in
                switch count {
                case 0:
                    a?.angle = radianFrom(Double(truncating: observation.roll!))
                case 1:
                    a?.angle = radianFrom(Double(truncating: observation.roll!) * 2)
                case 2:
                    a?.angle = radianFrom(Double(truncating: observation.roll!) * 3)
                case 3:
                    a?.angle = radianFrom(Double(truncating: observation.roll!) * 4)
                default:
                    break
                }

            }.first
        })
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([faceDetectionRequest])
    }
}
