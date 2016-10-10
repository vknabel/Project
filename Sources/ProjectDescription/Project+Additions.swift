import Foundation
import Stencil

public extension Project {
    public func on(_ subCommand: String, actions: [Action]) {
        guard Project.subCommands.keys.contains(subCommand) else { return }
        
        let context: Context
        do {
            context = try self.context()
        } catch {
            print("Could not create context with error", error)
            return
        }

        do {
            try actions.forEach { action in
                _ = try action.renderer(self, context)
            }
        } catch {
            print("Could not perform all actions", error)
        }
    }

    public func on(_ subCommand: String, perform actions: Action...) {
        on(subCommand, actions: actions)
    }

    public func create(perform actions: Action...) {
        on("create", actions: actions)
    }

    public func onChange(perform actions: Action...) {
        on("change", actions: actions)
    }
}
