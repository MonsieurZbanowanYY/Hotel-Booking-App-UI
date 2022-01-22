import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking_app_ui/widgets/details/hotel_details.dart';
import 'package:unicons/unicons.dart';

class DetailsPage extends StatefulWidget {
  final Map hotel;
  final Size size;
  const DetailsPage({
    Key? key,
    required this.hotel,
    required this.size,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool extendDetails = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //check the size of device
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness ==
        Brightness.dark; //check if device is in dark or light mode
    Color defaultColor = isDarkMode ? Colors.white : Colors.black;
    Color secondColor = isDarkMode ? Colors.black : Colors.white;

    Map hotel = widget.hotel;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode
                ? const Color(0xff06090d)
                : const Color(0xfff8f8f8), //background color
          ),
          child: Stack(
            children: [
              buildImage(
                hotel,
                size,
                defaultColor,
                secondColor,
              ), //! buildImage is located at the bottom of this file
              buildHotelDetails(
                hotel,
                defaultColor,
                secondColor,
                extendDetails,
                size,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(
      Map hotel, Size size, Color defaultColor, Color secondColor) {
    double paddingTop = MediaQuery.of(context).padding.top;

    return Stack(
      children: [
        InkWell(
          onTap: () => setState(() {
            extendDetails = !extendDetails;
          }),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              hotel['img'],
              fit: BoxFit.fill,
              height: size.height * 0.35,
              width: size.width,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Container(
                  height: size.height * 0.35,
                  width: size.width,
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
                  height: size.height * 0.35,
                  width: size.width,
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
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(
              top: paddingTop,
              left: size.width * 0.05,
            ),
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: defaultColor,
                ),
                child: Icon(
                  UniconsLine.arrow_left,
                  color: secondColor,
                  size: size.height * 0.035,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
