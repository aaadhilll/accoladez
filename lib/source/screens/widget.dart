import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FormField1 extends StatelessWidget {
  FormField1(
      {super.key,
      required this.hinText,
      required this.contr,
      required this.validator});
  final String hinText;
  final contr;
  final validator;
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;

    // ignore: unused_local_variable
    double Width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
          left: 15, right: 15, top: Height / 51, bottom: Height / 51),
      child: TextFormField(
        validator: validator,
        controller: contr,
        style: GoogleFonts.play(
            color: Colors.black, fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          label: Padding(
            padding: EdgeInsets.only(left: 11),
            child: Text(
              hinText,
              style: GoogleFonts.play(
                  color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
          // hintText: hintText,
          hintStyle: GoogleFonts.robotoSlab(),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: Color.fromARGB(255, 0, 230, 250), width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.white70, width: 0.5),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
