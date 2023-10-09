import 'package:directos_twitch/ui/ui.dart';
import 'package:flutter/material.dart';

class BtnGenery extends StatelessWidget {
  const BtnGenery({
    super.key,
    this.titleBtn,
    this.onPressed,
    this.isEmergencyBtn = false,
  });

  final String? titleBtn;
  final Function()? onPressed;
  final bool isEmergencyBtn;

  @override
  Widget build(BuildContext context) {
    final emergencyBtn = isEmergencyBtn == true;
    final alignElement = emergencyBtn ? Alignment.centerRight : Alignment.centerLeft;
    final colorElement = emergencyBtn ? ColorsApp.colorOrangeBTN : ColorsApp.colorGreenBTN;

    return Container(
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(maxHeight: 50, minHeight: 45, maxWidth: 200, minWidth: 180),
      height: 45,
      width: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(45),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black26,
            blurRadius: 2,
          )
        ],
      ),
      child: Stack(
        children: [
          Align(
            alignment: alignElement,
            child: Container(
              height: 45,
              width: 130,
              decoration: BoxDecoration(
                color: colorElement,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(emergencyBtn ? 0 : 50),
                  bottomLeft: Radius.circular(emergencyBtn ? 50 : 0),
                ),
              ),
            ),
          ),
          Align(
            alignment: alignElement,
            child: Padding(
              padding: EdgeInsets.only(left: emergencyBtn ? 0 : 30, right: emergencyBtn ? 30 : 0),
              child: Text(titleBtn ?? "Profile", style: TextStyleApp.btnGenery),
            ),
          ),
          Align(
            alignment: emergencyBtn ? Alignment.centerLeft : Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: emergencyBtn ? 0 : 10, left: emergencyBtn ? 10 : 0),
              child: Icon(
                emergencyBtn ? Icons.help : Icons.security_rounded,
                color: colorElement,
              ),
            ),
          )
        ],
      ),
    );
  }
}
