import Foundation
import CSFML

public class RenderWindow: Window, RenderTarget
{
    public override var framerate: Int
    {
        get { return _framerate }
        set(value)
        {
            _framerate = value
            sfRenderWindow_setFramerateLimit(ptr, UInt32(value))
        }
    }

    public override var title: String
    {
        get { return _title }
        set(value)
        {
            _title = value
            sfRenderWindow_setTitle(ptr, value)
        }
    }

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