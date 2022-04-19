# banai_delayed_displays

You can delay the display of widgets with gradient and offset animations.
When your widgets are very performance-intensive and cause routing jumps to freeze, you can also pass in a placeholder to improve performance.

## How to cancel animation redrawing in listview

When using components, just pass in a unique key, for example:
```
const BanaiDelayedDisplays(
	key: Key('1'),  // add unique key
	fadeIn: true,
	from: Offset(0, 0.35),
	delay: Duration(milliseconds: 300),
	duration: Duration(milliseconds: 500),
	placelholder: Text(''),
	child: Center(
		child: Text('delayed_displays_example'),
	),
),
```



## Preview
![preview](https://raw.githubusercontent.com/ihongwu/banai_delayed_displays/main/documentation/preview.gif)


## Super simple to use
```
DelayedDisplays(
	from: const Offset(-0.35, 0.35),
	delay: const Duration(milliseconds: 300),
	duration: const Duration(milliseconds: 500),
	child: Container(
		width: 200,
		height: 50,
		color: Colors.blue,
		child: const Text('delayed_displays_example'),
	),
),
```


## Getting Started
Add dependency
```
dependencies:
  delayed_displays: ^last version
```

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

