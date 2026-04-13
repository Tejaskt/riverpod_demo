class ImageModel {
  final String photographer;
  final String photographerDp;
  final String avgColor; // placeholder while the image loads.
  final String imageUrl;
  final String? caption;

  ImageModel({
    required this.photographer,
    required this.photographerDp,
    required this.avgColor,
    required this.imageUrl,
    required this.caption,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {

    final imageUrl = json['src'];

    return ImageModel(
      photographer: json['photographer'],
      photographerDp: json['photographer_url'],
      avgColor: json['avg_color'],
      imageUrl: imageUrl['original'],
      caption: json['alt'],
    );
  }
}
