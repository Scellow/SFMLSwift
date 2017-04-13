import Foundation
import CSFML

public extension sfTime
{
    var seconds: Float
    {
        get
        {
            return sfTime_asSeconds(self)
        }
    }
    var milliseconds: Int
    {
        return Int(sfTime_asMilliseconds(self))
    }

    var microseconds: Int
    {
        return Int(sfTime_asMicroseconds(self))
    }

    init(seconds: Float)
    {
        self = sfSeconds(seconds)
    }

    init(milliseconds: Int)
    {
        self = sfMilliseconds(Int32(milliseconds))
    }

    init(microseconds: Int)
    {
        self = sfMicroseconds(Int64(microseconds))
    }
}