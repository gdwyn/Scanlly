
<img width="1089" alt="scannly header" src="https://github.com/user-attachments/assets/0a66c220-1fb3-4103-8732-4062f73f52d8">

Scanlly is a SwiftUI application that allows users to take photos, recognize text within those photos, and translate the recognized text into different languages. This project demonstrates the use of various SwiftUI components, the Vision framework for text recognition, and integration with the Translation API.


## Features

- **Camera Integration**: Take photos using the device camera.
- **Photo Gallery Access**: Pick photos from the photo gallery.
- **Text Recognition**: Recognize text within photos using the Vision framework.
- **Text Translation**: Translate recognized text into different languages.
- **MVVM Architecture**: Clean separation of concerns with Model-View-ViewModel architecture.

### Scanlly benefits from:

- UIKit for accessing device camera
- Vision API for text recognition
- Translate API for translating recognized text
- Animated SF Symbols


## Screenshots

### HomeView

The `HomeView` contains the main interface with buttons to take photos or select photos from the gallery.

<img width="961" alt="home" src="https://github.com/user-attachments/assets/a622d2e3-9ee0-4391-81c0-a0621c4d1e2c">


### ResultsView

The `ResultsView` displays the recognized text and translation from the photo.

<img width="472" alt="results" src="https://github.com/user-attachments/assets/93f2f9aa-6f0c-4529-9d8f-af97431dd60f">


## Requirements

- iOS 17.0+
- Xcode 15.4+
- Swift 5.0+


## Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/godwinnebri/scanlly.git
   ```
2. Open the project in Xcode:
   ```sh
   cd scanlly
   open Scanlly.xcodeproj
   ```
3. Build and run the project on your iOS device or simulator.


## Usage

### Home Screen

- Tap the **Camera** button to take a photo.
- Tap the **Gallery** button to select a photo from the gallery.
- The app will recognize text in the selected or captured photo and display it in the results view.

### Results View

- The recognized text will be displayed as a `Text`
- Use the **Copy** button to copy the text to the clipboard.
- Tap the **Translate** button to translate the recognized text into different languages.

## Contributing

Contributions are welcome. Please feel free to submit a Pull Request.
