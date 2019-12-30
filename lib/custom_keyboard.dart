import 'package:flutter/material.dart';

class CustomKeyboard extends StatefulWidget {
  final Function onBackPressed, onPressedKey;
  final TextStyle textStyle;
  final bool showLetters;
  CustomKeyboard({
    this.onBackPressed,
    this.onPressedKey,
    this.textStyle,
    this.showLetters = false,
  });

  CustomKeyboardState createState() => CustomKeyboardState();
}

class CustomKeyboardState extends State<CustomKeyboard> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 16, right: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumPad(
                widget: widget,
                digit: '1',
                letters: '',
              ),
              NumPad(
                widget: widget,
                digit: '2',
                letters: 'ABC',
              ),
              NumPad(
                widget: widget,
                digit: '3',
                letters: 'DEF',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumPad(
                widget: widget,
                digit: '4',
                letters: 'GHI',
              ),
              NumPad(
                widget: widget,
                digit: '5',
                letters: 'JKL',
              ),
              NumPad(
                widget: widget,
                digit: '6',
                letters: 'MNO',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumPad(
                widget: widget,
                digit: '7',
                letters: 'PQRS',
              ),
              NumPad(
                widget: widget,
                digit: '8',
                letters: 'TUV',
              ),
              NumPad(
                widget: widget,
                digit: '9',
                letters: 'WXYZ',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              NumPad(
                widget: widget,
                icon: Text(
                  '',
                  style: widget.textStyle,
                ),
              ),
              NumPad(
                widget: widget,
                digit: '0',
              ),
              NumPad(
                widget: widget,
                icon: Icon(
                  Icons.backspace,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumPad extends StatelessWidget {
  const NumPad({
    Key key,
    this.digit,
    this.letters,
    this.icon,
    @required this.widget,
  }) : super(key: key);

  final CustomKeyboard widget;
  final String digit;
  final String letters;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          child: Material(
            color: Colors.transparent,
            child: icon != null && icon is Text
                ? Container(
                    height: 48,
                    width: 48,
                    child: Center(
                        child: icon != null
                            ? icon
                            : Text(digit, style: widget.textStyle)),
                  )
                : InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(48)),
                    onTap: () => icon != null
                        ? icon is Icon ? widget.onBackPressed() : null
                        : widget.onPressedKey(digit),
                    child: Container(
                      height: 48,
                      width: 48,
                      child: widget.showLetters && letters != null
                          ? Column(
                              children: <Widget>[
                                Center(
                                  child: icon != null
                                      ? icon
                                      : Text(digit, style: widget.textStyle),
                                ),
                                Text(
                                  letters,
                                  style:
                                      widget.textStyle.copyWith(fontSize: 10.0),
                                )
                              ],
                            )
                          : Center(
                              child: icon != null
                                  ? icon
                                  : Text(digit, style: widget.textStyle),
                            ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
