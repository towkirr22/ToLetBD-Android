# To-Let BD Premium Android Upgrade

## এই আপগ্রেডে এখন কার্যকর
- Premium Emerald visual layer: property card shadow/radius, image touch feedback, toast feedback, responsive 5-item mobile navigation.
- Favourite/Shortlist: heart button দিয়ে বিজ্ঞাপন সংরক্ষণ ও বাদ দেওয়া যায়; localStorage-এ থাকে, অ্যাপ বন্ধ করলেও একই ডিভাইসে থাকবে।
- Favourite screen: সংরক্ষিত approved বিজ্ঞাপন এক জায়গায় দেখা যায়; সব একসঙ্গে মুছতে পারে।
- Share listing: Android/Web Share Sheet সমর্থিত হলে সেটি খোলে; না হলে link copy fallback।
- Android Back handling: property details/edit থেকে listings, অন্য tab থেকে home-এ ফেরার ব্যবস্থা (Capacitor App plugin উপলভ্য থাকলে)।
- Status bar: existing Capacitor StatusBar config retained; Android build-এ non-overlay status bar config থাকে।

## যেসব ফিচারের জন্য অতিরিক্ত Backend/credentials লাগবে

### Push notification
শুধু APK build করলেই Push notification কাজ করবে না। Firebase project, Android app registration (`com.orbithousebd.toletbd`), `google-services.json`, Firebase Cloud Messaging setup এবং notification পাঠানোর secure server/Edge Function দরকার। Firebase server key কখনো HTML বা APK-তে রাখা যাবে না।

### In-app chat
Chat চালু করতে Supabase-এ `conversations` ও `messages` schema, participant-only Row Level Security policies, Realtime publication এবং message notification flow দরকার। বর্তমান upgrade-এ chat backend তৈরি বা fake chat UI যোগ করা হয়নি—কারণ তা বাস্তব ব্যবহারকারীর message নিরাপত্তা ছাড়া চালু করা ঠিক হবে না।

### Favourite sync
এখন Favourite একই ফোনে localStorage-এ সংরক্ষিত। একাধিক ডিভাইসে sync করতে চাইলে Supabase `user_favorites` table এবং authenticated RLS policy যোগ করতে হবে।

## Build
GitHub Actions workflow আগের মতোই `main`/`master` push অথবা manual Run workflow-তে debug APK তৈরি করবে। ZIP extract করে project-এর contents repository root-এ upload/replace করতে হবে; `.github/workflows/android-apk.yml` অবশ্যই রাখতে হবে।
