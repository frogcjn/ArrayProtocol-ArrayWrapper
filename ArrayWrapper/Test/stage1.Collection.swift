//
//  stage1.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

class MyCollection : Collection {
    
    var startIndex: Int {
        return 100
    }
    
    var endIndex: Int {
        return 0
    }
    
    func index(after i: Int) -> Int {
        return i - 2
    }
    
    // start, end, index(after i: Int) -> indices: DefaultIndices
    
    subscript(position: Int) -> Void {
        return ()
    }
}

