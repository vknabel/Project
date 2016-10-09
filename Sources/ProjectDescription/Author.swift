import Stencil

public struct Author: SubContext {
    public var name: String
    public var email: String

    public init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

import Stencil

public extension Author {
    public func context(from dictionary: [String: Any]) throws -> Any {
        return [
            "name": name,
            "email": email
        ]
    }
}
