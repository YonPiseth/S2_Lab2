# S2-Lab2 E-commerce App

A structured Flutter application demonstrating adaptive user interfaces for Android (Material) and iOS (Cupertino) within a single codebase.

## Features

- **Dual Interface**: Toggle seamlessly between Android and iOS UI styles using the switch in the navigation bar.
- **Android (Material)**:
  - Standard `Scaffold` with `AppBar` and `Drawer`.
  - `BottomNavigationBar` for footer navigation.
  - `SnackBar` feedback interactions.
- **iOS (Cupertino)**:
  - `CupertinoTabScaffold` for native-style tab navigation.
  - `CupertinoNavigationBar` and native typography.
- **State Management**: Stateful switching logic to dynamically rebuild the widget tree based on the selected platform.

## Getting Started

1.  **Prerequisites**: Ensure you have Flutter installed and an emulator (Android) or simulator (iOS) running.
2.  **Run the App**:
    ```bash
    flutter run
    ```
3.  **Toggle Platform**: Click the switch icon in the top-right corner to change the interface style.
