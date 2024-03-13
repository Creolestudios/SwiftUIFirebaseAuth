//
//  ProfileView.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 06/02/24.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State var resetPasswordSheet:Bool = false
    
    
    var body: some View {
        ZStack(alignment:.bottom){
            Color.accentColor
                .edgesIgnoringSafeArea(.top)
            VStack{
                UserDataRow(title: viewModel.currentUser?.fullname ?? "NirmalSinh")
                UserDataRow(title: viewModel.currentUser?.email ?? "nirmalsinh@yopmail.com")
                Button(action: {
                    resetPasswordSheet.toggle()
                }, label: {
                    ButtonView(title: "Reset Password")
                })
                Button(action: {
                    viewModel.signOut()
                }, label: {
                    HStack{
                        Text("LogOut")
                            .fontWeight(.semibold)
                            .font(.title2)
                            .foregroundColor(.red)
                            .frame(width:350,height: 52)
                    }
                    .overlay {
                        Capsule()
                            .stroke(Color.red, lineWidth:2)
                            .foregroundColor(Color.white)
                            .shadow(color:.orange,radius: 10)
                    }
                    
                })
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            .overlay(alignment:.top,content: {
                
                if  viewModel.currentUser?.photoURL !=  nil {
                    AsyncImage(url: viewModel.currentUser?.photoURL)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: 100,height:100)
                        .shadow(color:.white,radius: 8)
                        .offset(x:-5, y: -100)
                }
                else
                {
                    Text(viewModel.currentUser?.initials ?? "NS")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 100,height:100)
                        .background(Color(hex:"#5496ee"))
                        .clipShape(Circle())
                        .shadow(color:.white,radius: 8)
                        .offset(x:-5, y: -100)
                    
                }
            })
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .frame(height: UIScreen.main.bounds.height - 200)
            .padding(.top,40)
            .background(Color.white)
        }
        .sheet(isPresented: $resetPasswordSheet, content: {
            ResetPasswordView(resetPasswordSheet:$resetPasswordSheet)
        })
        
    }
    
}


#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
    
}
