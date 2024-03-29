import 'package:flutter/material.dart';
import 'RentAvailabilityPage.dart';

class RentalPricePage extends StatefulWidget {
  @override
  _RentalPricePageState createState() => _RentalPricePageState();
}

class _RentalPricePageState extends State<RentalPricePage> {
  String rentType = '';
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Price'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select Rental Type:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            buildRentTypeRadio('Daily', Icons.calendar_today),
            buildRentTypeRadio('Monthly', Icons.calendar_view_month),
            SizedBox(height: 20),
            Text(
              'Enter Price:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 10),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter the rental price',
                border: OutlineInputBorder(),
              ),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                if (rentType.isNotEmpty && priceController.text.isNotEmpty) {
                  print('Selected Rent Type: $rentType');
                  print('Entered Price: ${priceController.text}');

                  // Navigate to RentPropertyPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RentPropertyPage(),
                    ),
                  );
                } else {
                  print('Please select rent type and enter the price');
                }
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.orange,
              ),
              child: Text(
                'Continue',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRentTypeRadio(String value, IconData icon) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: rentType,
          onChanged: (String? newValue) {
            setState(() {
              rentType = newValue!;
            });
          },
        ),
        Icon(icon),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
