# contact

A new Flutter project.

## Getting Started
--------------------
## 플러터 레이아웃 만드는 법 

### 글자넣고 싶으면 Text()
 위젯 안에 파라미터로 적고싶은 글을 넣으면 된다. 둘째 파라미터부터는 텍스트의 크기, 색, 폰트 등을 넣을 수 있다.
 #### style: TextStyle()
 이 파라미터는 Text()위젯 안에 들어간다. TextStyle() 안에 스타일 다 넣으면 된다.  
 ----
 #### color 파라미터
 색을 넣고 싶으면 color: 파라미터 쓰면 된다. 박스에 넣으면 박스배경색, 아이콘에 넣으면 아이콘 색이 입혀진다. 근데 색상넣는 방법은 3개  중 하나 선택하면 된다. 1번은 미리 정해진 색상표에서 고르는 방법, 2번은 RGBO로 고르는 방법, 3번은 hex 칼라로 고르는 방법 (앞에 0xff   붙이면 된다)

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

#### AppBar()
title: 제목
leading: 제목왼쪽 아이콘 
actions: 제목오른쪽 아이콘들

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
이렇게 쓰면 []리스트 자료형 안에 넣은 위젯들이 가로로 배치된다. Column() 도 위와 같은 방식이다.
위의 두 위젯은 mainAxisAlignment: 파라미터를 입력가능하다. 이 파라미터로 위젯들의 배치 간격을 조정할 수 있다.
자동완성기능을 활용하여 사용하면 된다.
Row() 말고 Column() 위젯에서도 마찬가지로 정렬이 가능하다. 다만 Column()은 mainAxisAlignment: 사용시 세로로 정렬해준다.
왜냐하면 Row() 쓰면 mainAxis가 가로가 되고 Column()을 쓰면 mainAxis가 세로가 된다.

### Container() 대신 SizedBox()
width,height 이런 파라미터만 필요하면 SizeBox()를 쓰면 된다. 똑같은 박스 위젯이지만 Container()보다 훨씬 가볍기 때문이다. 

### Container()에 여백주기
margin: 바깥여백양, padding: 안쪽여백양 이런 파라미터를 쓰면 된다. 
~~~
margin : EdgeInsets.all(30), //상하좌우 여백을 30씩  준다.
padding: EdgeInsets.fromLTRB(10,20,30,40),//왼쪽 10, 위 20, 오른쪽 30, 밑 40 만큼 여백을 줄 수 있다. 자동완성을 통해 좀 더 다양한 방식을 알아보면 된다.
~~~

###Container()에 나머지 스타일 주는 법
decoration: BoxDecoration() 안에 다른 다양한 박스 스타일을 넣을 수 있게 되어있다. color, shape, boxShadow, gradient, image, borderRadius 등등...

### 박스 정렬
Center() 안에 자식으로 담으면 중앙정렬이 된다. 좌상단, 우하단 이런 정렬은 Align() 안에 담으면 된다.
~~~
Align(
  alignment : Alignment.bottomLeft,
  child : Container( width : 50, height : 50, color : Colors.blue)
)
~~~
이렇게 하면 하단왼쪽 정렬이다. bottomLeft 부분을 바꾸면 상하좌우정렬을 바꿀수 있다.

### 버튼 넣기
TextButton(), ElevateButton(), IconButton() 외모만 다르고 같은 기능이다. opPressed 파라미터는 버튼 눌렀을 때 실행해줄 코드(함수) 를 넣을 수 있다. 

### Flexible 위젯 
Row() 안에 박스를 여러개 배치할 때 박스의 폭을 고정된 숫자가 아니라 비율로 정하고 싶을 때가 있다. 그리고 싶으면 Flexible() 안에 박스들을 담으면 된다. 
~~~
Row(
  children : [
    Flexible( child: Container(color : Colors.blue), flex : 1 ),
    Flexible( child: Container(Color : Colors.green), flex : 1 )
  ]
)
~~~
Row() 안에 있는 것들을 Flexible()로 각각 감싼 뒤에 flex를 주면 된다. flex는 이 박스가 얼마나 가로폭을 차지할지 결정하는 "배수"입니다. 1과 2를 써놓으면 1대 2만큼 차지 한다. 
Column() 안에서도 사용가능하다.
하나의 박스만 가로폭을 꽉 채우고 싶으면 이 위젯으로 감싸면 된다. 감싼 박스는 남은 폭을 꽉채우고 싶어한다.

### 커스텀 위젯 
레이아웃이 너무 길고 복잡해져서 한 단어로 축약하고 싶을 때 사용한다. stless 라고 작성하고 탭키나 엔터키를 누르면 다음과 같은 코드가 자동완성 된다. 
~~~
class 작명 extends StatelessWidget{
  const 작명({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

     return 짧은단어로축약할위젯()
  }
}
~~~
1.작명부분에 작명하고 (영어대문자로 시작) 
2.return 오른쪽에 위젯넣는 부분에 축약할 위젯들을 넣으면 된다.
3.작명() 이렇게 쓸 때 마다 축약했던 위젯들이 그 자리에 북붙된다.

### ListView 위젯
-무한 스크롤된다. 

-데이터만 있으면 자동으로 반복문 돌려줌 

-지나간 목록은 삭제해서 메모리 아낄 수 있음

위와 같은 목록을 만들 때 항상 사용한다. ListView()는 Column() 이랑 유사하게 사용한다. children: [] 안에 목록으로 만들 위젯을 넣으면 된다. 
