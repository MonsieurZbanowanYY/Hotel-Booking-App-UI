import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unicons/unicons.dart';

Row buildTopBar(Color defaultColor, Size size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Searching hotel in",
            style: GoogleFonts.poppins(
              color: defaultColor.withOpacity(0.4),
              fontSize: size.height * 0.017,
            ),
          ),
          Row(
            children: [
              Icon(
                UniconsLine.location_pin_alt,
                color: Colors.indigo,
                size: size.height * 0.03,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: size.width * 0.015,
                ),
                child: Text(
                  "Katowice",
                  style: GoogleFonts.lato(
                    color: defaultColor,
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: defaultColor.withOpacity(0.25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(
            UniconsLine.search,
            color: Colors.indigo,
            size: size.height * 0.03,
          ),
        ),
      ),
    ],
  );
}
