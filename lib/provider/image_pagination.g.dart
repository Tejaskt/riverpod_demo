// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_pagination.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ImagePagination)
final imagePaginationProvider = ImagePaginationFamily._();

final class ImagePaginationProvider
    extends $AsyncNotifierProvider<ImagePagination, List<ImageModel>> {
  ImagePaginationProvider._({
    required ImagePaginationFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'imagePaginationProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$imagePaginationHash();

  @override
  String toString() {
    return r'imagePaginationProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ImagePagination create() => ImagePagination();

  @override
  bool operator ==(Object other) {
    return other is ImagePaginationProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$imagePaginationHash() => r'5f712274375e7b71704ab0e87863c224d62635ca';

final class ImagePaginationFamily extends $Family
    with
        $ClassFamilyOverride<
          ImagePagination,
          AsyncValue<List<ImageModel>>,
          List<ImageModel>,
          FutureOr<List<ImageModel>>,
          String
        > {
  ImagePaginationFamily._()
    : super(
        retry: null,
        name: r'imagePaginationProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  ImagePaginationProvider call(String category) =>
      ImagePaginationProvider._(argument: category, from: this);

  @override
  String toString() => r'imagePaginationProvider';
}

abstract class _$ImagePagination extends $AsyncNotifier<List<ImageModel>> {
  late final _$args = ref.$arg as String;
  String get category => _$args;

  FutureOr<List<ImageModel>> build(String category);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<ImageModel>>, List<ImageModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ImageModel>>, List<ImageModel>>,
              AsyncValue<List<ImageModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
