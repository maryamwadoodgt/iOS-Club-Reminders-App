//
//  TodayView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 11/11/25.
//

import SwiftUI

struct TodayView: View {
    var body: some View {
        VStack{
            Text("Today") .font(.system(size: 40, weight: .bold, design: .rounded)).foregroundColor(.blue)
                .frame(maxWidth: .infinity, alignment: .leading).padding(.bottom,10)
            Divider().background(Color.customGrayText)
            Text("Morning") .font(.system(size: 18, weight: .bold)).foregroundColor(.customGrayText)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider().background(Color.customGrayText)
            Text("Afternoon") .font(.system(size: 18, weight: .bold)).foregroundColor(.customGrayText)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider().background(Color.customGrayText)
            Text("Tonight") .font(.system(size: 18, weight: .bold)).foregroundColor(.customGrayText)
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider().background(Color.customGrayText)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.leading, 20)
        .padding(.top, 20)
        .background(Color.white)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "ellipsis.circle")
                    .foregroundColor(.blue)
            }
        }
    }
}

extension Color {
    static let customGrayText = Color(red: 195/255, green: 195/255, blue: 197/255)
}

#Preview {
    TodayView()
}

