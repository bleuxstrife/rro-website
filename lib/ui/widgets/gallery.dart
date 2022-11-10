import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:rro_web/utils/colors.dart';
import 'package:rro_web/utils/texts.dart';

class Gallery extends StatelessWidget {
  final List<String> imagePath;
  const Gallery({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: systemWhiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      titlePadding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      title: Row(children: [
        Expanded(
            child: Text("Gallery",
                style: contentPrimaryBold.copyWith(fontSize: 15.sp))),
        InkWell(
          child: Icon(
            Icons.close,
            size: 20.sp,
            color: systemPrimaryColor,
          ),
          onTap: () {
            Navigator.pop(context, false);
          },
        )
      ]),
      contentPadding: const EdgeInsets.all(16),
      content: SingleChildScrollView(child: _mainSegment(context)),
    );
  }

  _mainSegment(BuildContext context) {
    return ResponsiveGridRow(
        children: imagePath
            .map<ResponsiveGridCol>((e) => _buildItem(context, e))
            .toList());
  }

  _buildItem(BuildContext context, String path) {
    return ResponsiveGridCol(
      xl: 4,
      sm: 12,
      md: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => showDialog(
              context: context, builder: (_) => GalleryDetail(path: path)),
          child: Image.asset(
            path,
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}

class GalleryDetail extends StatelessWidget {
  final String path;
  const GalleryDetail({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: systemWhiteColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      titlePadding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      title: Row(children: [
        Expanded(
            child: Text("Detail",
                style: contentPrimaryBold.copyWith(fontSize: 15.sp))),
        InkWell(
          child: Icon(
            Icons.close,
            size: 20.sp,
            color: systemPrimaryColor,
          ),
          onTap: () {
            Navigator.pop(context, false);
          },
        )
      ]),
      contentPadding: const EdgeInsets.all(16),
      content:_mainSegment(context),
    );
  }

  Widget _mainSegment(BuildContext context) {
    return Expanded(
      child: Container(
         width: MediaQuery.of(context).size.width,
         height:MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(16.0),
          child: PhotoView(
            backgroundDecoration: BoxDecoration(color: systemWhiteColor),
            imageProvider: AssetImage(path),
            minScale: 0.3,
          )),
    );
  }
}
