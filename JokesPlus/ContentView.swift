//
//  ContentView.swift
//  JokesPlus
//
//  Created by Dev Soni on 28/08/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory = 0
    
    let flags = ["Nsfw", "Religious", "Political", "Racist", "Sexist", "Explicit"]
    @State private var selectedFlags: [String] = []
    
    var body: some View {
        VStack {
            Text("Jokes+")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.red)
            Spacer()
            
            Text("Joke Here")
                .font(.title)
            
            Spacer()
            Divider()
            
            HStack {
                Text("Category")
                    .bold()
                Spacer()
                Picker("Select Category", selection: $selectedCategory) {
                    Text("All").tag(0)
                    Text("Programming").tag(1)
                    Text("Misc").tag(2)
                    Text("Dark").tag(3)
                    Text("Spooky").tag(4)
                    Text("Pun").tag(5)
                    Text("Christmas").tag(6)
                }
            }
            Divider()
            
            Text("BlackList")
                .bold()
            
            ForEach(flags, id: \.self) { flag in
                HStack {
                    Text(flag)
                    Spacer()
                    Image(systemName: selectedFlags.contains(flag) ? "xmark.square.fill" : "square")
                        .onTapGesture {
                            toggle(flag)
                        }
                }
            }
            
            Button {
                
            } label: {
                Text("Get Joke!")
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(10)
            .foregroundStyle(.white)
            .background(Color.red)
            .clipShape(Capsule(style: .continuous))
        }
        .padding()
    }
    
    private func toggle(_ flag: String) {
        if let index = selectedFlags.firstIndex(of: flag) {
            selectedFlags.remove(at: index) // uncheck
        } else {
            selectedFlags.append(flag) // check
        }
    }
}

#Preview {
    ContentView()
}
