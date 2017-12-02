//
//  stage2.3.RandomAccessCollection.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

struct MyRandomAccessCollection : RandomAccessCollection {
    subscript(position: Int) ->Void {
        return ()
    }
    
    var startIndex: Int {
        return 1
    }
    
    var endIndex: Int {
        return 2
    }
}
