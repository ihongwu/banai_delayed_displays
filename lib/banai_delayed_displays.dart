import 'dart:async';
import 'package:flutter/material.dart';
List keys = [];
class BanaiDelayedDisplays extends StatefulWidget {
  /// Child that will be displayed with the animation and delay
  final Widget child;

  /// The placeholder widget sets components that are as close to the actual widget as possible
  final Widget ? placelholder;

  /// Delay before displaying the widget and the animations
  final Duration delay;

  /// Duration of the fading animation
  final Duration duration;

  /// Curve of the sliding animation
  final Curve curve;

  /// Offset of the widget at the beginning of the sliding animation
  final Offset from;

  /// If true, make the child appear, disappear otherwise. Default to true.
  final bool fadeIn;
  const BanaiDelayedDisplays(
    {Key? key,
    required this.child, 
    this.placelholder,
    this.delay = const Duration(milliseconds: 420), 
    this.duration = const Duration(milliseconds: 600), 
    this.curve = Curves.decelerate, 
    this.from = const Offset(0, 0),
    this.fadeIn = true}) : super(key: key);
  @override
  State<BanaiDelayedDisplays> createState() => _BanaiDelayedDisplaysState();
}

class _BanaiDelayedDisplaysState extends State<BanaiDelayedDisplays> with TickerProviderStateMixin{
  
  // whether to display child
  bool showChild = false;

  /// last displayed widget
  Widget ? result;

  /// Controller of the opacity animation
  late AnimationController _opacityController;

  /// Sliding Animation offset
  late Animation<Offset> _slideAnimationOffset;

  late Duration delay;

  /// Timer used to delayed animation
  Timer ? _timer;

  @override
  void initState() {
    super.initState();

    delay = widget.delay;
    var key = widget.key;

    bool isanimate = true;
    
    if(keys.contains(key.toString())) {
      isanimate = false;
      delay = Duration.zero;
    }

    _opacityController = AnimationController(
      vsync: this,
      duration: isanimate ? widget.duration : Duration.zero,
    );

    final CurvedAnimation curvedAnimation = CurvedAnimation(
      curve: widget.curve,
      parent: _opacityController,
    );

    _slideAnimationOffset = Tween<Offset>(
      begin: widget.from,
      end: Offset.zero,
    ).animate(curvedAnimation);
    
    if(key != null) {
      if(!keys.contains(key.toString())) {
        keys.add(key.toString());
      }
    }
    
    _runFadeAnimation();
  }


  @override
  void didUpdateWidget(BanaiDelayedDisplays oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (
      oldWidget.fadeIn != widget.fadeIn
    ) {
      _runFadeAnimation();
    }

    if(
      oldWidget.child != widget.child ||
      oldWidget.curve != widget.curve || 
      oldWidget.delay != widget.delay || 
      oldWidget.duration != widget.duration || 
      oldWidget.from != widget.from || 
      oldWidget.placelholder != widget.placelholder
    ) {
      setState(() {});
    }
    return ;
  }


  void _runFadeAnimation() {
    _timer = Timer(delay, () {
      result = widget.child;
      showChild = true;
      setState(() {});
      widget.fadeIn ? _opacityController.forward() : _opacityController.reverse();
    });
  }

  /// Dispose the opacity controller
  @override
  void dispose() {
    _opacityController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return showChild || widget.placelholder == null ? FadeTransition(
        opacity: _opacityController,
        child: SlideTransition(
          position: _slideAnimationOffset,
          child: widget.child,
        ),
      ) : widget.placelholder!;
  }
}