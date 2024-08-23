<h1 align="center">Cached Widget</h1>

<p align="center">Avoid unnecessary rebuilding of Flutter Widgets. Only rebuild when the Widget's data changes.</p><br>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="https://pub.dartlang.org/packages/cached_widget">
    <img src="https://img.shields.io/pub/v/cached_widget.svg"
      alt="Pub Package" />
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/github/license/hantrungkien/cached-widget"
      alt="License: MIT" />
  </a>
  <br>
</p><br>

# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  cached_widget: ^1.0.0
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:cached_widget/cached_widget.dart';
```

# Usage

## Primitive

```dart
class PrimitiveExample extends StatelessWidget {
  const PrimitiveExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedWidget(
      value: "String",
      builder: (context, value) {
        return const SizedBox.shrink();
      },
    );
  }
}
```

## Collection

```dart
class ListExample extends StatelessWidget {
  const ListExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedWidget(
      value: const ['1', '2', '3'],
      builder: (context, value) {
        return const SizedBox.shrink();
      },
    );
  }
}
```

## Object

>Object class must be extended from Equatable or use Freeze to implement the equals and hashCode functions for diffing.

```dart
import 'package:equatable/equatable.dart';

class ObjectDemo extends Equatable {
  final String id;
  final List<String> skins;

  const ObjectDemo({
    required this.id,
    required this.skins,
  });

  @override
  List<Object?> get props => [id, skins];
}

class ObjectExample extends StatelessWidget {
  const ObjectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CachedWidget(
      value: const ObjectDemo(id: '1', skins: ['1', '2', '3']),
      builder: (context, value) {
        return const SizedBox.shrink();
      },
    );
  }
}
```