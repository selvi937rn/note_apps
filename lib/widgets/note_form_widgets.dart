import 'package:flutter/material.dart';
import 'package:note_app_selvi/models/note.dart';

class NoteFormWidget extends StatelessWidget {
  const NoteFormWidget(
    {Key? key,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.onChangeIsImportant,
    required this.onChangeNumber,
    required this.onChangeTitle,
    required this.onChangeDescription,
    }
  )
  : super (key: key);
  
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final ValueChanged<bool> onChangeIsImportant;
  final ValueChanged<int> onChangeNumber;
  final ValueChanged<String> onChangeTitle;
  final ValueChanged<String> onChangeDescription;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Switch(value: isImportant, onChanged: onChangeIsImportant),
                Expanded(
                  child: Slider(
                    value: number.toDouble(),
                    min: 1.0,
                    max: 5.0,
                    divisions: 4,
                    onChanged: (value) => onChangeNumber(value.toInt()),
                  ),
                ),
              ],
            ),
            buildTitleField(),
            const SizedBox(
              height: 8,
            ),
            buildDescriptionField(),
          ],
        ),
      ),
    );
  }

  buildTitleField() {
    return TextFormField(
      maxLines: 1,
      initialValue: title,
      style: const TextStyle(
        // color: Colors.white70,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Title",
        hintStyle: TextStyle(color: Colors.grey),
      ),
      validator: (title) {
        return title != null && title.isEmpty 
        ? "Please enter a title" 
        : null;
      },
      onChanged: onChangeTitle,
    );
  }

  buildDescriptionField() {
    return TextFormField(
      maxLines: null,
      initialValue: description,
      style: const TextStyle(
        // color: Colors.white70,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: "Type something dear...",
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      validator: (desc) {
        return desc != null && desc.isEmpty
        ? "Please type something as description"
        : null;
      },
      onChanged: onChangeDescription,
    );
  }
}