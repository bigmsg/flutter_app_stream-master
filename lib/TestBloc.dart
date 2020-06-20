import 'dart:async';
import 'dart:math';

import 'package:requests/requests.dart';
import 'package:rxdart/rxdart.dart';

class TestBloc{

  int counter = 0;
  //final _gigSubject = BehaviorSubject<List<Goojik>>.seeded([]);

  Stream <List<String>> getPeriodicStream() async* {
    print('--------- call getPeriodicStream ---------');

    counter++;
    /*yield* Stream.periodic(Duration(seconds: 1),(_) {
      print('------- call Stream.periodic -------');
      var value = new Random().nextInt(100);
      return value;
    });*/

    /*yield* Stream.periodic(Duration(seconds: 1), (_) {
      print('----- call Stream.periodic ------');
      return counter;
    });*/

    yield* Stream.fromFuture(getData());
    /*yield* Stream.fromFuture((_)  {
      return ['1','2','3'];
    });*/

  }
}


Future<List<String>> getData() async {
  print('call getData()');
  await Future.delayed(Duration(seconds: 3)); // 5초간 대기
  print("Fetched Data");
  return ['안녕하세요?', 'good'];




  /*var url = 'https://www.massagemania.co.kr/_mobileapp/ver1/gooin/list.php'+'?bo_table=gooin';
  Requests.get(url).then((res) {
    List<Gooin> gooins = [];

    //print('------- gooin list -------');
    //print(gooinListUrl);
    //print(res.content());
    var js = res.json();
    //print(js[0]['mc_age1'].runtimeType);
    //print(js[0]['mc_age2'].runtimeType);


    //print(js[0]['mc_company']);
    //print(js[0]['mc_local']);

    js.forEach((item) {
      //print('${item['wr_id']}: ${item['wr_subject']}');
      gooins.add(Gooin.fromJson(item));
      //gooins.add(jsonToGooin(item));
    });
    print('----- result num: ${gooins.length} --------');
    print('----- 1: ${gooins[0].wr_id} ${gooins[0].wr_subject} --------');
    //print(gooins);
    return gooins;
  });
  */

}


class TestBloc2 {
  final _gooinSubject = BehaviorSubject<List<Gooin>>.seeded([]);
  Stream<List<Gooin>> get data => _gooinSubject.stream;

  TestBloc2() {
    print('------- call TestBloc2() -----');
    fetch();
  }

  fetch({String sido, String gugun}) async {
    print('------ call fetch ---------');
    //var res = await request.get(bbsListUrl+'?bo_table=${bo_table}');
    var url = 'https://www.massagemania.co.kr/_mobileapp/ver1/gooin/list.php'+'?bo_table=gooin';
    url += sido != null ? '&sido=${sido}&gugun=${gugun}' : '';
    Requests.get(url).then((res) {
      List<Gooin> gooins = [];

      //print('------- gooin list -------');
      //print(gooinListUrl);
      //print(res.content());
      var js = res.json();
      //print(js[0]['mc_age1'].runtimeType);
      //print(js[0]['mc_age2'].runtimeType);


      //print(js[0]['mc_company']);
      //print(js[0]['mc_local']);

      js.forEach((item) {
        print(item['wr_subject']);
        gooins.add(Gooin.fromJson(item));
        //gooins.add(jsonToGooin(item));
      });

      _gooinSubject.add(gooins);
      return true;
    });
  }
}





class Gooin {
  int wr_id;
  String mb_id;
  String mb_nick;
  String mb_photo;
  String ca_name;
  String wr_subject;
  String wr_content;
  String wr_thumbnail;
  List<dynamic> wr_photos;
  int wr_hit;
  DateTime wr_datetime;
  bool wr_is_show;
  int wr_is_approval;

  String mc_company;
  String mc_hp;
  String mc_tel;
  String mc_site;

  String mc_female;
  int mc_age1;
  int mc_age2;

  String mc_career;
  List<String> mc_options;
  String mc_pay_prefix;
  int mc_pay;
  String mc_local;
  String mc_addr_zipcode;
  String mc_addr_basic;
  String mc_addr_detail;
  bool mc_robots_disallow;

  String ad_package;

  int wr_jump_count;
  int wr_jump_limit;
  DateTime wr_jump_last_dt;


  Gooin({this.wr_id, this.mb_id, this.mb_nick, this.mb_photo,
    this.ca_name,
    this.wr_subject, this.wr_content,
    this.wr_thumbnail, this.wr_photos,
    this.wr_datetime, this.wr_hit, this.wr_is_show, this.wr_is_approval,

    this.mc_company, this.mc_hp, this.mc_tel, this.mc_site,
    this.mc_female,
    this.mc_age1, this.mc_age2, this.mc_career, this.mc_options,
    this.mc_pay_prefix, this.mc_pay,
    this.mc_local, this.mc_addr_zipcode, this.mc_addr_basic, this.mc_addr_detail, this.mc_robots_disallow,

    this.ad_package,

    this.wr_jump_count, this.wr_jump_limit, this.wr_jump_last_dt,
  });


  factory Gooin.fromJson(Map<String, dynamic> js)  {
    List<String> photos = [];
    js['wr_photos'].forEach((val) {
      photos.add(val);
    });

    var jump_last = (['',null].contains(js['wr_jump_last_dt'])) ? null :  DateTime.parse(js['wr_jump_last_dt']);

    List<String> mc_options = [];
    for(var it in js['mc_options']) {
      mc_options.add(it);
    }

    return Gooin(
      wr_id: js['wr_id'],
      mb_id: js['mb_id'],
      mb_nick: js['mb_nick'],
      mb_photo: js['mb_photo'],
      wr_is_show: js['wr_is_show'],
      wr_subject: js['wr_subject'],
      wr_content: js['wr_content'],
      wr_thumbnail: js['wr_thumbnail'],
      wr_photos: photos,
      wr_datetime: DateTime.parse(js['wr_datetime']),
      wr_hit: js['wr_hit'],
      ca_name: js['ca_name'],

      mc_company: js['mc_company'],
      mc_hp: js['mc_hp'],
      mc_tel: js['mc_tel'],
      mc_site: js['mc_site'],

      mc_female: js['mc_female'],
      mc_age1: js['mc_age1'],
      mc_age2: js['mc_age2'],
      mc_career: js['mc_career'],
      mc_options: mc_options,
      mc_pay_prefix: js['mc_pay_prefix'],
      mc_pay: js['mc_pay'],

      mc_local: js['mc_local'],
      mc_addr_zipcode: js['mc_addr_zipcode'],
      mc_addr_basic: js['mc_addr_basic'],
      mc_addr_detail: js['mc_addr_detail'],
      mc_robots_disallow: js['mc_robots_disallow'],
      ad_package: js['ad_package'],

      wr_jump_count: js['wr_jump_count'],
      wr_jump_limit: js['wr_jump_limit'],
      wr_jump_last_dt: jump_last,

    );
  }


  Map toJson() {
    return {
      'mb_id': mb_id,
      'mb_nick': mb_nick,
      'wr_subject': wr_subject,
      'wr_content': wr_content
    };
  }


  @override
  String toString() {
    return '${wr_id} ${wr_subject}';
  }
}
