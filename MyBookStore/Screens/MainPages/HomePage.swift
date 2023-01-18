//
//  HomeScreen.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct HomePage: View {
    
    ///Connections
    @State private var tabSelection = 0
    
    var body: some View {
        
        ///TabView Strarting
        TabView(selection: $tabSelection){
            
            HomeMainPage().font(.system(size: 40,weight: .bold,design: .rounded))
                .tabItem{
                    Image(systemName: "books.vertical.circle")
                }.tag(0)
            
            HomeSetting().font(.system(size: 40,weight: .bold,design: .rounded))
                .tabItem{
                    Image(systemName: "gearshape.2")
                }.tag(2)
            
        }.accentColor(Color("greenC"))
            .onAppear{
                UITabBar.appearance().barTintColor = .white
            }
        }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
