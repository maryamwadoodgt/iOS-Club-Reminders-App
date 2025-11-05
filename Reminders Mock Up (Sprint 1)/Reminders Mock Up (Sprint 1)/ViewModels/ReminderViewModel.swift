import SwiftUI

class ReminderViewModel {
    var reminders: [Reminder] = []
    
    func addReminder(title: String, dueDate: Date? = nil) {
        let newReminder = Reminder(
            id: reminders.count + 1,
            title: title,
            isCompleted: false,
            dueDate: dueDate
        )
        reminders.append(newReminder)
    }
    
    func toggleCompletion(for reminder: Reminder) {
        if let index = reminders.firstIndex(where: { $0.id == reminder.id }) {
            reminders[index].isCompleted.toggle()
        }
    }
    
    func deleteReminder(at offsets: IndexSet) {
        reminders.remove(atOffsets: offsets)
    }
}
