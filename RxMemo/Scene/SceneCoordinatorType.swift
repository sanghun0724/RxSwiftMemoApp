//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/23.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult
    func transition (to scene: Scene,using style:TransitionStyle,animated:Bool) -> Completable
    
    
    
    @discardableResult
    func close(animated:Bool) -> Completable
}
