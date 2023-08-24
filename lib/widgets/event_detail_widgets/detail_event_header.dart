import 'package:flutter/material.dart';
import 'package:tech_event/widgets/event_detail_widgets/detail_sliver_delagate.dart';

class DetailEventHeader extends StatelessWidget {
  const DetailEventHeader({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        image: image,
        expandedHeight: 400,
        roundedContainerHeight: 15,
      ),
    );
  }
}
