import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? Function(String?)? validation;
  final Function()? onEditComplete;
  final TextEditingController? textEditingController;
  final String hint;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enable;
  final String title;
  final String? initialValue;
  final bool obsecureText;
  final TextAlign textAlign;
  final TextInputAction textInputAction;
  final Function(String val)? onChange;
  final double? width;
  final double? height;

  const CustomTextField(
      {Key? key,
      this.width,
      this.height,
      this.validation,
      this.textEditingController,
      this.hint = "",
      this.onChange,
      this.textInputType,
      required this.title,
      this.inputFormatters,
      this.enable = true,
      this.initialValue,
      this.obsecureText = false,
      this.textAlign = TextAlign.left,
      this.onEditComplete,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<CustomTextField> {
  bool _isVisible = false;

  @override
  void initState() {
    _isVisible = widget.obsecureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextFormField(
        textDirection: TextDirection.ltr,
        controller: widget.textEditingController,
        initialValue: widget.initialValue,
        validator: widget.validation ??
            (val) {
              return null;
            },
        keyboardType: widget.textInputType,
        inputFormatters: widget.inputFormatters,
        textInputAction: widget.textInputAction,
        enabled: widget.enable,
        onChanged: (val) {
          if (widget.onChange != null) {
            widget.onChange!(val);
          }
        },
        onEditingComplete: widget.onEditComplete,
        obscureText: _isVisible,
        style: TextStyle(
          fontSize: 15.h,
          height: 1.h,
          color: Colors.black,
        ),
        textAlign: widget.textAlign,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            hintText: widget.hint,
            labelText: widget.title,
            labelStyle: const TextStyle(color: Colors.black54),
            suffixIcon: widget.obsecureText
                ? GestureDetector(
                    child: _isVisible
                        ? Icon(
                            Icons.visibility_off,
                            size: 20.h,
                            color: Colors.grey,
                          )
                        : Icon(
                            Icons.visibility,
                            size: 20.h,
                            color: Colors.grey,
                          ),
                    onTap: () => setState(() {
                      _isVisible = !_isVisible;
                    }),
                  )
                : null,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 15.h, vertical: 0.5.h),
            hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 2.h),
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1.h, color: Colors.black26),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1.h, color: Colors.black26),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1.h, color: Colors.black26),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(width: 1.h, color: Colors.black26),
            )),
      ),
    );
  }
}
