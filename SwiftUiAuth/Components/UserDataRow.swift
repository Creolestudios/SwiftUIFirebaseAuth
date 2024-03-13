//
//  UserDataRow.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 14/02/24.
//

import SwiftUI

struct UserDataRow: View {
    let title:String
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color(hex: "#F1F3F6"))
            .frame(height: 50)
            .frame(maxWidth: 350)
            .overlay(alignment:.leading) {
                Text(title)
                    .padding(.horizontal)
                   
            }
    }
}

#Preview {
    UserDataRow(title: "hello")
}
