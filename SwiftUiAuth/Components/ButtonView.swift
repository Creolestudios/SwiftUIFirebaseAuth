//
//  CommonBtn.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 10/02/24.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var title:String = ""
    var body: some View {
        VStack(spacing: 0){
            if viewModel.Error != "" {
                Text(viewModel.Error)
                    .foregroundColor(.red)
                    .font(.caption)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            viewModel.Error = ""
                        }
                    }
            }
            ZStack{
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.white)
                }
                else
                {
                    Text(title)
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
            
            .frame(width: UIScreen.main.bounds.width - 32,height: 52)
            .frame(maxWidth: 350)
            .background(Color("AccentColor"))
            .cornerRadius(10)
            .shadow(color: Color.secondary, radius: 5, x: 0, y: 2)
            .padding(.vertical,10)
        }
       
    }
}

#Preview {
    ButtonView(title: "Login")
        .environmentObject(AuthViewModel())
}
