# New York Times Most Popular


Simple App to hit the NY Times Most Popular Articles API and show a list of articles, that
shows details when items on the list are tapped

## Flutter Version Used: [Channel stable, 3.13.9](https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.13.9-stable.zip)
[![Coverage Status](https://img.shields.io/badge/coverage-XX%25-brightgreen)](coverage\html\index.html)
### Packages Used
1. [Dio ^5.4.0](https://pub.dev/packages/dio)
2. [Get_it ^7.6.4](https://pub.dev/packages/get_it)
2. [Flutter_Bloc ^8.1.3](https://pub.dev/packages/flutter_bloc)
3. [Equatable ^2.0.5](https://pub.dev/packages/equatable )
4. [Url_Launcher ^6.2.1](https://pub.dev/packages/url_launcher )
5. [Device_Preview ^1.1.0](https://pub.dev/packages/device_preview)
6. [Test ^1.24.3](https://pub.dev/packages/test)
7. [Coverage: ^1.6.4](https://pub.dev/packages/coverage)

### Installation
1. Clone the repository.
```bash
git clone https://github.com/abdallahAlsaifi/ny_time_news.git
```
2. Navigate to the project directory.
```bash
cd project
```
3. Install dependencies.
```bash
flutter pub get
```
### Running the Code
- **To Run without *[Device_Preview ^1.1.0](https://pub.dev/packages/device_preview) and to get full experience.**
```bash
flutter run --release
```
- To Run in debug mode.
```bash
flutter run
```
**Some times when you clone a project from GitHub your IDE may not load your Flutter SDK and you have to add your SDK manually to your IDE (Reported from Android Studio)**
### Testing
- General Test for all 'test/{filename}_test.dart' files.
```bash
flutter test
```
which should give a result of
```bash
00:03 +3: All tests passed!
```
or
```bash
00:03 -3: Some tests failed!
```
- Coverage test should be done with
```bash
flutter test --coverage
```
which should give
```bash
Generating coverage report...
```
### Running tests with [Coverage: ^1.6.4](https://pub.dev/packages/coverage)
- For the common use case where you just want to run all your tests, and generate an lcov.info file, you can use the test_with_coverage script:
```bash
dart pub global run coverage:test_with_coverage
```
- By default, this script assumes it's being run from the root directory of a package, and outputs a coverage.json and lcov.info file to ./coverage/
- This script is essentially the same as running:
```bash
dart run --pause-isolates-on-exit --disable-service-auth-codes --enable-vm-service=8181 test &
dart pub global run coverage:collect_coverage --wait-paused --uri=http://127.0.0.1:8181/ -o coverage/coverage.json --resume-isolates --scope-output=foo
dart pub global run coverage:format_coverage --packages=.dart_tool/package_config.json --lcov -i coverage/coverage.json -o coverage/lcov.info
```
Ignore lines from coverage:

- `// coverage:ignore-line` to ignore one line.

- `// coverage:ignore-start` and `// coverage:ignore-end` to ignore range of lines inclusive.

- `// coverage:ignore-file` to ignore the whole file.

**overall creating a coverage report at `{project}/coverage` which contain the lcov.info and coverage.json**

### To view coverage report lcov.info in top level use lcov

You can install lcov by the following commands:
- Mac
```bash
brew install lcov
```
- Windows
```bash
choco install lcov
```
then execute `genhtml {path to lcov.info} -o {output path}`