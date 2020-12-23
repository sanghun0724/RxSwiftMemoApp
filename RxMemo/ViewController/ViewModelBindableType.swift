//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/23.
//

import UIKit

//뷰모델에서 뷰로 바인딩
protocol  ViewModelBindableType {
    associatedtype ViewModelType //제네릭
    
    var viewModel: ViewModelType! { get set }
    func  bindViewModel()
}

//뷰컨트롤러에 추가된 실제 뷰모댈을 저장하고 , 바인드 뷰모델 을 자동으로 호출하는 메소드 구현
extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel:Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel() //각 뷰컨에서 이 메소드를 호출할 일이 없기때문에 코드 단순해짐 
    }
}
