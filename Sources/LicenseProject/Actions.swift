import PathKit
import ProjectDescription

public extension Action {
    public static func license(fileName: Path = "LICENSE") -> Action {
        return Action { project, context in
            guard let license = context["license"] as? [String: Any], let text = license["text"] as? String else {
                return
            }
            try fileName.write(text)
        }
    }
}
