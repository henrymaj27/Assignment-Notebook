//
//  AssignmentList.swift
//  Assignment Notebook
//
//  Created by Henry Majewski on 7/28/21.
//

import Foundation

class AssignmentList: ObservableObject {
    @Published var items = [AssignmentItem(course: "Math", description: "Do algebra", dueDate: Date()),
                            AssignmentItem(course: "Science", description: "Do chemistry", dueDate: Date()),
                            AssignmentItem(course: "ELA", description: "Read", dueDate: Date())]
}
