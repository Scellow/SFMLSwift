import Foundation
import CSFML

public struct Attribute: OptionSet
{
    public let rawValue: UInt32
    public init(rawValue: UInt32)
    {
        self.rawValue = rawValue
    }

    public static let Default = VideoStyle(rawValue: 0)
    public static let Core = VideoStyle(rawValue: 1 << 0)
    public static let Debug = VideoStyle(rawValue: 1 << 2)
}

public struct ContextSettings
{
    public var ptr: sfContextSettings

    public var depthBits: UInt32
    {
        get
        {
            return ptr.depthBits
        }
        set(value)
        {
            ptr.depthBits = value
        }
    }
    public var stencilBits: UInt32
    {
        get
        {
            return ptr.stencilBits
        }
        set(value)
        {
            ptr.stencilBits = value
        }
    }
    public var antialiasingLevel: UInt32
    {
        get
        {
            return ptr.antialiasingLevel
        }
        set(value)
        {
            ptr.antialiasingLevel = value
        }
    }
    public var majorVersion: UInt32
    {
        get
        {
            return ptr.majorVersion
        }
        set(value)
        {
            ptr.majorVersion = value
        }
    }
    public var minorVersion: UInt32
    {
        get
        {
            return ptr.minorVersion
        }
        set(value)
        {
            ptr.minorVersion = value
        }
    }
    public var attributeFlags: Attribute
    {
        get
        {
            return Attribute(rawValue: ptr.attributeFlags)
        }
        set(value)
        {
            ptr.attributeFlags = value.rawValue
        }
    }
    public var sRgbCapable: Bool
    {
        get
        {
            return ptr.sRgbCapable == 1 ? true : false
        }
        set(value)
        {
            ptr.sRgbCapable = value ? 1 : 0
        }
    }

}