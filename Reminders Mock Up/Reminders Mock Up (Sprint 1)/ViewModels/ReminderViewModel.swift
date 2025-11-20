import SwiftUI
import Combine

// Make sure Reminder model exists in a separate file
// struct Reminder: Identifiable {
//     let id = UUID()
//     let title: String
//     let list: String
// }

class ReminderViewModel: ObservableObject {
    @Published var reminders: [Reminder] = [
        Reminder(title: "Buy groceries", list: "Today"),
        Reminder(title: "Call mom", list: "Scheduled"),
        Reminder(title: "Finish project", list: "All"),
        Reminder(title: "Pay bills", list: "Flagged"),
        Reminder(title: "Meditate", list: "Completed"),
        Reminder(title: "Walk the dog", list: "Today"),
        Reminder(title: "Read book", list: "All")
    ]
    
    func count(for listTitle: String) -> Int {
        switch listTitle {
        case "All":
            return reminders.count
        default:
            return reminders.filter { $0.list == listTitle }.count
        }
    }
    
    func filteredReminders(searchText: String) -> [Reminder] {
        guard !searchText.isEmpty else { return [] }
        return reminders.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }
    
    func addReminder(title: String, list: String) {
        let newReminder = Reminder(title: title, list: list)
        reminders.append(newReminder)
    }
}
