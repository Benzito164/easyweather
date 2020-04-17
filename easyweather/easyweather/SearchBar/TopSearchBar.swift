//
//  TopSearchBar.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI



struct TopSearchBar : View {
     @State var show = false
     @State var text = ""
    var body: some View {
        VStack(spacing:0){
            HStack {
                if !self.show {
                    Text("Search")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.purple)

                }
                Spacer(minLength: 0)
                HStack{
                    
                    if self.show {
                        Image("search1")
                        .padding(.horizontal,8)

                        TextField("Search.....", text: self.$text)
                        Button(action: {
                            withAnimation {
                                 self.show.toggle()
                            }
                          
                        }){
                            Image(systemName: "xmark").foregroundColor(.black)
                        }
                        .padding(.horizontal,8)
                    }
                    else {
                        Button(action: {
                            withAnimation {
                                 self.show.toggle()
                            }
                         }){
                             Image("search1")
                                .scaledToFit()
                                //.foregroundColor(.white)
                                .padding(10)
                         }
                        
                    }
                }
                .padding(self.show ? 10 : 0)
                .background(Color.white)
                .cornerRadius(20)
            
            }
            .padding(.top,(UIApplication.shared.windows.first?.safeAreaInsets.top)!+15)
            .padding(.horizontal)
            .padding(.bottom,10)
           // .background(Color.orange)
          //  Spacer()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
