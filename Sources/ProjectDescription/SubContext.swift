
import Stencil

public protocol SubContext {
    func context(from dictionary: [String: Any]) throws -> Any
}

public extension Array where Element: SubContext {
    func context(from dictionary: [String: Any]) throws -> Any {
        return try self.map({ try $0.context(from: dictionary) })
    }
}
