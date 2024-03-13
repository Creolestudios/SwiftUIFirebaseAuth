//
//  RegistrationView.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 06/02/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmpassword = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ScrollView{
                    VStack{
                        Image("SignUp")
                            .resizable()
                            .frame(width: 258,height: 234)
                        
                        VStack(spacing:24){
                            InputView(text: $email, title: "Email Address", placeholder: "name@example.com",labelWidth: 104)
                            InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name",labelWidth: 74)
                            InputView(text: $password, title: "Password", placeholder: "Enter your password",isSecureField: true,labelWidth: 74)
                            InputView(text: $confirmpassword, title: "Confirm Password", placeholder: "Confirm your password",isSecureField: true,labelWidth: 135)
                        }
                        .padding(.horizontal)
                        .padding(.top,12)
                        
                        Button(action: {
                            Task{
                                try await viewModel.createUser(withEmail:email,password:password,fullname:fullname)
                            }
                        }) {
                            ButtonView(title: "Sign Up")
                        }
                        
                        .disabled(!formIsValid)
                        .opacity(formIsValid ? 1.0: 0.6)
                        Spacer()
                        NavigationLink {
                            LoginView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            Text("Already have an account?")
                                .foregroundColor(Color("TextColor"))
                            Text("Sign in")
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.blue)
                        }
                        .foregroundColor(Color("AccentColor"))
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                }
            }
            
            
            
        }
    }
}


extension RegistrationView: AuthentiCationFormProtocol {
    var formIsValid: Bool{
        return  !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && confirmpassword == password
        && !fullname.isEmpty
        
    }
}

#Preview {
    RegistrationView()
        .environmentObject(AuthViewModel())
}
