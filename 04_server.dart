//静态服务器(https://github.com/dart-lang/samples/blob/master/server/simple/bin/server.dart)
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io; //重命名
import 'package:shelf_router/shelf_router.dart' as shelf_router;
import 'package:shelf_static/shelf_static.dart' as shelf_static;

Future<void> main(List<String> args) async {
  //从环境变量里获取端口号，若没有，则用本机的‘8080’
  //??快捷操作符(https://blog.csdn.net/nimeghbia/article/details/100921620)
  //更多快捷符号操作(https://blog.csdn.net/haojiagou/article/details/104737689?utm_medium=distribute.pc_relevant.none-task-blog-2~default~baidujs_baidulandingword~default-0.pc_relevant_antiscanv2&spm=1001.2101.3001.4242.1&utm_relevant_index=3)
  
  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  //一个请求队列(https://pub.dev/documentation/shelf/latest/shelf/Cascade-class.html)
  final cascade = Cascade().add(_staticHandler);
  //启动一个HTTP服务(https://pub.dev/documentation/shelf/latest/shelf/shelf_io/serve.html)
  final server = await shelf_io.serve(
      //处理请求的时候，顺便做个日志.(https://pub.dev/documentation/shelf/latest/shelf/logRequests.html)
      logRequests().addHandler(cascade.handler),
      InternetAddress.anyIPv4,
      port);
  print(
      'Serving at http://${server.address.host}:${server.port},CTRL+C to stop');
}

final _staticHandler =
    shelf_static.createStaticHandler('public', defaultDocument: 'index.html');
