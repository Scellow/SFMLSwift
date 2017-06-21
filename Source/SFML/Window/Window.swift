import Foundation
import CSFML

public struct VideoMode
{
    public var ptr: sfVideoMode

    public var width: UInt
    {
        get
        {
            return UInt(ptr.width)
        }
        set(value)
        {
            ptr.width = UInt32(value)
        }
    }

    public var height: UInt
    {
        get
        {
            return UInt(ptr.height)
        }
        set(value)
        {
            ptr.width = UInt32(value)
        }
    }

    public var bitsPerPixel: UInt
    {
        get
        {
            return UInt(ptr.bitsPerPixel)
        }
        set(value)
        {
            ptr.bitsPerPixel = UInt32(value)
        }
    }

    public init(width: Int, height: Int, bpp: Int = 32)
    {
        ptr = sfVideoMode(width: UInt32(width), height: UInt32(height), bitsPerPixel: UInt32(bpp))
    }
}

public class Window
{
    var _framerate: Int = 0
    var _title: String = ""

    public var ptr: OpaquePointer

    public var framerate: Int
    {
        get { return _framerate }
        set(value)
        {
            _framerate = value
            sfWindow_setFramerateLimit(ptr, UInt32(value))
        }
    }

    public var title: String
    {
        get { return _title }
        set(value)
        {
            _title = value
            sfWindow_setTitle(ptr, value)
        }
    }

    init(mode: VideoMode, title: String, style: VideoStyle, settings: ContextSettings? = nil)
    {
        ptr = sfWindow_create(mode.ptr, title, style.rawValue, nil)
    }

    init(handle: OpaquePointer)
    {
        ptr = handle
    }

    deinit
    {
        sfWindow_destroy(ptr)
    }

    public func isOpen() -> Bool
    {
        return Bool(NSNumber(value: sfWindow_isOpen(ptr)))
    }

    public func close()
    {
        sfWindow_close(ptr)
    }

    public func pollEvent(completionHandler: (_ event: sfEvent) -> Void)
    {
        var eventCatch: sfEvent = sfEvent()
        while (sfWindow_pollEvent(ptr, &eventCatch) == 1)
        {
            completionHandler(eventCatch)
        }
    }

    public func display()
    {
        sfWindow_display(ptr)
    }
}