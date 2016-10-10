import Foundation
import PathKit
import Stencil

public extension Rendered {
    public static func inline(type: InlineTemplate, text: InlineTemplate, path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered<License> { context in
            return try context.push(dictionary: [
                "path": path.description,
                "year": Calendar(identifier: .gregorian).component(.year, from: year)
            ]) {
                return License(type: "MIT", text: try text.render(context))
            }
        }
    }

    public static func template(type: InlineTemplate, textNamed text: TemplateName, path: Path = "LICENSE", year: Date = Date()) -> Rendered<License> {
        return Rendered<License> { context in
            return try context.push(dictionary: [
                "path": path.description,
                "year": Calendar(identifier: .gregorian).component(.year, from: year)
            ]) {
                return License(type: "MIT", text: try Template(search: text).render(context))
            }
        }
    }

    public static func github(
        user: String,
        name: InlineTemplate = "{{ name }}") -> Rendered<URL> {
        return Rendered<URL> { dictionary in
            let plainUrl = try name.render(dictionary)
            return URL(string: "https://github.com/\(user)/\(plainUrl)")!
        }
    }

    public static func twitter(user name: InlineTemplate) -> Rendered<URL> {
        return Rendered<URL> { context in
            let name = try name.render(context)
            return URL(string: "https://twitter.com/\(name)")!
        }
    }

    public static func facebook(user name: InlineTemplate) -> Rendered<URL> {
        return Rendered<URL> { context in
            let name = try name.render(context)
            return URL(string: "https://facebook.com/\(name)")!
        }
    }
}
