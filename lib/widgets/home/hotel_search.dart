import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app_ui/data/example_data.dart';
import 'package:hotel_booking_app_ui/widgets/home/hotel.dart';
import 'package:unicons/unicons.dart';

Column buildHotelSearch(Color defaultColor, Size size) {
  return Column(children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Search results (${katowiceHotels.length + forYou.length})',
          style: GoogleFonts.lato(
            color: defaultColor,
            fontSize: size.height * 0.025,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: size.height * 0.04,
          width: size.width * 0.1,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
            color: Color(0xff3b22a1), //filters bg color
          ),
          child: Icon(
            UniconsLine.sliders_v,
            color: Colors.white,
            size: size.height * 0.025,
          ),
        ),
      ],
    ),
    Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.025,
      ),
      child: SizedBox(
        width: size.width * 0.85,
        child: ListView.builder(
          itemCount: katowiceHotels.length + forYou.length,
          primary: false,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            Map hotel = {};
            if (i >= katowiceHotels.length) {
              hotel = forYou[i - katowiceHotels.length];
            } else {
              hotel = katowiceHotels[i];
            }
            return buildHotel(hotel, defaultColor, size);
          },
        ),
      ),
    ),
  ]);
}
