//
//  HomeMainPage.swift
//  MyBookStore
//
//  Created by Mirzabek on 06/01/23.
//

import SwiftUI

struct HomeMainPage: View {
    
    /// Connections
    @Environment(\.colorScheme) var shceme
    @State var search = ""
    
    var body: some View {
    /// starting VStack
        VStack{
            
            /// Title
            Text("BookStore")
                .font(.title)
                .fontWeight(.bold)
            
            /// Scroll View
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                /// Text Field
                    HStack{
                        TextField("Search",text: $search).padding()
                        
                        if  self.search != ""{
                            Button(action: {
                                
                            }, label: {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(.primary)
                            }).padding()
                        }
                        
                    }.overlay(RoundedRectangle(cornerRadius: 15).stroke(.blue.opacity(0.50),lineWidth: 3)).font(.system(size:15)).padding(.all,10)
                    
                    /// Main Information
                    VStack{
                        Image("main")
                        
                        Text("Read the Books below")
                            .fontWeight(.bold)
                            .font(.title)
                            .padding(.top,-30)
                        
                            Text("Swipe and pick your Book")
                            .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .padding(.top,8)
                                .padding(.bottom)
    
                    }
                    .background(
                        Color.blue.opacity(0.06)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .cornerRadius(25)
                            .padding(.top,95)
                    ).padding(.top,10).padding(.bottom,10)
                    
                    Text("Recommended")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    ForEach(books,id:\.self){ item in
                        
                       HStack(spacing: 15){
                            
                           ForEach(item){ i in
                               
                               /// ZStack
                               ZStack(alignment: .topLeading){
                                   /// Book Mark
                                   Button(action: {
                                       
                                   }, label: {
                                       
                                       Image(systemName: "bookmark").font(.system(size: 15)).padding(.all,10).foregroundColor(.black)
                                   })
                                
                                 /// Item
                                   VStack{
                                       Image(i.image)
                                           .resizable().aspectRatio(contentMode: .fill)
                                       
                                       Text(i.title)
                                           .fontWeight(.bold)
                                           .font(.system(size: 20))
                                       
                                       Link("read more...",destination: URL(string: "https://www.opportunitiesforyouth.org/wp-content/uploads/2021/04/Atomic_Habits_by_James_Clear-1.pdf")!)
                                   .font(.system(size: 15))
                                           .padding(.bottom,6)
                                   }
                                   .padding()
                                   .background(.primary.opacity(0.06))
                                   .cornerRadius(10)
                               }
                           }
                        }
                        
                    }


                }
                
            }
        }.padding()
        
    }
}

struct HomeMainPage_Previews: PreviewProvider {
    static var previews: some View {
        HomeMainPage()
    }
}

