import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:verseum/constants/color.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.labelText,
    required this.icon,
    required this.type,
    required this.obscureText,
    required this.controller,
    this.suffixIcon,
  });
  final String labelText;
  final IconData icon;
  final TextInputType type;
  final bool obscureText;
  final TextEditingController controller;
  final IconData? suffixIcon;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(
            bottom: BorderSide(color: HexColor(borderColor)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This field can't be empty";
              } else if (widget.type == TextInputType.emailAddress) {
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return 'Incorrect email format';
                }
              }
              return null;
            },
            controller: widget.controller,
            obscureText: obscureText,
            style: TextStyle(fontSize: 15),
            maxLines: 1,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: TextStyle(color: HexColor(primaryColor)),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              prefixIcon: Icon(
                widget.icon,
                size: 20,
                color: HexColor(primaryColor),
              ),
              suffixIcon: widget.suffixIcon != null
                  ? GestureDetector(
                      onTap: () => setState(() {
                        obscureText = !obscureText;
                      }),
                      child: Icon(widget.suffixIcon, size: 17),
                    )
                  : null,
            ),
            keyboardType: widget.type,
          ),
        ),
      ),
    );
  }
}
