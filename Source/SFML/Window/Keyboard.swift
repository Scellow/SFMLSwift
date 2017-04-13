import Foundation
import CSFML

public class Keyboard
{
    public class func isKeyPressed(code: sfKeyCode) -> Bool
    {
        return Bool(NSNumber(value: sfKeyboard_isKeyPressed(code)))
    }
}
