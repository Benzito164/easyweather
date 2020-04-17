//
//  ContentView.swift
//  easyweather
//
//  Created by Beni Ibeh on 15/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack(spacing:0){
            TopSearchBar()
            Spacer()
           Cards()
       
        }.edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
          ContentView()
    }
}



class Host: UIHostingController<ContentView> {
    
     var  prefferedStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}


