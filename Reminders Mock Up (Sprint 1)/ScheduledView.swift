//
//  ScheduledView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 11/11/25.
//

import SwiftUI

struct ScheduledView: View {
    var num : Int = 0
    var body: some View {
        VStack{
            Text("Scheduled") .font(.system(size: 40, weight: .bold, design: .rounded)).foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack{
                Text("\(num) Completed") .font(.system(size: 20, weight: .bold)).foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Show") .font(.system(size: 20, weight: .bold)).foregroundColor(.red)
                    .padding(.trailing, 20)
            }.padding(.top,10).padding(.bottom,5)
            Divider().background(Color.customGrayText)
            Text("Today") .font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
            
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

#Preview {
    ScheduledView()
}

