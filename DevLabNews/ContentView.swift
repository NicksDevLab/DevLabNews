//
//  ContentView.swift
//  DevLabNews
//
//  Created by Nicholas Church on 10/31/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
  
  @State private var selection = 1

  var body: some View {
    TabView(selection: $selection) {
      SavedListView()
        .tabItem {
          Text("Saved")
        }.tag(0)
      TopNewsView()
        .tabItem {
          Text("Top News")
        }.tag(1)
      CategoriesView()
        .tabItem {
          Text("Categories")
        }.tag(2)
    }
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
