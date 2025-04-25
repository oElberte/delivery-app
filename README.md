# Delivery App

A modern food delivery application built with Flutter using Clean Architecture with BLoC Pattern.

## 📱 About

Delivery App is a comprehensive mobile application that connects customers with restaurants, allowing users to browse menus, place orders, and track deliveries. The app features a clean and intuitive user interface with a focus on user experience.

## 🏗️ Architecture

This project follows **Clean Architecture with BLoC Pattern** principles:

- **BLoC (Business Logic Component)**: Manages state and business logic, separating it from the UI
- **Repository Pattern**: Abstracts data sources, providing a clean API for the domain layer
- **Dependency Injection**: Uses Provider for dependency management
- **Feature-based Structure**: Organized by features rather than technical concerns

## 🛠️ Tech Stack

- **Flutter**: UI framework
- **Dart**: Programming language
- **BLoC/Cubit**: State management
- **Provider**: Dependency injection
- **Dio**: HTTP client for API communication
- **Shared Preferences**: Local storage
- **Equatable**: Simplifies equality comparisons
- **Validatorless**: Form validation
- **Flutter Dotenv**: Environment configuration

## 🌟 Features

- User authentication (login/register)
- Restaurant menu browsing
- Product details view
- Shopping cart functionality
- Order placement and tracking
- User profile management

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=2.19.0 <3.0.0)
- Dart SDK
- Android Studio / VS Code
- Android/iOS emulator or physical device

## 📂 Project Structure

```
lib/
├── app/
│   ├── core/          # Core functionality, configs, UI components
│   ├── dto/           # Data Transfer Objects
│   ├── models/        # Domain models
│   ├── pages/         # UI screens organized by feature
│   ├── repositories/  # Data repositories
│   └── delivery_app.dart  # Main app widget
└── main.dart          # Entry point
```
