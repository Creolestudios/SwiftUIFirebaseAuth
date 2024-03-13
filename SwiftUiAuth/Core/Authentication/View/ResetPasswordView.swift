//
//  ResetPasswordView.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 14/02/24.
//

import SwiftUI

struct ResetPasswordView: View {
    @State  var password = ""
    @State  var confirmPassword  = ""
    @State  var isPasswordUpdated = false
    @Binding var resetPasswordSheet:Bool

    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
    
            VStack{
                Image("ResetPassword")
                    .resizable()
                    .frame(width: 258,height: 234)
                    .padding(.vertical,32)
                VStack(spacing:25){
                    InputView(text: $password, title: "Password", placeholder: "Enter new password",isSecureField: true,labelWidth: 74)
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Enter your Confirm Password",isSecureField: true,labelWidth: 135)
                }
                Button(action: {
                    Task {
                        do {
                            try await viewModel.updatePassword(password: password)
                            isPasswordUpdated = true
                        } catch {
                            print("Error\(error.localizedDescription)")
                        }
                    }
                    
                }, label: {
                    ButtonView(title: "Continue")
                })
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0: 0.6)
                Spacer()
            }
        .alert(isPresented: $isPasswordUpdated){
             Alert(title: Text("Password changed successfully"),dismissButton: .default(Text("OK"), action: {
                 resetPasswordSheet.toggle()
             })
             )
         }
        .padding(.horizontal)
    }
}

extension ResetPasswordView: AuthentiCationFormProtocol {
    var formIsValid: Bool{
        return !password.isEmpty
        && password.count > 5
        && confirmPassword == password
    }
}

#Preview {
    ResetPasswordView(resetPasswordSheet: .constant(true))
        .environmentObject(AuthViewModel())
}
