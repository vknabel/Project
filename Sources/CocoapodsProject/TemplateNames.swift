import ProjectDescription

public extension TemplateName {
    private static var prefix: String {
        return "Cocoapods/"
    }

    public static var jsonPodspec: TemplateName {
        return TemplateName(rawValue: prefix + "NAME.podspec.json.stencil")!
    }

    public static var rubyPodspec: TemplateName {
        return TemplateName(rawValue: prefix + "NAME.podspec.stencil")!
    }
}
