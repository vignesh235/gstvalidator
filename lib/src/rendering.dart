part of gstvalidator;

class GSTvalidator extends StatefulWidget {
  final String labelText;

  final TextEditingController controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final FormFieldValidator<String>? validator;
  final Function(String)? onChange;
  final AutovalidateMode autovalidateMode;
  final IconData? suffixIcon;
  final Color? suffixIconColor;
  const GSTvalidator({
    super.key,
    required this.labelText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.onChange,
    this.suffixIcon,
    this.suffixIconColor,
    required this.autovalidateMode,
  });

  @override
  State<GSTvalidator> createState() => _GSTvalidatorState();
}

class _GSTvalidatorState extends State<GSTvalidator> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autovalidateMode: widget.autovalidateMode,
      keyboardType: widget.keyboardType,
      validator: ((value) {
        String res = validateGstinCheckDigit(widget.controller.text);
        return res.isEmpty ? null : res;
      }),
      maxLength: widget.maxLength,
      onChanged: (text) {
        if (widget.onChange != null) {
          widget.onChange!(text);
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
        LengthLimitingTextInputFormatter(15)
      ],
      decoration: InputDecoration(
        suffixIcon: Icon(
          widget.suffixIcon,
          color: widget.suffixIconColor,
        ),
        labelText: widget.labelText,
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0x0ff2d2e4))),
      ),
    );
  }

  String? _validateInput(value) {
    final RegExp pattern =
        RegExp(r"^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$");
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    if (!pattern.hasMatch(value)) {
      return 'Invalid GST format';
    }
    return null;
  }

  String validateGstinCheckDigit(String gstin) {
    var gstval = _validateInput(gstin);
    if ((gstval ?? '').toString().isNotEmpty) {
      return gstval.toString();
    }
    int factor = 1;
    int total = 0;
    String codePointChars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    int mod = codePointChars.length;
    String inputChars = gstin.substring(0, gstin.length - 1);

    for (int i = 0; i < inputChars.length; i++) {
      String char = inputChars[i];
      int digit = factor * codePointChars.indexOf(char);
      digit = (digit ~/ mod) + (digit % mod);
      total += digit;
      factor = (factor == 1) ? 2 : 1;
    }

    if (gstin[gstin.length - 1] !=
        codePointChars[((mod - (total % mod)) % mod)]) {
      return "The GSTIN provided is not valid; \n It fails the check digit validation.";
    }

    return "";
  }
}
