# 🚀 Example CI/CD Flutter Project

Đây là một ví dụ Flutter project có tích hợp **CI/CD với GitHub Actions**.  
Mỗi khi bạn **push code** hoặc **tạo pull request**, workflow sẽ tự động chạy để **build project** và kiểm tra lỗi.

---

## 📦 Yêu cầu môi trường (Prerequisites)

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>=3.0.0)
- Dart SDK đi kèm với Flutter
- Android Studio / VS Code (tuỳ chọn IDE)
- Xcode (nếu build iOS, chỉ chạy trên macOS)

---

## ▶️ Cài đặt & chạy project

Clone repo và cài đặt dependencies:

```bash
git clone https://github.com/your-username/example_cicd.git
cd example_cicd
flutter pub get
flutter run
```

---

## 🏗️ Build release (local)

Build APK (Android):

```bash
flutter build apk --release
```

Build AppBundle (AAB):

```bash
flutter build appbundle --release
```

Build iOS:

```bash
flutter build ios --release
```

---

## 🤖 CI/CD với GitHub Actions

Repo này đã cấu hình sẵn workflow tại:  
📂 `.github/workflows/flutter.yml`

### 🔄 Quy trình workflow
1. Khi có **push** hoặc **pull request** vào branch `main`:
    - Thiết lập môi trường Flutter
    - Chạy `flutter pub get` để cài dependencies
    - Build project để kiểm tra code không lỗi

2. Kết quả build có thể xem tại tab **Actions** trên GitHub.

### 🔑 Secrets cần cấu hình (nếu build release thật)
- `ANDROID_KEYSTORE`
- `ANDROID_KEYSTORE_PASSWORD`
- `ANDROID_KEY_ALIAS`
- `ANDROID_KEY_PASSWORD`

*(Hiện tại project này chỉ build debug/release unsigned, muốn release signed cần thêm keystore vào repo secrets.)*

---

## 📂 Cấu trúc thư mục

```
.
├── lib/               # Source code chính của Flutter
├── test/              # Unit test
├── android/           # Code native Android
├── ios/               # Code native iOS
├── .github/workflows  # CI/CD pipeline (GitHub Actions)
└── README.md          # Tài liệu dự án
```

---

## 🤝 Contributing

1. Fork repo
2. Tạo branch mới: `git checkout -b feature/my-feature`
3. Commit thay đổi: `git commit -m "Add my feature"`
4. Push lên branch: `git push origin feature/my-feature`
5. Tạo Pull Request 🎉

---

