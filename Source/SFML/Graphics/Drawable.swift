import Foundation
import CSFML

public protocol Drawable
{
    func draw(target: RenderTarget, states: RenderStates)
}