//
//  stage2.2.BidirectionalCollection.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

class MyBidirectionalCollection : Collection {
    var startIndex: Int {
        return 1
    }
    
    var endIndex: Int {
        return 2
    }
    
    func index(after i: Int) -> Int {
        return i + 1
    }
    
    
    // start, end, index(after i: Int) -> indices: DefaultIndices
    subscript(position: Int) -> Void {
        get {
            return ()
        }
    }
}

extension MyBidirectionalCollection : BidirectionalCollection {
    func index(before i: Int) -> Int {
        return i - 1
    }
}
