import ProjectDescription

public extension NpmAction {
    public static func package(main: InlineTemplate = "index.ts", keywords: [InlineTemplate] = [], scripts: [String: InlineTemplate] = ["test": "echo \"Error: no test specified\" && exit 1"], repositoryType: String = "git", devDepencencies: [InlineTemplate] = [], dependencies: [InlineTemplate] = []) -> NpmAction {
        return NpmAction(
            Action.write(templateNamed: .package, to: "package.json")
            .with(additional: { _, context in
                return [
                    "main": try main.render(context)
                ]
            })
        )
    }

    public static func tslint(to file: InlineTemplate = "tslint.json") -> NpmAction {
        return NpmAction(.write(templateNamed: .tslint, to: file))
    }

    public static func tsconfig(to file: InlineTemplate = "tsconfig.json") -> NpmAction {
        return NpmAction(.write(templateNamed: .tsconfig, to: file))
    }

    public static func index(empty: Bool = true, to file: InlineTemplate = "index.ts") -> NpmAction {
        return NpmAction(.write(templateNamed: .index, to: file))
    }

    public static func push() -> NpmAction {
        return NpmAction(.shell("{{ npmLaunchPath }}", "push"))
    }
}
