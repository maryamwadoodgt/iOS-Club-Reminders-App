import SwiftUI

struct Reminder: Identifiable {
    var id: Int
    var title: String
    var isCompleted: Bool = false
    var dueDate: Date? = nil
}

