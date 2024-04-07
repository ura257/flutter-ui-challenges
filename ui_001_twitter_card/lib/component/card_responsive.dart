import 'package:flutter/material.dart';
import 'package:ui_001_twitter_card/component/button_layout.dart';
import 'package:ui_001_twitter_card/component/hover_text_link.dart';
import 'package:ui_001_twitter_card/component/icon_text_layout.dart';
import 'package:ui_001_twitter_card/component/img_svg.dart';
import 'package:ui_001_twitter_card/const/color.dart';

class CardResponsive extends StatelessWidget {
  final String formattedDate;

  const CardResponsive({
    super.key,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    // MediaQuery 화면 너비
    double screenWidth = MediaQuery.sizeOf(context).width;
    // 화면 너비에 따라 카드의 너비를 조정
    double cardWidth = screenWidth > 600 ? 500 : screenWidth * 0.9;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: cardWidth,
      ),
      child: Container(
        margin: const EdgeInsets.fromLTRB(12, 6, 12, 6),
        child: Card(
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _CardHeader(),
              const SizedBox(height: 12.0),
              _CardContent(),
              SizedBox(height: 8.0),
              _CardTwitInfo(
                twitDate: formattedDate,
              ),
              SizedBox(height: 8.0),
              _ResponsiveUnderline(),
              SizedBox(height: 8.0),
              _CardInteractions(),
              SizedBox(height: 8.0),
              ButtonLayout(
                buttonName: 'Read 19 replies',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
} //CardResponsive

class _CardHeader extends StatelessWidget {
  const _CardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 좌측 프로필 정보
          ProfileInfo(),
          // 우측 로고 "X"
          ImgSvg(
            imgName: 'icon_x',
            width: 25,
            height: 25,
          )
        ],
      ),
    );
  }
} //_CardHeader

class _CardContent extends StatelessWidget {
  const _CardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Did you know?\n\n'
          'When you call `MediaQuery.of(context)` inside a build method, the widget will rebuild when *any* of the MediaQuery properties change.\n\n'
          'But there\'s a better way that lets you depend only on the properties you care about (and minimize unnecessary rebuilds). 👇\n',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        // ClipRRect : 자식 위젯의 모서리를 둥글게 잘라내어 표시
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset('asset/images/media-query-banner.jpg'),
        ),
      ],
    );
  }
} //_CardContent



//intl 패키지의 DateFormat 클래스를 사용하여 다양한 형식의 날짜와 시간을 표시
class _CardTwitInfo extends StatelessWidget {
  final String twitDate;

  const _CardTwitInfo({
    super.key,
    required this.twitDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          twitDate,
          style: TextStyle(
            color: AppColor.grey,
          ),
        ),
        ImgSvg(
          imgName: 'icon_info',
          applyColorFilter: true,
          imgColor: AppColor.grey,
        ),
      ],
    );
  }
} //_CardTwitInfo

class _ResponsiveUnderline extends StatelessWidget {
  const _ResponsiveUnderline({super.key});

  @override
  Widget build(BuildContext context) {
    // MediaQuery로 화면 너비 가져오기 //***카드너비로 변경 필요 */
    double screenWidth = MediaQuery.of(context).size.width;
    // 화면 너비에 따라 밑줄의 너비 조정
    double underlineWidth = screenWidth * 1.0;

    return Container(
      width: underlineWidth,
      height: 1.0, // 밑줄의 두께 설정
      color: AppColor.greyLight, // 밑줄 색상 설정
    );
  }
} //_ResponsiveUnderline

class _CardInteractions extends StatelessWidget {
  const _CardInteractions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconTextLayout(
          lable: '997',
          imgName: 'icon_heart_red',
          applyColorFilter: true,
          imgColor: AppColor.pink,
        ),
        SizedBox(
          width: 10,
        ),
        IconTextLayout(
          lable: 'Replay',
          imgName: 'icon_comment',
          applyColorFilter: true,
          imgColor: AppColor.primary,
        ),
        SizedBox(
          width: 10,
        ),
        IconTextLayout(
          lable: 'Copy link',
          imgName: 'icon_link',
        ),
      ],
    );
  }
}//_CardInteractions

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipOval(
          child: Image.asset(
            'asset/images/andrea-avatar.png',
            // width: 60,
            // height: 60,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HoverTextLink(
                    text: 'Andrea Bizzotto',
                    url: 'https://twitter.com/intent/follow?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1671085759858606081%7Ctwgr%5Eb5ea53987884af77016ff878a44318b5a3c63517%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fpro.codewithandrea.com%2Fflutter-ui-challenges%2F001-twitter-embed-card%2F01-intro&screen_name=biz84',
                    underlineColor: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ImgSvg(
                    imgName: 'icon_heart_blue',
                  ),
                  SizedBox(
                    width: 4.0,
                  ),
                  ImgSvg(
                    imgName: 'icon_verified',
                    applyColorFilter: true,
                    imgColor: AppColor.primary,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '@biz84 ・ ',
                    style: TextStyle(
                      color: AppColor.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Follow',
                    style: TextStyle(
                      color: AppColor.textBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

