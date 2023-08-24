import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tech_event/constants/constants.dart';

import 'eventdetail_shimmer.dart';

class PastDetailBody extends StatefulWidget {
  const PastDetailBody({
    Key? key,
    required this.eventId,
    required this.speekerName,
    required this.speekeerRole,
    required this.speekerProfil,
  }) : super(key: key);

  final String eventId;
  final String speekerName;
  final String speekeerRole;
  final String speekerProfil;

  @override
  State<PastDetailBody> createState() => _PastDetailBodyState();
}

class _PastDetailBodyState extends State<PastDetailBody> {
  String location = "";
  String title = "";
  String description = "";
  String link1 = "";
  String link2 = "";
  bool eventDetailShow = false;
  bool speckearsExiste = true;
  bool galleryExiste = true;
  List<String> speckearsImages = [];
  List<String> galleryImages = [];

  @override
  void initState() {
    super.initState();
    eventDetail();
  }

  void eventDetail() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('events')
          .doc(widget.eventId)
          .get();

      if (documentSnapshot.exists) {
        title = documentSnapshot["title"];
        description = documentSnapshot["description"];
        location = documentSnapshot["location"];
        link1 = documentSnapshot["link1"];
        link2 = documentSnapshot["link2"];
        eventDetailShow = true;

        Map<String, dynamic> eventData =
            documentSnapshot.data() as Map<String, dynamic>;

        if (eventData.containsKey("speckears")) {
          speckearsImages = List<String>.from(eventData["speckears"]);
        } else {
          speckearsExiste = false;
        }

        if (eventData.containsKey("gallery")) {
          galleryImages = List<String>.from(eventData["gallery"]);
        } else {
          galleryExiste = false;
        }
        setState(() {});
      } else {}
    } catch (e) {
      // ignore: avoid_print
      print("Une erreur s'est produite : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Constants constantsColor = Constants();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: eventDetailShow == false
          ? EventDetailShimmer(constantsColor: constantsColor)
          : Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title.toUpperCase(),
                      style: TextStyle(
                        color: constantsColor.primaryGradient,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: constantsColor.third,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Color(0xFF616161),
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    speckearsExiste == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Gap(8),
                              const Divider(),
                              const Gap(8),
                              Text(
                                "Intervenants",
                                style: TextStyle(
                                  color: constantsColor.third,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Gap(8),
                              StaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                children: speckearsImages.map((imageURL) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                CachedNetworkImage(
                                                  imageUrl: imageURL,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child: SizedBox(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  // height: expandedHeight,
                                                  // fit: BoxFit.cover,
                                                )),
                                          ),
                                        );
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: imageURL,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: const Color(0xFFD4D4D4),
                                          width: double.infinity,
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    const Gap(8),
                    link1 == "" && link2 == ""
                        ? const SizedBox()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              const Gap(8),
                              Text(
                                "Liens important",
                                style: TextStyle(
                                  color: constantsColor.third,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: const Text(
                                        "Lien 1",
                                        style: TextStyle(
                                          color: Color(0xFF006DC7),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      onTap: () async {
                                        await launchUrl(
                                          Uri.parse(link1),
                                        );
                                      },
                                    ),
                                    link2 == ""
                                        ? const SizedBox()
                                        : GestureDetector(
                                            child: const Text(
                                              "Lien 2",
                                              style: TextStyle(
                                                color: Color(0xFF006DC7),
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            onTap: () async {
                                              await launchUrl(
                                                Uri.parse(link2),
                                              );
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    galleryExiste == true
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(),
                              const Gap(8),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Galerie",
                                  style: TextStyle(
                                    color: constantsColor.third,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              StaggeredGrid.count(
                                crossAxisCount: 2,
                                mainAxisSpacing: 0.0,
                                crossAxisSpacing: 0.0,
                                children: galleryImages.map((imageURL) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: ((context) =>
                                                CachedNetworkImage(
                                                  imageUrl: imageURL,
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                    child: SizedBox(),
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                )),
                                          ),
                                        );
                                      },
                                      child: CachedNetworkImage(
                                        imageUrl: imageURL,
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            Container(
                                          color: const Color(0xFFD4D4D4),
                                          width: double.infinity,
                                          height:
                                              MediaQuery.sizeOf(context).height,
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
    );
  }
}
