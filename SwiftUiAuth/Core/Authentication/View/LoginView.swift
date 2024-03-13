//
//  LoginView.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 06/02/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showError = false
    @State var showpassword = false
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Environment(\.dismiss) var dismiss
    
    private func signInWithGoogle() {
        Task {
            if await viewModel.signInWithGoogle() == true {
                dismiss()
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ScrollView {
                    VStack{
                        Image("Login")
                            .resizable()
                            .frame(width: 258,height: 234)
                            .padding(.vertical,32)
                        
                        VStack(spacing:20){
                            InputView(text: $email, title: "Email Address", placeholder: "name@example.com",labelWidth: 104)
                                .autocapitalization(.none)
                            InputView(text: $password, title: "Password", placeholder: "Enter your Password",isSecureField: true,labelWidth: 74)
                        }
                        
                        NavigationLink {
                            EmailResetpassword()
                            
                        } label: {
                            Text("Forget Password ?")
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .trailing)
                                .padding(.horizontal,13)
                                .padding(.top,12)
                        }
                        
                        Button(action: {
                            Task {
                                try await viewModel.signIn(withEmail:email,password:password)
                            }
                        }, label: {
                            ButtonView(title: "Login")
                        })
                        
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0: 0.6)
                        
                        LabelledDivider(label: "Or")
                        
                        Button(action: signInWithGoogle, label: {
                            Image("googleIcon")
                                .resizable()
                                .frame(width: 50,height: 50)
                        })
                        
                        Spacer()
                        
                        NavigationLink {
                            RegistrationView()
                        } label: {
                            Text("Don't have account?")
                                .foregroundColor(Color("TextColor"))
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        }
                    }
                    .padding(.horizontal)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

extension LoginView: AuthentiCationFormProtocol {
    var formIsValid: Bool{
        return  !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
