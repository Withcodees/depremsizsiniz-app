import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class JeaDatas extends StatelessWidget {
  final BoxConstraints constraints;

  ///Deprem yoğunluğu, şiddeti.
  final String? intensity;

  ///İl, İlçe veya Mekan ve Ülke adı.
  final String? location;

  ///Depremin yaşandığı saat.
  final String? clock;

  const JeaDatas({
    super.key,
    required this.constraints,
    this.intensity,
    this.location,
    this.clock,
  });

  @override
  Widget build(BuildContext context) {
    return constraints.maxWidth < 700 ? mobile() : pc();
  }

  Container pc() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: constraints.maxWidth - 100,
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 83, 26, 189),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      intensity ?? "0,0",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location ?? "Bilinmeyen Konum",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.clock,
                                  color: Colors.white70, size: 15),
                              const SizedBox(width: 5),
                              Text(
                                clock ?? "00:00",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.link,
                                  color: Colors.white70, size: 15),
                              const SizedBox(width: 5),
                              Text(
                                "WithCodes RestAPI",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const InkWell(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Container mobile() {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      width: constraints.maxWidth - 100,
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 83, 26, 189),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      intensity ?? "0,0",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location ?? "Bilinmeyen Konum",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.clock,
                                  color: Colors.white70, size: 15),
                              const SizedBox(width: 5),
                              Text(
                                clock ?? "00:00",
                                style: GoogleFonts.poppins(
                                  color: Colors.white70,
                                  fontSize: 16,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const FaIcon(FontAwesomeIcons.link,
                                  color: Colors.white70, size: 15),
                              const SizedBox(width: 5),
                              // Text(
                              //   "WithCodes RestAPI",
                              //   style: GoogleFonts.poppins(
                              //     color: Colors.white70,
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // const InkWell(
              //   child: Padding(
              //     padding: EdgeInsets.all(15),
              //     child: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Colors.white70,
              //       size: 25,
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }
}
