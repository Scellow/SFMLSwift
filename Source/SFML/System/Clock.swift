import Foundation
import CSFML

public class Clock
{
    var ptr: OpaquePointer

    public  var elapsedTime: Time
    {
        return Time(time: sfClock_getElapsedTime(ptr))
    }

    public init()
    {
        ptr = sfClock_create()
    }

    deinit
    {
        sfClock_destroy(ptr)
    }

    public func restart() -> Time
    {
        return Time(time: sfClock_restart(ptr))
    }


}