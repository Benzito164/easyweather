//
//  MainSettingsScreen.swift
//  easyweather
//
//  Created by Beni Ibeh on 28/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct MainSettingsScreen: View {
    var body: some View {
             Settings()
    }
}

struct MainSettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainSettingsScreen().previewDevice(PreviewDevice.init(rawValue: "iPhone SE"))
    }
}

var settingsList = ["UI Theme", "Notifications", "Help Center", "General","About Us"]
struct Settings: View {
    var body: some View {
        
        VStack{
            ZStack{


                HStack{
                    VStack(alignment: .leading, spacing: 45, content: {
                        Text("Settings")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                            .fontWeight(.bold)
                    })
                        Spacer()

                }.padding()
                .padding(.top, 10)
                
                VStack{
                    loadImageFromResource(imageName: "sun.png")
                    .resizable()
                    .foregroundColor(.purple)
                    .frame(width: 50, height: 50)
                    Spacer()
                }.padding(.top,30)
                
            }.frame(height: 175)
            
            VStack(spacing: 15){
                ForEach(settingsList,id: \.self) { settingsName in
                    BtnView(name: settingsName)
                }
            }
            Spacer()
        }
    }
}

struct BtnView : View {
     var name = ""
    
    var body : some View {
       
        Button(action: {
            
        }){
            HStack {
//                loadImageFromResource(imageName: "")
//                    .renderingMode(.original)
//                .resizable()
//                .frame(width: 40, height: 40)
                Text(name)
                Spacer(minLength: 15)
                Image(systemName: "chevron.right")
            }.padding()
                .cornerRadius(5)
            .foregroundColor(Color.purple)
            
        }
    }
}
