import ProjectDescription

public extension TemplateName {
    private static var prefix: String {
        return "License/"
    }

    public static var agpl: TemplateName {
        return TemplateName(rawValue: prefix + "AGPL-3.0.stencil")!
    }
    public static var apache: TemplateName {
        return TemplateName(rawValue: prefix + "Apache-2.0.stencil")!
    }
    public static var ccBy: TemplateName {
        return TemplateName(rawValue: prefix + "CC-BY-4.0.stencil")!
    }
    public static var ccBySa: TemplateName {
        return TemplateName(rawValue: prefix + "CC-BY-SA-4.0.stencil")!
    }
    public static var cc0: TemplateName {
        return TemplateName(rawValue: prefix + "CC0-1.0.stencil")!
    }
    public static var gpl: TemplateName {
        return TemplateName(rawValue: prefix + "GPL-3.0.stencil")!
    }
    public static var lgpl: TemplateName {
        return TemplateName(rawValue: prefix + "LGPL-3.0.stencil")!
    }
    public static var mit: TemplateName {
        return TemplateName(rawValue: prefix + "MIT.stencil")!
    }
    public static var mpl: TemplateName {
        return TemplateName(rawValue: prefix + "MPL-2.0.stencil")!
    }
    public static var ofl: TemplateName {
        return TemplateName(rawValue: prefix + "OFL-1.1.stencil")!
    }
    public static var proprietary: TemplateName {
        return TemplateName(rawValue: prefix + "Proprietary.stencil")!
    }
    public static var unlicense: TemplateName {
        return TemplateName(rawValue: prefix + "Unlicense.stencil")!
    }
}
