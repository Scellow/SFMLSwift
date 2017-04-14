import Foundation
import CSFML

public struct VideoStyle: OptionSet
{
    public let rawValue: UInt32
    public init(rawValue: UInt32)
    {
        self.rawValue = rawValue
    }

    public static let None = VideoStyle(rawValue: 0)
    public static let Titlebar = VideoStyle(rawValue: 1 << 0)
    public static let Resize = VideoStyle(rawValue: 1 << 1)
    public static let Close = VideoStyle(rawValue: 1 << 2)
    public static let FullScreen = VideoStyle(rawValue: 1 << 3)
    public static let Default: VideoStyle = [Titlebar, Resize, Close]
}
