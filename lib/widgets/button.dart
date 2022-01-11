import 'package:flutter/material.dart';
import 'package:wave_app/widgets/customText.dart';

class CustomButton extends StatefulWidget {
  final String? buttonText;
  final VoidCallback? onPressed;
  final ButtonStyle? buttonStyle;
  final Color? textColor;
  final double textFontSize;

  const CustomButton(
      {Key? key, this.buttonText, this.onPressed, this.buttonStyle, this.textColor, this.textFontSize = 16})
      : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    
      child: Center(
        child: CustomText(
          widget.buttonText,
          fontSize: widget.textFontSize,
        ),
      ),
      style: widget.buttonStyle,
      onPressed: widget.onPressed,
    );
  }
}

