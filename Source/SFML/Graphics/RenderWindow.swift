import Foundation
import CSFML

public class RenderWindow: RenderTarget
{
    private(set) var width: Int
    private(set) var height: Int
    private(set) var bitsPerPixel: Int
    private(set) var title: String
    private var window: OpaquePointer

    public init(title: String, width: Int, height: Int, bitsPerPixel: Int, style: VideoStyle)
    {
        self.title = title
        self.width = width
        self.height = height
        self.bitsPerPixel = bitsPerPixel
        let mode = sfVideoMode(width: UInt32(width), height: UInt32(height), bitsPerPixel: UInt32(bitsPerPixel))
        window = sfRenderWindow_create(mode, title, style.rawValue, nil)
    }

    public convenience init(title: String, width: Int, height: Int, style: VideoStyle)
    {
        self.init(title: title, width: width, height: height, bitsPerPixel: 32, style: style)
    }

    public convenience init(title: String, width: Int, height: Int)
    {
        self.init(title: title, width: width, height: height, bitsPerPixel: 32, style: .Default)
    }

    public func isOpen() -> Bool
    {
        return Bool(NSNumber(value: sfRenderWindow_isOpen(window)))
    }

    public func close()
    {
        sfRenderWindow_close(window)
    }

    public func setFramerateLimit(value: Int)
    {
        sfRenderWindow_setFramerateLimit(window, UInt32(value))
    }

    public func setTitle(value: String)
    {
        sfRenderWindow_setTitle(window, value)
    }

    public func clear(color: Color = Color.black)
    {
        sfRenderWindow_clear(window, sfColor(r: color.r,g: color.g,b: color.b,a: color.a))
    }

    public func display()
    {
        sfRenderWindow_display(window)
    }

    public func pollEvent(completionHandler: (_ event: sfEvent) -> Void)
    {
        var eventCatch: sfEvent = sfEvent()
        while (sfRenderWindow_pollEvent(window, &eventCatch) == 1)
        {
            completionHandler(eventCatch)
        }
    }

    public func draw(drawable: Drawable)
    {
        if let draw = drawable as? Shape
        {
            sfRenderWindow_drawShape(window, draw.shape, nil)
        } else if let draw = drawable as? Text
        {
            sfRenderWindow_drawText(window, draw.text, nil)
        }
    }

    deinit
    {
        sfWindow_destroy(window)
    }
}