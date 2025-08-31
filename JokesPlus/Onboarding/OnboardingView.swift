//
//  OnboardingView.swift
//  JokesPlus
//
//  Created by Dev Soni on 31/08/25.
//

import SwiftUI

struct OnboardingView: View {
    @State var up = false
    @State private var page = 0
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false

    var body: some View {
        TabView (selection: $page) {
            VStack {
                Text("Get the")
                    .font(Font.system(size: 85))
                    .bold()
                    .padding(.vertical)
                    .rotation3DEffect(.degrees(-20), axis: (x: 1, y: 0, z: 0))
                Spacer()
                Text("🤣")
                    .font(Font.system(size: 150))
                    .fontWeight(.bold)
                    .offset(y: up ? -6 : 6)
                    .scaleEffect(up ? 1.06 : 0.98)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true)) {
                            up.toggle()
                        }
                    }
                Spacer()
                Text("Funnies")
                    .font(Font.system(size: 85))
                    .bold()
                    .padding(.vertical)
                    .padding(.bottom)
                    .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0, z: 0))
            }
            .tag(0)
            
            VStack {
                Spacer()
                Text("🧐")
                    .font(Font.system(size: 150))
                    .fontWeight(.bold)
                Text("Pick your vibe")
                    .font(.title)
                    .bold()
                Text("Tell us what you like. We’ll tailor jokes for you.")
                    .font(.headline)
                Spacer()
            }
            .tag(1)
            
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .safeAreaInset(edge: .bottom) {
                    Button(page == 0 ? "I Want" : "Give it to me") {
                        if page == 0 {
                            withAnimation(.easeInOut) { page = 1 }
                        } else {
                            withAnimation {
                                hasSeenOnboarding = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 56)
                    .font(.title3.bold())
                    .background(Color.orange)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                    .padding(.horizontal, 30)
                    .padding(.bottom)
        }
    }
}

#Preview {
    OnboardingView()
}
