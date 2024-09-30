//
//  File.swift
//  CSEKit
//
//  Created by Christian Norton on 9/30/24.
//
import Foundation
import CSEKit
import AppKit

struct _main {
    @MainActor static func main() {
        print("somethings happening")
        doWork()
    }

    static func doWork() {
        print("working")
        Task {
            print("awaiting factory")
            await runCSEFactory()
        }
    }

    static func runCSEFactory() async {
        do {
            print("\n")
            try await CSEFactory.main()
        } catch {
            print("Error occurred: \(error)")
        }
    }
}



_main.main()
NSApplication.shared.run()
