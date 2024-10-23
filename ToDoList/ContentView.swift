//
//  ContentView.swift
//  ToDoList
//
//  Created by thit on 10/23/24.
//

import SwiftUI

struct ContentView: View {
    @State var checklistItems = [
        "Take vocal lessons",
          "Record hit single",
          "Learn every martial art",
          "Design costume",
          "Design crime-fighting vehicle",
          "Come up with superhero name",
          "Befriend space raccoon",
          "Save the world",
          "Star in blockbuster movie",
        ]
        
                          
    var body: some View {
        NavigationView {
            List {
                ForEach(checklistItems, id: \.self) { item in
                    Text(item)
                }
                .onDelete(perform: self.deleteListItem)
                .onMove(perform: self.moveListItem)
            }
            .onAppear() {
                printChecklistContents()
            }
            .listStyle(GroupedListStyle())
            .navigationBarItems(trailing: EditButton())
            .navigationBarTitle("Checklist")
        }
    }
    
    func printChecklistContents() {
        for item in checklistItems {
            print(item)
        }
    }
    
    func deleteListItem(whichElement: IndexSet) {
      checklistItems.remove(atOffsets: whichElement)
      printChecklistContents()
    }
    
    func moveListItem(whichElement: IndexSet, destination: Int) {
      checklistItems.move(fromOffsets: whichElement, toOffset: destination)
      printChecklistContents()
    }
}

#Preview {
    ContentView()
}
