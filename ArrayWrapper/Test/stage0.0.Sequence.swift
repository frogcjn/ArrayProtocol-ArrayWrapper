//
//  stage0.0.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

import Foundation

class MySequence : Sequence {
    
    func makeIterator() -> MyIterator {
        return MyIterator()
    }
    
    // required: Sequence.Iterator <- "makeIterator() -> Iterator"
    // required: Sequence.Element <- "Iterator.Element"
}

struct MyIterator: IteratorProtocol {
    func next() -> Int? {
        return nil
    }
    // required: IteratorProtocol.Element <- "next() -> Element?"
}
