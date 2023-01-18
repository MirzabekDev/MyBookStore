//
//  HomeSetting.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct HomeSetting: View {
    
    /// Connections
    @Environment(\.colorScheme) var theme
    
    var body: some View {
        
        /// Starting List
        List{
            ///Log Out Section
            Section(header: Text("Log Out"),footer: Text("Do you want to log out ?")){
                HStack{
                    Text("Log Out").foregroundColor(Color("greenC"))
                    Spacer()
                    
                    Button(action: {
                        SessionStore().signOut()
                    }, label: {
                        Image(systemName: "pip.exit").foregroundColor(Color("greenC"))
                    })
                }
            }
                /// Mode Section
            Section(header: Text("Mode"),footer: Text("You can change your theme")){
                    HStack{
                        Text("Choose Your Mode").foregroundColor(Color("greenC"))
                        
                        Spacer()
                        /// Theme Action
                        Button(action: {
                            UIApplication.shared.windows.first?.rootViewController?.overrideUserInterfaceStyle = self.theme == .dark ? .light : .dark
                        }, label: {
                            Image(systemName: self.theme == .dark ? "sun.max.fill" : "moon.fill")
                                .foregroundColor(Color("greenC"))
                                .font(.system(size: 22))
                                .foregroundColor(.primary)
                        })
                    }
            }
            
        
        }.font(.system(size: 20))
    }
}

struct HomeSetting_Previews: PreviewProvider {
    static var previews: some View {
        HomeSetting()
    }
}
