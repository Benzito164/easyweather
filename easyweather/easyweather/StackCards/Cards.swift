//
//  Cards.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI



struct Cards:View {
    @State var backViewSize : CGFloat = 80
    @State var size : CGSize = .zero
    var body: some View {
        GeometryReader{reader in
            ZStack{
                VStack{
                    Color.blue
                }.frame(width: reader.size.width - 160, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -30)
                
                VStack{
                    Color.orange
                }.frame(width: reader.size.width - self.backViewSize, height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                .offset(y: -15)
                
                VStack{
                    Color.red
                }.frame(width: reader.size.width - 50 , height: 300)
                .cornerRadius(20)
                .shadow(radius: 20)
                    .gesture(DragGesture().onChanged({ (value) in
                        self.size = value.translation
                        self.backViewSize = 50
                    })
                        .onEnded({ (value) in
                            self.size = .zero
                            self.backViewSize = 80
                        })
                )
                    .offset(self.size)
           }
            
        }
        .animation(.spring())
    }
}

