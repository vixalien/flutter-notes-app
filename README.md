# 📝 Flutter Notes App — Individual Assignment 2

This is a mobile note-taking application built with Flutter and integrated with Firebase. The app supports authentication using email and password, and provides full CRUD operations for notes using Firestore.


## 📱 Features

* ✅ Firebase Email/Password **Authentication**
* ✅ **Add**, **View**, **Update**, and **Delete Notes**
* ✅ **User-specific notes** using subcollections
* ✅ **“Nothing here yet”** hint for new users
* ✅ **SnackBar** for success/error messages
* ✅ **Circular Loader** on first fetch
* ✅ Clean state management using **Provider**
* ✅ Proper separation of concerns (Clean Architecture)
* ✅ Logout support
* ✅ Responsive UI


## 💠 Setup Instructions

### ✅ Prerequisites

* Flutter installed
* Firebase CLI installed
* Android Studio or compatible emulator/physical device


### 🔧 Firebase Setup

#### 1. Create Firebase Project

* Visit [Firebase Console](https://console.firebase.google.com/)
* Create a new project (e.g., `notes-app-assignment`)
* Add a new Android app to the project:

  * **Package Name**: `com.example.notes_app`
  * Download the generated `google-services.json`
  * Place it inside `android/app/`

#### 2. Enable Firebase Services

* Enable **Email/Password Authentication** under the **Authentication** tab
* Create a **Cloud Firestore** database in **production mode**

#### 3. Set Firestore Security Rules

```js
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId}/notes/{noteId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }
  }
}
```


### 📆 Project Installation

```bash
git clone https://github.com/vixalien/flutter-notes-app.git
cd flutter-notes-app
flutter pub get
flutter run
```


## 📁 Folder Structure

```
lib/
├── data/
│   └── note_repository.dart        # Firestore logic
├── models/
│   └── note.dart                   # Note model
├── providers/
│   └── note_provider.dart          # State manager
├── screens/
│   ├── login.dart                  # Login UI
│   ├── signup.dart                 # Signup UI
│   └── notes.dart                  # Main Notes UI
└── main.dart                       # App entry and provider setup
```


## 🥪 Dart Analyzer

To check code quality:

```bash
flutter analyze
```

> ✅ No warnings or errors
