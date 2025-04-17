import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as Services;


class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 100.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              const TextSpan(text: 'Inovāciju atbalsta centrs: '),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () {
                    Services.Clipboard.setData(const Services.ClipboardData(
                        text: 'info@inovacijucentrs.lv'));
                  },
                  child: const Text(
                    'info@inovacijucentrs.lv',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue),
                  ),
                ),
              ),
              const TextSpan(text: '\nTālrunis: '),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () {
                    Services.Clipboard.setData(const Services.ClipboardData(
                        text: '+371 26172018'));
                  },
                  child: const Text(
                    '+371 26172018',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue),
                  ),
                ),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () {
                    Services.Clipboard.setData(const Services.ClipboardData(
                        text: 'https://www.inovacijucentrs.lv/'));
                  },
                  child: const Text(
                    '     mājas lapa',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue),
                  ),
                ),
              ),
              const TextSpan(text: '\nDeveloper: '),
              const TextSpan(
                text: 'Andris Matvejevs ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: GestureDetector(
                  onTap: () {
                    Services.Clipboard.setData(const Services.ClipboardData(
                        text: 'andrismatvejev@inbox.lv'));
                  },
                  child: const Text(
                    'andrismatvejev@inbox.lv',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.blue),
                  ),
                ),
              ),
              const TextSpan(
                  text: 'Member of the nextage IT team. '),
              const TextSpan(
                  text:
                  "Home and industrial automation solutions. Development of software sites, embedded systems, as well as building secure networks. We are able to solve automation problems for which the market does not offer ready-made solutions"),
            ],
          ),
        ),
      ),
    );
  }
}

