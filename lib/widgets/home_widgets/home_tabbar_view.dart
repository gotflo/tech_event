import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:tech_event/providers/top_event_provider.dart';
import 'package:tech_event/widgets/home_widgets/events_of_month.dart';
import 'package:tech_event/widgets/home_widgets/future_events.dart';
import 'package:tech_event/widgets/home_widgets/past_events.dart';

class HomeTabBarView extends StatelessWidget {
  const HomeTabBarView({
    Key? key,
    required this.futureEvents,
    required this.pastEvents,
    required this.tabController,
  }) : super(key: key);
  final FutureEvents futureEvents;
  final PastEvents pastEvents;
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: tabController,
      children: [
        ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            Consumer<EventProvider>(
              builder: (context, eventProvider, _) {
                if (eventProvider.events.isEmpty) {
                  eventProvider.fetchEvents();
                  return const SizedBox();
                }
                return const Padding(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10),
                      Text("Top événements du mois"),
                      TopEventOfMonth(),
                      Text("Tous les événements"),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  futureEvents,
                  // FutureEvents(),
                ],
              ),
            ),
          ],
        ),
        ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: pastEvents,
            )
            // FutureEvents(),
          ],
        ),
      ],
    );
  }
}
