import Foundation
import CSFML

public struct VideoStyle: OptionSet
{
    public let rawValue: UInt32
    public init(rawValue: UInt32)
    {
        self.rawValue = rawValue
    }

    static let None = VideoStyle(rawValue: 0)
    static let Titlebar = VideoStyle(rawValue: 1 << 0)
    static let Resize = VideoStyle(rawValue: 1 << 1)
    static let Close = VideoStyle(rawValue: 1 << 2)
    static let FullScreen = VideoStyle(rawValue: 1 << 3)
    static let Default: VideoStyle = [Titlebar, Resize, Close]
}
