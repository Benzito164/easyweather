//
//  ContentView.swift
//  easyweather
//
//  Created by Beni Ibeh on 15/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    @State var displayLabel = true
    @State var spacingAfterTextIsHidden:Int = 0
    @State private var timer = Timer.publish(every: 5.0, on: .main, in: RunLoop.Mode.common).autoconnect()
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:0)
                VStack(spacing:-22){
                    TopSearchBar().padding(.bottom, 70)
                    if displayLabel {
                      //  Spacer().frame(height:CGFloat(spacingAfterTextIsHidden))
                        LabelShimmer()
                    }
                    Cards()
                    Spacer()
                    Spacer()
                }
            }
            .onReceive(timer) { value in
                withAnimation(Animation.default.speed(0.15).delay(0).repeatForever(autoreverses: true)){
                    self.displayLabel.toggle()
                    self.timer.upstream.connect().cancel()
                //    self.spacingAfterTextIsHidden = 100
                }
            }
            .navigationBarTitle("Weather")
            .navigationBarHidden(true)
        }.preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



class Host: UIHostingController<ContentView> {
    
    var  prefferedStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}


