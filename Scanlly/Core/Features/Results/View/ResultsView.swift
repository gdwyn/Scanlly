//
//  ResultsView.swift
//  Scanlly
//
//  Created by Godwin IE on 28/07/2024.
//

import SwiftUI

struct ResultsView: View {
    var body: some View {
        VStack(spacing: 16) {
            ResultTopBar() {}
            
            VStack(spacing: 24) {
                Color.gray
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
    ResultsView()
}
