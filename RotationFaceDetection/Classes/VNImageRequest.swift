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
    private var count: Double = 1.0

    public init() {
        self.a?.v = self
    }

    func radianFrom(_ roll: Double) -> CGFloat {
        count = (count == 1.0 ? -1.0 : 1.0)
        print(count)
        return  CGFloat(roll * count)
    }

    public func checkFace(_ cgImage: CGImage) {
        let faceDetectionRequest = VNDetectFaceRectanglesRequest(completionHandler: { [self] (request, error) in
            
            if error != nil {
                print("FaceDetection error: \(String(describing: error)).")
            }
            guard let faceDetectionRequest = request as? VNDetectFaceRectanglesRequest,
                  let results = faceDetectionRequest.results as? [VNFaceObservation] else {
                return
            }
            results.compactMap{ observation in
                a?.angle = radianFrom(Double(truncating: observation.roll!))

            }.first
        })
        
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        try? handler.perform([faceDetectionRequest])
    }
}
