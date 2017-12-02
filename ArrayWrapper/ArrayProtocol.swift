//
//  ArrayProtocol.swift
//  ArrayWrapper
//
//  Created by Cao, Jiannan on 2017/12/3.
//  Copyright © 2017年 Cao, Jiannan. All rights reserved.
//

// MARK: - ArrayProtocol

public protocol ArrayProtocol : ArrayLikeProtocol, Encodable, Decodable {}

extension Array : ArrayProtocol {}

// MARK: - ArrayLikeProtocol

public protocol ArrayLikeProtocol :
    ArrayBufferProtocol, ArrayBytesProtocol,
    MutableCollection, RangeReplaceableCollection, RandomAccessCollection,
    ExpressibleByArrayLiteral,
    CustomStringConvertible, CustomDebugStringConvertible,
    CustomReflectable where Index == Int {
    var capacity: Int { get }
}

extension ArraySlice: ArrayLikeProtocol {}

extension ContiguousArray: ArrayLikeProtocol {}

extension Array : ArrayLikeProtocol {}

// MARK: - ArrayBufferProtocol & ArrayBytesProtocol

public protocol ArrayBufferProtocol : Sequence {
    /// Calls a closure with a pointer to the array's contiguous storage.
    ///
    /// Often, the optimizer can eliminate bounds checks within an array
    /// algorithm, but when that fails, invoking the same algorithm on the
    /// buffer pointer passed into your closure lets you trade safety for speed.
    ///
    /// The following example shows how you can iterate over the contents of the
    /// buffer pointer:
    ///
    ///     let numbers = [1, 2, 3, 4, 5]
    ///     let sum = numbers.withUnsafeBufferPointer { buffer -> Int in
    ///         var result = 0
    ///         for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 2) {
    ///             result += buffer[i]
    ///         }
    ///         return result
    ///     }
    ///     // 'sum' == 9
    ///
    /// The pointer passed as an argument to `body` is valid only during the
    /// execution of `withUnsafeBufferPointer(_:)`. Do not store or return the
    /// pointer for later use.
    ///
    /// - Parameter body: A closure with an `UnsafeBufferPointer` parameter that
    ///   points to the contiguous storage for the array. ${contiguousCaveat} If
    ///   `body` has a return value, that value is also used as the return value
    ///   for the `withUnsafeBufferPointer(_:)` method. The pointer argument is
    ///   valid only for the duration of the method's execution.
    /// - Returns: The return value, if any, of the `body` closure parameter.
    // @_inlineable
    func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R
    
    /// Calls the given closure with a pointer to the array's mutable contiguous
    /// storage.
    ///
    /// Often, the optimizer can eliminate bounds checks within an array
    /// algorithm, but when that fails, invoking the same algorithm on the
    /// buffer pointer passed into your closure lets you trade safety for speed.
    ///
    /// The following example shows how modifying the contents of the
    /// `UnsafeMutableBufferPointer` argument to `body` alters the contents of
    /// the array:
    ///
    ///     var numbers = [1, 2, 3, 4, 5]
    ///     numbers.withUnsafeMutableBufferPointer { buffer in
    ///         for i in stride(from: buffer.startIndex, to: buffer.endIndex - 1, by: 2) {
    ///             buffer.swapAt(i, i + 1)
    ///         }
    ///     }
    ///     print(numbers)
    ///     // Prints "[2, 1, 4, 3, 5]"
    ///
    /// The pointer passed as an argument to `body` is valid only during the
    /// execution of `withUnsafeMutableBufferPointer(_:)`. Do not store or
    /// return the pointer for later use.
    ///
    /// - Warning: Do not rely on anything about the array that is the target of
    ///   this method during execution of the `body` closure; it might not
    ///   appear to have its correct value. Instead, use only the
    ///   `UnsafeMutableBufferPointer` argument to `body`.
    ///
    /// - Parameter body: A closure with an `UnsafeMutableBufferPointer`
    ///   parameter that points to the contiguous storage for the array.
    ///   ${contiguousCaveat} If `body` has a return value, that value is also
    ///   used as the return value for the `withUnsafeMutableBufferPointer(_:)`
    ///   method. The pointer argument is valid only for the duration of the
    ///   method's execution.
    /// - Returns: The return value, if any, of the `body` closure parameter.
    // @_semantics("array.withUnsafeMutableBufferPointer")
    // @inline(__always) // Performance: This method should get inlined into the
    // caller such that we can combine the partial apply with the apply in this
    // function saving on allocating a closure context. This becomes unnecessary
    // once we allocate noescape closures on the stack.
    mutating func withUnsafeMutableBufferPointer<R>(_ body: (inout UnsafeMutableBufferPointer<Element>) throws -> R) rethrows -> R
}

public protocol ArrayBytesProtocol {
    
    /// Calls the given closure with a pointer to the underlying bytes of the
    /// array's mutable contiguous storage.
    ///
    /// The array's `Element` type must be a *trivial type*, which can be copied
    /// with just a bit-for-bit copy without any indirection or
    /// reference-counting operations. Generally, native Swift types that do not
    /// contain strong or weak references are trivial, as are imported C structs
    /// and enums.
    ///
    /// The following example copies bytes from the `byteValues` array into
    /// `numbers`, an array of `Int`:
    ///
    ///     var numbers: [Int32] = [0, 0]
    ///     var byteValues: [UInt8] = [0x01, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00]
    ///
    ///     numbers.withUnsafeMutableBytes { destBytes in
    ///         byteValues.withUnsafeBytes { srcBytes in
    ///             destBytes.copyBytes(from: srcBytes)
    ///         }
    ///     }
    ///     // numbers == [1, 2]
    ///
    /// The pointer passed as an argument to `body` is valid only for the
    /// lifetime of the closure. Do not escape it from the closure for later
    /// use.
    ///
    /// - Warning: Do not rely on anything about the array that is the target of
    ///   this method during execution of the `body` closure; it might not
    ///   appear to have its correct value. Instead, use only the
    ///   `UnsafeMutableRawBufferPointer` argument to `body`.
    ///
    /// - Parameter body: A closure with an `UnsafeMutableRawBufferPointer`
    ///   parameter that points to the contiguous storage for the array.
    ///   ${contiguousCaveat} If `body` has a return value, that value is also
    ///   used as the return value for the `withUnsafeMutableBytes(_:)` method.
    ///   The argument is valid only for the duration of the closure's
    ///   execution.
    /// - Returns: The return value, if any, of the `body` closure parameter.
    
    mutating func withUnsafeMutableBytes<R>(_ body: (UnsafeMutableRawBufferPointer) throws -> R) rethrows -> R
    
    /// Calls the given closure with a pointer to the underlying bytes of the
    /// array's contiguous storage.
    ///
    /// The array's `Element` type must be a *trivial type*, which can be copied
    /// with just a bit-for-bit copy without any indirection or
    /// reference-counting operations. Generally, native Swift types that do not
    /// contain strong or weak references are trivial, as are imported C structs
    /// and enums.
    ///
    /// The following example copies the bytes of the `numbers` array into a
    /// buffer of `UInt8`:
    ///
    ///     var numbers = [1, 2, 3]
    ///     var byteBuffer: [UInt8] = []
    ///     numbers.withUnsafeBytes {
    ///         byteBuffer.append(contentsOf: $0)
    ///     }
    ///     // byteBuffer == [1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, ...]
    ///
    /// - Parameter body: A closure with an `UnsafeRawBufferPointer` parameter
    ///   that points to the contiguous storage for the array.
    ///   ${contiguousCaveat} If `body` has a return value, that value is also
    ///   used as the return value for the `withUnsafeBytes(_:)` method. The
    ///   argument is valid only for the duration of the closure's execution.
    /// - Returns: The return value, if any, of the `body` closure parameter.
    // @_inlineable
    func withUnsafeBytes<R>(_ body: (UnsafeRawBufferPointer) throws -> R) rethrows -> R
}
