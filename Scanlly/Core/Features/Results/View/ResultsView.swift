//
//  ResultsView.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI
import Vision

struct ResultsView: View {
    let image: UIImage
    @Binding var navigationPath: NavigationPath
    var recognizedText: String

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 16) {
            ResultTopBar() {
                dismiss()
            }
            
            ScrollView{
                VStack(spacing: 24) {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .frame(height: 250)
                    
                    ResultCard(
                        copyAction: {},
                        saveAction: {},
                        recognizedText: recognizedText
                    )
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ResultsView(image: UIImage(systemName: "photo")!, navigationPath: .constant(NavigationPath()), recognizedText: "")
}
