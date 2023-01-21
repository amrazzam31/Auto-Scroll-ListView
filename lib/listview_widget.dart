import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  final ScrollController scrollController;
  final List<String> images;
  const ListViewWidget({
    required this.scrollController,
    required this.images,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/${images[index]}",
              width: 180,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
