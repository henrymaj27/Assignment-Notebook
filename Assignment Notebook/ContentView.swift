//
//  ContentView.swift
//  Assignment Notebook
//
//  Created by Henry Majewski on 7/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var assignmentItems =
        [AssignmentItem(course: "Math", description: "Do algebra", dueDate: Date()),
         AssignmentItem(course: "Science", description: "Do chemistry", dueDate: Date()),
         AssignmentItem(course: "ELA", description: "Read", dueDate: Date())]
    var body: some View {
        NavigationView {
            List {
                ForEach(assignmentItems) { item in
                    HStack {
                        VStack (alignment: .leading) {
                            Text(item.course)
                                .font(.headline)
                            Text(item.description)
                        }
                        Spacer()
                        Text(item.dueDate, style: .date)
                    }
                }
                .onMove(perform: { indices, newOffset in
                    assignmentItems.move(fromOffsets: indices, toOffset: newOffset)
                })
                .onDelete(perform: { indexSet in
                    assignmentItems.remove(atOffsets: indexSet)
                })
            }
            .navigationBarTitle("Assignment Notebook", displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AssignmentItem: Identifiable {
    var id = UUID()
    var course = String()
    var description = String()
    var dueDate = Date()
}
