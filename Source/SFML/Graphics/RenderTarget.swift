import Foundation
import CSFML

public protocol RenderTarget
{
    func clear(color: Color)

    func draw(drawable: Drawable)
}
