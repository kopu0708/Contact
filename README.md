# contact

A new Flutter project.

## Getting Started
--------------------
## 플러터 기초 위젯 

### 글자넣고 싶으면 Text()
 위젯 안에 파라미터로 적고싶은 글을 넣으면 된다. 둘째 파라미터부터는 텍스트의 크기, 색, 폰트 등을 넣을 수 있다.

### Icon() 
아이콘 위젯은 내부에 아이콘 이름을 적어 아이콘을 넣읗 수 있다. 아이콘 이름은 https://api.flutter.dev/flutter/material/Icons-class.html

### 이미지 넣기
프로젝트 내에 assets폴더를 만들고 이미지 파일을 넣어둔다. pubspec.yaml 파일을 찾아 flutter: 하위항목에 assets 폴더를 등록한다.

### Container() 네모  박스 넣기
Container() 또는 SizeBox()  둘 중 하나를 쓰면 네모 박스가 생성된다. width. height 이런 파라미터를 통해 사이즈 조절이 가능하다. 정수와 실수를 적고 단위는 적지 않는다.  (여기서 사용되는 수들의 단위는 LP(Logical Pixel)이다. px을 쓰지 않는 이유는 기기마다 픽셀의 절대적인 크기가 다르기 때문이다. 픽셀의 밀도에 관계없는 절대적인 수치를 LP라고 한다. 1cm는 38LP라고 한다.)

### child:
child: 파라미터는 위젯안에 위젯을 넣을 수 있게 해주는 파라미터이다.  

### Scaffold() 위젯
상단/중단/하단으로
나누어 주는 위젯이다. appBar(),body,bottomNavigationBar 이렇게 3개의 파라미터를 넣으면 상 중 하 로 쪼개준다.
body는 필수이다. 

### 가로/세로로 균일하게 위젯 배치하는 법
Row() 위젯과 Column위젯을 사용하면 된다. 가로로 균일하게 배치하고 싶으면 
~~~
MaterialApp(
  home:Scaffold(
    body: Row(
          children: [--넣고 싶은 위젯들--]
    ),
  )
);
~~~
이렇게 쓰면 []리스트 자료형 안에 넣은 위젯들이 가로로 배치된다. 
