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

    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text("English")
                    .foregroundStyle(.gray)
                Text(
                """
                In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available
                """
                )
            }
            
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
    ResultCard(copyAction: {}, saveAction: {})
}
