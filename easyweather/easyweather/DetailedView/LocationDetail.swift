//
//  LocationDetail.swift
//  easyweather
//
//  Created by Beni Ibeh on 18/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct LocationDetail: View {
       @State var searchedLocation:String = "Unkown Location"
       @State private var showDetail = false
      @State private var showAnimation = false
       var body: some View {
        VStack{
         
            HStack{
                Spacer()
                Button(action: {
                    self.showAnimation.toggle()
                    
                    print("tapped")
                    
                        //.frame(width: 150, height: 150)
                }){
                        Image("add")
                        .foregroundColor(.black)
                       // .scaledToFit()
                }.padding()
                .buttonStyle(GradientButtonStyle())
                Spacer()

            }
            
        ScrollView(.vertical, showsIndicators: false) {
                       ForEach(1...5, id: \.self){_ in
                           CardShimmer()
                       }
                   }
    }
       .navigationBarTitle(searchedLocation)
       
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

struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.green : Color.yellow).animation(.easeIn(duration:0.8))
            .cornerRadius(30)
            .scaleEffect(configuration.isPressed ? 3: 1).animation(.easeIn(duration:0.8))
    }
}

struct CPreviews: PreviewProvider {
    static var previews: some View {
          LocationDetail()
    }
}


