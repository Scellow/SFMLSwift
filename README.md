# Read Me

This is a work in progress, it works, but it's incomplete



# BUILD

Make sure you have csfml installed!


* macOS: ``brew install csfml`` 

* ubuntu: ``apt install csfml`` 

In order to find the C headers and libs, we need to compile with the following command: 

``swift build -Xcc -fblocks -Xswiftc -I/usr/local/include -Xlinker -L/usr/local/lib``

If you use CLion with the Swift plugin, you must run this once to generate the executable, then use the Run Configuration menu to select it

Then you can build it using CLion (cmake)

If you are unable to find the ``.build`` folder, wich is hidden by default, just create a symlink ``ln -s .build/ out/`` 

# Screenshot

```swift
import Foundation
import CSFML
import SFML

let width = 800
let height = 600
let window = RenderWindow(title: "SFML Swift", width: width, height: height)
window.setFramerateLimit(value: 60)

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
    window.clear(color: Color.fromRGB(red: 55, green: 0, blue: 0))
    window.display()
}
```

![screen](http://i.imgur.com/V0npXJE.png)
