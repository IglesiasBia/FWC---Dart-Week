// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_style.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';
import 'package:fwc_album_app/app/pages/my_stickers/presenter/my_stickers_presenter.dart';

class StickerGroup extends StatelessWidget {
  final GroupsStickers group;
  final String statusFilter;

  const StickerGroup({
    Key? key,
    required this.group,
    required this.statusFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build $hashCode');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 64,
            child: OverflowBox(
                maxWidth: double.infinity,
                maxHeight: double.infinity,
                child: ClipRect(
                  child: Align(
                    alignment: const Alignment(0, -0.1),
                    widthFactor: 1,
                    heightFactor: 0.1,
                    child: Image.network(
                      group.flag,
                      cacheWidth:
                          (MediaQuery.of(context).size.width * 3).toInt(),
                    ),
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';
              final stickerList = group.stickers
                  .where((sticker) => sticker.stickerNumber == stickerNumber);
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                  stickerNumber: stickerNumber,
                  sticker: sticker,
                  countryName: group.countryName,
                  coutryCode: group.countryCode);
              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repeated') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String coutryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    this.sticker,
    required this.countryName,
    required this.coutryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final presenter = context.get<MyStickersPresenter>();
        await Navigator.of(context).pushNamed('/sticker-detail', arguments: {
          'countryCode': coutryCode,
          'stickerNumber': stickerNumber,
          'countryName': countryName,
          'stickerUser': sticker,
        });
        presenter.refresh();
      },
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? '0',
                  style: context.textStyles.textSecundaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              coutryCode,
              style: context.textStyles.textSecundaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecundaryFontExtraBold.copyWith(
                  color: sticker != null ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
