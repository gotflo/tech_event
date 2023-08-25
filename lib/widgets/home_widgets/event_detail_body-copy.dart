// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:gap/gap.dart';
// import 'package:tech_event/widgets/home_widgets/time_widget.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:tech_event/constants/constants.dart';
// import 'dart:async';

// import 'eventdetail_shimmer.dart';

// class EventDetailBody extends StatefulWidget {
//   const EventDetailBody({
//     Key? key,
//     required this.eventId,
//   }) : super(key: key);
//   final String eventId;

//   @override
//   State<EventDetailBody> createState() => _EventDetailBodyState();
// }

// class _EventDetailBodyState extends State<EventDetailBody> {
//   late Timer _timer;

//   DateTime _eventDate = DateTime(0000, 0, 0, 0, 0, 0);
//   bool isTimerFinished = false;

//   // void _updateTimer(Timer timer) {
//   //   setState(() {});
//   // }

//   void _updateTimer(Timer timer) {
//     Duration remainingTime = _eventDate.difference(DateTime.now());

//     if (remainingTime.isNegative ||
//         (remainingTime.inDays == 0 &&
//             remainingTime.inHours == 0 &&
//             remainingTime.inMinutes == 0 &&
//             remainingTime.inSeconds == 0)) {
//       _timer.cancel(); // Stop the timer
//       setState(() {
//         isTimerFinished = true;
//       });
//     } else {
//       setState(() {});
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _timer = Timer.periodic(const Duration(seconds: 1), _updateTimer);
//     eventDetail();
//   }

//   @override
//   void dispose() {
//     _timer.cancel();
//     super.dispose();
//   }

//   List<String> speckearsImages = [];

//   bool eventDetailShow = false;
//   bool speckearsExiste = true;
//   // eventDetail() {
//   //   FirebaseFirestore.instance
//   //       .collection('events')
//   //       .doc(widget.eventId)
//   //       .get()
//   //       .then((DocumentSnapshot documentSnapshot) {
//   //     if (documentSnapshot.exists) {
//   //       title = documentSnapshot["title"];
//   //       description = documentSnapshot["description"];
//   //       location = documentSnapshot["location"];
//   //       link1 = documentSnapshot["link1"];
//   //       link2 = documentSnapshot["link2"];
//   //       eventDetailShow = true;
//   //       Timestamp timestamp = documentSnapshot["date"];
//   //       _eventDate = timestamp.toDate();

//   //       // Check if "speckears" property exists and is not empty
//   //       if (documentSnapshot["speckears"] != null &&
//   //           documentSnapshot["speckears"] is List &&
//   //           (documentSnapshot["speckears"] as List).isNotEmpty) {
//   //         speckearsImages = List<String>.from(documentSnapshot["speckears"]);
//   //       }

//   //       // Refresh the UI after fetching the data
//   //       setState(() {});
//   //     }
//   //   });
//   // }

//   void eventDetail() async {
//     try {
//       DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//           .collection('events')
//           .doc(widget.eventId)
//           .get();

//       if (documentSnapshot.exists) {
//         title = documentSnapshot["title"];
//         description = documentSnapshot["description"];
//         location = documentSnapshot["location"];
//         link1 = documentSnapshot["link1"];
//         link2 = documentSnapshot["link2"];
//         eventDetailShow = true;

//         Map<String, dynamic> eventData =
//             documentSnapshot.data() as Map<String, dynamic>;

//         if (eventData.containsKey("date")) {
//           Timestamp timestamp = eventData["date"];
//           _eventDate = timestamp.toDate();
//         }

//         if (eventData.containsKey("speckears")) {
//           speckearsImages = List<String>.from(eventData["speckears"]);
//         } else {
//           speckearsExiste = false;
//         }
//         setState(() {});
//       } else {}
//     } catch (e) {
//       // ignore: avoid_print
//       print("Une erreur s'est produite : $e");
//     }
//   }

//   String location = "";
//   String title = "";
//   String description = "";
//   String link1 = "";
//   String link2 = "";

//   @override
//   Widget build(BuildContext context) {
//     Constants constantsColor = Constants();
//     Duration remainingTime = _eventDate.difference(DateTime.now());
//     String days = remainingTime.inDays.toString().padLeft(2, '0');
//     String hours =
//         (remainingTime.inHours.remainder(24)).toString().padLeft(2, '0');
//     String minutes =
//         (remainingTime.inMinutes.remainder(60)).toString().padLeft(2, '0');
//     String seconds =
//         (remainingTime.inSeconds.remainder(60)).toString().padLeft(2, '0');
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: eventDetailShow == false
//           ? EventDetailShimmer(constantsColor: constantsColor)
//           : Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title.toUpperCase(),
//                       style: TextStyle(
//                         color: constantsColor.primaryGradient,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17,
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: constantsColor.fourth.withOpacity(0.8),
//                         boxShadow: const [
//                           BoxShadow(
//                             color: Colors.grey,
//                             blurRadius: 3,
//                             offset: Offset(1, 2), // Shadow position
//                           ),
//                         ],
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TimeWidget(
//                                   timer: isTimerFinished ? "00" : days,
//                                   title: "  Jours  ",
//                                 ),
//                                 TimeWidget(
//                                   timer: isTimerFinished ? "00" : hours,
//                                   title: "Heures",
//                                 ),
//                                 TimeWidget(
//                                   timer: isTimerFinished ? "00" : minutes,
//                                   title: "Minutes",
//                                 ),
//                                 TimeWidget(
//                                   timer: isTimerFinished ? "00" : seconds,
//                                   title: "Seconde",
//                                 ),
//                               ],
//                             ),
//                             const Gap(5),
//                             Text(
//                               location.toUpperCase(),
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const Gap(8),
//                     Text(
//                       "Description",
//                       style: TextStyle(
//                         color: constantsColor.third,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     const Gap(8),
//                     Text(
//                       description,
//                       textAlign: TextAlign.justify,
//                       style: const TextStyle(
//                         color: Color(0xFF616161),
//                         fontWeight: FontWeight.w200,
//                       ),
//                     ),
//                     const Gap(8),
//                     link1 == "" && link2 == ""
//                         ? const SizedBox()
//                         : Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Divider(),
//                               const Gap(8),
//                               Text(
//                                 "Liens important",
//                                 style: TextStyle(
//                                   color: constantsColor.third,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     GestureDetector(
//                                       child: const Text(
//                                         "Lien 1",
//                                         style: TextStyle(
//                                           color: Color(0xFF006DC7),
//                                           fontWeight: FontWeight.w400,
//                                         ),
//                                       ),
//                                       onTap: () async {
//                                         await launchUrl(
//                                           Uri.parse(link1),
//                                         );
//                                       },
//                                     ),
//                                     link2 == ""
//                                         ? const SizedBox()
//                                         : GestureDetector(
//                                             child: const Text(
//                                               "Lien 2",
//                                               style: TextStyle(
//                                                 color: Color(0xFF006DC7),
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                             ),
//                                             onTap: () async {
//                                               await launchUrl(
//                                                 Uri.parse(link2),
//                                               );
//                                             },
//                                           ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                   ],
//                 ),

// /////////////////////////////////////////////

//                 speckearsExiste == true
//                     ? Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Gap(8),
//                           const Divider(),
//                           const Gap(8),
//                           Text(
//                             "Intervenants",
//                             style: TextStyle(
//                               color: constantsColor.third,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           const Gap(8),
//                           StaggeredGrid.count(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 0.0,
//                             crossAxisSpacing: 0.0,
//                             children: speckearsImages.map((imageURL) {
//                               return Padding(
//                                 padding: const EdgeInsets.all(2.0),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.of(context).push(
//                                       MaterialPageRoute(
//                                         builder: ((context) =>
//                                             CachedNetworkImage(
//                                               imageUrl: imageURL,
//                                               placeholder: (context, url) =>
//                                                   const Center(
//                                                 child: SizedBox(),
//                                               ),
//                                               errorWidget:
//                                                   (context, url, error) =>
//                                                       const Icon(Icons.error),
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               // height: expandedHeight,
//                                               // fit: BoxFit.cover,
//                                             )),
//                                       ),
//                                     );
//                                   },
//                                   child: CachedNetworkImage(
//                                     imageUrl: imageURL,
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       color: const Color(0xFFD4D4D4),
//                                       width: double.infinity,
//                                       height: MediaQuery.sizeOf(context).height,
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Icon(Icons.error),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ],
//                       )
//                     : const SizedBox(),
//               ],
//             ),
//     );
//   }
// }
