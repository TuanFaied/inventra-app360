import 'package:flutter/material.dart';
import 'package:inventra/constants.dart';

class ReportScreen extends StatefulWidget {
  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  bool isNewInvoiceSelected = true;
  TextEditingController _dateController = TextEditingController();
  TextEditingController _salesmanController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

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
              icon: const Icon(Icons.arrow_circle_left_outlined,
                  color: Color(0xffa4a4a4), size: 28),
              onPressed: () {
               Navigator.of(context).pop();
              },
            ),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                Text(
                  'REPORT II',
                  style: TextStyle(
                      color: Color(0xffa4a4a4),
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      height: 1.0),
                ),
                Text(
                  'Daily Payment Details',
                  style: TextStyle(
                      color: Color(0xffa4a4a4), fontSize: 16, height: 0.8),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              
              child: const Text(
                'Print',
                style: TextStyle(color: Color(0xffa4a4a4), fontSize: 14),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xffa4a4a4),
                elevation: 4, // Elevation
                shadowColor: const Color(0xffa4a4a4),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isNewInvoiceSelected = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: isNewInvoiceSelected
                            ? kPrimaery
                            : const Color(0xffc3c3c3),
                        elevation: isNewInvoiceSelected ? 4 : 0,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('New Invoice',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isNewInvoiceSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: !isNewInvoiceSelected
                            ? kPrimaery
                            : const Color(0xffc3c3c3),
                        elevation: !isNewInvoiceSelected ? 4 : 0,
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Old Invoice',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _dateController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.date_range, color: Color(0xffaaaaaa)),
                  hintText: 'Choose Date',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _dateController.clear();
                      });
                    },
                    child: const ImageIcon(
                      AssetImage('assets/icons/remove.png'),
                      color: Color(0xffaaaaaa),
                      size: 20,
                    ),
                  ),
                  hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Color(0xffaaaaaa)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kPrimaery),
                  ),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _salesmanController,
                
                decoration: InputDecoration(
                  
                  prefixIcon:
                      const Icon(Icons.search, color: Color(0xffaaaaaa)),
                  hintText: 'Salesman',
                  hintStyle: const TextStyle(color: Color(0xffaaaaaa)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kPrimaery),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 231, 230, 230)),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  border: const Border.symmetric(
                      horizontal:
                          BorderSide(color: Color.fromRGBO(254, 213, 213, 1))),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Invoice Amount',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffaaaaaa))),
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
                        Text('Balance',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffaaaaaa))),
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
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 4,
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
                                    Text('Cash',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,345.00',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff52575c)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Cheque',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,245.00',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff52575c)),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Balance',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff979797))),
                                    Text(
                                      'Rs.1,245.00',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: Color(0xff52575c)),
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
            ],
          ),
        ),
      ),
    );
  }
}
