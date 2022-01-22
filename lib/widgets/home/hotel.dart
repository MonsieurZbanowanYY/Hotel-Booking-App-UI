import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_app_ui/pages/details_page.dart';

SizedBox buildHotel(
  Map hotel,
  Color defaultColor,
  Size size,
) {
  return SizedBox(
    height: size.height * 0.4,
    width: size.width * 0.85,
    child: InkWell(
      onTap: () => Get.to(
        () => DetailsPage(
          hotel: hotel,
          size: size,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              hotel['img'],
              fit: BoxFit.fill,
              height: size.height * 0.3,
              width: size.width * 0.85,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: defaultColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.3,
                    child: Align(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: size.height * 0.3,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: defaultColor.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: SizedBox(
                    width: size.width * 0.7,
                    height: size.height * 0.3,
                    child: Align(
                      child: CircularProgressIndicator(
                        color: defaultColor,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.01,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: size.width * 0.5,
                  child: Text(
                    hotel['name'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.lato(
                      color: defaultColor,
                      fontSize: size.height * 0.02,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: Text(
                    hotel['location'],
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    style: GoogleFonts.lato(
                      color: defaultColor,
                      fontSize: size.height * 0.018,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: defaultColor,
            height: size.height * 0.02,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${hotel['price']} \$",
                style: GoogleFonts.questrial(
                  color: Colors.indigo,
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                " per night",
                style: GoogleFonts.questrial(
                  color: defaultColor,
                  fontSize: size.height * 0.022,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.star,
                color: defaultColor,
                size: size.height * 0.025,
              ),
              Text(
                "${hotel['rating'].toStringAsFixed(1)}/5",
                style: GoogleFonts.lato(
                  color: defaultColor,
                  fontSize: size.height * 0.022,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
