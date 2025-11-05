//
//  ContentView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 10/28/25.
//

#Preview {
    ContentView()
}

import SwiftUI

struct ContentView: View {
    var cards: [(title: String, count: Int, icon: String, color: Color)] = [
        ("Today", 1, "calendar", .blue),
        ("Scheduled", 2, "calendar.badge.clock", .red),
        ("All", 2, "tray.fill", .black),
        ("Flagged", 0, "flag.fill", .orange),
        ("Completed", 0, "checkmark", .gray)
    ]
    
    let remindersList = ReminderList(title: "Reminders", icon: "list.bullet", color: .orange)
    let deletedList = ReminderList(title: "Recently Deleted", icon: "trash", color: .gray)
    
    var body: some View {
        VStack(spacing: 15) { //spacing in between rows
            ForEach(0..<2) { row in
                HStack(spacing: 15) { //spacing in between columns
                    ForEach(0..<2) { col in
                        let index = row * 2 + col
                        CardView(card: cards[index]) //way to access each row and column
                    }
                }
            }
            HStack {
                CardView(card: cards[4]) //single ending card for completed
                Spacer()
            }
            .padding(.leading, 15)
            
            // My Lists section
            Text("My Lists")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            ReminderGroupTile(top: remindersList, bottom: deletedList)
                .padding(.horizontal)

            Spacer()
            
        }
        .padding(.top, 150)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.2))
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

struct ReminderList: Identifiable {
    let id = UUID()
    let title: String
    let icon: String
    let color: Color
}

struct ReminderGroupTile: View {
    var top: ReminderList
    var bottom: ReminderList

    var body: some View {
        VStack(spacing: 0) {
            // Top section
            HStack(spacing: 12) {
                Image(systemName: top.icon)
                    .font(.system(size: 16)) // smaller icon
                    .foregroundColor(.white)
                    .padding(6)
                    .background(top.color)
                    .clipShape(Circle())

                Text(top.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)

                Spacer()
                
                HStack(spacing: 4) {
                    Text("2")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)

            Divider()

            // Bottom section
            HStack(spacing: 12) {
                Image(systemName: bottom.icon)
                    .font(.system(size: 16)) // smaller icon
                    .foregroundColor(.gray)
                    .padding(6)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())

                Text(bottom.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)

                Spacer()
                
                HStack(spacing: 4) {
                    Text("1")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.2), radius: 5, x: 0, y: 3)
    }
}
