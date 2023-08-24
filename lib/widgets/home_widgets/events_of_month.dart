import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:tech_event/providers/top_event_provider.dart';

class TopEventOfMonth extends StatelessWidget {
  const TopEventOfMonth({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EventProvider>(
      builder: (context, eventProvider, _) {
        // if (eventProvider.events.isEmpty) {
        //   eventProvider.fetchEvents();
        //   return const SizedBox();
        // }
        return Swiper(
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              // onTap: () => Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: ((context) => FutureEventDetailScreen(
              //           headerImageUrl: eventProvider.events[index].imageUrl,
              //           eventId: eventProvider.events[index].imageUID,
              //         )),
              //   ),
              // ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: eventProvider.events[index].imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: Container(
                        height: 400,
                        decoration: BoxDecoration(
                          color: const Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
          itemWidth: MediaQuery.of(context).size.width,
          itemHeight: 400,
          itemCount: eventProvider.events.length,
          layout: SwiperLayout.TINDER,
          scrollDirection: Axis.vertical,
          autoplay: true,
          autoplayDelay: 3000,
          autoplayDisableOnInteraction: true,
          // control:SwiperControl(),
        );
      },
    );
  }
}
