import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:async';
final prevention = [
  {'assets/images/distance.png': 'Avoid close\ncontact'},
  {'assets/images/wash_hands.png': 'Clean your\nhands often'},
  {'assets/images/mask.png': 'Wear a\nfacemask'},
];
final covidIndiaDailyNewCases = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
var total=0;
int date=0;
int head=0;
var active=0;
var recover=0;
var deaths=0;
Map data;
var graphdates;
var url = "https://covid-19-data.p.rapidapi.com/totals";
var headers = {
  'x-rapidapi-host': "covid-19-data.p.rapidapi.com",
  'x-rapidapi-key': "d0e6419e13msh78f917a8951c762p1963a6jsn74293e38e4b1"
};
var global;
Future<Map> coviddata() async{
  http.Response res=await http.get('https://api.covid19india.org/data.json');
  return json.decode(res.body);
}
void initialize() async {
  data=await coviddata();
  int l=data['cases_time_series'].length;
  total=int.parse(data['cases_time_series'][l-1]['totalconfirmed']);
  recover=int.parse(data['cases_time_series'][l-1]['totalrecovered']);
  deaths=int.parse(data['cases_time_series'][l-1]['totaldeceased']);
  active=total-recover-deaths;
  globaldata();
  for(int i=1;i<=10;i++){
    covidIndiaDailyNewCases[10-i]=double.parse(data['cases_time_series'][l-i]['dailyconfirmed'])/100000;
  }

}
void update() async{

  if(date==0){
  int l=data['cases_time_series'].length;
  total=int.parse(data['cases_time_series'][l-1]['totalconfirmed']);
  recover=int.parse(data['cases_time_series'][l-1]['totalrecovered']);
  deaths=int.parse(data['cases_time_series'][l-1]['totaldeceased']);
  active=total-recover-deaths;
  }
  else{
      int l=data['cases_time_series'].length;
      total=int.parse(data['cases_time_series'][l-date]['dailyconfirmed']);
      recover=int.parse(data['cases_time_series'][l-date]['dailyrecovered']);
      deaths=int.parse(data['cases_time_series'][l-date]['dailydeceased']);
      active=total-recover-deaths;
  }
}

void globaldata() async {
  http.Response response = await http.get(url, headers: headers);
  //request("GET", url, headers=headers, params=querystring)
  global=json.decode(response.body);
  int l=global.length;
}
void globalupdate() async{
  if(head==0){
    update();
  }
  else {
    total = global[0]['confirmed'];
    recover = global[0]['recovered'];
    deaths = global[0]['deaths'];
    active = total - recover - deaths;
  }
}
