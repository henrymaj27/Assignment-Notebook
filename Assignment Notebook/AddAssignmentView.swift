//
//  AddAssignmentView.swift
//  Assignment Notebook
//
//  Created by Henry Majewski on 7/28/21.
//

import SwiftUI

struct AddAssignmentView: View {
    @ObservedObject var AssignmentList: AssignmentList
    @State private var course = ""
    @State private var description = ""
    @State private var dueDate = Date()
    @Environment(\.presentationMode) var presentationMode
    static let courses = ["Math", "Science", "ELA", "History"]
    var body: some View {
        NavigationView {
            Form {
                Picker("Course", selection: $course) {
                    ForEach(Self.courses, id: \.self) { course in
                        Text(course)
                    }
                }
                TextField("Description", text: $description)
                DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
            }
            .navigationBarTitle("Add New Assignment", displayMode: .inline)
            .navigationBarItems(trailing: Button("Save") {
                            if course.count > 0 && description.count > 0 {
                                let item = AssignmentItem(id: UUID(), course: course,
                                                    description: description, dueDate: dueDate)
                                AssignmentList.items.append(item)
                                presentationMode.wrappedValue.dismiss()
                            }
                        })
        }
    }
}

struct AddAssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AddAssignmentView(AssignmentList: AssignmentList())
    }
}
