import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var showSearchResults = false
    
    let cards: [(title: String, icon: String, color: Color)] = [
        ("Today", "calendar", .blue),
        ("Scheduled", "calendar.badge.clock", .red),
        ("All", "tray.fill", .black),
        ("Flagged", "flag.fill", .orange),
        ("Completed", "checkmark", .gray)
    ]
    
    @ObservedObject var viewModel: ReminderViewModel
    
    var filteredReminders: [Reminder] {
        if searchText.isEmpty { return [] }
        return viewModel.reminders.filter { $0.title.lowercased().contains(searchText.lowercased()) }
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 15) {
                
                // SEARCH BAR
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .autocapitalization(.none)
                        .onSubmit {
                            showSearchResults = !searchText.isEmpty
                        }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(50)
                .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 2)
                .padding(.horizontal)
                .padding(.top, 80)
                
                ForEach(0..<2) { row in
                    HStack(spacing: 15) {
                        ForEach(0..<2) { col in
                            let index = row * 2 + col
                            NavigationLink(destination: destinationView(for: cards[index].title)) {
                                CardView(card: cards[index], count: viewModel.count(for: cards[index].title))
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                HStack {
                    NavigationLink(destination: destinationView(for: cards[4].title)) {
                        CardView(card: cards[4], count: viewModel.count(for: cards[4].title))
                    }
                    Spacer()
                }
                .padding(.leading, 15)
                
                Spacer()
                
                HStack(spacing: 2) {
                    Button(action: {
                        print("New Reminder tapped!")
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 25))
                            .foregroundColor(Color.blue)
                            .padding(10)
                        Text("New Reminder")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(Color.blue)
                    }
                    
                    Spacer()
                    
                    Button("Add List") {
                        print("Add List tapped!")
                    }
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.blue)
                    .padding(.trailing)
                }
            }
            .background(Color.gray.opacity(0.2))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            .background(
                NavigationLink(
                    destination: SearchResultsView(reminders: filteredReminders),
                    isActive: $showSearchResults,
                    label: { EmptyView() }
                )
            )
        }
    }
}

struct CardView: View {
    let card: (title: String, icon: String, color: Color)
    let count: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: (UIScreen.main.bounds.width - 40) / 2,
                   height: UIScreen.main.bounds.width * 0.22)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Circle()
                            .fill(card.color)
                            .frame(width: 32, height: 32)
                            .overlay(
                                Image(systemName: card.icon)
                                    .foregroundColor(.white)
                            )
                        Spacer()
                        Text("\(count)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Text(card.title)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal, 12)
            )
    }
}

@ViewBuilder
func destinationView(for title: String) -> some View {
    switch title {
    case "Today":
        TodayView()
    case "Scheduled":
        ScheduledView()
    case "All":
        AllView()
    case "Flagged":
        FlaggedView()
    case "Completed":
        CompletedView()
    default:
        Text("Page not found")
    }
}

struct SearchResultsView: View {
    let reminders: [Reminder]
    
    var body: some View {
        List(reminders) { reminder in
            Text(reminder.title)
        }
        .navigationTitle("Search Results")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }
}

#Preview {
    ContentView(viewModel: ReminderViewModel())
}
