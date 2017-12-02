//
//  stage3.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/3.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

import struct Foundation.Data

struct MySimpleArray : RandomAccessCollection, MutableCollection, RangeReplaceableCollection {
    
    subscript(position: Int) ->Void {
        get {
        return ()
        }
        set(newValue) {
            
        }
    }
    
    var startIndex: Int {
        return 1
    }
    
    var endIndex: Int {
        return 2
    }
}
