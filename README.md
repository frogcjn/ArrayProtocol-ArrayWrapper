# ArrayProtocol-ArrayWrapper
This repo contains two of `ArrayProtocol`, and two of `ArrayWrapper` to emulate the `Array` in Swift.
Thus you can subclass an `"Array"` type easily.

## About ArrayLikeProtocol
There are 3 array-like types in Swift 4 `stdlib`: `Array`, `ArraySlice` and `ContiguousArray`.

So I made `ArrayLikeProtocol` to conclude these three types.
```Swift
extension ArraySlice: ArrayLikeProtocol {}

extension ContiguousArray: ArrayLikeProtocol {}

extension Array : ArrayLikeProtocol {}
```

## About ArrayProtocol
And `Array` conforms `Encodable` and `Decodable`, so there is a special `ArrayProtocol` conforms these two.
```Swift
extension Array : ArrayProtocol {}
```

## About ArrayLikeWrapper and ArrayWrapper

There are two types of `ArrayWrapper`. If you only want to wrap `Array` type, you could just use `ArrayWrapper`.
If you want wrap to all the array-like types, use `ArrayLikeWrapper` instead.

```Swift
public class ArrayLikeWrapper<Wrapped : ArrayLikeProtocol> : ArrayLikeProtocol {
    
    public var wrapped: Wrapped
    
    public init(_ wrapped: Wrapped) {
        self.wrapped = wrapped
    }
    
    public required convenience init(arrayLiteral elements: Element...) {
        self.init(elements)
    }
    ...
}
```

Enjoy.
