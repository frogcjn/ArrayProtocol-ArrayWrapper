//
//  stage0.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

import Foundation

fileprivate class MySequence1 : Sequence {
    // makeIterator() is implemented by stdlib if "Self : IteratorProtocol"
    // makeIterator() -> Iterator {
    //     return self
    // }
    
    // required: Sequence.Iterator <- "makeIterator() -> Iterator"
    // required: Sequence.Element <- "Iterator.Element"
}

extension MySequence1 : IteratorProtocol {
    func next() -> Int? {
        return nil
    }
    // required: IteratorProtocol.Element <- "next() -> Element?"
}
