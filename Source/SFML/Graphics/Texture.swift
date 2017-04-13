import Foundation
import CSFML

enum TextureError: Error
{
    case FileNotExist
}

public class Texture
{
    var texture: OpaquePointer? = nil

    public init(file: String) throws
    {
        texture = sfTexture_createFromFile(file, nil)
        guard texture != nil else
        {
            throw TextureError.FileNotExist
        }
    }
}
