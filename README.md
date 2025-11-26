# TITLE AND OBJECTIVE

Getting started with Flutter and CSS in creating a car dealership

# GUIDE
- I decided to use Flutter and CSS in my project.
- I chose Flutter and CSS because it is cross-platformed and runs on all devices saving time and resources.
- The end goal is to use Flutter and CSS is to help me build a car dealership making it a beautiful UI for all users and at the same time making the development of the project faster and more efficient.

# QUICK SUMMARY OF THE TECHNOLOGY

# FLUTTER
A UI framework by Google used to build mobile, web, and desktop apps using one codebase.
It uses the Dart programming language.

Used to build:
	•	Android apps
	•	iOS apps
	•	Web apps
	•	Desktop apps (Windows, macOS, Linux)

Kenya Airways mobile app and Google Pay are built using Flutter.


# CSS
A styling language used to design and style web pages.
It controls:
	•	Colors
	•	Layout
	•	Fonts
	•	Spacing
	•	Animations

Used in web development to style:
	•	Websites
	•	Web apps
	•	Web pages built using HTML

The design of websites like Facebook, Twitter, and Netflix uses CSS to create layouts and themes.

# SYSTEM REQUIREMENTS
   
  #  Flutter

OS
	•	Windows 
	•	macOS 
	•	Linux

Tools Required
	•	Flutter SDK
	•	Dart SDK 
	•	Android Studio or Visual Studio Code
	•	Xcode (for iOS development, macOS only)
	•	Git

✔ Extra Packages / Dependencies
	•	Flutter packages from pub.dev

	
  # CSS

OS
	•	Windows
	•	macOS
	•	Linux
	•	ChromeOS
	•	Even Android/iOS 

Tools Required
	•	Any text editor (VS Code, Sublime, Notepad++)
	•	Any web browser (Chrome, Firefox, Safari, Edge)

✔ Extra Packages / Dependencies
	•	NPM + build tools (optional) such as
	•	Tailwind CSS
	•	PostCSS
	•	Sass
	•	Webpack / Vite


# INSTALLATION AND SETUP INSTRUCTIONS


# Step 1: Install Flutter
bash
# Download Flutter SDK from flutter.dev
# Add to PATH
# Verify installation
flutter doctor

# Part 1: Installing Flutter (Step-by-Step)
Step 1: Download Flutter SDK
Visit the official Flutter installation page at flutter.dev/get-started/install and download the Flutter SDK for your operating system FlutterFlutter (Windows, macOS, or Linux).
For Windows:

Download the Flutter SDK ZIP file from the Flutter download page LinkedIn
Extract the SDK to a directory without special characters or spaces, such as C:\Users{username}\develop Flutter
Add Flutter to your PATH:

Right-click Start menu → System → Advanced system settings
Click "Environment Variables"
Under "System variables", find and edit "Path"
Add: C:\flutter\bin (or your installation path)



For macOS:
bash# Download appropriate version for your Mac (Intel or Apple Silicon)
# Extract to ~/develop/ or preferred location
cd ~/Downloads
unzip flutter_macos_*.zip -d ~/develop/
For Linux:
bash# Install required packages first
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa

# Extract Flutter SDK
cd ~/Downloads
unzip flutter_linux_*.zip -d ~/develop/
Step 2: Verify Installation
Open terminal/command prompt and run:
bashflutter doctor
This command checks your environment and displays a report of the status of your Flutter installation, identifying any missing dependencies Medium.
You'll likely see messages about missing components - don't worry, we'll fix them!

# Step 3: Install Required Tools
A) Install an IDE (Choose one or both):
Option 1: Visual Studio Code (Recommended for beginners)

Download from code.visualstudio.com
Open Extensions view (Ctrl+Shift+X), search for "Flutter" and "Dart," and install both extensions Medium

# Option 2: Android Studio

Download from developer.android.com/studio
During installation, select Flutter and Dart plugins

B) Install Git (if not already installed)

Windows: Download from git-scm.com
macOS: Comes pre-installed or install via Xcode command-line tools
Linux: sudo apt-get install git

# Step 4: Set Up Android Development

Install Android Studio (even if using VS Code - needed for Android SDK)
Open Android Studio → Settings → Android SDK
Install required SDK platforms and tools
Accept Android licenses:

bashflutter doctor --android-licenses
# Step 5: Set Up Device/Emulator
# Option 1: Physical Device

Enable Developer Options on your phone
Enable USB Debugging
Connect via USB

# Option 2: Android Emulator

Open Android Studio → Device Manager
Create Virtual Device → Choose device model
Download system image → Create emulator

# Step 6: Final Verification
bashflutter doctor -v
You should see green checkmarks ✓ for all essential components!


# Step 7: Create Project
bashflutter create car_dealership_app
cd car_dealership_app
flutter run


# Setup Project Structure 
lib/
  ├── main.dart
  ├── models/
  │   └── car.dart
  ├── screens/
  │   ├── home_screen.dart
  │   ├── car_details_screen.dart
  │   └── favorites_screen.dart
  ├── widgets/
  │   ├── car_card.dart
  │   └── filter_button.dart
  └── data/
      └── cars_data.dart

# AI PROMPT PLAN

1.Setup: "How do I set up a new Flutter project and organize the folder structure for a car dealership app?"
2.Data Modeling: "Create a Dart class model for a car with properties like brand, model, price, and features"
3.UI Layout: "Show me how to create a grid view of cards in Flutter with images and text"
4.Navigation: "How do I navigate between screens in Flutter and pass data to the details screen?"
5.Styling: "What are the Flutter equivalents of CSS flexbox and grid for layouts?"
6.State Management: "How do I implement filtering and search in a Flutter app using setState?"      


# COMMON ISSUES AND FIXES
1. Error in uziping of the donloaded Flutter SDK file the naming of the file was wrong (unzip flutter_linux_3.38.3-stable.tar.xz -d ~/develop/ unzip: cannot find or open flutter_linux_3.38.3-stable.tar.xz) and Claude was able to correct the mistake and instead gave me this command: 	(tar -xf ~/Downloads/flutter_linux_3.38.3-stable.tar.xz -C ~/develop)  


2. Flutter Doctor Shows Errors
Problem:
bash$ flutter doctor
[!] Android toolchain - develop for Android devices
    ✗ Unable to locate Android SDK
[✗] Linux toolchain - develop for Linux desktop
    ✗ clang++ is required for Linux development
    ✗ CMake is required for Linux development
    ✗ ninja is required for Linux development
Solution:
The Android toolchain warning can be ignored if you're only developing for Linux/Web. For Linux development, install the required packages:
bashsudo apt install clang cmake ninja-build libgtk-3-dev -y
flutter doctor -v
Verification:
After installation, flutter doctor should show:
[✓] Linux toolchain - develop for Linux desktop
Reference: Flutter Linux Setup Guide



# Minimal Working Example
What the Example Does
This minimal example creates a simple car dealership app that:

Displays a grid of cars with images and prices
Shows car details when tapped
Includes search and category filtering
Demonstrates Flutter's widget composition and navigation

# Core Components
1. Car Model (lib/models/car.dart)
dart// Defines the structure of a car object
class Car {
  final String id;
  final String brand;
  final String model;
  final double price;
  final int year;
  final String category;
  final String imageUrl;
  final List<String> features;
  
  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.price,
    required this.year,
    required this.category,
    required this.imageUrl,
    required this.features,
  });
  
  // Computed property for display
  String get fullName => '$brand $model';
  
  // Formatted price with currency
  String get formattedPrice => 'KSh ${price.toStringAsFixed(0)}';
}



# Expected Output
When you run flutter run -d linux, you should see:
Home Screen:

Blue app bar with "Elite Auto Dealership" title
White search bar at the top
Horizontal scrollable category chips (All, Sedan, SUV, etc.)
2-column grid of car cards
Each card shows: car image, brand/model, year, price

Car Details Screen (when tapping a card):

Large car image at top
Car name and price
Specifications table (fuel type, transmission, mileage, etc.)
Feature chips
Contact dealer button

# Functionality:

- Search filters cars by name
- Category chips filter by type
- Tapping a card navigates to details
- All interactions are smooth with animations
- Back button returns to home screen

# Evaluation/ Review:
⭐⭐⭐⭐⭐ (5/5) - Extremely helpful. The AI gave platform-specific instructions for Linux, which saved time researching. The folder structure follows industry best practices and scales well as the project grows.


# References

# Official Documentation

Flutter Documentation

URL: https://docs.flutter.dev
Sections Used: Get Started, Widget Catalog, Layouts
Helpfulness: Comprehensive and well-organized


Dart Language Tour

URL: https://dart.dev/guides/language/language-tour
Used for: Understanding classes, collections, async/await
Helpfulness: Good but sometimes too technical


Flutter Widget Index

URL: https://docs.flutter.dev/reference/widgets
Used for: Finding appropriate widgets (GridView, Card, etc.)
Helpfulness: Essential reference



Video Tutorials

"Flutter Tutorial for Beginners" by The Net Ninja

URL: https://www.youtube.com/playlist?list=PL4cUxeGkcC9jLYyp2Aoh6hcWuxFDX6PBJ
Duration: ~3 hours total
Topics: Widgets, layouts, navigation, state management
Helpfulness: Excellent pace for beginners
