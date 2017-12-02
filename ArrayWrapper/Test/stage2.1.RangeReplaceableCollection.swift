//
//  stage2.1.RangeReplaceableCollection.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

struct MyRangeReplaceableCollection : RangeReplaceableCollection {
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
    
    init() {
    }
    
    func replaceSubrange<C>(_ subrange: Range<Index>, with newElements: C)
        where C : Collection, C.Element == Element {
            
    }
}
