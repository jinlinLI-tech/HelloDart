//变量(https://dart.cn/samples#variables)
/**
 * 打印dart中各种变量
 */
import 'dart:math';

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
// 类的属性不赋初值会报错，因此可以用late或者？来修饰
class Spacecraft {
  late String name;
  DateTime? launchDate;
  int? get launchYear => launchDate?.year;
  Spacecraft(this.name, this.launchDate) {}
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
  print('square of 100 is $x');
}
