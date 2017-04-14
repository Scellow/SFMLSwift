import Foundation
import CSFML // TODO: get rid of this, but i fist need to complete the binding
import SFML


let width = 800
let height = 600
let clock = Clock()
let window = RenderWindow(mode: VideoMode(width: width, height: height), title: "SFML Swift", style: .Default)
window.setFramerateLimit(value: 60)

var r:UInt8 = 55

while window.isOpen()
{
    window.pollEvent()
    {
        event in

        if event.isClosed
        {
            window.close()
        }
    }

    if Keyboard.isKeyPressed(code: sfKeyRight)
    {
        r+=1
    }

    if Keyboard.isKeyPressed(code: sfKeyLeft)
    {
        r-=1
    }

    let deltaTime = clock.restart().seconds

    window.clear(color: Color.fromRGB(red: r, green: 0, blue: 0))

    window.display()
}