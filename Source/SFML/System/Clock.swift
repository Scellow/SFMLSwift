import Foundation
import CSFML

public class Clock
{
    private var clock: OpaquePointer

    public init()
    {
        clock = sfClock_create()
    }

    public func getElapsedTime() -> sfTime
    {
        return sfClock_getElapsedTime(clock)
    }

    public func restart() -> sfTime
    {
        return sfClock_restart(clock)
    }

    deinit
    {
        sfClock_destroy(clock)
    }
}