import Foundation
import CSFML

public class Clock
{
    private var ptr: OpaquePointer

    public init()
    {
        ptr = sfClock_create()
    }

    public func getElapsedTime() -> sfTime
    {
        return sfClock_getElapsedTime(ptr)
    }

    public func restart() -> sfTime
    {
        return sfClock_restart(ptr)
    }

    deinit
    {
        sfClock_destroy(ptr)
    }
}