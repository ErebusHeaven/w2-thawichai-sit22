import 'package:flutter/material.dart';

class RecTanglePage extends StatefulWidget {
  const RecTanglePage({super.key});

  @override
  State<RecTanglePage> createState() => _RecTanglePageState();
}

class _RecTanglePageState extends State<RecTanglePage> {
  double width = 0, height = 0, area = 0;

  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _heightCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Colors.grey.shade200,
    labelStyle: const TextStyle(
      fontSize: 16,
      color: Colors.deepPurple,
      fontWeight: FontWeight.w600,
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade600,
      fontSize: 14,
    ),
    contentPadding:
    const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: BorderSide(
        color: Colors.deepPurple.shade100,
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(
        color: Colors.deepPurple,
        width: 2,
      ),
    ),
  );

  void _calRectangle() {
    if (_widthCtrl.text.isEmpty || _heightCtrl.text.isEmpty) {
      _showAlert("Please enter the Width and Height completely before calculating.");
      return;
    }

    width = double.tryParse(_widthCtrl.text) ?? 0;
    height = double.tryParse(_heightCtrl.text) ?? 0;

    setState(() {
      area = width * height;
    });
  }


  void _showAlert(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Okay"),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    _widthCtrl.dispose();
    _heightCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculate Rectangle Area"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            Text(
              "Width: $width   Height: $height\nArea: $area",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _widthCtrl,
                decoration: _textFieldStyle.copyWith(
                  labelText: "Width",
                  hintText: "Enter width",
                  suffixIcon: const Icon(Icons.straighten),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: _heightCtrl,
                decoration: _textFieldStyle.copyWith(
                  labelText: "Height",
                  hintText: "Enter height",
                  suffixIcon: const Icon(Icons.height),
                ),
                keyboardType: TextInputType.number,
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _calRectangle,
              child: const Text(
                "Calculate",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
