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
        VStack {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
            Spacer(minLength: 20)
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
        
    }
    
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    @State var isFaceUp: Bool = true
    
    /*
     @State changes isFaceUp to something that points to a boolean rather than being an immutable boolean so when changing the variable, you actually change what its referencing. This is for "changing" immutable data types. We don't use this often in app dev.
     */
    
    var content: String
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape
                    .fill()
                    .foregroundColor(.white)
                shape
                    .strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.largeTitle)
            }
            else {
                shape
                    .fill()
            }
        }
        .onTapGesture {
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
