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
    var indentity:String
    
    init(content:String,insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.indentity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    init(original:Memo,updatedContent:String) {
        self = original
        self.content = updatedContent
    }
}
