//
//  ContentView.swift
//  Memorize
//
//  Created by Dylan Blake on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚑", "🚂", "⛴️", "🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🛵", "🚲", "🏍️", "🛺", "🚀"]
    @State var emojiCount = 6
    var body: some View {
        VStack{
            HStack {
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                    CardView(content: emoji)
                }
            }
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
        
    }
    
    
    var remove: some View {
        Button(action: {
            emojiCount -= 1
        }, label: {
            VStack {
                Text("Remove")
                Text("Card")
            }
        })
    }
    
    var add: some View {
        Button(action: {
            emojiCount += 1
        }, label: {
            VStack {
                Text("Add")
                Text("Card")
            }
        })
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    
    /*
     @State changes isFaceUp to something that points to a boolean rather than being an immutable boolean so when changing the variable, you actually change what its referencing. This is for "changing" immutable data types. We don't use this often in app dev.
     */
    
    @State var content: String
    var body: some View {
        ZStack {
            
            let shape = RoundedRectangle(cornerRadius: 20)
            
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .stroke(lineWidth: 3)
                Text("✈️")
                    .font(.largeTitle)
            }
            else {
                shape
                    .fill()
            }
        }
        onTapGesture {
            isFaceUp = !isFaceUp
        }
        
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
