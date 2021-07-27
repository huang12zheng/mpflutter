// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
// Synced 2019-05-30T14:20:57.841444.

part of dart.ui;

typedef VoidCallback = void Function();
typedef FrameCallback = void Function(Duration duration);
typedef TimingsCallback = void Function(List<FrameTiming> timings);
typedef PointerDataPacketCallback = void Function(PointerDataPacket packet);
typedef PlatformMessageResponseCallback = void Function(ByteData? data);
typedef PlatformMessageCallback = void Function(
    String name, ByteData? data, PlatformMessageResponseCallback? callback);

enum AppLifecycleState {
  resumed,
  inactive,
  paused,
  detached,
}

abstract class WindowPadding {
  const factory WindowPadding._({
    required double left,
    required double top,
    required double right,
    required double bottom,
  }) = MockWindowPadding;

  double get left;
  double get top;
  double get right;
  double get bottom;

  static const WindowPadding zero =
      WindowPadding._(left: 0.0, top: 0.0, right: 0.0, bottom: 0.0);

  @override
  String toString() {
    return 'WindowPadding(left: $left, top: $top, right: $right, bottom: $bottom)';
  }
}

class Locale {
  const Locale(
    this._languageCode, [
    this._countryCode,
  ])  : assert(_languageCode != null), // ignore: unnecessary_null_comparison
        assert(_languageCode != ''),
        scriptCode = null;
  const Locale.fromSubtags({
    String languageCode = 'und',
    this.scriptCode,
    String? countryCode,
  })  : assert(languageCode != null), // ignore: unnecessary_null_comparison
        assert(languageCode != ''),
        _languageCode = languageCode,
        assert(scriptCode != ''),
        assert(countryCode != ''),
        _countryCode = countryCode;
  String get languageCode =>
      _deprecatedLanguageSubtagMap[_languageCode] ?? _languageCode;
  final String _languageCode;

  // This map is generated by //flutter/tools/gen_locale.dart
  // Mappings generated for language subtag registry as of 2019-02-27.
  static const Map<String, String> _deprecatedLanguageSubtagMap =
      <String, String>{
    'in': 'id', // Indonesian; deprecated 1989-01-01
    'iw': 'he', // Hebrew; deprecated 1989-01-01
    'ji': 'yi', // Yiddish; deprecated 1989-01-01
    'jw': 'jv', // Javanese; deprecated 2001-08-13
    'mo': 'ro', // Moldavian, Moldovan; deprecated 2008-11-22
    'aam': 'aas', // Aramanik; deprecated 2015-02-12
    'adp': 'dz', // Adap; deprecated 2015-02-12
    'aue': 'ktz', // ǂKxʼauǁʼein; deprecated 2015-02-12
    'ayx': 'nun', // Ayi (China); deprecated 2011-08-16
    'bgm': 'bcg', // Baga Mboteni; deprecated 2016-05-30
    'bjd': 'drl', // Bandjigali; deprecated 2012-08-12
    'ccq': 'rki', // Chaungtha; deprecated 2012-08-12
    'cjr': 'mom', // Chorotega; deprecated 2010-03-11
    'cka': 'cmr', // Khumi Awa Chin; deprecated 2012-08-12
    'cmk': 'xch', // Chimakum; deprecated 2010-03-11
    'coy': 'pij', // Coyaima; deprecated 2016-05-30
    'cqu': 'quh', // Chilean Quechua; deprecated 2016-05-30
    'drh': 'khk', // Darkhat; deprecated 2010-03-11
    'drw': 'prs', // Darwazi; deprecated 2010-03-11
    'gav': 'dev', // Gabutamon; deprecated 2010-03-11
    'gfx': 'vaj', // Mangetti Dune ǃXung; deprecated 2015-02-12
    'ggn': 'gvr', // Eastern Gurung; deprecated 2016-05-30
    'gti': 'nyc', // Gbati-ri; deprecated 2015-02-12
    'guv': 'duz', // Gey; deprecated 2016-05-30
    'hrr': 'jal', // Horuru; deprecated 2012-08-12
    'ibi': 'opa', // Ibilo; deprecated 2012-08-12
    'ilw': 'gal', // Talur; deprecated 2013-09-10
    'jeg': 'oyb', // Jeng; deprecated 2017-02-23
    'kgc': 'tdf', // Kasseng; deprecated 2016-05-30
    'kgh': 'kml', // Upper Tanudan Kalinga; deprecated 2012-08-12
    'koj': 'kwv', // Sara Dunjo; deprecated 2015-02-12
    'krm': 'bmf', // Krim; deprecated 2017-02-23
    'ktr': 'dtp', // Kota Marudu Tinagas; deprecated 2016-05-30
    'kvs': 'gdj', // Kunggara; deprecated 2016-05-30
    'kwq': 'yam', // Kwak; deprecated 2015-02-12
    'kxe': 'tvd', // Kakihum; deprecated 2015-02-12
    'kzj': 'dtp', // Coastal Kadazan; deprecated 2016-05-30
    'kzt': 'dtp', // Tambunan Dusun; deprecated 2016-05-30
    'lii': 'raq', // Lingkhim; deprecated 2015-02-12
    'lmm': 'rmx', // Lamam; deprecated 2014-02-28
    'meg': 'cir', // Mea; deprecated 2013-09-10
    'mst': 'mry', // Cataelano Mandaya; deprecated 2010-03-11
    'mwj': 'vaj', // Maligo; deprecated 2015-02-12
    'myt': 'mry', // Sangab Mandaya; deprecated 2010-03-11
    'nad': 'xny', // Nijadali; deprecated 2016-05-30
    'ncp': 'kdz', // Ndaktup; deprecated 2018-03-08
    'nnx': 'ngv', // Ngong; deprecated 2015-02-12
    'nts': 'pij', // Natagaimas; deprecated 2016-05-30
    'oun': 'vaj', // ǃOǃung; deprecated 2015-02-12
    'pcr': 'adx', // Panang; deprecated 2013-09-10
    'pmc': 'huw', // Palumata; deprecated 2016-05-30
    'pmu': 'phr', // Mirpur Panjabi; deprecated 2015-02-12
    'ppa': 'bfy', // Pao; deprecated 2016-05-30
    'ppr': 'lcq', // Piru; deprecated 2013-09-10
    'pry': 'prt', // Pray 3; deprecated 2016-05-30
    'puz': 'pub', // Purum Naga; deprecated 2014-02-28
    'sca': 'hle', // Sansu; deprecated 2012-08-12
    'skk': 'oyb', // Sok; deprecated 2017-02-23
    'tdu': 'dtp', // Tempasuk Dusun; deprecated 2016-05-30
    'thc': 'tpo', // Tai Hang Tong; deprecated 2016-05-30
    'thx': 'oyb', // The; deprecated 2015-02-12
    'tie': 'ras', // Tingal; deprecated 2011-08-16
    'tkk': 'twm', // Takpa; deprecated 2011-08-16
    'tlw': 'weo', // South Wemale; deprecated 2012-08-12
    'tmp': 'tyj', // Tai Mène; deprecated 2016-05-30
    'tne': 'kak', // Tinoc Kallahan; deprecated 2016-05-30
    'tnf': 'prs', // Tangshewi; deprecated 2010-03-11
    'tsf': 'taj', // Southwestern Tamang; deprecated 2015-02-12
    'uok': 'ema', // Uokha; deprecated 2015-02-12
    'xba': 'cax', // Kamba (Brazil); deprecated 2016-05-30
    'xia': 'acn', // Xiandao; deprecated 2013-09-10
    'xkh': 'waw', // Karahawyana; deprecated 2016-05-30
    'xsj': 'suj', // Subi; deprecated 2015-02-12
    'ybd': 'rki', // Yangbye; deprecated 2012-08-12
    'yma': 'lrr', // Yamphe; deprecated 2012-08-12
    'ymt': 'mtm', // Mator-Taygi-Karagas; deprecated 2015-02-12
    'yos': 'zom', // Yos; deprecated 2013-09-10
    'yuu': 'yug', // Yugh; deprecated 2014-02-28
  };
  final String? scriptCode;
  String? get countryCode =>
      _deprecatedRegionSubtagMap[_countryCode] ?? _countryCode;
  final String? _countryCode;

  // This map is generated by //flutter/tools/gen_locale.dart
  // Mappings generated for language subtag registry as of 2019-02-27.
  static const Map<String, String> _deprecatedRegionSubtagMap =
      <String, String>{
    'BU': 'MM', // Burma; deprecated 1989-12-05
    'DD': 'DE', // German Democratic Republic; deprecated 1990-10-30
    'FX': 'FR', // Metropolitan France; deprecated 1997-07-14
    'TP': 'TL', // East Timor; deprecated 2002-05-20
    'YD': 'YE', // Democratic Yemen; deprecated 1990-08-14
    'ZR': 'CD', // Zaire; deprecated 1997-07-14
  };

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is Locale &&
        other.languageCode == languageCode &&
        other.scriptCode == scriptCode &&
        other.countryCode == countryCode;
  }

  @override
  int get hashCode => hashValues(languageCode, scriptCode, countryCode);

  @override
  String toString() => _rawToString('_');

  // TODO(yjbanov): implement to match flutter native.
  String toLanguageTag() => _rawToString('-');

  String _rawToString(String separator) {
    final StringBuffer out = StringBuffer(languageCode);
    if (scriptCode != null) {
      out.write('$separator$scriptCode');
    }
    if (_countryCode != null) {
      out.write('$separator$countryCode');
    }
    return out.toString();
  }
}

abstract class Window {
  double get devicePixelRatio;
  Size get physicalSize;
  WindowPadding get viewInsets => WindowPadding.zero;
  WindowPadding get viewPadding => WindowPadding.zero;
  WindowPadding get systemGestureInsets => WindowPadding.zero;
  WindowPadding get padding => WindowPadding.zero;
  double get textScaleFactor => _textScaleFactor;
  double _textScaleFactor = 1.0;
  bool get alwaysUse24HourFormat => _alwaysUse24HourFormat;
  bool _alwaysUse24HourFormat = false;
  VoidCallback? get onTextScaleFactorChanged;
  set onTextScaleFactorChanged(VoidCallback? callback);
  Brightness get platformBrightness;
  VoidCallback? get onPlatformBrightnessChanged;
  set onPlatformBrightnessChanged(VoidCallback? callback);
  VoidCallback? get onMetricsChanged;
  set onMetricsChanged(VoidCallback? callback);
  Locale? get locale;
  List<Locale>? get locales;
  Locale? computePlatformResolvedLocale(List<Locale> supportedLocales) {
    // TODO(garyq): Implement on web.
    return null;
  }

  VoidCallback? get onLocaleChanged;
  set onLocaleChanged(VoidCallback? callback);
  void scheduleFrame();
  FrameCallback? get onBeginFrame;
  set onBeginFrame(FrameCallback? callback);
  TimingsCallback? get onReportTimings;
  set onReportTimings(TimingsCallback? callback);
  VoidCallback? get onDrawFrame;
  set onDrawFrame(VoidCallback? callback);
  PointerDataPacketCallback? get onPointerDataPacket;
  set onPointerDataPacket(PointerDataPacketCallback? callback);
  String get defaultRouteName;
  bool get semanticsEnabled => false;
  VoidCallback? get onSemanticsEnabledChanged;
  set onSemanticsEnabledChanged(VoidCallback? callback);
  VoidCallback? get onAccessibilityFeaturesChanged;
  set onAccessibilityFeaturesChanged(VoidCallback? callback);
  PlatformMessageCallback? get onPlatformMessage;
  set onPlatformMessage(PlatformMessageCallback? callback);

  void sendPlatformMessage(
    String name,
    ByteData? data,
    PlatformMessageResponseCallback? callback,
  );
  AccessibilityFeatures get accessibilityFeatures => _accessibilityFeatures;
  AccessibilityFeatures _accessibilityFeatures = AccessibilityFeatures._(0);
  void render(Scene scene);

  String get initialLifecycleState => 'AppLifecycleState.resumed';

  void setIsolateDebugName(String name) {}

  ByteData? getPersistentIsolateData() => null;
}

class AccessibilityFeatures {
  const AccessibilityFeatures._(this._index);

  static const int _kAccessibleNavigation = 1 << 0;
  static const int _kInvertColorsIndex = 1 << 1;
  static const int _kDisableAnimationsIndex = 1 << 2;
  static const int _kBoldTextIndex = 1 << 3;
  static const int _kReduceMotionIndex = 1 << 4;
  static const int _kHighContrastIndex = 1 << 5;

  // A bitfield which represents each enabled feature.
  final int _index;
  bool get accessibleNavigation => _kAccessibleNavigation & _index != 0;
  bool get invertColors => _kInvertColorsIndex & _index != 0;
  bool get disableAnimations => _kDisableAnimationsIndex & _index != 0;
  bool get boldText => _kBoldTextIndex & _index != 0;
  bool get reduceMotion => _kReduceMotionIndex & _index != 0;
  bool get highContrast => _kHighContrastIndex & _index != 0;

  @override
  String toString() {
    final List<String> features = <String>[];
    if (accessibleNavigation) {
      features.add('accessibleNavigation');
    }
    if (invertColors) {
      features.add('invertColors');
    }
    if (disableAnimations) {
      features.add('disableAnimations');
    }
    if (boldText) {
      features.add('boldText');
    }
    if (reduceMotion) {
      features.add('reduceMotion');
    }
    if (highContrast) {
      features.add('highContrast');
    }
    return 'AccessibilityFeatures$features';
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is AccessibilityFeatures && other._index == _index;
  }

  @override
  int get hashCode => _index.hashCode;
}

enum Brightness {
  dark,
  light,
}

// Unimplemented classes.
// TODO(flutter_web): see https://github.com/flutter/flutter/issues/33614.
class CallbackHandle {
  CallbackHandle.fromRawHandle(this._handle)
      : assert(_handle != null,
            "'_handle' must not be null."); // ignore: unnecessary_null_comparison

  final int _handle;

  int toRawHandle() => _handle;

  @override
  bool operator ==(Object other) => identical(this, other);

  @override
  int get hashCode => super.hashCode;
}

// TODO(flutter_web): see https://github.com/flutter/flutter/issues/33615.
class PluginUtilities {
  // This class is only a namespace, and should not be instantiated or
  // extended directly.
  factory PluginUtilities._() => throw UnsupportedError('Namespace');

  static CallbackHandle? getCallbackHandle(Function callback) {
    throw UnimplementedError();
  }

  static Function? getCallbackFromHandle(CallbackHandle handle) {
    throw UnimplementedError();
  }
}

// TODO(flutter_web): probably dont implement this one.
class IsolateNameServer {
  // This class is only a namespace, and should not be instantiated or
  // extended directly.
  factory IsolateNameServer._() => throw UnsupportedError('Namespace');

  static dynamic lookupPortByName(String name) {
    throw UnimplementedError();
  }

  static bool registerPortWithName(dynamic port, String name) {
    throw UnimplementedError();
  }

  static bool removePortNameMapping(String name) {
    throw UnimplementedError();
  }
}

enum FramePhase {
  vsyncStart,
  buildStart,
  buildFinish,
  rasterStart,
  rasterFinish,
}

class FrameTiming {
  factory FrameTiming({
    required int vsyncStart,
    required int buildStart,
    required int buildFinish,
    required int rasterStart,
    required int rasterFinish,
  }) {
    return FrameTiming._(
        <int>[vsyncStart, buildStart, buildFinish, rasterStart, rasterFinish]);
  }
  FrameTiming._(List<int> timestamps)
      : assert(timestamps.length == FramePhase.values.length),
        _timestamps = timestamps;

  int timestampInMicroseconds(FramePhase phase) => _timestamps[phase.index];

  Duration _rawDuration(FramePhase phase) =>
      Duration(microseconds: _timestamps[phase.index]);
  Duration get buildDuration =>
      _rawDuration(FramePhase.buildFinish) -
      _rawDuration(FramePhase.buildStart);
  Duration get rasterDuration =>
      _rawDuration(FramePhase.rasterFinish) -
      _rawDuration(FramePhase.rasterStart);
  Duration get vsyncOverhead =>
      _rawDuration(FramePhase.buildStart) - _rawDuration(FramePhase.vsyncStart);
  Duration get totalSpan =>
      _rawDuration(FramePhase.rasterFinish) -
      _rawDuration(FramePhase.vsyncStart);

  final List<int> _timestamps; // in microseconds

  String _formatMS(Duration duration) => '${duration.inMicroseconds * 0.001}ms';

  @override
  String toString() {
    return '$runtimeType(buildDuration: ${_formatMS(buildDuration)}, rasterDuration: ${_formatMS(rasterDuration)}, vsyncOverhead: ${_formatMS(vsyncOverhead)}, totalSpan: ${_formatMS(totalSpan)})';
  }
}

Window get window => mockWindow;
