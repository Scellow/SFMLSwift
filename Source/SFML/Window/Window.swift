import Foundation
import CSFML

public struct VideoMode
{
    public var ptr: sfVideoMode

    public var width: UInt32
    {
        get
        {
            return ptr.width
        }
        set(newValue)
        {
            ptr.width = newValue
        }
    }

    public var height: UInt32
    {
        get
        {
            return ptr.height
        }
        set(newValue)
        {
            ptr.height = newValue
        }
    }

    public var bitsPerPixel: UInt32
    {
        get
        {
            return ptr.bitsPerPixel
        }
        set(newValue)
        {
            ptr.bitsPerPixel = newValue
        }
    }


    public init(width: Int, height: Int, bpp: Int = 32)
    {
        ptr = sfVideoMode(width: UInt32(width), height: UInt32(height), bitsPerPixel: UInt32(bpp))
    }
}

public class Window
{
    public var ptr: OpaquePointer

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

    public func setTitle(value: String)
    {
        sfWindow_setTitle(ptr, value)
    }

    public func setFramerateLimit(value: Int)
    {
        sfWindow_setFramerateLimit(ptr, UInt32(value))
    }
    /*
        static extern IntPtr sfWindow_create(VideoMode Mode, string Title, Styles Style, ref ContextSettings Params);
        static extern IntPtr sfWindow_createUnicode(VideoMode Mode, IntPtr Title, Styles Style, ref ContextSettings Params);
        static extern IntPtr sfWindow_createFromHandle(IntPtr Handle, ref ContextSettings Params);
        static extern void sfWindow_destroy(IntPtr CPointer);
        static extern bool sfWindow_isOpen(IntPtr CPointer);
        static extern void sfWindow_close(IntPtr CPointer);
        static extern bool sfWindow_pollEvent(IntPtr CPointer, out Event Evt);
        static extern bool sfWindow_waitEvent(IntPtr CPointer, out Event Evt);
        static extern void sfWindow_display(IntPtr CPointer);
        static extern ContextSettings sfWindow_getSettings(IntPtr CPointer);
        static extern Vector2i sfWindow_getPosition(IntPtr CPointer);
        static extern void sfWindow_setPosition(IntPtr CPointer, Vector2i position);
        static extern Vector2u sfWindow_getSize(IntPtr CPointer);
        static extern void sfWindow_setSize(IntPtr CPointer, Vector2u size);
        static extern void sfWindow_setTitle(IntPtr CPointer, string title);
        static extern void sfWindow_setUnicodeTitle(IntPtr CPointer, IntPtr title);
        unsafe static extern void sfWindow_setIcon(IntPtr CPointer, uint Width, uint Height, byte* Pixels);
        static extern void sfWindow_setVisible(IntPtr CPointer, bool visible);
        static extern void sfWindow_setMouseCursorVisible(IntPtr CPointer, bool Show);
        static extern void sfWindow_setMouseCursorGrabbed(IntPtr CPointer, bool grabbed);
        static extern void sfWindow_setVerticalSyncEnabled(IntPtr CPointer, bool Enable);
        static extern void sfWindow_setKeyRepeatEnabled(IntPtr CPointer, bool Enable);
        static extern bool sfWindow_setActive(IntPtr CPointer, bool Active);
        static extern void sfWindow_setFramerateLimit(IntPtr CPointer, uint Limit);
        static extern uint sfWindow_getFrameTime(IntPtr CPointer);
        static extern void sfWindow_setJoystickThreshold(IntPtr CPointer, float Threshold);
        static extern IntPtr sfWindow_getSystemHandle(IntPtr CPointer);
        static extern void sfWindow_requestFocus(IntPtr CPointer);
        static extern bool sfWindow_hasFocus(IntPtr CPointer);
        static extern Vector2i sfMouse_getPosition(IntPtr CPointer);
        static extern void sfMouse_setPosition(Vector2i position, IntPtr CPointer);
        static extern Vector2i sfTouch_getPosition(uint Finger, IntPtr RelativeTo);
    */
}