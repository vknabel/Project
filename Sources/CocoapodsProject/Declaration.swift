import ProjectDescription

public extension Action {
    public static func cocoapods(perform actions: CocoapodsAction...) -> Action {
        return Action.combining(actions: actions.map({ $0.action }))
            .with(additional: { project, context in
                return [:]
            })
    }
}

public struct CocoapodsAction {
    public var action: Action

    public init(_ action: Action) {
        self.action = action
    }
}
