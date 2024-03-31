import 'package:airlinesk3/Box/New_Book_container.dart';
import 'package:airlinesk3/Views/Appbar/ButtonNavigator.dart';
import 'package:airlinesk3/Views/Appbar/MyAppbar.dart';
import 'package:flutter/material.dart';

class PaymentTicket extends StatefulWidget {
  // chidlenname
  // customername
  // total money ;
  // intcutomer
  // infomation user
  // khu hoi hay 1 chieu
  PaymentTicket({super.key});

  @override
  State<PaymentTicket> createState() => _PaymentTicketState();
}

bool isVnPaySelected = false;
bool isZaloPaySelected = false;
bool isPostpaidCardSelected = false;
bool isMoMoWalletSelected = false;

class _PaymentTicketState extends State<PaymentTicket> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: media.height * 0.7,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: media.height * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    height: media.height * 0.1,
                    width: media.width * 1,
                    child: NewBooxCOntainer(
                        child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 20,
                          width: media.width * 1,
                          child: Text(
                            "Total Money",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "100000",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: TicketInfomationDetails(context, media),
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    height: media.height * 0.6,
                    child: NewBooxCOntainer(
                      child: Column(
                        children: [
                          Container(
                            height: media.height * 0.06,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: media.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Ticket",
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text("Please choose the payment method below.",
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVnPaySelected = true;
                                        isZaloPaySelected = false;
                                        isPostpaidCardSelected = false;
                                        isMoMoWalletSelected = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: isVnPaySelected
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                      child: PaymentMethor(
                                        media,
                                        "VnPay",
                                        "https://play-lh.googleusercontent.com/2WHgcuwhtbmfrDEF-D-lYQ4sAk0TlI-aFtqx7lJXK5KV7f8smnofaedP_Opcd3edR2c",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVnPaySelected = false;
                                        isZaloPaySelected = true;
                                        isPostpaidCardSelected = false;
                                        isMoMoWalletSelected = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: isZaloPaySelected
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                      child: PaymentMethor(
                                        media,
                                        "ZaloPay",
                                        "https://play-lh.googleusercontent.com/MXoXRQvKYcPzk0AITb6nVJUxZMaWYESXar_HwK8KXbGMboZPQjcwVBcVtXlpOkfD7PM",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVnPaySelected = false;
                                        isZaloPaySelected = false;
                                        isPostpaidCardSelected = true;
                                        isMoMoWalletSelected = false;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: isPostpaidCardSelected
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                      child: PaymentMethor(
                                        media,
                                        "Postpaid Card",
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4TlKRYAzJxi4o1Kr7dgnQ111tOQfCwvHwKl8L977oQyqZ_TtnVO36ZUlDPya6jjNYfy0&usqp=CAU",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isVnPaySelected = false;
                                        isZaloPaySelected = false;
                                        isPostpaidCardSelected = false;
                                        isMoMoWalletSelected = true;
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: isMoMoWalletSelected
                                              ? Colors.blue
                                              : Colors.black,
                                        ),
                                      ),
                                      child: PaymentMethor(
                                        media,
                                        "MoMo Wallet",
                                        "https://play-lh.googleusercontent.com/dQbjuW6Jrwzavx7UCwvGzA_sleZe3-Km1KISpMLGVf1Be5N6hN6-tdKxE5RDQvOiGRg",
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // /
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            height: 300,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Container(
                                      width: media.width,
                                      child: Container(
                                        child: const Column(
                                          children: [
                                            Text(
                                              'Conditions for changing tickets:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '1. Super economical Economy fare:',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '- Vietnam domestic journey: not allowed',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '- Other itineraries: not allowed or allowed with a fee/free of charge depending on the conditions of each fare type',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            // Add ticket change conditions here if needed
                                            SizedBox(height: 20),
                                            Text(
                                              'Ticket refund conditions:',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              '1. Super economical Economy fare:',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '- Vietnam domestic journey: not allowed',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '- Other itineraries: not allowed or allowed with a fee/free of charge depending on the conditions of each fare type',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '2. Other types of fares:',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '- Allowed, charged or free depending on the conditions of each fare type',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              '3. If you choose different fare types, the strictest fare conditions will apply to the entire journey.',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(height: 20),
                                            Text(
                                              '4. Prepaid baggage fees and preferred seat selection are non-refundable.',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            Text(
                                              '5. Good reservation and upgrade fees are non-changeable and non-refundable.',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            BottomNavigator(
              child: Container(
                height: 50,
                child: Center(child: Text("Payment")),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container PaymentMethor(Size media, String name, String url) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration:
                BoxDecoration(image: DecorationImage(image: NetworkImage(url))),
          ),
          Container(
            child: Text(
              name,
              maxLines: 1,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }

  GestureDetector TicketInfomationDetails(BuildContext context, Size media) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: media.height * 0.7,
              child: Scaffold(
                appBar: CustomAppBar(
                  name: "Information Details",
                ),
                body: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: media.height * 0.7,
                        width: media.width * 1,
                        child: Column(
                          children: [
                            Expanded(
                              child: NewBooxCOntainer(
                                  child: Container(
                                width: media.width * 1,
                                color: Colors.amber,
                                child: Text("info chieu di"),
                              )),
                            ),
                            Expanded(
                              child: NewBooxCOntainer(
                                  child: Container(
                                width: media.width * 1,
                                color: Colors.red,
                                child: Text("Info chieu ve"),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottomNavigationBar: Container(
                  height: 70,
                  child: BottomNavigator(
                      child: Text(
                    "Continue",
                    maxLines: 1,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            );
          },
        );
      },
      child: Container(child: Icon(Icons.arrow_drop_down)),
    );
  }
}
