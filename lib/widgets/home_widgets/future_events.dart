import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tech_event/screens/event_detail/future_event_detail_screen.dart';
import 'package:tech_event/widgets/home_widgets/home_event_widget_shimmer.dart';

class FutureEvents extends StatelessWidget {
  const FutureEvents({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('events')
          // .where('status', isEqualTo: false) // Filtrer par statut "false"
          .where('date',
              isGreaterThanOrEqualTo:
                  Timestamp.now()) // Filtrer par date future
          .orderBy('date', descending: true) //Sort events by date desc
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeEventShimmer();
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("Pas d'événements future"));
        }
        if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          physics: const NeverScrollableScrollPhysics(),
          // scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            QueryDocumentSnapshot<Object?>? event = snapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(1, 2), // Shadow position
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => FutureEventDetailScreen(
                            headerImageUrl: event["imageUrl"],
                            eventId: event.id,
                          )),
                    ),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 330,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                imageUrl: event["imageUrl"],
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Center(
                                  child: Container(
                                    color: const Color(0xFFECECEC),
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height,
                                  ),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                width: 70,
                                height: 70,
                                // fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 8,
                            right: 8,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black54,
                                    blurRadius: 3,
                                    offset: Offset(1, 2), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      event["title"].toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      DateFormat('dd MMM yyyy', 'fr')
                                          .format(event["date"].toDate()),
                                      // event["date"].toString(),
                                      style: const TextStyle(
                                        color: Color(0xFF6D6D6D),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
