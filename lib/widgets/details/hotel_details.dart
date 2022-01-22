import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app_ui/widgets/details/hotel_details_bottom.dart';

AnimatedPadding buildHotelDetails(Map hotel, Color defaultColor,
    Color secondColor, bool extendDetails, Size size) {
  return AnimatedPadding(
    padding: EdgeInsets.only(
      top: extendDetails ? size.height * 0.3 : size.height * 0.35,
    ),
    duration: const Duration(milliseconds: 300),
    child: Column(
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: Container(
            decoration: BoxDecoration(
              color: secondColor,
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                40,
              )),
            ),
            width: size.width,
            height: extendDetails ? size.height * 0.53 : size.height * 0.48,
            child: Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.03,
                left: size.width * 0.08,
                right: size.width * 0.08,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: size.width * 0.65,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                hotel['name'],
                                maxLines: 1,
                                style: GoogleFonts.lato(
                                  color: defaultColor,
                                  fontSize: size.height * 0.035,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.lightBlue[800],
                                size: size.height * 0.02,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.015,
                                ),
                                child: Text(
                                  "Katowice, Poland",
                                  style: GoogleFonts.lato(
                                    color: defaultColor,
                                    fontSize: size.height * 0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: defaultColor.withOpacity(0.5),
                            size: size.height * 0.025,
                          ),
                          Text(
                            hotel['rating'].toStringAsFixed(1),
                            style: GoogleFonts.lato(
                              color: defaultColor.withOpacity(0.5),
                              fontSize: size.height * 0.025,
                              fontWeight: FontWeight.w600,
                              wordSpacing: -3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: defaultColor,
                    thickness: 0.5,
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: size.width * 0.8,
                    height:
                        extendDetails ? size.height * 0.4 : size.height * 0.35,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.zero,
                      child: Text(
                        //TODO: change description
                        //! EXAMPLE DESCRIPTION
                        "Example Description\nI’m a Flutter Developer from Poland.\nI'm 15 years old (March 2006) and open for a project or remote part-time (because of school) job. \nCurrently, I'm focused on UI Development, so if you need a Flutter UI Developer - just DM me details (LinkedIn: Martin Gogolowicz)\n I also know Firebase functions (database integration etc.) - more details on \"Experience\" section -> \"Flutter Developer\" description.\nMy open-source projects you can find at GitHub: MonsieurZbanowanYY or at the \"Projects\" section inside \"Accomplishments\" (LinkedIn - Martin Gogolowicz)",
                        style: GoogleFonts.poppins(
                          color: defaultColor.withOpacity(0.9),
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Divider(
          color: defaultColor,
          height: size.height * 0.01,
        ),
        buildDetailsBottomBar(hotel, defaultColor, secondColor, size),
      ],
    ),
  );
}
