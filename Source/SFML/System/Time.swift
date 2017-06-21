import Foundation
import CSFML

public struct Time
{
    var ptr: sfTime

    public var seconds: Float
    {
        return sfTime_asSeconds(self.ptr)
    }

    public var milliseconds: Int
    {
        return Int(sfTime_asMilliseconds(self.ptr))
    }

    public var microseconds: Int
    {
        return Int(sfTime_asMicroseconds(self.ptr))
    }

    init(seconds: Float)
    {
        self.ptr = sfSeconds(seconds)
    }

    init(milliseconds: Int)
    {
        self.ptr = sfMilliseconds(Int32(milliseconds))
    }

    init(microseconds: Int)
    {
        self.ptr = sfMicroseconds(Int64(microseconds))
    }

    init(time: sfTime)
    {
        self.ptr = time
    }
}