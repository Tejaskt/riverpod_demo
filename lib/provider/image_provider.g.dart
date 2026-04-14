// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fetchImage)
final fetchImageProvider = FetchImageFamily._();

final class FetchImageProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ImageModel>>,
          List<ImageModel>,
          FutureOr<List<ImageModel>>
        >
    with $FutureModifier<List<ImageModel>>, $FutureProvider<List<ImageModel>> {
  FetchImageProvider._({
    required FetchImageFamily super.from,
    required (String, int) super.argument,
  }) : super(
         retry: null,
         name: r'fetchImageProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchImageHash();

  @override
  String toString() {
    return r'fetchImageProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<List<ImageModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ImageModel>> create(Ref ref) {
    final argument = this.argument as (String, int);
    return fetchImage(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchImageProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchImageHash() => r'13a230f1bde34629c564d56e109feaf81dccdfef';

final class FetchImageFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ImageModel>>, (String, int)> {
  FetchImageFamily._()
    : super(
        retry: null,
        name: r'fetchImageProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchImageProvider call(String category, int page) =>
      FetchImageProvider._(argument: (category, page), from: this);

  @override
  String toString() => r'fetchImageProvider';
}
