import Foundation
import CSFML // TODO: get rid of this, but i fist need to complete the binding
import SFML


let width = 1280
let height = 800

let clock = Clock()
let window = RenderWindow(mode: VideoMode(width: width, height: height), title: "Hello Swift!", style: .Default)
window.framerate = 60

var r:UInt8 = 55

var pos = Vector2f(x: 50.0, y: 70.0)
var size = IntRect(left: 0, top: 0, width: 100, height: 100)
var texture = try Texture(file: "data/sfml.png")
var texSize = texture.size
var font = try Font(file: "data/pf_ronda_seven.ttf")


print("Vector2f: \(pos.x):\(pos.y)")
print("IntRect: \(size.left):\(size.top):\(size.width):\(size.height)")
print("Texture Size: \(texSize.x):\(texSize.y)")


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

    let time = clock.restart()
    let dt = time.seconds


    window.clear(color: Color.fromRGB(red: r, green: 0, blue: 0))

    window.display()
}