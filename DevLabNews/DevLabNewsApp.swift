//
//  DevLabNewsApp.swift
//  DevLabNews
//
//  Created by Nicholas Church on 10/31/20.
//

import SwiftUI

@main
struct DevLabNewsApp: App {
  
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
