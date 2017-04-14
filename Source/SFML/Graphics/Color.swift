import Foundation
import CSFML

//public struct Color
//{
//    public static let black =       Color(r: 0,   g: 0,   b: 0);
//    public static let white =       Color(r: 255, g: 255, b: 255);
//    public static let red =         Color(r: 255, g: 0,   b: 0);
//    public static let green =       Color(r: 0,   g: 255, b: 0);
//    public static let blue =        Color(r: 0,   g: 0,   b: 255);
//    public static let yellow =      Color(r: 255, g: 255, b: 0);
//    public static let magenta =     Color(r: 255, g: 0,   b: 255);
//    public static let cyan =        Color(r: 0,   g: 255, b: 255);
//    public static let transparent = Color(r: 0,   g: 0,   b: 0,   a: 0);
//
//    public var r: UInt8 = 0
//    public var g: UInt8 = 0
//    public var b: UInt8 = 0
//    public var a: UInt8 = 0
//
//    public init(r: UInt8 = 0,g: UInt8 = 0,b: UInt8 = 0,a: UInt8 = 255)
//    {
//        self.r = r
//        self.g = g
//        self.b = b
//        self.a = a
//    }
//}

//public typealias Color = sfColor
public struct Color
{
    public var ptr = sfColor()

    public var r: UInt8
    {
        get { return ptr.r }
        set(newR) { ptr.r = newR }
    }
    public var g: UInt8
    {
        get { return ptr.g }
        set(newG) { ptr.g = newG }
    }
    public var b: UInt8
    {
        get { return ptr.b }
        set(newB) { ptr.b = newB }
    }
    public var a: UInt8
    {
        get { return ptr.a }
        set(newA) { ptr.a = newA }
    }

    public init(r: UInt8 = 0, g: UInt8 = 0, b: UInt8 = 0, a: UInt8 = 255)
    {
        self.r = r
        self.g = g
        self.b = b
        self.a = a
    }
}

extension Color
{
    public static func fromRGB(red: UInt8, green: UInt8, blue: UInt8) -> Color
    {
        return Color(r: red,g:  green,b: blue)
    }

    public static func fromRGBA(red: UInt8, green: UInt8, blue: UInt8, alpha: UInt8) -> Color
    {
        return Color(r: red, g:  green, b: blue, a: alpha)
    }

    //public static func fromInteger(color: UInt32) -> Color
    //{
    //    return sfColor_fromInteger(color)
    //}

    //public func toInteger() -> UInt32
    //{
    //    return sfColor_toInteger(self)
    //}

    //public func add(color2: Color) -> Color
    //{
    //    return sfColor_add(self, color2)
    //}

    //public func subtract(color2: Color) -> Color
    //{
    //    return sfColor_subtract(self, color2)
    //}

    //public func modulate(color2: Color) -> Color
    //{
    //    return sfColor_modulate(self, color2)
    //}

    public static let black =       Color(r: 0,   g: 0,   b: 0);
    public static let white =       Color(r: 255, g: 255, b: 255);
    public static let red =         Color(r: 255, g: 0,   b: 0);
    public static let green =       Color(r: 0,   g: 255, b: 0);
    public static let blue =        Color(r: 0,   g: 0,   b: 255);
    public static let yellow =      Color(r: 255, g: 255, b: 0);
    public static let magenta =     Color(r: 255, g: 0,   b: 255);
    public static let cyan =        Color(r: 0,   g: 255, b: 255);
    public static let transparent = Color(r: 0,   g: 0,   b: 0,   a: 0);
}