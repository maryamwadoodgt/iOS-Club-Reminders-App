//
//  ContentView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 10/28/25.
//


import SwiftUI

struct ContentView: View {
    var cards: [(title: String, count: Int, icon: String, color: Color)] = [
        ("Today", 1, "calendar", .blue),
        ("Scheduled", 2, "calendar.badge.clock", .red),
        ("All", 2, "tray.fill", .black),
        ("Flagged", 0, "flag.fill", .orange),
        ("Completed", 0, "checkmark", .gray)
    ]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 15) { //spacing in between rows
                ForEach(0..<2) { row in
                    HStack(spacing: 15) { //spacing in between columns
                        ForEach(0..<2) { col in
                            let index = row * 2 + col
                            NavigationLink(destination: destinationView(for: cards[index].title)) {
                                CardView(card: cards[index])
                            }
                        }
                    }
                }
                HStack {
                    NavigationLink(destination: destinationView(for: cards[4].title)) {
                        CardView(card: cards[4])
                        Spacer()
                    }
                }.padding(.leading, 15)
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
            .padding(.top, 150)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.2))
        }
    }
}

struct CardView: View { //defined cardView
    let card: (title: String, count: Int, icon: String, color: Color)
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(Color.white)
            .frame(width: (UIScreen.main.bounds.width - 40) / 2,
                   height: UIScreen.main.bounds.width * 0.22)
            .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
            .overlay(
                
                    VStack(alignment: .leading, spacing: 8) {
                        HStack{
                            
                            Circle()
                                .fill(card.color)
                                .frame(width: 32, height: 32)
                                .overlay(
                                    Image(systemName: card.icon) //each circle has unique color and icon
                                        .foregroundColor(.white)
                                )
                            Spacer()
                            Text("\(card.count)") //unqiue count value, can be changed in list of tuples
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        Text(card.title) //label
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

#Preview {
    ContentView()
}

