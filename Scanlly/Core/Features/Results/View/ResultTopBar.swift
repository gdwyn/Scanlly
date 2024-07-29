//
//  ResultTopBar.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct ResultTopBar: View {
    var action: () -> Void

    var body: some View {
        HStack {
            Text("Results")
                .font(.title2.bold())
            
            Spacer()
            
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .padding()
                    .font(.title2)
                    .foregroundStyle(.gray.opacity(0.5))

            }
        }
    }
}

#Preview {
    ResultTopBar() {}
}
