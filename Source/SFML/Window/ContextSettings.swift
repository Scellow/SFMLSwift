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
        set(newValue)
        {
            ptr.depthBits = newValue
        }
    }
    public var stencilBits: UInt32
    {
        get
        {
            return ptr.stencilBits
        }
        set(newValue)
        {
            ptr.stencilBits = newValue
        }
    }
    public var antialiasingLevel: UInt32
    {
        get
        {
            return ptr.antialiasingLevel
        }
        set(newValue)
        {
            ptr.antialiasingLevel = newValue
        }
    }
    public var majorVersion: UInt32
    {
        get
        {
            return ptr.majorVersion
        }
        set(newValue)
        {
            ptr.majorVersion = newValue
        }
    }
    public var minorVersion: UInt32
    {
        get
        {
            return ptr.minorVersion
        }
        set(newValue)
        {
            ptr.minorVersion = newValue
        }
    }
    public var attributeFlags: Attribute
    {
        get
        {
            return Attribute(rawValue: ptr.attributeFlags)
        }
        set(newValue)
        {
            ptr.attributeFlags = newValue.rawValue
        }
    }
    public var sRgbCapable: Bool
    {
        get
        {
            return ptr.sRgbCapable == 1 ? true : false
        }
        set(newValue)
        {
            ptr.sRgbCapable = newValue ? 1 : 0
        }
    }

}