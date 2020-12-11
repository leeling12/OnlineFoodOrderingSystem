import 'package:flutter/material.dart';

class DailyReport extends StatefulWidget {
  @override
  _DailyReport createState() => _DailyReport();
}

class _DailyReport extends State<DailyReport> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Daily Report",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("lib/assets/images/daily_report.jpg")
          ],
        )
    );
  }

}

class WeeklyReport extends StatefulWidget {
  @override
  _WeeklyReport createState() => _WeeklyReport();
}

class _WeeklyReport extends State<WeeklyReport> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Weekly Report",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("lib/assets/images/weekly_report.jpg")
          ],
        )
    );
  }

}

class MonthlyReport extends StatefulWidget {
  @override
  _MonthlyReport createState() => _MonthlyReport();
}

class _MonthlyReport extends State<MonthlyReport> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  SizedBox(width: 15,),
                  Text(
                    "Monthly Report",
                    style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2
                    ),
                  ),
                ],
              ),
            )
            ,
            Image.asset("lib/assets/images/monthly_report.jpg")
          ],
        )
    );
  }

}