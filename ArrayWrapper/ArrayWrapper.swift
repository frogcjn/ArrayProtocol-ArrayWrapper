//
//  ArrayWrapper.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/3.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

public class ArrayLikeWrapper<Wrapped : ArrayLikeProtocol> : ArrayLikeProtocol {
    
    public var wrapped: Wrapped
    
    public init(_ wrapped: Wrapped) {
        self.wrapped = wrapped
    }
    
    public required convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    // MutableCollection, RangeReplaceableCollection, RandomAccessCollection
    
    public required init() {
        wrapped = Wrapped()
    }
    
    public subscript(position: Int) -> Wrapped.Element {
        get {
            return wrapped[position]
        }
        set {
            wrapped[position] = newValue
        }
    }
    
    public var startIndex: Int {
        return wrapped.startIndex
    }
    
    public var endIndex: Int {
        return wrapped.endIndex
    }
    
    // CustomStringConvertible, CustomDebugStringConvertible
    
    public var description: String {
        return wrapped.description
    }
    
    public var debugDescription: String {
        return wrapped.debugDescription
    }
    
    public var customMirror: Mirror {
        return wrapped.customMirror
    }
    
    // ArrayLikeProtocol
    
    public var capacity: Int {
        return wrapped.capacity
    }
    
    // ArrayBufferProtocol, ArrayBytesProtocol
    
    public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Wrapped.Element>) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeBufferPointer(body)
    }
    
    public func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Wrapped.Element>) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeMutableBufferPointer(body)
    }
    
    public func withUnsafeBytes<R>(_ body: (UnsafeRawBufferPointer) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeBytes(body)
    }
    
    public func withUnsafeMutableBytes<R>(_ body: (UnsafeMutableRawBufferPointer) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeMutableBytes(body)
    }
}

public class ArrayWrapper<Wrapped : ArrayProtocol> : ArrayProtocol {
    
    public var wrapped: Wrapped
    
    public init(_ wrapped: Wrapped) {
        self.wrapped = wrapped
    }
    
    public required convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    
    // MutableCollection, RangeReplaceableCollection, RandomAccessCollection
    
    public required init() {
        wrapped = []
    }
    
    public subscript(position: Int) -> Wrapped.Element {
        get {
            return wrapped[position]
        }
        set {
            wrapped[position] = newValue
        }
    }
    
    public var startIndex: Int {
        return wrapped.startIndex
    }
    
    public var endIndex: Int {
        return wrapped.endIndex
    }
    
    // CustomStringConvertible, CustomDebugStringConvertible
    
    public var description: String {
        return wrapped.description
    }
    
    public var debugDescription: String {
        return wrapped.debugDescription
    }
    
    public var customMirror: Mirror {
        return wrapped.customMirror
    }
    
    // ArrayLikeProtocol
    
    public var capacity: Int {
        return wrapped.capacity
    }
    
    // Encoder, Decoder
    
    public required convenience init(from decoder: Decoder) throws {
        try self.init([Element](from: decoder))
    }
    
    public func encode(to encoder: Encoder) throws {
        return try wrapped.encode(to: encoder)
    }
    
    // ArrayBufferProtocol, ArrayBytesProtocol
    
    public func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Wrapped.Element>) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeBufferPointer(body)
    }
    
    public func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Wrapped.Element>) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeMutableBufferPointer(body)
    }
    
    public func withUnsafeBytes<R>(_ body: (UnsafeRawBufferPointer) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeBytes(body)
    }
    
    public func withUnsafeMutableBytes<R>(_ body: (UnsafeMutableRawBufferPointer) throws -> R) rethrows -> R {
        return try wrapped.withUnsafeMutableBytes(body)
    }
}
