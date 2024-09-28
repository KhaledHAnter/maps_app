import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phone_otp/core/helpers/validator_utils/validator_utils.dart';
import 'package:phone_otp/core/theming/colors.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  late String phoneNumber;

  Widget _buildIntroText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What is your phone number?",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Gap(30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: const Text(
            "Please enter your phone number to verify your account",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildPhoneFormField() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.lightGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('${generateCountryFlag()} +2',
                style: const TextStyle(fontSize: 18, letterSpacing: 2.0)),
          ),
        ),
        const Gap(8),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: ColorsManager.blue),
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              autofocus: true,
              style: const TextStyle(fontSize: 18, letterSpacing: 2.0),
              cursorColor: Colors.black,
              validator: ValidatorUtils.validatePhoneNumberEG,
              keyboardType: TextInputType.number,
              maxLength: 11,
              buildCounter: (BuildContext context,
                  {int? currentLength, int? maxLength, bool? isFocused}) {
                return null; // This hides the counter
              },
              onSaved: (value) {
                phoneNumber = value!;
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        onPressed: () {
          // TODO: implement next button
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(110, 50),
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          "Next",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  String generateCountryFlag() {
    String countryCode = 'eg';

    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));

    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: UniqueKey(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 88),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildIntroText(),
                const Gap(110),
                _buildPhoneFormField(),
                const Gap(70),
                _buildNextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
