import ProjectDescription

public extension GitAction {
    public static func setup() -> GitAction {
        return GitAction(.shell("git", "init"))
    }

    public static func tagAdd(
        name: InlineTemplate = "{{ version }}",
        message: InlineTemplate = "Release {{ version }}") -> GitAction {
        return GitAction(.shell("git", "tag", "-a", name, "-m", message))
    }

    public static func push(includeTags: Bool = true) -> GitAction {
        let action: Action = includeTags ? .shell("git", "push", "--tags") : .shell("git", "push")
        return GitAction(action)
    }

    public static func gitignore(buildGenerated: Bool = true, variousSettings: Bool = true, other: Bool = true, objc: Bool = true, playgrounds: Bool = true, swiftPM: Bool = true, cocoapods: Bool = true, carthage: Bool = true, fastlane: Bool = true, macOS: Bool = true, ignore files: String...) -> GitAction {
        var dict: [String: Any] = [
            "buildGenerated": buildGenerated,
            "variousSettings": variousSettings,
            "playgrounds": playgrounds,
            "swiftPM": swiftPM,
            "cocoapods": cocoapods,
            "carthage": carthage,
            "other": other,
            "objc": objc,
            "fastlane": fastlane,
            "macOS": macOS
        ]
        if files.count > 0 {
            dict["files"] = files
        }
        let action: Action = Action.write(templateNamed: .gitignore, to: ".gitignore", additional: dict)
        return GitAction(action)
    }
}
