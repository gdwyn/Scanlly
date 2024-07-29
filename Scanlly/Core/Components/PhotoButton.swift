//
//  PhotoButton.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct PhotoButton: View {
    var icon: String
    var label: String
    //var action: () -> Void

    var body: some View {
       
            HStack {
                Image(systemName: icon)
                Text(label)
            }
            .foregroundStyle(.dark)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            .background(.gray.opacity(0.06))
            .clipShape(Capsule())
        }
    
}

#Preview {
    PhotoButton(icon: "camera", label: "Camera") 
}
