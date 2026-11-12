# To-Let BD Android App (Capacitor)

এটি To-Let BD-এর বর্তমান ওয়েবসাইট HTML-কে Capacitor Hybrid Android App হিসেবে প্যাকেজ করার প্রজেক্ট। App ID: `com.orbithousebd.toletbd`।

## Windows ল্যাপটপে APK তৈরি

### ১) প্রয়োজনীয় সফটওয়্যার
- Node.js LTS
- Android Studio (সর্বশেষ Stable)
- Android Studio থেকে Android SDK Platform, SDK Build-Tools এবং Platform-Tools ইনস্টল

### ২) প্রজেক্ট Extract
ZIP Extract করে `ToLetBD_Android` ফোল্ডারে প্রবেশ করো। ওই ফোল্ডারে Command Prompt / PowerShell খোলো।

### ৩) Dependencies ইনস্টল
```bash
npm install
```

### ৪) Android Native Project তৈরি
```bash
npx cap add android
```

যদি `android` ফোল্ডার আগে থেকেই থাকে, এই ধাপ বাদ দাও।

### ৫) Web assets ও plugin sync
```bash
npx cap sync android
```

### ৬) Android Studio-তে খোলো
```bash
npx cap open android
```

Android Studio SDK/Gradle setup শেষ হলে Build > Build Bundle(s) / APK(s) > Build APK(s) চাপো।

Debug APK পাওয়া যাবে:
`android/app/build/outputs/apk/debug/app-debug.apk`

অথবা Windows terminal থেকে:
```bash
cd android
.\gradlew.bat assembleDebug
```

## গুরুত্বপূর্ণ
- `www/index.html` হলো এই প্যাকেজে রাখা ওয়েবসাইটের সোর্স। ওয়েবসাইট আপডেট করলে এই ফাইলটি নতুন HTML দিয়ে replace করে `npx cap sync android` চালাবে।
- Supabase backend URL/key ওয়েবসাইটের HTML-এ যেভাবে আছে সেভাবেই ব্যবহৃত হবে। কোনো service-role key অ্যাপে রাখা যাবে না।
- GPS permission Android-এ প্রথমবার চাইবে। ল্যাপটপের IP-location সমস্যা Android GPS-এ নিজে থেকেই ঠিক হবে এমন নিশ্চয়তা নেই; ফোনের GPS/Location setting ও permission-ও গুরুত্বপূর্ণ।
- Google OAuth redirect, push notification, Android share এবং background location আলাদা native configuration/testing চাইতে পারে।
- এই ZIP হলো build-ready Capacitor source package; এখানে APK compile করা হয়নি, কারণ এই build environment-এ Android SDK/Gradle SDK setup নেই।

## GitHub Actions দিয়ে APK বানানো (Android Studio / local Node.js ছাড়াই)

1. এই সম্পূর্ণ `ToLetBD_Android` ফোল্ডারের ভেতরের সব ফাইল GitHub repository-র root-এ upload করো। ZIP ফাইলটি extract করে ভেতরের ফাইলগুলো upload করতে হবে; ZIP-টিকে শুধু repository-তে রাখলে হবে না।
2. GitHub repository-তে **Actions** tab খোলো। প্রথমবার workflow চালানোর অনুমতি চাইলে enable করো।
3. **Build To-Let BD Android APK** workflow নির্বাচন করে **Run workflow** চাপো। `main` অথবা `master` branch নির্বাচন করে Run workflow দাও।
4. Build শেষ হলে workflow run খুলে নিচের **Artifacts** অংশ থেকে `To-Let-BD-debug-apk` ডাউনলোড করো।
5. ZIP extract করলে `app-debug.apk` পাবে। Android ফোনে ফাইলটি পাঠিয়ে install করো। প্রয়োজন হলে Android Settings-এ ওই উৎস থেকে app install করার অনুমতি দাও।

প্রতিবার `main` বা `master` branch-এ push করলেও workflow স্বয়ংক্রিয়ভাবে চলবে। এটি debug APK; Play Store release-এর জন্য আলাদা signed release build দরকার। GitHub Actions build-এর জন্য এই workflow-তে Android Studio বা তোমার কম্পিউটারে Node.js ইনস্টল করতে হয় না।

## Premium Upgrade (এই সংস্করণ)
এই সংস্করণে Premium Emerald UI refinement, persistent on-device Favourite list, property share action, 5-item mobile navigation এবং Android Back handling যুক্ত হয়েছে। বিস্তারিত সীমাবদ্ধতা ও পরবর্তী Firebase/Supabase setup: `docs/PREMIUM_UPGRADE_BN.md`। Push notification ও secure in-app chat চালু করতে আলাদা Firebase/Supabase backend configuration আবশ্যক।
