//
//  FlaggedView.swift
//  Reminders Mock Up (Sprint 1)
//
//  Created by Prathithi Nellaiappan on 11/11/25.
//

import SwiftUI

struct FlaggedView: View {
    var body: some View {
        VStack{
            Text("Flagged") .font(.system(size: 40, weight: .bold, design: .rounded)).foregroundColor(.orange)
                .frame(maxWidth: .infinity, alignment: .leading).padding(.bottom,10)
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
    FlaggedView()
}

