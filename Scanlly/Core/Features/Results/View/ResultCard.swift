//
//  ResultCard.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct ResultCard: View {
    var copyAction: () -> Void
    var saveAction: () -> Void
    var recognizedText: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                
                
                if recognizedText.isEmpty {
                    Text("No text detected")
                        .foregroundColor(.gray)
                } else {
                    Text("English")
                        .foregroundStyle(.gray)
                    
                    Text(recognizedText)
                }
                
            }
            .frame(maxWidth: .infinity)
            
            HStack(spacing: 24) {
                Button {
                    copyAction()
                } label: {
                    Image(systemName: "doc.on.doc")
                }
                
                Button {
                    saveAction()
                } label: {
                    Image(systemName: "bookmark")
                }
            }
            .padding(.horizontal, 24)
            .padding(.vertical)
            .foregroundStyle(.white)
            .background(.dark)
            .clipShape(Capsule())
            .padding(8)
        }
        .padding()
        .background(.gray.opacity(0.02))
        .overlay(
            RoundedRectangle(cornerRadius: 18)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
    }
}

#Preview {
    ResultCard(copyAction: {}, saveAction: {}, recognizedText: "")
}
