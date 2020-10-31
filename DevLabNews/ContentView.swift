//
//  ContentView.swift
//  DevLabNews
//
//  Created by Nicholas Church on 10/31/20.
//

import SwiftUI
import CoreData

struct ContentView: View {

  var body: some View {
    TabView {
      TopNewsView()
        .tabItem {
          Text("TOP")
        }.tag(0)
      CategoriesView()
        .tabItem {
          Text("CAT")
        }.tag(1)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
