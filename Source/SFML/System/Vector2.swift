import Foundation
import CSFML

public struct Vector2i
{
    public var ptr = sfVector2i()

    public init(x: Int = 0, y: Int = 0)
    {
        self.x = x
        self.y = y
    }

    public var x: Int
    {
        get { return Int(ptr.x) }
        set(value) { ptr.x = Int32(value) }
    }

    public var y: Int
    {
        get { return Int(ptr.y) }
        set(value) { ptr.y = Int32(value) }
    }
}

public struct Vector2u
{
    public var ptr = sfVector2u()

    public init(ptr: sfVector2u)
    {
        self.ptr = ptr
    }

    public init(x: UInt = 0, y: UInt = 0)
    {
        self.x = x
        self.y = y
    }

    public var x: UInt
    {
        get { return UInt(ptr.x) }
        set(value) { ptr.x = UInt32(value) }
    }

    public var y: UInt
    {
        get { return UInt(ptr.y) }
        set(value) { ptr.y = UInt32(value) }
    }
}

public struct Vector2f
{
    public var ptr = sfVector2f()

    public init(x: Float = 0.0, y: Float = 0.0)
    {
        self.x = x
        self.y = y
    }

    public var x: Float
    {
        get { return ptr.x }
        set(value) { ptr.x = value }
    }

    public var y: Float
    {
        get { return ptr.y }
        set(value) { ptr.y = value }
    }
}
