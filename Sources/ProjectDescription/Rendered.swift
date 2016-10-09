import Stencil

public struct Rendered<R>: SubContext {
    public typealias Renderer = (Context) throws -> R
    public let renderer: Renderer

    public init(
        additional dictionary: [String: Any] = [:],
        rendering renderer: @escaping Renderer) {
        self.renderer = { context in
            return try context.push(dictionary: dictionary) {
                return try renderer(context) }
        }
    }

    public func context(from dictionary: [String: Any]) throws -> Any {
        return try renderer(Context(dictionary: dictionary))
    }
}
