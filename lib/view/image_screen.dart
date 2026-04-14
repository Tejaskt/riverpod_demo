import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/utils/hex_to_color.dart';
import 'package:riverpod_demo/provider/image_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../core/component/shimmer_effect.dart';

class ImageScreen extends ConsumerWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final images = ref.watch(imageProvider);

    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
          title: Text('Images'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical : 8.0, horizontal: 16.0),
        child: images.when(
          data: (images) {
            return ListView.builder(
              itemCount: images.length,
              itemBuilder: (context, index) {
                final image = images[index];
                return Container(
                  margin: .only(bottom: 8),
                  decoration: BoxDecoration(
                    color: hexToColor(image.avgColor),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 16,
                    ),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'User : @${image.photographer}',
                          style: TextStyle(color: Colors.white),
                        ),

                        CachedNetworkImage(
                          height: 180,
                          width: .infinity,
                          imageUrl: image.imageUrl,
                          fit: .contain,
                          placeholder: (_, _) => ShimmerEffect(),
                          fadeInDuration: Duration(milliseconds: 0),
                          fadeOutDuration: Duration(milliseconds: 0),
                        ),

                        Text(
                          "Caption : ${image.caption}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) => Center(child: Text(error.toString())),
          loading: () => Center(child: ShimmerEffect()),
        ),
      ),
    );
  }
}
