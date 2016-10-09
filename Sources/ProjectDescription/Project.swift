import Foundation
import PathKit
import Stencil

public final class Project {
    internal static var searchDirectories: [Path] = []
    public internal(set) static var subCommands: [String: [String]] = [:]

    public let name: String
    public let version: String
    public let swiftVersions: [SwiftVersion]
    public let authors: [Author]
    public let source: Rendered<URL>
    public let license: Rendered<License>
    public let socialMedia: Rendered<URL>
    public let summary: InlineTemplate
    public let description: InlineTemplate

    public func context() throws -> Context {
        var dictionary: [String: Any] = [
            "name": self.name,
            "version": self.version,
            "swiftVersions": self.swiftVersions
        ]

        let render = [
            ("authors", authors.context),
            ("source", source.context),
            ("license", { try self.license.renderer(Context(dictionary: $0)).context(from: $0) }),
            ("socialMedia", socialMedia.context),
            ("summary", summary.context),
            ("description", description.context)
        ]
        try render.forEach {
            dictionary[$0.0] = try $0.1(dictionary)
        }

        return Context(dictionary: dictionary)
    }

    public init(
        name: String,
        version: String,
        swiftVersions: [SwiftVersion],
        authors: [Author],
        source: Rendered<URL>,
        license: Rendered<License>,
        socialMedia: Rendered<URL>,
        summary: InlineTemplate,
        description: InlineTemplate)
    {
        self.name = name
        self.version = version
        self.swiftVersions = swiftVersions
        self.authors = authors
        self.source = source
        self.license = license
        self.socialMedia = socialMedia
        self.summary = summary
        self.description = description

        guard let path = CommandLine.arguments.first else { return }
        do {
            Path.current = Path(path)
            try Project.main().run(Array(CommandLine.arguments.dropFirst(1)))
        } catch {
            print("Failed with \(error)")
        }
    }
}

import Commander

public extension Project {
    public static func addSearchDirectory(_ path: Path) -> Void {
        Project.searchDirectories.append(path)
    }

    public static func main() -> CommandType {
        return command(
            Option("working-dir", Path.current.description),
            Option("templates-dir", (Path.current + "Package/templates").description),
            Argument("command"),
            VaradicArgument("arguments")
        ) { (workingDir: String, templatesDir: String, command: String, arguments: [String]) in
            do {
                let workingPath = Path(workingDir)
                try workingPath.mkpath()
                Path.current = Path(workingDir)
            } catch {
                print("Could not create working directory", error)
            }

            do {
                let templatesPath = Path(templatesDir)
                try templatesPath.mkpath()
                Project.addSearchDirectory(templatesPath)
            } catch {
                print("Could not create templates directory", error)
            }

            Project.subCommands[command] = arguments
        }
    }
}
