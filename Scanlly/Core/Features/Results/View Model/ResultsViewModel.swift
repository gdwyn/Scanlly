import Foundation
import UIKit

extension ResultsView {
    @Observable
    class ViewModel {
        var showTranslation: Bool = false
        
        func copyToClipboard(text: String) {
            UIPasteboard.general.string = text
        }
    }
}
