import 'dart:io';

void main(){
  performTasks();
}

void performTasks(){
  task1();
  String task2Result;
  task3();
}

void task1() {
  String result = 'task1 data';
  print('Task 1 complete');
}

Future task2() async{
  Duration threeSeconds = Duration(seconds: 3);

  String result;
  await Future.delayed(threeSeconds, (){
    result = 'task2 data';
    print('Task 2 complete');
  });

}

void task3() {

  String result = 'task3 data';
  print('Task 3 complete');
}