import SwiftUI

struct ResultTopBar: View {
    var action: () -> Void

    var body: some View {
        HStack {
            Text("Result")
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
