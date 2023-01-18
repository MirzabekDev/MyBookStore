//
//  SignUpPage.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct SignUpPage: View {
    
    ///Connections
    @State var email = ""
    @State var password = ""
    @State var cpassword = ""
    @State var isLoading = false
    @Environment(\.presentationMode) var presentation
    
    /// SignUp function
    func doSignUp(){
        isLoading = true
        SessionStore().signUp(email:email,password: password,completion:{(res,error) in
            isLoading = false
            if error  != nil{
                print("user not Create !!!")
                return
            }
            print("User Created")
            presentation.wrappedValue.dismiss()
        })
    }
    
    var body: some View {
        
        NavigationView{
            
            /// Starting ZStack
            ZStack{
                Rectangle()
                    .fill(Color("bgColor"))
                    .frame(maxWidth: .infinity).frame(maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                /// Starting VStack
                VStack{
                    Spacer()
                    Text("REGISTRATION")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Create your own Accaunt")
                        .foregroundColor(.black.opacity(0.4))
                    
                    /// Email field
                    VStack{
                        TextField("EMAIL",text:$email)
                            .padding()
                            .cornerRadius(5)
                            .modifier(innershadowViewModifier())
                            .padding(.bottom,10)
                        /*
                        if isEmail {
                        Text("Error Email")
                            .foregroundColor(.black)
                            .padding(.leading)
                            .font(.system(size: 17))
                            
                        }
                         */
                    }
                    ///Password  field
                    VStack{
                        SecureField("PASSWORD",text:$password)
                            .padding()
                            .cornerRadius(5)
                            .modifier(innershadowViewModifier())
                            .padding(.bottom,10)
                        /*
                       if isPassword {
                        Text("The password must contain at least 1 capital letter, number and symbol!")
                            .foregroundColor(.black)
                            .font(.system(size: 15))
                           
                       }
                         */
                    }
                    
                    /// Confirm Password field
                    VStack{
                        SecureField("CONFIRM PASSWORD",text:$cpassword)
                            .padding()
                            .cornerRadius(5)
                            .modifier(innershadowViewModifier())
                            .padding(.bottom,10)
                        /*
                      if isCPassword {
                        Text("The password is not the same!")
                            .foregroundColor(.black)
                            .font(.system(size: 15))
                          
                      }
                         */
                    }
                    
                    /// Sign Up Button
                    HStack{
                        Button(action: {
                            doSignUp()
                        }, label: {
                            Spacer()
                            Text("Create")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            Spacer()
                        })
                        .foregroundColor(.blue.opacity(0.8))
                        .padding()
                        .background(Color("bgColor"))
                        .cornerRadius(10)
                        .modifier(shadowViewModifier())
                    }.padding(.bottom,16)
                    HStack{
                        Text(" Already have an Account ")
                            .foregroundColor(.black.opacity(0.4))
                   
                        Button(action: {
                            self.presentation.wrappedValue.dismiss()
                        }, label: {
                            Text("Log In").foregroundColor(.black)
                                .fontWeight(.bold)
                        })
                    }
                    Spacer()
                }.padding(30)
            }
        }.navigationBarBackButtonHidden(true)
            .accentColor(.white)
    }
}

struct SignUpPage_Previews: PreviewProvider {
    static var previews: some View {
        SignUpPage()
    }
}
