import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vms/theme/app_theme.dart';

class UploadProgress extends StatefulWidget {
  @override
  _UploadProgressState createState() => _UploadProgressState();
}

class _UploadProgressState extends State<UploadProgress>
    with SingleTickerProviderStateMixin {
  bool isInProgress = true;
  late ThemeData theme;
  late AnimationController controller;
  late Animation<double> animation;
  late CustomTheme customTheme;

  @override
  void initState() {
    super.initState();
    theme = AppTheme.theme;
    customTheme = AppTheme.customTheme;
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    startTimer();
  }

  late Timer _timer;

  void startTimer() {
    setState(() {
      isInProgress = true;
    });
    controller.repeat();

    const oneSec = Duration(seconds: 3);
    _timer = Timer.periodic(
        oneSec,
        (Timer timer) => {
              _timer.cancel(),
              showMyDialog(context),
              controller.stop(),
              setState(
                () {
                  isInProgress = false;
                },
              )
            });
  }

  showMyDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return _UploadDoneDialog();
        });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.stop();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(16),
            child: Center(
                child: isInProgress
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                customTheme.homemadePrimary,
                              ),
                              value: animation.value,
                            ),
                          ),
                          SizedBox(width: 20),
                          Text(
                            "Uploading...",
                            style: TextStyle(
                                color: theme.colorScheme.onBackground,
                                letterSpacing: 0.2),
                          )
                        ],
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: customTheme.homemadePrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0))),
                        onPressed: () {
                          startTimer();
                        },
                        child: Text(
                          "Upload File",
                          style:
                              TextStyle(color: theme.colorScheme.onSecondary),
                        )))));
  }
}

class _UploadDoneDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
         color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Center(
                  child: Icon(
                Icons.cloud_upload_outlined,
                size: 40,
                color: AppTheme.customTheme.homemadePrimary,
              )),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: Text("Success!",
                      style: TextStyle(fontWeight: FontWeight.w700))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: Text("Your file upload successful",
                      style: TextStyle(fontWeight: FontWeight.w600))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: Center(
                  child: Text("Now you can check your file",
                      style: TextStyle(fontWeight: FontWeight.w600))),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: AppTheme.customTheme.homemadePrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0))),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Go to Folder",
                          style: TextStyle(fontWeight: FontWeight.w600, color: theme.colorScheme.onPrimary))
                          )),
            )
          ],
        ),
      ),
    );
  }
}
