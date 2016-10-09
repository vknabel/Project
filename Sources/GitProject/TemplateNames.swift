import ProjectDescription

public extension TemplateName {
    private static var prefix: String {
        return "Git/"
    }

    public static var gitignore: TemplateName {
        return TemplateName(rawValue: prefix + "gitignore.stencil")!
    }
}
