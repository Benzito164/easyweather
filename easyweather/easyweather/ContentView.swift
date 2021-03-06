//
//  ContentView.swift
//  easyweather
//
//  Created by Beni Ibeh on 15/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

var savedLocationsArray = ["Chester","Hull","leeds"]
struct ContentView: View {
    @State var displayLabel = true
    @State var spacingAfterTextIsHidden:Int = 0
    @State var showDebugScreen = false
    @State var showSettingsScreen = false
    @State var displayCards = false
    @State var displaySavedCardsWeatherView = false
    @State var savedLocationData = WeatherDataManager.savedLocationsWeatherData
    @State var valueChanged = false
    @State var sampleText = "H"
    
    @State private var timer = Timer.publish(every: 5.0, on: .main, in: RunLoop.Mode.common).autoconnect()
    var body: some View {
        NavigationView{
            VStack{
                Spacer().frame(height:0)
                VStack(spacing:-39){
                    HStack{
                        NavigationLink(destination: SearchView()) {
                            loadImageFromResource(imageName: "search.png")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color.purple)
                            .scaledToFit()
                            .padding(.horizontal,8)
                            
                        }.navigationBarTitle("Home", displayMode: .inline)
                        Spacer(minLength: -10)
                        Button(action: {
                            self.showSettingsScreen.toggle()
                        }){
                            loadImageFromResource(imageName:"SettingsIcon.png")
                                .resizable()
                                .buttonStyle(GradientButtonStyle())
                                .frame(width: 25, height: 25)
                                .foregroundColor(.purple)
                        }.sheet(isPresented: $showSettingsScreen){
                            MainSettingsScreen()
                        }
                    }
                    .padding(.horizontal)
                    .onAppear(){
                        print("on appear")
                       self.displayCards = false
                        let WDM = WeatherDataManager()
                        var iterationCounter = 0
                        savedLocationsArray.forEach { (location) in
                            WDM.getWeatherForSavedLocations(locationName: location) {
                                iterationCounter+=1
                                if savedLocationsArray.count == iterationCounter {
                                    self.displayCards = true
                                }
                                
                            }
                        }
                    }

                    if displayLabel {
                        LabelShimmer().padding(.bottom,190)
                    } else
                    {
                        LabelShimmer()
                            .hidden()
                           .padding(.bottom,190)
                    }
                    if displayCards{
                        Cards(weatherInformation: WeatherDataManager.savedLocationsWeatherData, valueChanged: $valueChanged).onTapGesture {
                            var number = 1
                            sampleText = "\(sampleText)\(number+=1)"
                        }
                        
                    }
                  
                    Text(sampleText).padding(.bottom,40)
                    Spacer()
                }
                Button(action: {
                    self.showDebugScreen.toggle()
                    self.valueChanged.toggle()
                }){
                    loadImageFromResource(imageName:"infoIcon.png")
                        .renderingMode(Image.TemplateRenderingMode.original)
                        .resizable()
                        .buttonStyle(GradientButtonStyle())
                        .frame(width: 40, height: 40)
                }.sheet(isPresented: $showDebugScreen){
                    DebugScreenView()
                }
            }
            .onReceive(timer) { value in
                withAnimation(Animation.default.speed(0.15).delay(0)){
                    self.displayLabel.toggle()
                    self.timer.upstream.connect().cancel()
                }
            }
            .navigationBarTitle("Weather")
            .navigationBarHidden(true)
        }.preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
       Group {
        ContentView()
           .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
           .previewDisplayName("iPhone SE")

              }
    }
}

//TODO: This is a helper method it should be extracted to a seperate class
func loadImageFromResource(imageName:String) -> Image {
    return Image(uiImage: UIImage(imageLiteralResourceName: imageName))
}

class Host: UIHostingController<ContentView> {
    
    var  prefferedStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}


