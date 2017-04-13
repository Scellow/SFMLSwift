import Foundation
import CSFML

public extension sfEvent
{
    public var isClosed: Bool
    {
        return type == sfEvtClosed
    }

    public var isKeyPressed: Bool
    {
        return type == sfEvtKeyPressed
    }

    public var isLostFocus: Bool
    {
        return type == sfEvtLostFocus
    }

    public var isGainedFocus: Bool
    {
        return type == sfEvtGainedFocus
    }

    public var isKeyUp: Bool
    {
        return isKeyPressed && key.code == sfKeyUp
    }

    public var isKeyDown: Bool
    {
        return isKeyPressed && key.code == sfKeyDown
    }

    public var isKeyRight: Bool
    {
        return isKeyPressed && key.code == sfKeyRight
    }

    public var isKeyLeft: Bool
    {
        return isKeyPressed && key.code == sfKeyLeft
    }

    public var isKeySpace: Bool
    {
        return isKeyPressed && key.code == sfKeySpace
    }
    public var isMouseButtonPressed: Bool
    {
        return type == sfEvtMouseButtonPressed
    }

    public var isMouseRightButtonPressed: Bool
    {
        return isMouseButtonPressed && mouseButton.button == sfMouseRight
    }

    public var isMouseLeftButtonPressed: Bool
    {
        return isMouseButtonPressed && mouseButton.button == sfMouseLeft
    }

    public var isMouseMiddleButton: Bool
    {
        return isMouseButtonPressed && mouseButton.button == sfMouseMiddle
    }
}
