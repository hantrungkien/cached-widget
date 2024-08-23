import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

typedef CachedWidgetBuilder<T> = Widget Function(
  BuildContext context,
  T value,
);

class CachedWidget<T> extends StatefulWidget {
  final T value;
  final CachedWidgetBuilder<T> builder;

  const CachedWidget({
    super.key,
    required this.value,
    required this.builder,
  });

  @override
  CachedWidgetState<T> createState() => CachedWidgetState<T>();
}

class CachedWidgetState<T> extends State<CachedWidget<T>> {
  T? _value;
  Widget? _cache;

  @override
  Widget build(BuildContext context) {
    final previous = _value;
    final next = widget.value;

    final shouldInvalidateCache = _cache == null ||
        previous != next ||
        !const DeepCollectionEquality().equals(previous, next);

    if (shouldInvalidateCache) {
      _value = next;
      _cache = Builder(
        builder: (context) => widget.builder(
          context,
          next,
        ),
      );
    }
    return _cache!;
  }
}
