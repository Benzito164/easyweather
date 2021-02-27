//
//  SearchView.swift
//  easyweather
//
//  Created by Beni Ibeh on 22/11/2020.
//  Copyright © 2020 Beni Ibeh. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var text = ""
    @State private var isEditing = false
    var body: some View {
        VStack{
            HStack{
                TextField("Search", text: self.$text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                 
                        if isEditing {
                            Button(action: {
                                self.text = ""
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                    )
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
            if isEditing {
                  Button(action: {
                      self.isEditing = false
                      self.text = ""

                  }) {
                      Text("Cancel")
                  }
                  .padding(.trailing, 10)
                  .transition(.move(edge: .trailing))
                  .animation(.spring())
              }
            }.onDisappear(){
                print("search view gone!")
            }
            ResultTableview(searchText: text)
        }.padding(.vertical,6)
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
