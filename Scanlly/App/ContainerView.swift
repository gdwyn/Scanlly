//
//  ContainerView.swift
//  Scanlly
//
//  Created by Godwin IE on 30/07/2024.
//

import SwiftUI

struct ContainerView: View {
    @State private var showSplashScreen = true
    var body: some View {
        if showSplashScreen {
            SplashScreenView(showSplashScreen: $showSplashScreen)
        } else {
            HomeView()
                .preferredColorScheme(.light)
        }
    }
}

#Preview {
    ContainerView()
}
