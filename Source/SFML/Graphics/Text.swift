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
    private(set) var text: OpaquePointer
    public var position: (Float, Float)
    {
        get
        {
            let vector = sfText_getPosition(text)
            return (vector.x, vector.y)
        }set
    {
        let vector = sfVector2f(x: newValue.0, y: newValue.1)
        sfText_setPosition(text, vector)
    }
    }
    public var rotation: Float
    {
        get
        {
            return sfText_getRotation(text)
        }set
    {
        sfText_setRotation(text, newValue)
    }
    }
    public var scale: (Float, Float)
    {
        get
        {
            let vector = sfText_getScale(text)
            return (vector.x, vector.y)
        }set
    {
        let vector = sfVector2f(x: newValue.0, y: newValue.1)
        sfText_setScale(text, vector)
    }
    }
    public var origin: (Float, Float)
    {
        get
        {
            let vector = sfText_getOrigin(text)
            return (vector.x, vector.y)
        }set
    {
        let vector = sfVector2f(x: newValue.0, y: newValue.1)
        sfText_setOrigin(text, vector)
    }
    }
    public var color: sfColor
    {
        get
        {
            return sfText_getColor(text)
        }set
    {
        sfText_setColor(text, newValue)
    }
    }
    public var style: TextStyle
    {
        get
        {
            return TextStyle(rawValue: sfText_getStyle(text))
        }set
    {
        sfText_setStyle(text, newValue.rawValue)
    }
    }

    public var characterSize: Int
    {
        get
        {
            return Int(sfText_getCharacterSize(text))
        }
        set
        {
            sfText_setCharacterSize(text, UInt32(newValue))
        }
    }

    public var string: String
    {
        get
        {
            return String(describing: sfText_getString(text))
        }
        set
        {
            return sfText_setString(text, newValue)
        }
    }
    init(string: String, font: Font)
    {
        text = sfText_create()
        sfText_setFont(text, font.font)
        sfText_setString(text, string)
        //sfText_setColor(text,sfColor.redColor())
    }

    public func move(offsetX: Float, offsetY: Float)
    {
        let vector = sfVector2f(x: offsetX, y: offsetY)
        sfText_move(text, vector)
    }

    public func rotate(angle: Float)
    {
        sfText_rotate(text, angle)
    }

    public func scale(factorX: Float, factorY: Float)
    {
        let vector = sfVector2f(x: factorX, y: factorY)
        sfText_scale(text, vector)
    }

    public func draw(target: RenderTarget)
    {
    }
}