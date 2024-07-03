import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:inventra/constants.dart';

class ReportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_circle_left_outlined, color: Color(0xffa4a4a4), size: 28),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  'REPORT II',
                  style: TextStyle(color: Color(0xffa4a4a4), fontSize: 25, fontWeight: FontWeight.w500,height: 1.0,),
                ),
                
                Text(
                  'Daily Payment Details',
                  style: TextStyle(color: Color(0xffa4a4a4), fontSize: 16,height: 0.8),
                ),
              ],
            ),
            SizedBox(width: 80),
            ElevatedButton(
              child: Text(
                'Print',
                style: TextStyle(color: Color(0xffa4a4a4), fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, 
                foregroundColor: Color(0xffa4a4a4), 
                elevation: 4, // Elevation
                shadowColor: Color(0xffa4a4a4), 
                
              ),
              onPressed: () {},
            ),
          ],
        ),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: kPrimaery,
                      elevation: 4,
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      )
                    ),
                    child: const Text('New Invoice'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: const Text('Old Invoice'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              
              decoration: InputDecoration(
                
                prefixIcon: const Icon(Icons.date_range, color: Color(0xffaaaaaa)),
                hintText: 'Choose Date',
                hintStyle: TextStyle(color: Color(0xffaaaaaa)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xffaaaaaa)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search,color:Color(0xffaaaaaa)),
                hintText: 'Salesman',
                hintStyle: TextStyle(color: Color(0xffaaaaaa)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xffaaaaaa)),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Invoice Amount', style: TextStyle(fontSize: 12,color: Color(0xffaaaaaa))),
                      Text(
                        'Rs.1,345.00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Balance',style: TextStyle(fontSize: 12,color: Color(0xffaaaaaa))),
                      Text(
                        'Rs.1,245.00',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    
                                    Text(
                                      'James Elizabeth',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                      '#10223445566',
                                      style: TextStyle(
                                        color: kPrimaery,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'Rs.2,345.00',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Text(
                                          'Amount',
                                          style: TextStyle(
                                            color: Color(0xffaaaaaa),
                                            fontSize: 12,
                                          ),
                                        ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Cash', style: TextStyle(fontSize: 10,color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,345.00',
                                      style: TextStyle(fontSize: 11,color: Color(0xff52575c),)
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Cheque', style: TextStyle(fontSize: 10,color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,245.00',
                                      style: TextStyle(fontSize: 11,color: Color(0xff52575c),)
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Balance', style: TextStyle(fontSize: 10,color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,245.00',
                                      style: TextStyle(fontSize: 11,color: Color(0xff52575c),)
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}