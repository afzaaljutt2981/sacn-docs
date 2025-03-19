Frame Scan
Frame Scan is a Flutter-based document scanner app that allows users to scan, crop, and save documents efficiently. The app ensures a smooth user experience with state management using GetX and local storage with Hive.
 


 Features
- Splash Screen & Onboarding: The app starts with a splash screen followed by onboarding screens. If the user clicks "Use Now," their session is saved using Hive, and onboarding will not appear again on subsequent launches.
- User Session Management: The session is stored in local storage using Hive.
- Home Screen: Users can pick an image from the camera or gallery.
- Document Edge Detection & Cropping: The camera scans the document and detects its edges, allowing users to crop and adjust it.
- State Management: GetX is used for efficient and reactive state management.
- MVVM Architecture: The app follows the MVVM (Model-View-ViewModel) structure for better code maintainability.
- Global Utilities: Colors, text styles, and the primary button are stored in a global folder within the `lib/` directory.
- Custom Fonts: The app uses Google Fonts with Poppins for better typography.
- Responsive UI: The app adapts to different screen sizes using `flutter_screenutil`.



Tech Stack
- Flutter Version: 3.24.0
- State Management: GetX
- Local Storage: Hive
- UI Responsiveness: flutter_screenutil
- Fonts: Google Fonts (Poppins)



 Folder Structure
lib/
│── global/
│   │── app_config/ (Hive configuration)
│   │── buttons/ (primary button)
│   │── helpers/ (toast, hive)
│   │── utils/ (App colors, text styles, etc.)
│
│── ui/
│   │── home/
│   │   │── view/
│   │   │── controller/
│   │── onboarding/
│   │   │── view/
│   │   │── model/
│   │── splash/
│   │   │── view/
│
│── main.dart




 Installation & Setup
 Prerequisites
- Flutter SDK installed
- Dart installed
- Android/iOS emulator or physical device

 Steps to Run the App
1. Clone the repository:
   git clone <repository-url>

2. Navigate to the project directory:
   cd frame_scan

3. Install dependencies:
   flutter pub get
 
4. Run the app:   
   flutter run
 



 Dependencies
The following dependencies are used in this project:
dependencies:
  flutter:
    sdk: flutter
  get: latest_version
  cupertino_icons: latest_version
  flutter_screenutil: latest_version
  google_fonts: latest_version
  page_transition:latest_version
  permission_handler: latest_version
  edge_detection: latest_version
  fluttertoast:latest_version
  path_provider:latest_version
  path: latest_version
  hive: latest_version
  hive_flutter: latest_version








