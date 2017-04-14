import Foundation
import CSFML

public class RenderWindow: Window, RenderTarget
{

    public init(mode: VideoMode, title: String, style: VideoStyle)
    {
        // TODO: not sure about this
        super.init(handle: sfRenderWindow_create(mode.ptr, title, style.rawValue, nil))
    }

    public override func isOpen() -> Bool
    {
        return Bool(NSNumber(value: sfRenderWindow_isOpen(ptr)))
    }

    public override func close()
    {
        sfRenderWindow_close(ptr)
    }

    public override func setFramerateLimit(value: Int)
    {
        sfRenderWindow_setFramerateLimit(ptr, UInt32(value))
    }

    public override func setTitle(value: String)
    {
        sfRenderWindow_setTitle(ptr, value)
    }

    public func clear(color: Color = Color.black)
    {
        sfRenderWindow_clear(ptr, color.ptr)
    }

    public override func display()
    {
        sfRenderWindow_display(ptr)
    }

    public override func pollEvent(completionHandler: (_ event: sfEvent) -> Void)
    {
        var eventCatch: sfEvent = sfEvent()
        while (sfRenderWindow_pollEvent(ptr, &eventCatch) == 1)
        {
            completionHandler(eventCatch)
        }
    }

    public func draw(drawable: Drawable)
    {
        if let draw = drawable as? Shape
        {
            sfRenderWindow_drawShape(ptr, draw.shape, nil)
        } else if let draw = drawable as? Text
        {
            sfRenderWindow_drawText(ptr, draw.text, nil)
        }
    }

    deinit
    {
        sfWindow_destroy(ptr)
    }
}