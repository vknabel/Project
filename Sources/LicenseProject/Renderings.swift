import Foundation
import PathKit
import ProjectDescription

public extension Rendered {
    public static func agpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "AGPL-3.0", textNamed: .mit, path: path, year: year)
    }
    public static func apache(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "Apache-2.0", textNamed: .mit, path: path, year: year)
    }
    public static func cc_by(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC-BY-4.0", textNamed: .mit, path: path, year: year)
    }
    public static func cc_by_sa(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC-BY-SA-4.0", textNamed: .mit, path: path, year: year)
    }
    public static func cc0(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "CC0-1.0", textNamed: .mit, path: path, year: year)
    }
    public static func gpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "GPL-3.0", textNamed: .mit, path: path, year: year)
    }
    public static func lgpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "LGPL-3.0", textNamed: .mit, path: path, year: year)
    }
    public static func mit(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "MIT", textNamed: .mit, path: path, year: year)
    }
    public static func mpl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "MPL-2.0", textNamed: .mit, path: path, year: year)
    }
    public static func ofl(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "OFL-1.1", textNamed: .mit, path: path, year: year)
    }
    public static func unlicense(path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered.template(type: "Unlicense", textNamed: .mit, path: path, year: year)
    }
}
