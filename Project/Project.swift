import Foundation
import ProjectDescription
import LicenseProject
import PackageProject
import CocoapodsProject
import GitProject

let project = Project(
    name: "Project",
    version: "1.0.0",
    swiftVersions: [.swift3_0],
    authors: [Author(name: "Valentin Knabel", email: "develop@vknabel.com")],
    source: .github(user: "vknabel"),
    license: .mit(),
    socialMedia: .twitter(user: "vknabel"),
    summary: "Describe projects and generate files in Swift.",
    description: "{{ name }} lets you define all your project meta data and generate custom templates."
)

project.onInit(perform:
    .git(perform: .setup()), // git init
    //.swiftenv(), // must be executed before .package
    .package(perform:
        .setup(), // swift package init
        .linuxMain()
    ),
    // .xcode(
    //     .playground(),
    //     .workspace(files:
    //         .group("{{ name }}.xcodeproj"),
    //         .group("{{ name }}.playground")
    //     )
    // )
    .onChange()
)

project.onChange(perform:
    //.swiftenv(),
    .git(perform: .gitignore()),
    .license(),
    .cocoapods(perform: .podspec(format: .json)),
    .package(perform: .generateXcodeproj())
    // .jazzy(),
    // .travis()
)

project.on("push", perform:
    .git(perform:
        .tagAdd(name: "{{ version }}", message: "Release {{ version }}"),
        .push(includeTags: true)
    ),
    .cocoapods(perform:
        .trunkPush()
    )
)
