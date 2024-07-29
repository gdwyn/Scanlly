//
//  Empty.swift
//  Scanlly
//
//  Created by Godwin IE on 29/07/2024.
//

import SwiftUI

struct Empty: View {
    var body: some View {
        VStack(spacing: 14) {
            Image("empty")
                .resizable()
                .scaledToFit()
                .frame(width: 84)
            
            VStack(spacing: 6) {
                Text("Add an image to scan")
                    .font(.title3)
                Text("Take a photo or upload from gallery")
                    .font(.callout)
                    .foregroundStyle(.gray)
                    .frame(width: 180)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    Empty()
}
