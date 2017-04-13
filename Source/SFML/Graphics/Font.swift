import Foundation
import CSFML

enum FontError: Error
{
    case FileNotExist
}

public class Font
{
    private(set) var font: OpaquePointer?
    init(file: String) throws
    {
        font = sfFont_createFromFile(file)
        guard font != nil else
        {
            throw FontError.FileNotExist
        }
    }

    func getInfo() -> sfFontInfo
    {
        return sfFont_getInfo(font)
    }
}