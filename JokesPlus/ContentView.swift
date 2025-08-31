//
//  ContentView.swift
//  JokesPlus
//
//  Created by Dev Soni on 28/08/25.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AppModel.self) var model
    let flags = ["Nsfw", "Religious", "Political", "Racist", "Sexist", "Explicit"]
    
    var body: some View {
        @Bindable var model = model
        VStack {
            Text("Jokes+")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.orange)
            Spacer()
            
            if model.isLoading {
                ProgressView("Loading the funnies...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            } else if let err = model.error{
                Text("Something went wrong")
                Text(err.localizedDescription)
            } else {
                Text(model.jokeText ?? "Press the button to get a joke")
                    .font(.title)
            }
            
            Spacer()
            Divider()
            
            HStack {
                Text("Category")
                    .bold()
                Spacer()
                Picker("Select Category", selection: $model.category) {
                    Text("All").tag("any")
                    Text("Programming").tag("programming")
                    Text("Misc").tag("misc")
                    Text("Dark").tag("dark")
                    Text("Spooky").tag("spooky")
                    Text("Pun").tag("pun")
                    Text("Christmas").tag("christmas")
                }
            }
            Divider()
            
            HStack (alignment: .top){
                Text("BlackList")
                    .bold()
                    .padding(.trailing, 100)
                VStack {
                    ForEach(flags, id: \.self) { flag in
                        HStack {
                            Text(flag)
                            Spacer()
                            Image(systemName: model.selectedFlags.contains(flag) ? "xmark.square.fill" : "square")
                                .onTapGesture {
                                    toggle(flag)
                                }
                        }
                    }
                }
            }
            .padding(.bottom)
            .padding(.top, 3)
            
            Button {
                Task {
                    await model.fetchJoke()
                }
            } label: {
                Text("Get Joke!")
                    .bold()
            }
            .frame(maxWidth: .infinity)
            .padding(15)
            .foregroundStyle(.white)
            .background(Color.orange)
            .clipShape(Capsule(style: .continuous))
            .disabled(model.isLoading)
        }
        .padding()
    }
    
    private func toggle(_ flag: String) {
        if let index = model.selectedFlags.firstIndex(of: flag) {
            model.selectedFlags.remove(at: index) // uncheck
        } else {
            model.selectedFlags.append(flag) // check
        }
    }
}

#Preview {
    ContentView()
        .environment(AppModel())
}
