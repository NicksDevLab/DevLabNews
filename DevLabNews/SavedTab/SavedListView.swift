//
//  SwiftUIView.swift
//  DevLabNews
//
//  Created by Nicholas Church on 10/31/20.
//

import SwiftUI

struct SavedListView: View {
  
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)], animation: .default)

  private var items: FetchedResults<Item>
  
  var body: some View {
    List {
      ForEach(0..<9) { each in
        Text("OOPS")
      }
      .onDelete(perform: deleteItems)
      .toolbar {
        #if os(iOS)
        EditButton()
        #endif

        Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
        }
      }
    }
  }
  
  private func addItem() {
    withAnimation {
      let newItem = Item(context: viewContext)
      newItem.timestamp = Date()

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }

  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(viewContext.delete)

      do {
        try viewContext.save()
      } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
      }
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SavedListView()
    }
}
