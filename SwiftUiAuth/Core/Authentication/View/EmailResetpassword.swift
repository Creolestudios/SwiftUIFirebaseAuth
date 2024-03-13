//
//  EmailResetpassword.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 07/02/24.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift

struct EmailResetpassword: View {
    @State private var email = ""
    @State private var showAlert = false
    
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            VStack(spacing:0){
                Image("ResetPassword")
                    .resizable()
                    .frame(width: 258,height: 234)
                    .padding(.vertical,32)
                
                VStack{
                    Text("Enter your email for verification process we will send reset password link.")
                        .font(.title3)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom,20)
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com",labelWidth: 104)
                        .autocapitalization(.none)
                }
                
                .padding(.vertical,10)
                
                Button(action: {
                    Task
                    {
                        do{
                            try await viewModel.resetPassword(email:email)
                            showAlert.toggle()
                        }
                        catch{
                            print("Something want Wrong")
                        }
                    }
         
                }, label: {
                    ButtonView(title: "Continue")
                })
                
                Spacer()
            }
            .padding(.horizontal)
        }
        .alert(
            Text(viewModel.showMessage),
            isPresented: $showAlert
        ) {
            if viewModel.showMessage == "Link send successfully"
            {
                NavigationLink("OK") {
                    LoginView()
                        .navigationBarBackButtonHidden(true)
                }
            }
            else
            {
                Button("Cancel", role: .cancel) {
                    showAlert.toggle()
                }
            }
           
        }
    }
}
extension EmailResetpassword: AuthentiCationFormProtocol {
    var formIsValid: Bool{
        return  !email.isEmpty
        && email.contains("@")
    }
}

#Preview {
    EmailResetpassword()
        .environmentObject(AuthViewModel())
}
