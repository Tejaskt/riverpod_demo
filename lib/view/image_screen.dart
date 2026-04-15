import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/core/utils/hex_to_color.dart';
import 'package:riverpod_demo/provider/image_pagination.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:riverpod_demo/res/app_colors.dart';
import 'package:riverpod_demo/res/app_fonts.dart';
import 'package:riverpod_demo/res/app_strings.dart';
import '../core/component/shimmer_effect.dart';

class ImageScreen extends ConsumerStatefulWidget {
  const ImageScreen({super.key});

  @override
  ConsumerState createState() => _ImageScreenState();
}

class _ImageScreenState extends ConsumerState<ImageScreen> {
  final Map<String, ScrollController> controllers = {};

  @override
  void initState() {
    super.initState();

    for (var category in AppStrings.category) {
      final controller = ScrollController();

      controller.addListener(() {
        if (controller.position.pixels >=
            controller.position.maxScrollExtent - 200) {
          ref
              .read(imagePaginationProvider(category).notifier)
              .loadMore(category);
        }
      });

      controllers[category] = controller;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppStrings.category.length,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(AppStrings.appbarHeading, style: AppFonts.txtHeading),
          backgroundColor: Colors.deepPurple.shade100,

          bottom: TabBar(
            tabAlignment: .start,
            isScrollable: true,
            tabs: AppStrings.category
                .map((e) => Tab(text: e.toUpperCase()))
                .toList(),
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            return TabBarView(
              children: AppStrings.category.map((e) {
                final state = ref.watch(imagePaginationProvider(e));
                final isLoadingMore = state.isLoading && state.hasValue;
                return state.when(
                  data: (images) {
                    return ListView.builder(
                      controller: controllers[e],
                      itemCount: images.length + 1,
                      itemBuilder: (context, index) {
                        if (index < images.length) {
                          final image = images[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            child: Container(
                              margin: .only(bottom: 8),
                              decoration: BoxDecoration(
                                color: hexToColor(image.avgColor),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  spacing: 8,
                                  children: [
                                    Text(
                                      "${image.caption}",
                                      style: AppFonts.txtNormal.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),

                                    CachedNetworkImage(
                                      height: 180,
                                      width: .infinity,
                                      imageUrl: image.imageUrl,
                                      fit: .contain,
                                      placeholder: (_, _) => ShimmerEffect(),
                                      fadeInDuration: Duration(milliseconds: 0),
                                      fadeOutDuration: Duration(
                                        milliseconds: 0,
                                      ),
                                    ),

                                    Text(
                                      '@${image.photographer}',
                                      textAlign: .right,
                                      style: AppFonts.txtNormal.copyWith(
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        } else {
                          return const Padding(
                            padding: EdgeInsets.all(16),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                      },
                    );
                  },
                  error: (error, stackTrace) =>
                      Center(child: Text(error.toString())),
                  loading: () => isLoadingMore
                      ? const Center(child: CircularProgressIndicator())
                      : const Center(child: ShimmerEffect()),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
