# news_app

A new Flutter project.

## Getting Started

## build and run the App
Step 1: Clone the project
To get started, clone the project from the Git repository using the following command:

git clone https://github.com/aliKadon/news_app

Step 2: Install dependencies

Navigate into the project directory and run the following command to install the project dependencies:

flutter pub get

Step 3: Run the app

flutter run

This will build the app and launch it on a connected device or emulator.

Step 4: Build the app
To build the app for release, run the following command:

flutter build <platform>

Replace <platform> with the platform you want to build the app for, such as apk for Android or ios for iOS.



## tests and coverage reports

Step 1: Run the tests
To run the tests, run the following command:

flutter test

Step 2: Generate coverage reports with lcov

To generate coverage reports with lcov, run the following command:

flutter test --coverage && genhtml coverage/lcov.info -o coverage/html

This will generate the coverage report in HTML format in the coverage/html directory.
