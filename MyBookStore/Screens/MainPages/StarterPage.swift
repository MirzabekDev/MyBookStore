//
//  StarterPage.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct StarterPage: View {
    /// Connections
    @EnvironmentObject var session: SessionStore
    
    var body: some View {
        
        /// if issue that make pages
        VStack{
            if session.session != nil{
                HomePage()
            }else{
                SignInPage()
            }
        }.onAppear{
            session.listen()
        }
        
    }
}

struct StarterScreen_Previews: PreviewProvider {
    static var previews: some View {
        StarterPage()
    }
}
