import Stencil

public struct Action {
    public typealias Renderer = (Project, Context) throws -> Void
    public let renderer: Renderer

    public init(rendering renderer: @escaping Renderer) {
        self.renderer = renderer
    }
}
