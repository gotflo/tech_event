import 'package:flutter/material.dart';

import 'package:tech_event/widgets/event_detail_widgets/detail_event_header.dart';
import 'package:tech_event/widgets/home_widgets/event_detail_body.dart';

class FutureEventDetailScreen extends StatelessWidget {
  const FutureEventDetailScreen({
    Key? key,
    required this.headerImageUrl,
    required this.eventId,
  }) : super(key: key);

  final String headerImageUrl;
  final String eventId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DetailEventHeader(
            image: headerImageUrl,
          ),
          SliverToBoxAdapter(
            child: EventDetailBody(
              eventId: eventId,
            ),
          )
        ],
      ),
    );
  }
}
