//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Blake on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20.0)
                .stroke(lineWidth: 3)
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                    .foregroundColor(Color.blue)
            }
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        
        

        
        
        
        
        
        
    }
}









struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
