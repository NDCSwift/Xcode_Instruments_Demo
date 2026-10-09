# ⏱️ SwiftUI Performance with Instruments
Find and fix SwiftUI performance problems on a real iPhone using the SwiftUI instrument, Time Profiler and Run Comparisons.

---

## 🤔 What this is
SwiftUIPerfLab is a small stock-ticker app with two performance bugs left in on purpose. In the first, one price change makes every row redraw its body. In the second, tapping **Sort by Trend** freezes the app for more than half a second. The video uses Instruments to find each bug, fix it, and prove the fix with a before-and-after comparison.

## ✅ Why you'd use it
- **SwiftUI instrument** — see which views update, how often, and why, using Summary and the Cause & Effect Graph
- **Time Profiler + Top Functions** — trace a hang back to the exact closure that's eating main-thread time
- **Run Comparisons** — put a before run and an after run side by side and show the fix with numbers

## 📺 Watch on YouTube
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtube.com/watch?v=PLACEHOLDER)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@NoahDoesCoding).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/Xcode_Instruments_Demo.git
cd Xcode_Instruments_Demo
```

### 2. Open in Xcode
Double-click `SwiftUIPerfLab.xcodeproj`.

### 3. Set Your Development Team
Select the **SwiftUIPerfLab** target ▸ **Signing & Capabilities** ▸ choose your **Team**. The repo includes no team on purpose.

### 4. Update the Bundle Identifier
Change `com.noahdoescoding.SwiftUIPerfLab` to something unique to you, for example `com.yourname.SwiftUIPerfLab`.

## 🛠️ Notes
- **Branches:** this is `finished`, with both fixes applied and a *Sort by Trend* signpost (Points of Interest). `main` is the starting state with both bugs.
- **Profile a real iPhone, not the Simulator.** In the Simulator, the SwiftUI template either refuses to record (Hitches isn't supported there) or records with no SwiftUI data.
- **Use Product ▸ Profile (⌘I)** so Instruments profiles a Release build.
- **The market ticks twice a second** (`Market.swift`) so the starting-state trace stays small enough to model on a 16 GB Mac. At faster tick rates, the SwiftUI instrument can need more memory than the Mac has.
- **Unlock the phone before every recording.** A locked phone fails with *"Timed out waiting for device to boot."*
- Expect your numbers to differ from the video's, because prices are random. The ratios are what to check: about 500 row updates per price change before fix one.

## 📦 Requirements
- Xcode 27+
- iOS 27+ on a physical iPhone with Developer Mode on
- Swift 6

📺 [Watch the guide on YouTube](https://youtube.com/watch?v=PLACEHOLDER)
