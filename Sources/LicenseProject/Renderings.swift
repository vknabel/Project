import Foundation
import PathKit
import ProjectDescription

public extension Rendered {
    public static func agpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "AGPL-3.0", textNamed: .agpl, path: path, year: year)
    }
    public static func apache(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "Apache-2.0", textNamed: .apache, path: path, year: year)
    }
    public static func ccBy(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC-BY-4.0", textNamed: .ccBy, path: path, year: year)
    }
    public static func ccBySa(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC-BY-SA-4.0", textNamed: .ccBySa, path: path, year: year)
    }
    public static func cc0(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC0-1.0", textNamed: .cc0, path: path, year: year)
    }
    public static func gpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "GPL-3.0", textNamed: .gpl, path: path, year: year)
    }
    public static func lgpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "LGPL-3.0", textNamed: .lgpl, path: path, year: year)
    }
    public static func mit(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "MIT", textNamed: .mit, path: path, year: year)
    }
    public static func mpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "MPL-2.0", textNamed: .mpl, path: path, year: year)
    }
    public static func ofl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "OFL-1.1", textNamed: .ofl, path: path, year: year)
    }
    public static func proprietary(type: InlineTemplate = "Proprietary", path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: type, textNamed: .proprietary, path: path, year: year)
    }
    public static func unlicense(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "Unlicense", textNamed: .unlicense, path: path, year: year)
    }
}
