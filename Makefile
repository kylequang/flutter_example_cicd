clean:
	fvm flutter clean

get-dependencies:
	fvm flutter pub get

upgrade-dependencies:
	fvm flutter pub upgrade --major-versions

build-runner:
	fvm flutter pub run build_runner build

watch-runner:
	fvm flutter pub run build_runner watch

build-runner-delete:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

watch-runner-delete:
	fvm flutter pub run build_runner watch --delete-conflicting-outputs

gen-l10n:
	fvm flutter gen-l10n

gen-flavor:
	fvm flutter pub run flutter_flavorizr

build-apk-dev:
	fvm flutter build apk --flavor dev -t lib/main.dart

build-apk-prod:
	fvm flutter build apk --flavor prod -t lib/main.dart


gen-assets:
	fluttergen -c pubspec.yaml

reset:
	fvm flutter clean
	fvm flutter pub get
	fvm flutter gen-l10n
	fvm flutter pub run build_runner build --delete-conflicting-outputs


build_apk_dev_normal:
ifeq ($(OS),Windows_NT)
	@echo "🪟 Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "dev" -ENTRYPOINT "lib/main_dev.dart" -FULL_ADS "false"
else
	@echo "🐧 Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "dev" "lib/main_dev.dart" "false"
endif

build_apk_dev_full_ads:
ifeq ($(OS),Windows_NT)
	@echo "🪟 Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "dev" -ENTRYPOINT "lib/main_dev.dart" -FULL_ADS "true"
else
	@echo "🐧 Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "dev" "lib/main_dev.dart" "true"
endif

build_apk_prod_normal:
ifeq ($(OS),Windows_NT)
	@echo "🪟 Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "prod" -ENTRYPOINT "lib/main_prod.dart" -FULL_ADS "false"
else
	@echo "🐧 Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "prod" "lib/main_prod.dart" "false"
endif

build_apk_prod_full_ads:
ifeq ($(OS),Windows_NT)
	@echo "🪟 Running on Windows (PowerShell)"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_android.ps1 -FLAVOR "prod" -ENTRYPOINT "lib/main_prod.dart" -FULL_ADS "true"
else
	@echo "🐧 Running on Unix (macOS/Linux)"
	@chmod +x ./build_config/build_android.sh
	@./build_config/build_android.sh "prod" "lib/main_prod.dart" "true"
endif

build_aab:
ifeq ($(OS),Windows_NT)
	@echo "🪟 Building AAB on Windows"
	@powershell -ExecutionPolicy Bypass -File ./build_config/build_aab.ps1
else
	@echo "🐧 Building AAB on Unix/macOS"
	@chmod +x ./build_config/build_aab.sh
	@./build_config/build_aab.sh
endif
