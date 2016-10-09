
public struct License: SubContext {
    public let type: String
    public let text: String

    public init(type: String, text: String) {
        self.type = type
        self.text = text
    }
}

import Stencil

public extension License {
    public func context(from dictionary: [String: Any]) throws -> Any {
        return [
            "type": type,
            "text": text
        ]
    }
}
