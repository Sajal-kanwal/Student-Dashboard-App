# 📚 Student Dashboard App

A beautiful, minimalist Flutter application for students to track their courses, progress, and upcoming classes.

---

## ✨ Features

* 🔒 **Authentication**: Secure login with form validation
* 📊 **Dashboard**: Clean overview of courses and progress
* 📚 **Course Management**: View courses with progress tracking
* 📆 **Upcoming Classes**: Quick view of scheduled classes
* 📱 **Responsive Design**: Works on all screen sizes
* 🎨 **Smooth Animations**: Engaging user experience
* ⚡ **State Management**: Efficient Provider pattern implementation

---

## 🏗️ Architecture

The app follows a clean, scalable architecture:

* **Models**: Data structures for User and Course
* **Services**: API service layer for data fetching
* **Providers**: State management using the Provider pattern
* **Screens**: UI screens (Splash, Login, Home)
* **Widgets**: Reusable UI components
* **Utils**: Constants and theme configuration

---

## 📂 Project Structure

```
ib/
├── main.dart                 # App entry point
├── models/                   # Data models
├── services/                 # API services
├── providers/                # State management
├── screens/                  # UI screens
├── widgets/                  # Reusable components
└── utils/                    # Constants & theme
```

---

## 🛠️ Getting Started

Follow these steps to set up and run the project locally.

### ✅ Prerequisites

* Ensure you have **Flutter** installed (>= 3.0.0)
* Set up your Flutter environment (Android Studio / VS Code recommended)

---

### 🚀 Installation Instructions

1️⃣ **Clone the Repository**

```bash
git clone https://github.com/yourusername/student_dashboard.git
cd student_dashboard
```

---

2️⃣ **Create a New Flutter Project (if needed)**

If you want to create it manually instead of cloning:

```bash
flutter create student_dashboard
cd student_dashboard
```

---

3️⃣ **Replace Dependencies**

* Open the `pubspec.yaml` file.
* Replace its contents with the **provided dependencies** in this repository.

Example:

```yaml
name: student_dashboard
description: A new Flutter project.

dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  http: ^0.14.0
  shared_preferences: ^2.0.15
  animations: ^2.0.7
  google_fonts: ^5.0.0
```

---

4️⃣ **Set Up Folder Structure**

Create the folder structure exactly as shown:

```
ib/
├── main.dart
├── models/
├── services/
├── providers/
├── screens/
├── widgets/
└── utils/
```

---

5️⃣ **Add Source Files**

* Copy each provided file into its respective location in the folder structure.

---

6️⃣ **Install Dependencies**

```bash
flutter pub get
```

---

7️⃣ **Run the App**

```bash
flutter run
```

---

## 🔐 Login Credentials

> ✅ The app uses **dummy authentication** — any email and password combination will work.

---

## 📦 Dependencies

* [`provider`](https://pub.dev/packages/provider): State management
* [`http`](https://pub.dev/packages/http): API calls
* [`shared_preferences`](https://pub.dev/packages/shared_preferences): Local storage
* [`animations`](https://pub.dev/packages/animations): Smooth transitions
* [`google_fonts`](https://pub.dev/packages/google_fonts): Typography

---

## 🌟 Future Enhancements

* Real API integration
* Push notifications
* Dark mode support
* Course details screen
* Assignment tracking
* Calendar integration

---

## ❤️ Contributing

Pull requests are welcome! If you have suggestions, improvements, or bug fixes, feel free to open an issue or a PR.

---
