import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextEditorWidget extends StatefulWidget {
  final String text;
  const TextEditorWidget({Key key, this.text}) : super(key: key);

  @override
  _TextEditorWidgetState createState() => _TextEditorWidgetState();
}

class _TextEditorWidgetState extends State<TextEditorWidget> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _textEditingController.text = widget.text;
    super.initState();
  }

  Widget _header() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 16,
                ),
                Text(
                  "프로필 편집",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back(result: _textEditingController.text);
            },
            child: Text(
              "완료",
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _editTextField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextField(
          controller: _textEditingController,
          maxLength: 20,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
          decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 18, color: Colors.white),
            counterStyle: TextStyle(fontSize: 14, color: Colors.white),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          _header(),
          Expanded(
            child: _editTextField(),
          )
        ],
      ),
    );
  }
}
