import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KiloGramsToPoundsPage extends StatefulWidget {
  const KiloGramsToPoundsPage({super.key});

  @override
  State<KiloGramsToPoundsPage> createState() =>
      _KiloGramsToPoundsPageState();
}

class _KiloGramsToPoundsPageState extends State<KiloGramsToPoundsPage> {
  double kilograms = 0 , pounds = 0;

  final TextEditingController _kgCtrl = TextEditingController();

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

  void _convertKgToLb() {
    if (_kgCtrl.text.isEmpty) {
      _showAlert("Please enter kilograms before converting.");
      return;
    }

    kilograms = double.tryParse(_kgCtrl.text) ?? 0;

    setState(() {
      pounds = kilograms * 2.20462;
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
    _kgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kilograms to Pounds"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),

            Text(
              "Kilograms: $kilograms\nPounds : ${pounds.toStringAsFixed(2)}",
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
                controller: _kgCtrl,
                decoration: _textFieldStyle.copyWith(
                  labelText: "Kilograms",
                  hintText: "Enter kilograms",
                  suffixIcon: const Icon(Icons.scale),
                ),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*$'),
                  ),
                ],
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
              onPressed: _convertKgToLb,
              child: const Text(
                "Convert",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
