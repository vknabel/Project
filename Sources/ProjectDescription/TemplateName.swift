import Foundation
import Stencil
import PathKit

public struct TemplateName: RawRepresentable {
    public var rawValue: String
    public init?(rawValue: String) {
        self.rawValue = rawValue
    }

    internal var prefix: Path? {
        return Project.searchDirectories.reversed().first(where: { ($0 + self.rawValue).exists })
    }
    internal var path: Path? {
        guard let prefix = prefix else { return nil }
        return prefix + rawValue
    }
}

public extension Template {
    public convenience init(search suffix: TemplateName) throws {
        guard let path = suffix.path else {
            throw  NSError(domain: NSURLErrorDomain, code: NSURLErrorFileDoesNotExist, userInfo: ["path": suffix, "searchDirectories": Project.searchDirectories])
        }
        try self.init(path: path)
    }
}
