//
//  ResultTableview.swift
//  easyweather
//
//  Created by Beni Ibeh on 17/04/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct ResultTableview: View {
    var searchText : String = ""
    var body: some View {
       tableView(searchText: searchText)
    }
}


struct tableView : View {
    var searchText:String = ""
    var names : [String]=[]
    @State var show = false
    var body: some View {
        VStack{
            if searchText.isEmpty{

                    List{
                        NavigationLink(destination:LocationDetail()){
                            Text("No Results found")
                            .padding()
                            }.cornerRadius(13).listRowBackground(Color.red.opacity(0.2))
                        }
            } else {
                List(generateRandomArrayFromSingleParameter(string: searchText),id:\.self){ name in
                    NavigationLink(destination:LocationDetail()){
                         Text(name)
                            .padding()
                    }.cornerRadius(13).listRowBackground(Color.blue.opacity(0.2))
                }
            }
           
        }
    }
    
}

    func generateRandomArrayFromSingleParameter (string:String)->[String]{
        var emptyArray: [String] = []
        for value in 1...4 {
            emptyArray.append(string+String(6))
        }
    return emptyArray
}


