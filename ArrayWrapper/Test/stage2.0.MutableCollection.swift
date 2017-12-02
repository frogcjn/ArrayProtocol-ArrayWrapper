//
//  stage2.MutableCollection.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/2.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

class MyMutableCollection : MyCollection {
    override subscript(position: Int) -> () {
        get {
            return super[position]
        }
        set {
            print("hi")
        }
    }
}

extension MyMutableCollection : MutableCollection {
}
