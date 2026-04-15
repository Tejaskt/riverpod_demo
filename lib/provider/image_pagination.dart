import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_demo/api/model/image_model.dart';
import 'package:riverpod_demo/api/service/image_service.dart';
import 'package:riverpod_demo/provider/dio_provider.dart';

part 'image_pagination.g.dart';

@Riverpod(keepAlive: true)
class ImagePagination extends _$ImagePagination {
  int _page = 1;
  bool _hasMore = true;
  List<ImageModel> _images = [];

  /// first api call on screen load.
  @override
  Future<List<ImageModel>> build(String category) async {
    _page = 1;
    _images = [];

    final dio = ref.watch(dioProvider);
    final newImages = await ImageService(
      dio,
    ).fetchImages(category, page: _page);

    _images = newImages;
    return _images;
  }

  /// load more images on user scroll.
  Future<void> loadMore(String category) async {
    if (!_hasMore || state.isLoading) return;

    // ignore: invalid_use_of_internal_member
    state = AsyncLoading<List<ImageModel>>().copyWithPrevious(state);

    _page++;

    try {
      final dio = ref.read(dioProvider);
      final newImages = await ImageService(
        dio,
      ).fetchImages(category, page: _page);

      if (newImages.isEmpty) {
        _hasMore = false;
      } else {
        _images = [..._images, ...newImages];
      }

      state = AsyncData(_images);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
