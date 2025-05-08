# CW Time App

**CW Time App** is a Morse code training utility that helps users learn and practice **CW (Continuous Wave)** transmission using simple iambic keying. The app is built in Swift for iOS and simulates a dual-paddle keyer, where:

* The **left button (green)** represents a **dit (·)**
* The **right button (blue)** represents a **dah (–)**

This project is great for amateur radio enthusiasts or anyone interested in learning Morse code in an interactive way.

---

## Features

* **Iambic keying simulation**
  Tap using left/right paddles to practice sending Morse code.

* **Visual and audio feedback**
  Helps you learn timing and rhythm through visual cues and sounds.

* **Simple, beginner-friendly interface**
  Minimalist design with clear interactive zones.

* **Offline functionality**
  No internet connection required.

---

## Installation Instructions

To run the CW Time App on your iOS device or simulator, follow the steps below.

### Prerequisites

* **macOS** with the latest version of [Xcode](https://developer.apple.com/xcode/)
* A valid **Apple Developer Account** (free or paid)

### Steps

1. **Download or Clone the Repository**
   You can download the ZIP file or use Git to clone the project:

   ```bash
   git clone https://github.com/your-username/cw-time-app.git
   ```

2. **Open the Project in Xcode**

   Launch Xcode and open the `.xcodeproj` or `.xcworkspace` file.

3. **Set Up Your Signing & Capabilities**

   * Click on the project in the left project navigator.
   * Select your target (usually the app name under “Targets”).
   * Go to the **Signing & Capabilities** tab.
   * Choose your **Apple Developer Team** from the dropdown (sign in with your Apple ID if needed).
   * Xcode will automatically manage provisioning profiles for you.

4. **Select a Run Destination**

   * At the top of Xcode, next to the play (▶) button, choose your **iOS device** or a **simulator**.

5. **Build and Run**

   * Press the **Play (▶)** button or use `Cmd + R` to build and run the app.

### Note for Free Developer Accounts

* You can run the app on your personal device for up to **7 days** before the provisioning profile expires.
* To continue testing, repeat the signing process again as needed.

---

## Usage Guide

Once the app is running:

1. **Hold down the green (left) button** to send a **dit (·)**
2. **Hold down the blue (right) button** to send a **dah (–)**
3. Use both buttons together for **iambic (alternate) keying**

The app is ideal for CW training without needing real hardware paddles or radios.

---

## Project Structure

```
put something here
```

Each Swift file contains the core functionality of the keyer logic and UI rendering.

---

## Built With

* **Swift** – Native iOS development language
* **SwiftUI** – Framework for building UI on Apple platforms
* **AVFoundation** – For audio tone generation (if included)

---

## Improvements

* Add **tone audio feedback** (beeping sounds)
* Implement **practice modes** (e.g., random letter generation)
* Add **scoring or timing metrics**
* Support for **iambic A/B logic modes**
* Save and review user sessions

---

## Author

**\Jett**
Ham Radio Enthusiast & iOS Developer
\https://github.com/JettM9104/cwtimeApps/

---

## 📜 License

This project is licensed under the Apache 2.0 License – see the [LICENSE](LICENSE) file for details.

