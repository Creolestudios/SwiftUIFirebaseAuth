//
//  InputView.swift
//  SwiftUiAuth
//
//  Created by Nirmalsinh Rathod on 06/02/24.
//

import SwiftUI

struct InputView: View {
    @Binding var text:String
    
    let title:String
    let placeholder:String
    @State var isSecureField = false
    @State var isPasswordVisible: Bool = false
    @State var width: CGFloat = 361
    @State var labelWidth: CGFloat = 100
    
    var body: some View {
        VStack{
            if !isPasswordVisible && isSecureField{
                    SecureField(placeholder, text: $text)
//                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(EdgeInsets(top: 15, leading:20, bottom: 15, trailing: 10))
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 5)
                                    .trim(from: 0, to: 0.55)
                                    .stroke(.gray, lineWidth: 1)
                                    .shadow(color: Color("ShadowColor"), radius: 5,x:0,y:10)
                                RoundedRectangle(cornerRadius: 5)
                                    .trim(from: 0.56 + (0.44 * (labelWidth / width)), to: 1)
                                    .stroke(.gray, lineWidth: 1)
                                
                                HStack{
                                    Text(title)
                                        .foregroundColor(.gray)
                                        .bold()
                                        .padding(2)
                                        .font(.subheadline)
                                        .frame(maxWidth: .infinity,
                                               maxHeight: .infinity,
                                               alignment: .topLeading)
                                        .offset(x: 20, y: -10)
                              
                                        Button(action: {
                                            print("Pressed")
                                            isPasswordVisible.toggle()
                                        }) {
                                            Image(systemName: isPasswordVisible ? "eye.fill" :  "eye.slash.fill")
                                                .foregroundColor(.blue)
                                                .padding()
                                   
                                        }
                                        .frame(width: 50,height: 50)
                                        .background(Color.clear)
                                
                                }
                            }
                        }
                        .overlay(GeometryReader { geo in Color.clear.onAppear
                            {
                                
                                if labelWidth == 0 {
                                    labelWidth = geo.size.width
                                }
                                
                            }
                            
                        })
                
            }
            else
            {
                TextField(placeholder, text: $text)
//                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .padding(EdgeInsets(top: 15, leading:20, bottom: 15, trailing: 10))
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .trim(from: 0, to: 0.55)
                                .stroke(.gray, lineWidth: 1)
                                .shadow(color: Color("ShadowColor"), radius: 5,x:0,y:10)
                            RoundedRectangle(cornerRadius: 5)
                                .trim(from: 0.56 + (0.44 * (labelWidth / width)), to: 1)
                                .stroke(.gray, lineWidth: 1)
                            
                            HStack{
                                Text(title)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .padding(2)
                                    .font(.subheadline)
                                    .frame(maxWidth: .infinity,
                                           maxHeight: .infinity,
                                           alignment: .topLeading)
                                    .offset(x: 20, y: -10)
                                if isSecureField {
                                    Button(action: {
                                        print("Pressed")
                                        isPasswordVisible.toggle()
                                    }) {
                                        Image(systemName: isPasswordVisible ?  "eye.fill" :  "eye.slash.fill")
                                            .foregroundColor(.blue)
                                            .padding()
                               
                                    }
                                    .frame(width: 50,height: 50)
                                    .background(Color.clear)
                                }
                            }
                        }
                    }
                    .overlay(GeometryReader { geo in Color.clear.onAppear
                        {
                            
                            if labelWidth == 0 {
                                labelWidth = geo.size.width
                            }
                            
                        }
                        
                    })

            }
           
        }
        .frame(maxWidth: 350)
    }
}
struct InputView_Previews: PreviewProvider{
    static var previews: some View{
        //        InputView(text: .constant(""),title:"Email Address",placeholder:"name@example.com")
        InputView(text: .constant(""), title: "Password", placeholder: "Enter your",isSecureField: true,labelWidth: 74)
    }
}
