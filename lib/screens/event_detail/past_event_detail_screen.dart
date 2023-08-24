import 'package:flutter/material.dart';
import 'package:tech_event/widgets/event_detail_widgets/detail_event_header.dart';
import 'package:tech_event/widgets/home_widgets/past_event_detail_body.dart';

class PastEventDetailScreen extends StatelessWidget {
  const PastEventDetailScreen({
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
            child: Column(
              children: [
                PastDetailBody(
                  eventId: eventId,
                  speekeerRole: "Co-fondateur Tdev",
                  speekerName: "Boris AGBO",
                  speekerProfil:
                      "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
