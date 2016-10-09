import ProjectDescription

public extension TemplateName {
    private static var prefix: String {
        return "Package/"
    }

    public static var linuxMain: TemplateName {
        return TemplateName(rawValue: prefix + "LinuxMain.swift.stencil")!
    }
}
