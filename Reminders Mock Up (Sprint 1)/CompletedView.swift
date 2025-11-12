//
//  CompletedView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 11/11/25.
//
import SwiftUI

let customGray = Color(red: 0.345, green: 0.404, blue: 0.443)

struct CompletedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Completed")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                            .foregroundStyle(customGray)
                        
                        HStack(spacing: 8) {
                            Text("7 Completed")
                                .foregroundColor(.gray)
                            Circle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 3, height: 3)
                            Button("Clear") {
                                print("Clear tapped")
                            }
                            .foregroundColor(.blue)
                        }
                        .font(.subheadline)
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // MARK: - Sections
                    SectionView(
                        title: "Previous 7 Days",
                        reminders: [
                            CompletedReminder(title: "random task",
                                              reminderDate: "Reminders  11/3/25, 8:00 PM",
                                              completedDate: "Completed: 11/9/25, 8:00 PM")
                        ]
                    )
                    
                    SectionView(
                        title: "Previous 30 Days",
                        reminders: [
                            CompletedReminder(title: "walk the dog",
                                              reminderDate: "Reminders  11/1/25, 8:00 PM",
                                              completedDate: "Completed: 11/2/25, 8:00 PM"),
                            CompletedReminder(title: "random task",
                                              reminderDate: "Reminders  10/14/25, 8:00 PM",
                                              completedDate: "Completed: 10/28/25, 8:00 PM")
                        ]
                    )
                    
                    SectionView(
                        title: "May",
                        reminders: [
                            CompletedReminder(title: "buy groceries",
                                              reminderDate: "Reminders  5/29/25, 8:00 PM",
                                              completedDate: "Completed: 5/30/25, 8:00 AM"),
                            CompletedReminder(title: "go to class",
                                              reminderDate: "Reminders  5/15/25, 8:00 PM",
                                              completedDate: "Completed: 5/15/25, 8:00 PM")
                        ]
                    )
                }
                .padding(.bottom, 40)
            }
            .navigationTitle("Completed")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: ContentView()) {
                        HStack(spacing: 4) {
                            Image(systemName: "chevron.left")
                            Text("Back")
                        }
                        .foregroundColor(.blue)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "ellipsis.circle")
                        .foregroundColor(.blue)
                }
            }
        }
    }
}

struct CompletedReminder: Identifiable {
    let id = UUID()
    let title: String
    let reminderDate: String
    let completedDate: String
}

struct SectionView: View {
    let title: String
    let reminders: [CompletedReminder]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .padding(.horizontal)
            
            ForEach(reminders) { reminder in
                VStack(alignment: .leading, spacing: 4) {
                    HStack(alignment: .top) {
                        Circle()
                            .stroke(customGray.opacity(0.8), lineWidth: 2)
                            .frame(width: 26, height: 26)
                            .overlay(
                                Circle()
                                    .fill(customGray.opacity(1))
                                    .frame(width: 20, height: 20)
                            )
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(reminder.title)
                                .font(.body)
                                .foregroundColor(.black)
                            Text(reminder.reminderDate)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(reminder.completedDate)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.leading, 4)
                    }
                    Divider()
                        .padding(.leading, 40)
                }
                .padding(.horizontal)
                .padding(.top, 4)
            }
        }
    }
}

#Preview {
    CompletedView()
}
