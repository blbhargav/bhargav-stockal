import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StockAlTextField extends StatelessWidget {
  final bool obscureText, enabled;
  var onChanged;
  final TextInputType? textInputType;
  final int? maxLength;
  final int? maxLines;
  final TextInputAction? textInputAction;
  final Color? textColor;
  final String? error;
  //final Function onEditComplete;
  final List<TextInputFormatter>? textInputFormatter;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;
  final GlobalKey? textKey;
  final TextStyle textStyle;

  var onEditComplete;
  StockAlTextField(
      {
        this.textInputFormatter,
        this.maxLength,
        this.onEditComplete,
        this.error,
        this.textColor,
        this.textInputAction,
        this.maxLines,
        this.obscureText=false,
        this.onChanged,
        this.enabled=true,
        this.controller,
        this.textCapitalization,
        this.textInputType,
        this.textKey,
        required this.textStyle,
      });

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    var scalingWidth = screenWidth / 360;
    var scalingHeight = screenHeight / 800;

    if (controller != null) {
        controller!.selection = TextSelection.fromPosition(
          TextPosition(offset: controller!.text.length));
    }
    return Container(
      width: 300.0 *(scalingWidth>1.0?1.0:scalingWidth),
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: TextField(
        onSubmitted: onEditComplete,
        maxLines: maxLines,
        key: textKey!=null?textKey:null,
        textAlign: TextAlign.start,
        style: textStyle,
        autofocus: true,
        keyboardType: textInputType,
        obscureText:  obscureText,
        maxLength: maxLength != null ? maxLength : null,
        onChanged: onChanged,
        enabled:enabled,
        inputFormatters: textInputFormatter,
        controller: controller != null ? controller : null,
        textInputAction: textInputAction != null ? textInputAction : TextInputAction.done,
        textCapitalization: textCapitalization!=null?textCapitalization!:TextCapitalization.sentences,
        decoration: InputDecoration(
          errorText: error,
          labelStyle: textStyle,
          labelText: null,
          alignLabelWithHint: true,
          hintStyle:textStyle,
          filled: false,
          counterText: "",
          hintText: null,
          errorMaxLines: 5,
          contentPadding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
