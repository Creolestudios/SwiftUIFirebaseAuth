# SwiftUIFirebaseAuth

SwiftUIFirebaseAuth App is a SwiftUI-based iOS application that implements Firebase Authentication using the MVVM (Model-View-ViewModel) architecture. It provides features such as Google signup, password reset functionality, custom text input, and seamless login experience where the user does not need to login again after closing the application.

## Features💥

- **Google Signup**: Users can sign up using their Google account.
- **Password Reset**: Users can request a password reset link which is sent to their registered email address.
- **Custom TextInput**: Customized text input fields for enhanced user experience.
- **Firestore Integration**: User details are stored in Firebase Firestore.
- **Persistent Login**: After successfully logging in, the user does not need to login again upon closing the application.


## Demo ☄️
![](PreView/appDemo.gif)

## Architecture 🔥

The project follows the MVVM (Model-View-ViewModel) architecture pattern to maintain a clean and structured codebase.

- **Model**: Represents the data and business logic of the application.
- **View**: Defines the UI components and layout.
- **ViewModel**: Acts as an intermediary between the Model and the View, handling user interactions and updating the View accordingly.

## Technologies Used 💡

- **SwiftUI**: SwiftUI is used for building the user interface.
- **Firebase Authentication**: Firebase Authentication is used for user authentication.
- **Firebase Firestore**: Firebase Firestore is used for storing user details.

## Installation ⚡️

1. Clone the repository to your local machine.

`
git clone https://github.com/NirmalsinhRathod/SwiftUIFirebaseAuth.git
`

2. Open the project in Xcode.

3. Set up Firebase in your project by following the Firebase documentation: [Firebase Documentation](https://firebase.google.com/docs/ios/setup).

4. Run the project in Xcode.

## Configuration ✨

Before running the application, make sure to configure Firebase in your project:

1. Create a Firebase project in the Firebase console: [Firebase Console](https://console.firebase.google.com/).

2. Add your iOS app to the Firebase project and follow the setup instructions.

3. Download the `GoogleService-Info.plist` file and add it to your Xcode project.

4. Enable Firebase Authentication and Firestore in the Firebase console.

## Usage 📱

1. Launch the application on a simulator or device.

2. Sign up using Google or register with an email and password.

3. After successful login, navigate through the application features.

4. Test the password reset functionality by requesting a password reset link.

5. Close the application and reopen to verify the persistent login feature.

## Author 🙋🏻‍♂️

- [@NirmalsinhRathod](https://github.com/NirmalsinhRathod) 🧑🏻‍💻
