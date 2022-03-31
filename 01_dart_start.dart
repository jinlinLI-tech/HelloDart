//变量(https://dart.cn/samples#variables)
/**
 * 打印dart中各种变量
 */
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

/**
 * 调用printVariable函数
 */
void main(List<String> args) {
  printVariable();
}
