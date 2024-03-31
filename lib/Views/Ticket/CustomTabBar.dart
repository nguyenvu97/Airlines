import 'package:airlinesk3/Box/New_Box.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  String ticket;
  String ticKetVip;
  String catecory;
  bool isRouterCallback;
  String dateTime;
  final ValueChanged<bool> onIsRouterCallbackChanged;
  CustomTabBar(
      {Key? key,
      required this.ticKetVip,
      required this.ticket,
      required this.catecory,
      required this.onIsRouterCallbackChanged,
      required this.dateTime,
      required this.isRouterCallback})
      : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Container(
                    height: 100,
                    width: 150,
                    child: NewBox(
                      child: Column(
                        children: [
                          Text(
                            widget.ticket,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Money",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              ),
              Tab(
                child: Container(
                    height: 100,
                    width: 150,
                    child: NewBox(
                      child: Column(
                        children: [
                          Text(
                            widget.ticKetVip,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Money",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
          Visibility(
            visible: !widget.isRouterCallback,
            child: InNormalAndVip(),
          ),
          Visibility(
            visible: widget.isRouterCallback,
            child: InNormalAndVip(),
          ),
        ],
      ),
    );
  }

  Container InNormalAndVip() {
    if (widget.catecory.contains("Round_trip")) {
      if (widget.isRouterCallback) {
        return Container(
          height: 350,
          width: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              // Ticket
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(
                        child: Column(
                          children: [
                            Visibility(
                              visible: !widget.isRouterCallback,
                              child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      bool newIsRouterCallback =
                                          !widget.isRouterCallback;
                                      widget.onIsRouterCallbackChanged(
                                          newIsRouterCallback);
                                    });
                                    print(!widget.isRouterCallback);
                                  },
                                  icon: Icon(Icons.abc)),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              child: Text(widget.dateTime),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Ticket Vip
              Container(
                child: ListView.builder(
                  shrinkWrap:
                      true, // Giúp đảm bảo ListView co lại khi nó bị bao bởi một widget không giới hạn
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(child: Column()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          height: 350,
          width: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              // Ticket
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(
                          child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  bool newIsRouterCallback =
                                      !widget.isRouterCallback;
                                  widget.onIsRouterCallbackChanged(
                                      newIsRouterCallback);
                                });
                                print(!widget.isRouterCallback);
                              },
                              icon: Icon(Icons.abc)),
                          Container(
                            height: 50,
                            width: 100,
                            child: Text(widget.dateTime),
                          )
                        ],
                      )),
                    );
                  },
                ),
              ),
              // Ticket Vip
              Container(
                child: ListView.builder(
                  shrinkWrap:
                      true, // Giúp đảm bảo ListView co lại khi nó bị bao bởi một widget không giới hạn
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(child: Column()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
      // ! one_way ??????????????????????
    } else {
      if (widget.isRouterCallback) {
        return Container(
          height: 350,
          width: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              // Ticket
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              child: Text(widget.dateTime),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Ticket Vip
              Container(
                child: ListView.builder(
                  shrinkWrap:
                      true, // Giúp đảm bảo ListView co lại khi nó bị bao bởi một widget không giới hạn
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(child: Column()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      } else {
        return Container(
          height: 350,
          width: 400,
          child: TabBarView(
            controller: _tabController,
            children: [
              // Ticket
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(
                          child: Column(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  bool newIsRouterCallback =
                                      !widget.isRouterCallback;
                                  widget.onIsRouterCallbackChanged(
                                      newIsRouterCallback);
                                });
                                print(!widget.isRouterCallback);
                              },
                              icon: Icon(Icons.abc)),
                          Container(
                            height: 50,
                            width: 100,
                            child: Text(widget.dateTime),
                          )
                        ],
                      )),
                    );
                  },
                ),
              ),
              // Ticket Vip
              Container(
                child: ListView.builder(
                  shrinkWrap:
                      true, // Giúp đảm bảo ListView co lại khi nó bị bao bởi một widget không giới hạn
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      height: 350,
                      child: NewBox(child: Column()),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }
    }
  }
}
