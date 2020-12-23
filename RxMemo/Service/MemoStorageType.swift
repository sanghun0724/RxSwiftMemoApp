//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/22.
//

import Foundation
import RxSwift
//메모 저장소 구현
protocol MemoStorageType {
    //CRUD 구현
    @discardableResult //필요없는 경우도 있기에 discardable 추가
    func createMemo(content:String) -> Observable<Memo>
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo:Memo,content:String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
