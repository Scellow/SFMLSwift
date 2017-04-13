import Foundation
import CSFML

public protocol Transformable
{
    var position: (Float, Float)
    {
        get set
    }
    var rotation: Float
    {
        get set
    }
    var scale: (Float, Float)
    {
        get set
    }
    var origin: (Float, Float)
    {
        get set
    }
    func move(offsetX: Float, offsetY: Float)

    func rotate(angle: Float)

    func scale(factorX: Float, factorY: Float)
}