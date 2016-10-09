import ProjectDescription

public extension String {
    public static var origin: String {
        return "origin"
    }
}

public struct GitAction {
    public var action: Action

    public init(_ action: Action) {
        self.action = action
    }
}

public extension Action {
    public static func git(
        remote: String = .origin,
        perform actions: GitAction...) -> Action {
        return Action.combining(actions: actions.map({ $0.action }))
            .with(additional: { project, context in
                return [
                    "remote": remote
                ]
            })
    }
}
