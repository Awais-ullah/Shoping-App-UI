import 'package:flutter/material.dart';


class TopSearchBar  extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          //for search bar
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,

                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'search...',
                  prefixIcon: Icon(Icons.search)

                ),
              ),
            ),
          ),
          //fir notificarion icon
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: (){},
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Icon(Icons.notification_add_outlined),
                ),
            ),
          ),
          //for category selection


        ],
      ),
    );
  }
}
