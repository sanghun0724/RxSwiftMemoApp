//
//  TransitionModel.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/23.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError:Error {
    case navigationControllerMissing
    case cannotPop
    case unKnown
}
