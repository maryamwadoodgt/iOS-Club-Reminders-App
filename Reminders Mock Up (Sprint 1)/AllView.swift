//
//  AllView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 11/11/25.
//

import SwiftUI

struct AllView: View {
    var body: some View {
        VStack{
            Text("All") .font(.system(size: 40, weight: .bold, design: .rounded)).foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading).padding(.bottom,10)
            Text("Reminders") .font(.system(size: 18, weight: .bold)).foregroundColor(.orange)
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

#Preview {
    AllView()
}
