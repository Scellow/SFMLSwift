import Foundation
import CSFML

enum FontError: Error
{
    case FileNotExist
}

public class Font
{
    var ptr: OpaquePointer? = nil

    public init(file: String) throws
    {
        ptr = sfFont_createFromFile(file)
        guard ptr != nil else
        {
            throw FontError.FileNotExist
        }
    }

    deinit
    {
        sfFont_destroy(ptr)
    }
}