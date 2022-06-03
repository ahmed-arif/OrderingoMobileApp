// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title, description;
  final Widget? topWidget, descriptionWidget;
  final List<Widget> actionButtonList;
  const CustomDialog({
    Key? key,
    this.description,
    this.descriptionWidget,
    required this.actionButtonList,
    required this.title,
    this.topWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: (topWidget != null ? 30 : 0)),
          child: Card(
            color: Theme.of(context).backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 24,
            child: Padding(
              padding: EdgeInsets.only(
                top: (topWidget != null ? 50 : 16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      mainAxisSize:
                          MainAxisSize.min, // To make the card compact
                      children: <Widget>[
                        Text(
                          title!,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: description != '' ? 8.0 : 0),
                        descriptionWidget != null
                            ? descriptionWidget!
                            : description != ''
                                ? Text(
                                    description!,
                                    textAlign: TextAlign.center,
                                  )
                                : const SizedBox(),
                        SizedBox(height: description != '' ? 16.0 : 8),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  actionButtonList != null
                      ? actionButtonList.length > 2
                          ? Column(
                              children: getActionButtonsList(context),
                            )
                          : Row(
                              children: getActionButtonsList(context),
                            )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ),
        topWidget != null
            ? Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Card(
                      color: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      elevation: 6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: topWidget,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  List<Widget> getActionButtonsList(BuildContext context) {
    if (actionButtonList != null) {
      if (actionButtonList.length > 2) {
        List<Widget> list = [];
        for (var i = 0; i < actionButtonList.length; i++) {
          list.add(actionButtonList[i]);
          if (i != actionButtonList.length) {
            list.add(const Divider(
              height: 1,
            ));
          }
        }
        return list;
      } else if (actionButtonList.length == 2) {
        List<Widget> list = [];
        list.add(
          Expanded(child: actionButtonList[0]),
        );
        list.add(
          Container(
            width: 0.6,
            height: 48,
            color: Theme.of(context).dividerColor,
          ),
        );
        list.add(Expanded(child: actionButtonList[1]));
        return list;
      } else {
        List<Widget> list = [];
        list.add(
          Expanded(child: actionButtonList[0]),
        );
        return list;
      }
    } else {
      return [];
    }
  }
}

class CustomDialogActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool isRed;

  const CustomDialogActionButton(
      {Key? key,
      required this.onPressed,
      required this.buttonText,
      this.isRed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: isRed
          ? Theme.of(context).errorColor.withOpacity(0.1)
          : Theme.of(context).primaryColor.withOpacity(0.1),
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onPressed();
      },
      child: Container(
        alignment: Alignment.center,
        height: 48,
        child: Text(
          buttonText,
        ),
      ),
    );
  }
}
