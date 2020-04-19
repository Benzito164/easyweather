//
//  LocationDetail.swift
//  easyweather
//
//  Created by Beni Ibeh on 18/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct LocationDetail: View {
       var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack{
                Text("London").font(.title)
                       ForEach(1...5, id: \.self){_ in
                           CardShimmer()
                       }
                   }
        } 
       
       
    }
}

struct CardShimmer : View {
    
    @State var show = false
    var center = (UIScreen.main.bounds.width / 2) + 110
    
    var body : some View{
        
        ZStack{
            
            Color.black.opacity(0.09)
            .frame(height: 200)
            .cornerRadius(10)
            
            Color.white
            .frame(height: 200)
            .cornerRadius(10)
            .mask(
            
                Rectangle()
                .fill(
                
                    LinearGradient(gradient: .init(colors: [.clear,Color.white.opacity(0.48),.clear]), startPoint: .top, endPoint: .bottom)
                )
                .rotationEffect(.init(degrees: 70))
                .offset(x: self.show ? center : -center)
            
            )
        }
        .padding(.horizontal)
        .padding(.top)
        .onAppear {
            
            withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: false)){
                
                self.show.toggle()
            }
        }
    }
}

//struct LocationDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationDetail()
//    }
//}
