//
//  ScanButton.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct ScanButton: View {
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "doc.viewfinder")
                .padding(20)
                .background(.dark)
                .foregroundStyle(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ScanButton() {}
}
