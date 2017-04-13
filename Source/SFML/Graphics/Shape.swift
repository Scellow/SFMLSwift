import Foundation
import CSFML

public protocol Shape: Transformable, Drawable
{
    var shape: OpaquePointer
    {
        get
    }
    var fillColor: sfColor
    {
        get set
    }
    var outlineColor: sfColor
    {
        get set
    }
    var outlineThickness: Float
    {
        get set
    }
    func getPointCount() -> Int

    func getPoint(index: Int) -> (Float, Float)
}

extension Shape
{
    func update()
    { //Never Override this function !
        sfShape_update(shape)
    }
    public var position: (Float, Float)
    {
        get
        {
            let vector = sfShape_getPosition(shape)
            return (vector.x, vector.y)
        }
        set
        {
            let vector = sfVector2f(x: newValue.0, y: newValue.1)
            sfShape_setPosition(shape, vector)
        }
    }
    public var rotation: Float
    {
        get
        {
            return sfShape_getRotation(shape)
        }set
    {
        sfShape_setRotation(shape, newValue)
    }
    }
    public var scale: (Float, Float)
    {
        get
        {
            let vector = sfShape_getPosition(shape)
            return (vector.x, vector.y)
        }set
    {
        let vector = sfVector2f(x: newValue.0, y: newValue.1)
        sfShape_setScale(shape, vector)
    }
    }
    public var origin: (Float, Float)
    {
        get
        {
            let vector = sfShape_getPosition(shape)
            return (vector.x, vector.y)
        }set
    {
        let vector = sfVector2f(x: newValue.0, y: newValue.1)
        sfShape_setOrigin(shape, vector)
    }
    }
    public var fillColor: sfColor
    {
        get
        {
            return sfShape_getFillColor(shape)
        }set
    {
        sfShape_setFillColor(shape, newValue)
    }
    }
    public var outlineColor: sfColor
    {
        get
        {
            return sfShape_getOutlineColor(shape)
        }set
    {
        sfShape_setOutlineColor(shape, newValue)
    }
    }
    public var outlineThickness: Float
    {
        get
        {
            return sfShape_getOutlineThickness(shape)
        }
        set
        {
            sfShape_setOutlineThickness(shape, newValue)
        }
    }
    public func move(offsetX: Float, offsetY: Float)
    {
        let vector = sfVector2f(x: offsetX, y: offsetY)
        sfShape_move(shape, vector)
    }

    public func rotate(angle: Float)
    {
        sfShape_rotate(shape, angle)
    }

    public func scale(factorX: Float, factorY: Float)
    {
        let vector = sfVector2f(x: factorX, y: factorY)
        sfShape_scale(shape, vector)
    }
}