import Stencil
import Foundation

public struct InlineTemplate: ExpressibleByStringLiteral, ExpressibleByExtendedGraphemeClusterLiteral {
    public let template: Template

    public init(stringLiteral value: String) {
        self.template = Template(templateString: value)
    }

    public init(extendedGraphemeClusterLiteral value: StringLiteralType) {
        self.init(stringLiteral: value)
    }

    public init(unicodeScalarLiteral value: StringLiteralType) {
        self.init(stringLiteral: value)
    }

    public func render(_ context: Context) throws -> String {
        return try template.render(context)
    }

    public func context(from dictionary: [String: Any]) throws -> Any {
        return try render(Context(dictionary: dictionary))
    }
}
