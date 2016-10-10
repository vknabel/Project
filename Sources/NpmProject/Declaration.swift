import ProjectDescription

///
/// ```swift
/// import ProjectDescription
/// import NpmProject
///
/// NpmAction.npmLaunchPath = "npm3"
///
/// let project = Project(
///     name: "@conclurer/edelog",
///     version: "1.0.0",
///     authors: [
///         Author(name: "Conclurer GmbH", email: "kontakt@conclurer.com")
///     ],
///     source: "https://github.com/conclurer/edelog",
///     license: .mit(),
///     socialMedia: .facebook(name: "conclurer"),
///     summary: "Edelog allows users to run, report and submit forms and mobile workflows to the Edelog platform. "
/// )
///
/// project.create(perform:
///     .npm(perform:
///         .package(),
///         .index()
///     ),
///     onChange()
/// )
/// project.onChange(perform:
///     .npm(perform:
///         .tsconfig(),
///         .tslint()
///     )
/// )
/// project.on("push", perform:
///     .npm(perform: .push())
/// )
/// ```
///
public struct NpmAction {
    public var action: Action
    public static var launchPath: InlineTemplate = "npm"

    public init(_ action: Action) {
        self.action = action
    }
}

public extension Action {
    public static func npm(
        npmLaunchPath: InlineTemplate = NpmAction.launchPath,
        perform actions: NpmAction...) -> Action {
        return Action.combining(actions: actions.map({ $0.action }))
            .with(additional: { project, context in
                return [
                    "npmLaunchPath": try npmLaunchPath.render(context)
                ]
            })
    }
}
