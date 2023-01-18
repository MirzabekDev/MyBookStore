//
//  SignInPage.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct SignInPage: View {
    
    ///Connections
    @State var email = ""
    @State var password = ""
    @State var isLoading = false
    @EnvironmentObject var session : SessionStore
    
    /// SignIn function
    func doSIgnIn(){
        isLoading = true
        SessionStore().signIn(email: email, password: password, completion:{(res,error) in
            isLoading = false
            if error != nil{
                print("CHeck Email or Password")
                return
            }
            session.listen()
            print("User Signed IN")
        })
    }
     
    var body: some View {
        
        NavigationView{
            
            ///Starting ZStack......
            ZStack{
                
                Rectangle()
                    .fill(Color("bgColor"))
                    .frame(maxWidth: .infinity).frame(maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)///The background
                
                VStack{
                    
                    /// The headings
                    Spacer()
                    Text("Welcome")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    
                    Text("Log in to your existance accaunt !")
                        .foregroundColor(.black.opacity(0.4))
                    
                    /// Email Field
                    VStack{
                            TextField("EMAIL",text:$email)
                                .padding()
                                .cornerRadius(5)
                                .modifier(innershadowViewModifier())
                            .padding(.bottom,10)
                            
                        /*
                        if isEmail {
                            
                            Text("error_email")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                        }
                        */
                    }
                    
                    ///  Password Field
                    VStack{
                            SecureField("PASSWORD",text:$password)
                                .padding()
                                .cornerRadius(5)
                                .modifier(innershadowViewModifier())
                                .padding(.bottom,10)
                        
                      /*  if isPassword {
                            Text("error_password")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                        }
                        */
                    }
                    
                    /// Log In Button
                    HStack{
                        Button(action: {
                            doSIgnIn()
                        }, label: {
                            Spacer()
                            Text("LOG IN")
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
                    
                    /// Bottom Button
                    HStack{
                        Text(" Already have an Account ")
                            .foregroundColor(.black.opacity(0.4))
                       NavigationLink(destination: SignUpPage(),
                        label: {
                           Text("Sign Up")
                               .fontWeight(.bold)
                               .foregroundColor(.black)
                       })
                    }
                    
                    Spacer()
                }.padding(30)
            
            }
            
        }
    }
}

/// InnerShadow for the TextFields, Button

struct innershadowViewModifier: ViewModifier  {
    @State var radius : CGFloat = 10
    func body(content: Content) -> some View {
        content
            .overlay(
            RoundedRectangle(cornerRadius: radius)
                .stroke(Color("bgColor"),lineWidth: 4)
                .shadow(color: Color("lightColor"), radius: 4, x: 5, y: 5)
                .clipShape(RoundedRectangle(cornerRadius: radius))
                .shadow(color: Color("lightColor"), radius: 4, x: -5, y: -5)
                .clipShape(RoundedRectangle(cornerRadius: radius))
            )
    }
}

/// Shadow for the TextFields, Button

struct shadowViewModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("lightColor"), radius: 8, x:-8, y:-8)
            .shadow(color: Color("lightColor"), radius: 8, x: 8, y: 8)
    }
}


struct SignInPage_Previews: PreviewProvider {
    static var previews: some View {
        SignInPage()
    }
}


/// extensions for the checking
extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^[A-Z0-9a-z][a-zA-Z0-9_.-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

extension String {
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}").evaluate(with: self)
    }
}
