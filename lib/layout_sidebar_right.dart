import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_desktop_kit/cdk.dart';
import 'package:provider/provider.dart';
import 'app_data.dart';
import 'layout_sidebar_tools.dart';
import 'util_tab_views.dart';

class LayoutSidebarRight extends StatelessWidget {
  const LayoutSidebarRight({super.key});

  @override
  Widget build(BuildContext context) {
    AppData appData = Provider.of<AppData>(context);
    CDKTheme theme = CDKThemeNotifier.of(context)!.changeNotifier;
    Color backgroundColor = theme.backgroundSecondary2;
    double screenHeight = MediaQuery.of(context).size.height;

    TextStyle fontBold =
        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    TextStyle font = const TextStyle(fontSize: 12, fontWeight: FontWeight.w400);

    return Container(
        color: backgroundColor,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 1.0),
              height: screenHeight - 45,
              color: backgroundColor,
              child: UtilTabViews(isAccent: true, options: const [
                Text('Document'),
                Text('Format'),
                Text('Shapes')
              ], views: [
                SizedBox(
                  width: double.infinity, // Estira el widget horitzontalment
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Document dimensions:", style: fontBold),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text("Width:", style: font),
                              const SizedBox(width: 4),
                              SizedBox(
                                  width: 80,
                                  child: CDKFieldNumeric(
                                    value: appData.docSize.width,
                                    min: 100,
                                    max: 2500,
                                    units: "px",
                                    increment: 100,
                                    decimals: 0,
                                    onValueChanged: (value) {
                                      appData.setDocWidth(value);
                                    },
                                  )),
                              Expanded(child: Container()),
                              Text("Height:", style: font),
                              const SizedBox(width: 4),
                              SizedBox(
                                  width: 80,
                                  child: CDKFieldNumeric(
                                    value: appData.docSize.height,
                                    min: 100,
                                    max: 2500,
                                    units: "px",
                                    increment: 100,
                                    decimals: 0,
                                    onValueChanged: (value) {
                                      appData.setDocHeight(value);
                                    },
                                  ))
                            ],
                          ),
                          const SizedBox(height: 16),
                        ]),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LayoutSidebarTools(),
                      if (appData.toolSelected == "shape_drawing")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Stroke and Fill."),
                            const SizedBox(height: 12),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Stroke width: ", style: font),
                                      SizedBox(
                                        width: 35,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CDKFieldNumeric(
                                              value: appData.strokeWidth,
                                              min: 1,
                                              max: 100,
                                              units: "px",
                                              decimals: 0,
                                              onValueChanged: (value) {
                                                appData.setStrokeWidth(value);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                          width: 30), // Espacio en el medio
                                      SizedBox(
                                        width: 100,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CDKPickerColorHSV(
                                              value: appData.color1,
                                              onChanged: (value) {
                                                appData.setSelectedColor(value);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity, // Estira el widget horitzontalment
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const Column(
                      children: [
                        Text('List of shapes'),
                      ],
                    ),
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}