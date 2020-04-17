//
//  CircleLoadingAnimation.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct CircleLoadingAnimation: View {
    @State var percent : CGFloat = 0
    var body : some View {
        VStack{
            Loader(percent: percent)
            HStack{
                Button(action: {
                    self.percent = 10
                }) {
                    Text("90%")
                }
                Button(action: {
                   self.percent = 80
                }) {
                    Text("80%")
                }
                Button(action: {
                    self.percent = 80
                }) {
                    Text("60%")
                }
                Button(action: {
                    self.percent = 80
                }) {
                    Text("30%")
                }
            }
        }
    }
}

struct Loader : View {

    var percent : CGFloat = 0
    var colors : [Color] = [.red,.orange,.yellow,.green,.purple,.red]
    var body: some View {
        ZStack{
            
            Circle()
                .fill(Color.white)
            .frame(width: 120, height: 120)
            .overlay(
                Circle()
                    .trim(from: 0, to: percent * 0.01)
                    .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                .fill(AngularGradient(gradient: .init(colors: colors), center: .center,startAngle: .zero,endAngle: .init(degrees: 240)))
            ).animation(.spring(response: 1.0, dampingFraction: 1.0, blendDuration: 1.0))
            Text(String(format: "%.1f",percent)+" %").font(.system(size: 20)).fontWeight(.heavy)
        }
    }
}
