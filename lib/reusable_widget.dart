import 'package:flutter/material.dart';

Image logoWidget(String imageName) {
  return Image.asset(
    imageName,
    fit: BoxFit.fitWidth,
    width: 240,
    height: 240,
    //color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPassWordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPassWordType,
    enableSuggestions: !isPassWordType,
    autocorrect: !isPassWordType,
    cursorColor: Colors.white,
    style: TextStyle(color: Colors.white.withOpacity(0.9)),
    decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white70),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: const BorderSide(width: 0, style: BorderStyle.none))),
    keyboardType: isPassWordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(90)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "LOG IN" : "SIGN UP",
        style: const TextStyle(
            color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.black26;
            }
            return Colors.white;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
    ),
  );
}

SizedBox searchMentor(String name, String ph, String sub, String cls) {
  return SizedBox(
      width: double.infinity,
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Name : ' + name,
                        textAlign: TextAlign.center,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Phone : ' + ph,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Class : ' + cls,
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Subject : ' + sub,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ));
}

SizedBox searchNGO(String name, String ph, String add1, String add2) {
  return SizedBox(
      width: double.infinity,
      height: 65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Name : ' + name,
                        textAlign: TextAlign.left,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Phone : ' + ph,
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        'Address : ' + add1,
                        textAlign: TextAlign.right,
                      ),
                      Padding(padding: EdgeInsets.only(top: 15)),
                      Text(
                        add2,
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ));
}
