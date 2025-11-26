TITLE AND OBJECTIVE

Getting started with Flutter and CSS in creating a car dealership

GUIDE
- I decided to use Flutter and CSS in my project.
- I chose Flutter and CSS because it is cross-platformed and runs on all devices saving time and resources.
- The end goal is to use Flutter and CSS is to help me build a car dealership making it a beautiful UI for all users and at the same time making the development of the project faster and more efficient.

QUICK SUMMARY OF THE TECHNOLOGY

FLUTTER
A UI framework by Google used to build mobile, web, and desktop apps using one codebase.
It uses the Dart programming language.

Used to build:
	•	Android apps
	•	iOS apps
	•	Web apps
	•	Desktop apps (Windows, macOS, Linux)

Kenya Airways mobile app and Google Pay are built using Flutter.


CSS
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

SYSTEM REQUIREMENTS
   
   Flutter

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

	
    CSS

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


INSTALLATION AND SETUP INSTRUCTIONS


Step 1: Install Flutter
bash
# Download Flutter SDK from flutter.dev
# Add to PATH
# Verify installation
flutter doctor

Part 1: Installing Flutter (Step-by-Step)
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

Step 3: Install Required Tools
A) Install an IDE (Choose one or both):
Option 1: Visual Studio Code (Recommended for beginners)

Download from code.visualstudio.com
Open Extensions view (Ctrl+Shift+X), search for "Flutter" and "Dart," and install both extensions Medium

Option 2: Android Studio

Download from developer.android.com/studio
During installation, select Flutter and Dart plugins

B) Install Git (if not already installed)

Windows: Download from git-scm.com
macOS: Comes pre-installed or install via Xcode command-line tools
Linux: sudo apt-get install git

Step 4: Set Up Android Development

Install Android Studio (even if using VS Code - needed for Android SDK)
Open Android Studio → Settings → Android SDK
Install required SDK platforms and tools
Accept Android licenses:

bashflutter doctor --android-licenses
Step 5: Set Up Device/Emulator
Option 1: Physical Device

Enable Developer Options on your phone
Enable USB Debugging
Connect via USB

Option 2: Android Emulator

Open Android Studio → Device Manager
Create Virtual Device → Choose device model
Download system image → Create emulator

Step 6: Final Verification
bashflutter doctor -v
You should see green checkmarks ✓ for all essential components!


Step 7: Create Project
bashflutter create car_dealership_app
cd car_dealership_app
flutter run
```

**Step 3: Setup Project Structure**
```
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


COMMON ISSUES AND FIXES
1. Error in uziping of the donloaded Flutter SDK file the naming of the file was wrong (unzip flutter_linux_3.38.3-stable.tar.xz -d ~/develop/ unzip: cannot find or open flutter_linux_3.38.3-stable.tar.xz) and Claude was able to correct the mistake and instead gave me this command: 	(tar -xf ~/Downloads/flutter_linux_3.38.3-stable.tar.xz -C ~/develop)  