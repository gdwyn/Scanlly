//
//  ResultsView.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct ResultsView: View {
    let image: UIImage
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack(spacing: 16) {
            ResultTopBar() {
                navigationPath.removeLast(navigationPath.count)
            }
            
            VStack(spacing: 24) {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .frame(height: 250)
                
                ResultCard(
                    copyAction: {},
                    saveAction: {}
                )
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ResultsView(image: UIImage(systemName: "photo")!, navigationPath: .constant(NavigationPath()))
}
