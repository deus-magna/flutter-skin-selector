import 'package:flutter/material.dart';
import 'package:skin_selector/models/brand_skin_model.dart';

class DBrandSkinSelection extends StatefulWidget {
  @override
  _DBrandSkinSelectionState createState() => _DBrandSkinSelectionState();
}

class _DBrandSkinSelectionState extends State<DBrandSkinSelection>
    with SingleTickerProviderStateMixin {
  BrandSkin _current = skins.first;
  BrandSkin _past = skins.last;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      upperBound: 2.5,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Brand Skin Selector'),
      ),
      body: Column(
        children: [
          _buildImageView(),
          _buildSelector(context),
        ],
      ),
    );
  }

  Widget _buildImageView() {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            _past.image,
            fit: BoxFit.cover,
          )),
          Positioned.fill(
              child: AnimatedBuilder(
                  animation: _controller,
                  builder: (_, __) {
                    return ClipPath(
                        clipper: _CustomClipper(_controller.value, _current),
                        child: Image.asset(
                          _current.image,
                          fit: BoxFit.cover,
                        ));
                  }))
        ],
      ),
    );
  }

  Widget _buildSelector(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Text(
          _current.name,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(color: Colors.white),
        ),
        Expanded(
          child: GridView.builder(
              padding: EdgeInsets.all(20),
              itemCount: skins.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return _SkinButton(
                  skin: skins[index],
                  selected: skins[index].color == _current.color,
                  onTap: () {
                    _onSkinSelected(skins[index]);
                  },
                );
              }),
        )
      ],
    ));
  }

  void _onSkinSelected(BrandSkin skin) {
    setState(() {
      _current = skin;
      _controller.forward(from: 0.0).whenComplete(() {
        _past = _current;
      });
    });
  }
}

class _CustomClipper extends CustomClipper<Path> {
  final double percent;
  final BrandSkin skin;

  _CustomClipper(this.percent, this.skin);

  @override
  Path getClip(Size size) {
    final path = Path();
    Offset center;

    if(skin.center == Alignment.center){
      center = Offset(size.width / 2, size.height / 2);
    } else if (skin.center == Alignment.bottomCenter) {
      center = Offset(size.width / 2, size.height);
    } else if (skin.center == Alignment.bottomLeft) {
      center = Offset(0, size.height);
    } else if (skin.center == Alignment.bottomRight) {
      center = Offset(size.width, size.height );
    } else if (skin.center == Alignment.centerRight) {
      center = Offset(size.width, size.height / 2);
    } else if (skin.center == Alignment.centerLeft) {
      center = Offset(0, size.height / 2);
    } else if (skin.center == Alignment.topCenter) {
      center = Offset(size.width / 2, 0);
    }

    path.addOval(Rect.fromCenter(
      center: center,
      width: size.width * percent,
      height: size.height * percent,
    ));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class _SkinButton extends StatelessWidget {
  final BrandSkin skin;
  final VoidCallback onTap;
  final bool selected;

  const _SkinButton({Key key, this.skin, this.onTap, this.selected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.0),
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: selected ? 5.0 : 2.0,
            ),
          ),
          child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Color(skin.color), shape: BoxShape.circle))),
    );
  }
}
