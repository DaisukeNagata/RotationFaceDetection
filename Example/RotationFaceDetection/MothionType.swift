//
//  MothionType.swift
//  RotationFaceDetection_Example
//
//  Created by 永田大祐 on 2020/12/07.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

enum MothionType: UIInterfaceOrientationMask.RawValue {

    typealias RawValue = UIInterfaceOrientationMask

    init?(rawValue: RawValue) {
        switch rawValue {
        case .portrait: self = .portrait
        case .all     : self = .all
        default       : self = .all
        }
    }

    var rawValue: RawValue {
        switch self {
        case .portrait: return UIInterfaceOrientationMask.portrait
        case .all: return UIInterfaceOrientationMask.all
        }
    }

    case  portrait, all
}

struct D {
    static var orientationFlg = false
    static var duration = MothionType.RawValue() {
        didSet {
            return
        }
    }
}
