//
//  flexolk_hw1App.swift
//  flexolk_hw1
//
//  Created by User22 on 2021/3/3.
//

import SwiftUI

@main
struct flexolk_hw1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
