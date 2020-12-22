//
//  Memo.swift
//  RxMemo
//
//  Created by sangheon on 2020/12/22.
//

import Foundation

struct Memo:Equatable {
    var content:String
    var insertDate:Date
    var indentity:String //메모구분
    
    init(content:String,insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.indentity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    //업데이트된 내용
    init(original:Memo,updatedContent:String) {
        self = original
        self.content = updatedContent
    }
}

