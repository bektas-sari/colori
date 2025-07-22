# 🎨 Colori - Learn Colors with Fun! (Flutter APP)

**Colori** is a modern and colorful Flutter mobile application designed to help young children (ages 3–6) learn basic colors in an interactive and fun way. 
The app includes a visual color guide, engaging sound effects, and a playful quiz to test color recognition.

---

## 📱 Features

* 🧠 **Color Learning Mode**

    * Displays colorful shapes with the name and pronunciation of each color
    * Audio support for each color name (e.g., "This is red!")

* 🎮 **Color Quiz Mode**

    * Interactive quiz: "Which one is blue?"
    * Random color choices with audio prompts
    * Positive feedback with applause or retry sounds

* 🌈 **Child-Friendly Design**

    * Large colorful buttons
    * Smooth transitions and animations
    * Simple and safe user interface

---

## 🚀 Getting Started

### Prerequisites

* Flutter SDK (>= 3.2.0)
* Compatible IDE (VS Code or Android Studio)

### Installation

```bash
git clone https://github.com/bektas-sari/colori.git
cd colori
flutter pub get
flutter run
```

---

## 📁 Project Structure

```
lib/
├── main.dart
├── screens/
│   ├── splash_screen.dart
│   ├── home_screen.dart
│   ├── learn_colors_screen.dart
│   └── color_quiz_screen.dart
├── widgets/
assets/
├── images/
├── animations/
└── sounds/
```

---

## 🔊 Assets

Make sure the following directories contain required media files:

* `assets/sounds/`

    * red.mp3, blue.mp3, ...
    * correct.mp3, wrong.mp3
* `assets/animations/`

    * colorsplash.json (Lottie animation)

Update `pubspec.yaml` accordingly:

```yaml
flutter:
  assets:
    - assets/sounds/
    - assets/animations/
    - assets/images/
```

---

## 👨‍💻 Developer

**Bektas Sari**
Email: [bektas.sari@gmail.com](mailto:bektas.sari@gmail.com)<br>
GitHub: [bektas-sari](https://github.com/bektas-sari)<br>
LinkedIn: [linkedin.com/in/bektas-sari](https://www.linkedin.com/in/bektas-sari/)<br>
ResearchGate: [Bektas Sari](https://www.researchgate.net/profile/Bektas-Sari-3)<br>
Academia: [Independent Academia](https://independent.academia.edu/bektassari)<br>

---

## 📜 License

This project is licensed under the MIT License.

---

## 🙌 Contributions

Suggestions, improvements or feedback are welcome! Feel free to fork the repo and create pull requests.

---
