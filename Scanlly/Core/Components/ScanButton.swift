import SwiftUI

struct ScanButton: View {
    var action: () -> Void
    @State private var isPressed: Bool = false

    var body: some View {
        Button {
            action()
            withAnimation {
                isPressed.toggle()
            }
        } label: {
            Image(systemName: isPressed ? "xmark" : "barcode.viewfinder")
                .contentTransition(.symbolEffect(.replace))
                .font(.title2)
                .frame(width: 64, height: 64)
                .background(.dark)
                .foregroundStyle(.white)
                .clipShape(Circle())
        }
    }
}

#Preview {
    ScanButton() {}
}
