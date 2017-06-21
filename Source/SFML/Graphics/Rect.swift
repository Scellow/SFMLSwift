import Foundation
import CSFML

public struct IntRect
{
    public var ptr = sfIntRect()

    public init(left: Int = 0, top: Int = 0, width: Int = 0, height: Int = 0)
    {
        self.left = left
        self.top = top
        self.width = width
        self.height = height
    }

    public var left: Int
    {
        get { return Int(ptr.left) }
        set(value) { ptr.left = Int32(value) }
    }

    public var top: Int
    {
        get { return Int(ptr.top) }
        set(value) { ptr.top = Int32(value) }
    }

    public var width: Int
    {
        get { return Int(ptr.width) }
        set(value) { ptr.width = Int32(value) }
    }

    public var height: Int
    {
        get { return Int(ptr.height) }
        set(value) { ptr.height = Int32(value) }
    }
}

public struct FloatRect
{
    public var ptr = sfFloatRect()

    public init(left: Float = 0.0, top: Float = 0.0, width: Float = 0.0, height: Float = 0.0)
    {
        self.left = left
        self.top = top
        self.width = width
        self.height = height
    }

    public var left: Float
    {
        get { return ptr.left }
        set(value) { ptr.left = value }
    }

    public var top: Float
    {
        get { return ptr.top }
        set(value) { ptr.top = value }
    }

    public var width: Float
    {
        get { return ptr.width }
        set(value) { ptr.width = value }
    }

    public var height: Float
    {
        get { return ptr.height }
        set(value) { ptr.height = value }
    }
}
