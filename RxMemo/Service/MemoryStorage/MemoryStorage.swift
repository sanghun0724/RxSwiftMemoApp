//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/22.
//

import Foundation
import RxSwift
//메모리저장소 구현 (메모리의 메모를 저장)
class MemoryStorage: MemoStorageType {
    private var list = [
        Memo(content: "Hello,RxSwift", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Lorem Ipsum", insertDate: Date().addingTimeInterval(-20))
    ] //이 배열은 옵저버블을 통해 외부로 공개됨  그리고 이 옵저버블은 배열의 상태가 업데이트되면 새로운 넥스트이벤트를 방출 해야함
    
    //초기데이터도 보여줘야하니 Behavial 로
    private lazy var store = BehaviorSubject<[Memo]>(value: list) //기본값을 list로 표현하기 위해 lazy로 선언
    
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content:content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store //이 메소드를 통해 subject에 접근
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let update = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: {$0 == memo}) {//오리지날 메모랑 같은 배열위치
            list.remove(at:index)
            list.insert(update, at: index)
            
        }
        store.onNext(list)
        
        return Observable.just(update)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: {$0 == memo}) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
}

