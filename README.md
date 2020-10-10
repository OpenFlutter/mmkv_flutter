# mmkv_flutter

Plugin that allow Flutter to read  value from persistent storage or save value to persistent storage based on MMKV framework

## Getting Started

Open terminal, cd to your project directory, run pod repo update to make CocoaPods aware of the latest available MMKV versions

## Quick Tutorial

```dart

  MmkvFlutter mmkv = await MmkvFlutter.getInstance();

  mmkv.setBool('boolKey', true);
  print('get bool value is ${ await mmkv.getBool('boolKey')}');
  
  int counter = await mmkv.getInt('intKey') + 1;
  print('GetSetIntTest value is $counter ');
  await mmkv.setInt('intKey', counter);
  
  String stringtest = await mmkv.getString('stringKey') + '1';
  print('GetSetStringTest value is $stringtest');
  await mmkv.setString('stringKey', stringtest);

```

## Change Log

**1.1.2**  `2020.10.10`

> * 新增仅删除Flutter侧缓存（remove from flutter mmkvCache）
> * 执行clear操作时，默认删除带'mmkv.flutter.'前缀的key，不会清空defaultMMKV缓存池
