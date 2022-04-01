//变量(https://dart.cn/samples#variables)
/**
 * 打印dart中各种变量
 */
import 'dart:math';
import 'dart:io';

void printVariable() {
  var name = 'Voyaga I';
  var year = 1997;
  var antennaDiameter = 3.7;
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  var img = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };
  print(
      'name is $name,year is $year,antennaDiameter is $antennaDiameter,flybyObjects is $flybyObjects,img is $img');
}

//流程控制语句(https://dart.cn/samples#control-flow-statements)
/**
 * 测试流程控制if-else语句
 */
void controlIf(var year) {
  if (year >= 2001) {
    print('21st century');
  } else if (year >= 1901) {
    print('20th century');
  }
}

/**
 * 测试流程控制增强for语句
 */
void controlProFor(var flybyObjects) {
  for (final object in flybyObjects) {
    print(object);
  }
}

/**
 * 测试流程控制for语句
 */
void controlFor() {
  for (int month = 1; month <= 12; month++) {
    print(month);
  }
}

/**
 * 测试流程控制while语句
 */
void controlWhile(var year) {
  while (year < 2016) {
    year += 1;
    print('year is $year');
  }
}

//函数(https://dart.cn/samples#functions)
/**
 * 测试递归函数
 */
int fibonacci(int n) {
  if (n == 0 || n == 1) return 1;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

/**
 * 测试上面写的斐波那契数列函数
 */
void testFunction(int n) {
  var result = fibonacci(n);
  print('斐波那契数列的第$n个值为$result');
}
//注释(https://dart.cn/samples#comments)
//可以用//
///* 也可以像这样使用单斜杠和星号的注释方式 */
//导入(https://dart.cn/samples#imports)
//导入数学相关的库：import  'dart:math';注意导包只能放程序的最开始的位置
// Importing core libraries import 'dart:math';
// Importing libraries from external packages import 'package:test/test.dart';
// Importing files import 'path/to/my_other_file.dart';

//类(https://dart.cn/samples#classes)
// 类的属性不赋初值会报错，因此可以用late或者？来修饰,继承需要用extends关键字，可以有自己额外的属性,之类中调用supper方法前面需要加：
class Spacecraft {
  late String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
  Spacecraft(this.name, this.launchDate) {}
  Spacecraft.unlaunched(String name) : this(name, null);
  void describe(){
    print('Spacecraft :$name');
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
  
}
class Orbiter extends Spacecraft {
  double altitude;
  Orbiter(String name, DateTime launchDate, this.altitude)
       :super(name, launchDate);
}
//Mixins(https://dart.cn/samples#mixins)
//简单理解为可以增加代码的复用性
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}
class PilotedCraft extends Spacecraft with Piloted {

}
//接口和抽象类(https://dart.cn/samples#interfaces-and-abstract-classes)
//Dart 没有 interface 关键字。相反，所有的类都隐式定义了一个接口。因此，任意类都可以作为接口被实现。用interface和abstract两个关键字
//继承抽象类和接口时需要重写里面的方法
class MockSpaceship implements Spacecraft {

}
abstract class Describable {
  void describe();
  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
//继承Describable抽象类，重写了describe方法
class abstractTest extends Describable {
  void describe() {
    print('Hello World!');
  }
}
//异步（https://dart.cn/samples#async）
//使用 async 和 await 关键字可以让你避免回调地狱（Callback Hell）并使你的代码更具可读性。
const oneSecond = Duration(seconds: 1);
Future<void> printWithDelay(String message) async {
  await Future.delayed(oneSecond);
  print(message);
}
//异常(https://dart.cn/samples#exceptions)
/*
 *测试异常
 */
Future<void> testTry() async {
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  try {
    for (final object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}

void main(List<String> args) {
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  printVariable(); //调用打印变量函数
  controlIf(2022); //调用if函数并传入2022的参数
  controlFor(); //调用普通for函数
  controlProFor(flybyObjects); //调用增强for函数并传入flybyObjects参数
  controlWhile(2012); //调用while函数并传入2012的参数
  testFunction(20); //调用斐波那契数列递归函数，测试第20个数的值
  flybyObjects.where((name) => name.contains('turn')).forEach(print); //调用胖箭头函数
  var x = sqrt(100);
  print('square of 100 is $x');//测试导包是否成功
  var voyager = Spacecraft('Voyager I', DateTime(1977, 9, 5));
  voyager.describe();
  var voyager3 = Spacecraft.unlaunched('Voyager III');
  voyager3.describe();
  abstractTest test = new abstractTest();//测试抽象类
  test.describeWithEmphasis();
  printWithDelay('Hello World!');//测试异步
  testTry();



}
