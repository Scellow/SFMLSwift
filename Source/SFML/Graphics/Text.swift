import Foundation
import CSFML

public struct TextStyle: OptionSet
{
    public let rawValue: UInt32

    public init(rawValue: UInt32)
    {
        self.rawValue = rawValue
    }

    static let Regular = TextStyle(rawValue: 0)
    static let Bold = TextStyle(rawValue: 1 << 0)
    static let Italic = TextStyle(rawValue: 1 << 1)
    static let Underlined = TextStyle(rawValue: 1 << 2)
    static let StrikeThrough = TextStyle(rawValue: 1 << 3)
}

public class Text: Transformable, Drawable
{
    var ptr: OpaquePointer

    public var position: (Float, Float)
    {
        get
        {
            let vector = sfText_getPosition(ptr)
            return (vector.x, vector.y)
        }
        set
        {
            let vector = sfVector2f(x: newValue.0, y: newValue.1)
            sfText_setPosition(ptr, vector)
        }
    }

    public var rotation: Float
    {
        get
        {
            return sfText_getRotation(ptr)
        }
        set
        {
            sfText_setRotation(ptr, newValue)
        }
    }

    public var scale: (Float, Float)
    {
        get
        {
            let vector = sfText_getScale(ptr)
            return (vector.x, vector.y)
        }
        set
        {
            let vector = sfVector2f(x: newValue.0, y: newValue.1)
            sfText_setScale(ptr, vector)
        }
    }

    public var origin: (Float, Float)
    {
        get
        {
            let vector = sfText_getOrigin(ptr)
            return (vector.x, vector.y)
        }
        set
        {
            let vector = sfVector2f(x: newValue.0, y: newValue.1)
            sfText_setOrigin(ptr, vector)
        }
    }

    public var color: sfColor
    {
        get
        {
            return sfText_getColor(ptr)
        }
        set
        {
            sfText_setColor(ptr, newValue)
        }
    }

    public var style: TextStyle
    {
        get
        {
            return TextStyle(rawValue: sfText_getStyle(ptr))
        }
        set
        {
            sfText_setStyle(ptr, newValue.rawValue)
        }
    }

    public var characterSize: Int
    {
        get
        {
            return Int(sfText_getCharacterSize(ptr))
        }
        set
        {
            sfText_setCharacterSize(ptr, UInt32(newValue))
        }
    }

    public var string: String
    {
        get
        {
            return String(describing: sfText_getString(ptr))
        }
        set
        {
            return sfText_setString(ptr, newValue)
        }
    }

    init(string: String, font: Font)
    {
        ptr = sfText_create()
        sfText_setFont(ptr, font.ptr)
        sfText_setString(ptr, string)
        //sfText_setColor(text,sfColor.redColor())
    }

    public func move(offsetX: Float, offsetY: Float)
    {
        let vector = sfVector2f(x: offsetX, y: offsetY)
        sfText_move(ptr, vector)
    }

    public func rotate(angle: Float)
    {
        sfText_rotate(ptr, angle)
    }

    public func scale(factorX: Float, factorY: Float)
    {
        let vector = sfVector2f(x: factorX, y: factorY)
        sfText_scale(ptr, vector)
    }

    public func draw(target: RenderTarget, states: RenderStates)
    {

    }
}