import ProjectDescription

public extension PackageAction {
    public static func setup() -> PackageAction {
        return PackageAction(.shell("swift", "package", "init"))
    }

    public static func generateXcodeproj() -> PackageAction {
        return PackageAction(.shell("swift", "package", "generate-xcodeproj"))
    }

    public static func linuxMain() -> PackageAction {
        return PackageAction(.write(templateNamed: .linuxMain, to: "Tests/LinuxMain.swift"))
    }
}
