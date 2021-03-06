// 数字、集合、字符串(https://dart.cn/guides/libraries/library-tour#dartcore---numbers-collections-strings-and-more)
// ignore: unused_import

import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'dart:async';

void dartcore_numbers_collections_strings_and_more() {
  print('#' * 40); // 打印40个#
  print('数字、集合、字符串等');
  assert(int.parse('42') == 42); // 将字符串转换为整数
  assert(int.parse('0x42') == 66); // 将十六进制字符串转换为整数
  assert(double.parse('0.50') == 0.5); // 将字符串转换为浮点数
  assert(int.parse('42', radix: 16) == 66); // 将十六进制字符串转换为整数
  assert(42.toString() == '42'); // 将整数转换为字符串
  assert(123.456.toString() == '123.456'); // 将浮点数转换为字符串
  assert(123.456.toStringAsFixed(2) == '123.46'); // 将浮点数转换为字符串，保留小数点后两位
  assert(123.456.toStringAsPrecision(2) == '1.2e+2'); // 将浮点数转换为字符串，保留小数点后两位
  assert(double.parse('1.2e+2') == 120.0); // 将字符串转换为浮点数
  assert('Never odd or even'.contains('odd')); // 判断字符串是否包含指定字符串
  assert('Never odd or even'.startsWith('Never')); // 判断字符串是否以指定字符串开头
  assert('Never odd or even'.endsWith('even')); // 判断字符串是否以指定字符串结尾
  assert('Never odd or even'.indexOf('odd') == 6); // 返回指定字符串在字符串中的索引
  assert('Never odd or even'.substring(6, 9) ==
      'odd'); // 返回指定索引范围内的字符串,索引范围不包含结束索引，左开右闭
  var parts = 'progressive web apps'.split(' '); // 将字符串按照指定分隔符分割为数组
  assert(parts.length == 3); // 判断数组长度
  assert(parts[0] == 'progressive'); // 判断数组第一个元素
  assert(parts[1] == 'web'); // 判断数组第二个元素
  assert(parts[2] == 'apps'); // 判断数组第三个元素
  assert('Never odd or even'[0] == 'N'); // 返回指定索引处的字符
  for (final char in 'hello'.split('')) {
    // 用空参数分割字符串为数组，遍历字符串
    print(char);
  }
  var codeUnitList =
      'Never odd or even'.codeUnits.toList(); //获取字符串中的所有UTF-16代码单元。
  assert(codeUnitList[0] == 78); // 判断第一个UTF-16代码单元
  assert('web apps'.toUpperCase() == 'WEB APPS'); // 将字符串转换为大写
  assert('WEB APPS'.toLowerCase() == 'web apps'); // 将字符串转换为小写
  assert('    hello'.trim() == 'hello'); // 去除字符串首尾空格
  assert(''.isEmpty); // 判断字符串是否为空
  assert(' '.isNotEmpty); // 判断字符串是否不为空
  var greetingTemplate = 'Hello,NAME!'; // 定义字符串模板
  var greeting =
      greetingTemplate.replaceAll(RegExp('NAME'), 'Bob'); // 替换字符串模板中的NAME
  assert(greeting != greetingTemplate); // 判断字符串是否不相等,greetingTemplate没有改变
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  var fullString = sb.toString(); // 将StringBuffer转换为字符串
  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';
  assert(!allCharacters.contains(numbers)); // 判断字符串是否不包含指定正则表达式
  assert(someDigits.contains(numbers)); // 判断字符串是否包含指定正则表达式
}

//集合(https://dart.cn/guides/libraries/library-tour#collections)
void the_lists() {
  var grains = <String>[]; // 创建一个空的字符串数组
  assert(grains.isEmpty); // 判断数组是否为空
  var fruits = ['apples', 'oranges', 'pears']; // 用字符串常量创建一个字符串数组
  fruits.add('kiwis'); // 向数组中添加一个元素
  fruits.addAll(['grapes', 'bananas']); // 向数组中添加多个元素
  assert(fruits.length == 5); // 得到数组长度
  var appleIndex = fruits.indexOf('apples'); // 返回指定元素在数组中的索引
  fruits.removeAt(appleIndex); // 移除指定索引处的元素
  assert(fruits.length == 4); // 判断数组长度
  fruits.clear(); // 清空数组
  assert(fruits.isEmpty); // 判断数组是否为空
  var vegetables = List.filled(99, 'broccoli'); // 创建一个具有指定长度和指定元素的数组,用构造器创建
  assert(vegetables.every((v) => v == 'broccoli')); // 判断数组中的所有元素是否都等于指定元素
  fruits = ['bananas', 'apples', 'oranges'];
  fruits.sort(((a, b) => a.compareTo(b))); // 对数组中的元素进行排序
  assert(fruits[0] == 'apples');
  fruits = <String>[];
  fruits.add('apples');
  var fruit = fruits[0];
  assert(fruit is String);
  //fruits.add(5);是错的，数值类型不匹配
}

void the_sets() {
  var ingredients = <String>{}; // 创建一个空的字符串集合
  ingredients.addAll(['gold', 'titanium', 'xnon']); // 向集合中添加元素
  assert(ingredients.length == 3); // 判断集合长度
  ingredients.add('gold'); // 向集合中添加重复元素,没有效果，集合长度不会变
  assert(ingredients.length == 3); // 判断集合长度
  ingredients.remove('gold'); // 移除集合中的指定元素
  assert(ingredients.length == 2); // 判断集合长度
  var atomicNumbers = Set.from([79, 22, 54]); //用构造函数创建集合
  assert(atomicNumbers.length == 3); // 判断集合长度
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.contains('titanium')); // 判断集合是否包含指定元素
  assert(ingredients.containsAll(['titanium', 'xenon'])); // 判断集合是否包含指定的所有元素
  ingredients = Set<String>();
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases); //创建两个集合的交集
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void the_maps() {
  var hawaiianBeaches = {
    'oahu': ['waikiki', 'kailua', 'waimanalo'],
    'big island': ['wailea bay', 'pololu beach'],
    'kauai': ['hanalei', 'poipu']
  }; //创建一个字典,键常用字符串
  var searchTerms = Map(); //用构造函数创建字典
  var nobleGases = Map<int, String>(); //可以指定字典的参数类型
  nobleGases = {54: 'xenon'}; // 惰性气体
  assert(nobleGases[54] == 'xenon'); // 用键检索值
  assert(nobleGases.containsKey('54')); // 判断是否包含指定键
  nobleGases.remove('54'); // 移除一个键值对
  assert(!nobleGases.containsKey('54')); // 判断是否包含指定键
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  var keys = hawaiianBeaches.keys; // 以一个无顺序的方式获取字典的键集合
  assert(keys.length == 3); // 判断键集合的长度
  assert(Set.from(keys).contains('Oahu')); // 判断键集合是否包含指定键
  var values = hawaiianBeaches.values; // 以一个无顺序的方式获取字典的值集合
  assert(values.length == 3); // 判断值集合的长度
  assert(values.any((element) => element.contains('Waikiki'))); // 判断值集合是否包含指定值
  //any用法(https://blog.csdn.net/qq_42351033/article/details/108161475)
  hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  assert(hawaiianBeaches.containsKey('Oahu')); // 判断字典是否包含指定键
  assert(!hawaiianBeaches.containsKey('Florida')); // 判断字典是否包含指定键
  var teamAssignments = <String, String>{}; // 创建一个空的字典
  String pickTougheskid() {
    return 'pickTougheskid';
  }

  teamAssignments.putIfAbsent(
      'Catcher', () => pickTougheskid()); // 如果指定键不存在,则添加键值对
  assert(teamAssignments['Catcher'] != null); // 判断字典是否包含指定键
}

//Common collection methods
void the_public_methods() {
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  //isEmpty 和 isNotEmpty 方法可以检查 list， set 或 map 对象中是否包含元素：
  assert(coffees.isEmpty); // 判断集合是否为空
  assert(teas.isNotEmpty); // 判断集合是否不为空
  teas.forEach((tea) => print(
      'I drink $tea')); // 遍历集合, forEach() 可以让 list， set 或 map 对象中的每个元素都使用一个方法
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  hawaiianBeaches.forEach((k, v) => {
        //当在 map 对象上调用 `forEach() 方法时，函数必须带两个参数（key 和 value）：
        print('I wantto visit $k and swim at $v'),
      });
  var loudTeas = teas.map(
      (tea) => tea.toUpperCase()); //Iterable 提供 map() 方法，这个方法将所有结果返回到一个对象中。
  loudTeas.forEach(print);
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();
  bool isDecaffeinated(String name) => name == 'chamomile'; //判断是否含有咖啡因
  var decaffeinatedTeas =
      teas.where((element) => isDecaffeinated(element)); //用where()方法过滤集合
  //or teas.where(isDecaffeinated);
  assert(teas.any(isDecaffeinated)); //用any()方法判断集合中是否包含指定元素,只需要一个元素满足即可
  assert(!teas.every(isDecaffeinated)); //用every()方法判断集合中是否包含指定元素,所有元素都满足才可以
}

void collections() {
  print('\n');
  print('#' * 40);
  print('集合');
  print('#' * 40);
  the_lists();
  the_sets();
  the_maps();
  the_public_methods();
}

// URIs (https://dart.cn/guides/libraries/library-tour#uris)
void uris() {
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri); //对特殊字符（例如 /， :， &， #）以外的字符进行编码
  assert(encoded == 'http://example.org/api?foo=some%20message');
  var decoded = Uri.decodeFull(encoded); //对特殊字符（例如 /， :， &， #）以外的字符进行解码
  assert(uri == decoded);
  //上述两个方法只是对URi中的特殊字符空格进行编解码
  encoded = Uri.encodeComponent(
      uri); //使用encodeComponent()方法对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :编码
  assert(encoded == 'http%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  decoded = Uri.decodeComponent(
      encoded); //使用decodeComponent()方法对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :解码
  assert(uri == decoded);
  //上述方法中/被编码为%2F，&被编码为%26，:被编码为%3A
  var uri2 = Uri.parse(
      'https://example.org:8080/foo/bar#frag'); //使用parse()方法将字符串解析为 URI 对象
  assert(uri2.scheme == 'https'); //获取 URI 的 scheme
  assert(uri2.host == 'example.org'); //获取 URI 的 host
  assert(uri2.port == 8080); //获取 URI 的 port
  assert(uri2.path == '/foo/bar'); //获取 URI 的 path
  assert(uri2.fragment == 'frag'); //获取 URI 的 fragment
  assert(uri2.origin == 'https://example.org:8080'); //获取 URI 的 origin
  var uri3 = Uri(
      scheme: 'https',
      host: 'example.org',
      path: 'foo/bar',
      fragment: 'frag'); //使用构造函数创建 URI 对象
}

// 时间和日期 （https://dart.cn/guides/libraries/library-tour#dates-and-times）
void date_and_times() {
  print('\n');
  print('#' * 40);
  print('时间和日期');
  print('#' * 40);
  var now = DateTime.now(); //获取当前时间
  var y2k = DateTime(2000); //创建一个 DateTime 对象，并将其设置为 2000 年 1 月 1 日
  y2k = DateTime(2000, 1, 2); //创建一个 DateTime 对象，并将其设置为 2000 年 1 月 2 日
  y2k = DateTime.utc(
      2000, 1, 2); //创建一个 DateTime 对象，并将其设置为 2000 年 1 月 2 日，并将其设置为 UTC 时间
  y2k = DateTime.fromMicrosecondsSinceEpoch(946684800000,
      isUtc: true); //从Unix纪元开始，以ms为单位指定日期和时间
  y2k = DateTime.parse('2000-01-01T00:00:00.000Z'); //从字符串中解析日期和时间
  y2k =
      DateTime.utc(2000); //创建一个 DateTime 对象，并将其设置为 2000 年 1 月 1 日，并将其设置为 UTC 时间
  assert(y2k.millisecondsSinceEpoch == 946684800000);
  var unixEpoch = DateTime.utc(1970); //1/1/1970 UTC
  assert(unixEpoch.millisecondsSinceEpoch == 0);
  y2k = DateTime.utc(2000);
  var y2001 = y2k.add(const Duration(days: 366)); //将 DateTime 对象增加一年
  var december2000 =
      y2001.subtract(const Duration(days: 30)); //将 DateTime 对象减少一个月
  assert(december2000.month == 12);
  assert(december2000.year == 2000);
  var duration = y2001.difference(y2k); //计算两个 DateTime 对象的差值
  assert(duration.inDays == 366); //y2k是闰年
}

// 工具类 （https://dart.cn/guides/libraries/library-tour#utility-classes）
class Line implements Comparable<Line> {
  //实现Comparable接口，通常用于排序
  final int length;
  const Line(this.length);
  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  //用Object 类提供的静态方法，为对象内的多个属性生成单一的哈希值
  final String firstName, lastName;
  Person(this.firstName, this.lastName);
  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == this.firstName &&
        other.lastName == this.lastName;
  }
}

class Process {
  //Represents a process
  final String name;
  Process(this.name);
}

class ProcessIterator implements Iterator<Process> {
  //Represents an iterator over a collection of processes
  final List<Process> _processes;
  int _index = 0;
  ProcessIterator(this._processes);
  @override
  Process get current => _processes[_index];
  @override
  bool moveNext() {
    var hasNext = _index < _processes.length;
    if (hasNext) _index++;
    return hasNext;
  }
}

class ProcessIterable extends IterableBase<Process> {
  //Represents an iterable over a collection of processes
  final List<Process> _processes;
  ProcessIterable(this._processes);
  @override
  Iterator<Process> get iterator => ProcessIterator(_processes);
}

void utility_classes() {
  print('\n');
  print('#' * 40);
  print('工具类');
  print('#' * 40);
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);
  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode); //两个对象的哈希值相同
  assert(p1 != p3); //两个对象不相等
}

// 异常 (https://dart.cn/guides/libraries/library-tour#exceptions)
class FooException implements Exception {
  final String? message;
  const FooException([this.message]);
  @override
  String toString() => message ?? 'FooException';
}

void testFooException() {
  try {
    throw FooException('测试异常');
  } on FooException catch (e) {
    print(e);
  }
}

// 异步编程 (https://dart.cn/guides/libraries/library-tour#dartasync---asynchronous-programming)
Future<Function> findEntryPoint() async {
  await Future.delayed(Duration(seconds: 1));
  return print;
}

// 以args为参数执行exec函数
Future<int> runExecutable(exec, args) async {
  exec(args);
  return 0;
}

// 分析exit code，此处直接输出一下
Future<void> flushThenExit(code) async {
  print('exit with code $code');
}

// 使用then链式回调按顺序执行异步函数
void runUsingFuture() {
  findEntryPoint().then((entryPoint) {
    return runExecutable(entryPoint, "using then to callback.");
  }).then(flushThenExit);
}

// 使用await可以写出类似于同步的异步代码
Future<void> runUsingAsyncAwait() async {
  var entryPoint = await findEntryPoint();
  try {
    var exitCode = await runExecutable(entryPoint, 'using await to callback.');
    await flushThenExit(exitCode);
  } catch (e) {}
}

Future<void> throw_error_future(bool flag) async {
  if (!flag) {
    throw FooException('Exception in async function.');
  } else {
    print('No throwing Exception in async function.');
  }
}

// catch异步函数中抛出的异常
void catch_error(bool flag) {
  throw_error_future(flag).then((_) {}).catchError((e) {
    print(e);
  });
}

void async_test() {
  print('\n');
  print('#' * 40);
  print('异步Future测试');
  print('#' * 40);
  runUsingFuture();
  runUsingAsyncAwait();
  catch_error(false);
}

//数学和随机数(https://dart.cn/guides/libraries/library-tour#math-and-random)
void math_and_random() {
  print('\n');
  print('#' * 40);
  print('数学和随机数');
  print('#' * 40);
  assert(cos(pi) == -1.0); //cos(π)
  var degrees = 30;
  var radians = degrees * (pi / 180); //radians is π/6
  var sinof30degrees = sin(radians); //sin(30°)=0.5
  assert((sinof30degrees - 0.5).abs() < 0.01); //sin(30°)
  assert(max(1, 1000) == 1000); //max(1, 1000)
  assert(min(1, -1000) == -1000); //min(1, -1000)
  //其他数学库中的常量
  print(e); //2.718281828459045
  print(pi); //3.141592653589793
  print(sqrt2); //1.4142135623730951
  var random = Random();
  var value1 = random.nextDouble(); //在0.0和1.0之间，左闭右开区间
  print('nextDouble: $value1');
  var value2 = random.nextInt(10); //在0和10之间，左闭右开区间
  print('nextInt: $value2');
  var value3 = random.nextBool(); //true or false
  print('nextBool: $value3');
}

//编解码(https://dart.cn/guides/libraries/library-tour#dartconvert---decoding-and-encoding-json-utf-8-and-more)
void decoding_and_encoding_json_utf_8_and_more() {
  print('\n');
  print('#' * 40);
  print('编解码');
  print('#' * 40);
  print('编解码json');
  var jsonString = '''
  [
    {"score": 40},
    {"score": 80}
  ]
'''; //在json中用双引号不是单引号
  var scores =
      jsonDecode(jsonString); //使用 jsonDecode() 解码 JSON 编码的字符串为 Dart 对象：
  assert(scores is List); //true
  var firstScore = scores[0];
  assert(firstScore is Map); //true
  assert(firstScore['score'] == 40); //true
  scores = [
    {'score': 40},
    {'score': 80},
    {'score': 100, 'overtime': true, 'special_guest': null}
  ];
  var jsonText = jsonEncode(scores); //使用 jsonEncode() 编码 Dart 对象为 JSON 字符串：
  assert(jsonText ==
      '[{"score":40},{"score":80},{"score":100,"overtime":true,"special_guest":null}]'); //true
  print('编解码UTF-8');
  List<int> utf8Bytes = [
    0xc3,
    0x8e,
    0xc3,
    0xb1,
    0xc5,
    0xa3,
    0xc3,
    0xa9,
    0x72,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xc3,
    0xb6,
    0xc3,
    0xb1,
    0xc3,
    0xa5,
    0xc4,
    0xbc,
    0xc3,
    0xae,
    0xc5,
    0xbe,
    0xc3,
    0xa5,
    0xc5,
    0xa3,
    0xc3,
    0xae,
    0xe1,
    0xbb,
    0x9d,
    0xc3,
    0xb1
  ];
  var funnyWorld =
      utf8.decode(utf8Bytes); //使用 utf8.decode() 解码 UTF8 编码的字符创为 Dart 字符串：
  assert(funnyWorld == 'Îñţérñåţîöñåļîžåţîờñ'); //true
  List<int> encoded = utf8.encode(
      'Îñţérñåţîöñåļîžåţîờñ'); //使用 utf8.encode() 将 Dart 字符串编码为一个 UTF8 编码的字节流：
  assert(encoded.length == utf8Bytes.length);
  for (int i = 0; i < encoded.length; i++) {
    assert(encoded[i] == utf8Bytes[i]);
  }
}
//基于浏览器应用(https://dart.cn/guides/libraries/library-tour#darthtml)

void main(List<String> args) {
  //数字、集合、字符串测试
  dartcore_numbers_collections_strings_and_more();
  //集合测试
  collections();
  //uris测试
  uris();
  //日期和时间
  date_and_times();
  //工具类
  utility_classes();
  //异常
  testFooException();
  //异步测试
  async_test();
  testFooException();
  //数学和随机数
  math_and_random();
  //编解码
  decoding_and_encoding_json_utf_8_and_more();
}
