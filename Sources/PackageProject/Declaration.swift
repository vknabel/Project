import ProjectDescription

public struct PackageAction {
    public var action: Action

    public init(_ action: Action) {
        self.action = action
    }
}

public extension Action {
    public static func package(perform actions: PackageAction...) -> Action {
        return Action.combining(actions: actions.map({ $0.action }))
    }
}
