import Foundation
import CSFML

enum TextureError: Error
{
    case FileNotExist
}

public class Texture
{
    var ptr: OpaquePointer? = nil

    public init(ptr: OpaquePointer?)
    {
        self.ptr = ptr
    }

    public init(file: String, area: IntRect = IntRect()) throws
    {
        var a = area;
        ptr = sfTexture_createFromFile(file, &a.ptr)
        guard ptr != nil else
        {
            throw TextureError.FileNotExist
        }
    }

    deinit
    {
        sfTexture_destroy(ptr)
    }


}
