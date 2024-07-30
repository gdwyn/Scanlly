//
//  SplashScreenView.swift
//  Scanlly
//
//  Created by Godwin IE on 30/07/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @Binding var showSplashScreen: Bool
    @State private var showFull = false
    @State private var scale = CGSize(width: 0.8, height: 0.8)
    @State private var opacity = 1.0


    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ZStack {
                Image("scanllysplash")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 68, height: 68)
                    .mask(
                        Rectangle()
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                            .frame(height: showFull ? 68 : 8)
                            .alignmentGuide(.bottom) { _ in 0 }
                    )
                    .clipped()
                    .scaleEffect(scale)
                    .opacity(opacity)

            }

        }
        .onAppear {
            withAnimation(.spring(duration: 1.5)) {
                showFull = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5, execute: {
                withAnimation(.easeIn(duration: 0.35)) {
                    opacity = 0
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.7, execute: {
                withAnimation(.easeIn(duration: 0.35)) {
                    scale = CGSize(width: 68, height: 68)
                }
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.9, execute: {
                withAnimation(.easeIn(duration: 0.35)) {
                    showSplashScreen.toggle()
                }
            })
        }
    }
}

#Preview {
    SplashScreenView(showSplashScreen: .constant(true))
}
