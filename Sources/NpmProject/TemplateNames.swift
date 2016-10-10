import ProjectDescription

public extension TemplateName {
    private static var prefix: String {
        return "Npm/"
    }

    public static var package: TemplateName {
        return TemplateName(rawValue: prefix + "package.json.stencil")!
    }

    public static var tslint: TemplateName {
        return TemplateName(rawValue: prefix + "tslint.json.stencil")!
    }

    public static var tsconfig: TemplateName {
        return TemplateName(rawValue: prefix + "tsconfig.json.stencil")!
    }

    public static var index: TemplateName {
        return TemplateName(rawValue: prefix + "index.ts.empty.stencil")!
    }
}
