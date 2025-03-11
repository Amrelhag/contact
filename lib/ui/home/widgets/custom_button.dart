import 'package:contact/core/ColorManager.dart';
import 'package:flutter/material.dart';

typedef CustomButtonCallBack= String? Function(String calue);
class CustomButton extends StatelessWidget {
  TextEditingController controller=TextEditingController();
  String hint;
  CustomButtonCallBack validator;
  TextInputType textInputType ;
   CustomButton({required this.controller,required this.hint,
     required this.validator,required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value)=> validator(value!),
          keyboardType: textInputType,
          style: TextStyle(
            fontSize: 16,

        color: ColorManager.secondaryG ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(
                color: ColorManager.secondaryG,
              )
            ),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorManager.secondaryG,
                )
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: ColorManager.secondaryG,
                )
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.red,
                )
            ),
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 16,
              color: ColorManager.tertiary
            )
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
