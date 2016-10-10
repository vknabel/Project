import Foundation
import Commander
import PathKit
import Stencil
import ProjectDescription

let projectManifestPath: Path = Path("Project/Project.swift")

let main = Group {
    let newCommand = command {
        guard !projectManifestPath.exists else {
            print("A project manifest already exists at: \(projectManifestPath)")
            return
        }
        let name = Path.current.lastComponent
        let contents: String = "import ProjectDescription\n"
            + "import LicenseProject\n"
            + "\n"
            + "let project = Project(\n"
            + "    name: \"\(name)\",\n"
            + "    version: \"1.0.0\",\n"
            + "    swiftVersions: [.swift3_0],\n"
            + "    authors: [Author(name: \"Your Name\", email: \"your@mail.com\")],\n"
            + "    source: .github(user: \"vknabel\"),\n"
            + "    license: .mit(),\n"
            + "    socialMedia: .twitter(user: \"vknabel\"),\n"
            + "    summary: \"A brief summary of {{ name }}.\",\n"
            + "    description: \"Optional parameter to provide a more detailed description of {{ name }}. Will default to: \\n{{ summary }}\"\n"
            + ")\n"
            + "\n"
            + "import GitProject\n"
            + "import PackageProject\n"
            + "\n"
            + "project.create(perform:\n"
            + "    .git(perform: .setup()),\n"
            + "    .package(perform:\n"
            + "        .setup(),\n"
            + "        .linuxMain()\n"
            + "    ),\n"
            + "    .onChange()\n"
            + ")\n"
            + "\n"
            + "import CocoapodsProject\n"
            + "\n"
            + "project.onChange(perform:\n"
            + "    .git(perform: .gitignore()),\n"
            + "    .license(),\n"
            + "    .cocoapods(perform: .podspec(format: .json)),\n"
            + "    .package(perform: .generateXcodeproj())\n"
            + ")\n"
            + "\n"
            + "project.on(\"push\", perform:\n"
            + "    .git(perform:\n"
            + "        .tagAdd(name: \"{{ version }}\", message: \"Release {{ version }}\"),\n"
            + "        .push(includeTags: true)\n"
            + "    ),\n"
            + "    .cocoapods(perform:\n"
            + "        .trunkPush()\n"
            + "    )\n"
            + ")\n"

        let dictionary = [
            "openCurly": "{{",
            "closeCurly": "}}",
            "name": name
        ]

        try projectManifestPath.parent().mkpath()
        try projectManifestPath.write(contents)
    }

    let runCommand = command(
        Argument<String>("sub command"),
        VaradicArgument<String>("arguments")
    ) { subCommand, arguments in
        guard projectManifestPath.exists else {
            print("Doesn't exist")
            return
        }
        let process = Process()
        process.currentDirectoryPath = Path.current.description
        process.launchPath = "/usr/bin/env"
        var manifestArgs = ["swift", "-F", Path("~/.project/Library/Frameworks").normalize().description, "-target", "x86_64-macosx10.12", "Project/Project.swift", subCommand]
        manifestArgs.append(contentsOf: arguments)
        process.arguments = manifestArgs
        process.launch()
        process.waitUntilExit()
    }

    $0.addCommand("init", newCommand)
    $0.addCommand("run", runCommand)
}

main.run()
