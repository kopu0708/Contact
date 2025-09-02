
-----

# Flutter 노트

## I. 플러터 레이아웃 만들기

### \#\#\# 텍스트: `Text()`

글자를 화면에 표시할 때 사용합니다. 첫 번째 파라미터에 원하는 텍스트를 넣고, `style` 파라미터를 통해 디자인을 변경할 수 있습니다.

```dart
Text(
  '안녕하세요!',
  style: TextStyle(
    color: Colors.blue, // 글자 색상
    fontSize: 24.0,     // 글자 크기
    fontWeight: FontWeight.bold, // 굵기
  ),
)
```

> **🎨 색상 지정 방법 3가지**
>
> 1.  **미리 정의된 색상**: `Colors.blue`, `Colors.red` 등
> 2.  **RGBO**: `Color.fromRGBO(255, 0, 0, 1)` (Red, Green, Blue, Opacity)
> 3.  **HEX 코드**: `Color(0xFFE91E63)` (앞에 `0xFF`를 붙여서 사용)

-----

### \#\#\# 아이콘: `Icon()`

미리 정의된 아이콘을 보여주는 위젯입니다. `Icons` 클래스에서 원하는 아이콘을 선택하여 사용합니다.

```dart
Icon(
  Icons.star,
  color: Colors.yellow,
  size: 50.0,
)
```

> **Tip**: 아이콘의 종류는 [Flutter 공식 문서](https://api.flutter.dev/flutter/material/Icons-class.html)에서 찾아볼 수 있습니다.

-----

### \#\#\# 이미지: `Image.asset()`

프로젝트 내부에 저장된 이미지를 불러올 때 사용합니다.

1.  프로젝트 최상단에 `assets` 폴더를 만들고 이미지를 넣습니다.
2.  `pubspec.yaml` 파일에 `assets` 폴더 경로를 등록합니다.

<!-- end list -->

```yaml
# pubspec.yaml
flutter:
  assets:
    - assets/
```

3.  `Image.asset('경로')` 코드를 사용해 이미지를 표시합니다.

<!-- end list -->

```dart
Image.asset('assets/my_image.png')
```

-----

### \#\#\# 박스: `Container()` 와 `SizedBox()`

사각형 영역을 만드는 위젯입니다.

  - **`Container()`**: 여백(`margin`, `padding`), 테두리, 배경색 등 다양한 꾸미기가 가능한 만능 박스입니다.
  - **`SizedBox()`**: 단순히 **공간을 차지하거나 크기를 지정**하는 용도의 가벼운 박스입니다. `Container()`보다 가벼워 성능에 유리합니다.

<!-- end list -->

```dart
Container(
  width: 150,
  height: 150,
  color: Colors.blue,
  padding: EdgeInsets.all(20), // 안쪽 여백
  margin: EdgeInsets.all(10), // 바깥 여백
  child: Text('Box'),
  decoration: BoxDecoration( // color는 decoration과 동시 사용 불가
    border: Border.all(color: Colors.black),
    borderRadius: BorderRadius.circular(10),
  ),
)
```

> **단위 LP (Logical Pixel)**
> Flutter에서 사용하는 `width`, `height` 등의 단위는 LP입니다. 다양한 기기의 화면 밀도(PPI)에 관계없이 일관된 크기를 보여주기 위한 논리적 단위입니다. (참고: 1cm ≈ 38LP)

-----

### \#\#\# 위젯 배치 및 정렬

#### **`Row()`와 `Column()`: 가로/세로 배치**

여러 위젯을 가로나 세로로 나란히 배치할 때 사용합니다. `children` 파라미터에 위젯 리스트(`[]`)를 전달합니다.

  - `Row()`: 위젯을 **가로**로 배치합니다. (mainAxis: 가로)
  - `Column()`: 위젯을 **세로**로 배치합니다. (mainAxis: 세로)

<!-- end list -->

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 자식 위젯들의 간격 조절
  children: [
    Icon(Icons.star),
    Icon(Icons.star),
    Icon(Icons.star),
  ],
)
```

#### **`Center()`와 `Align()`: 특정 위치 정렬**

  - `Center()`: 자식 위젯을 부모 영역의 **중앙**에 배치합니다.
  - `Align()`: 자식 위젯을 **원하는 위치**에 정밀하게 배치합니다.

<!-- end list -->

```dart
Align(
  alignment: Alignment.bottomRight, // 우측 하단 정렬
  child: Container(width: 50, height: 50, color: Colors.blue),
)
```

#### **`Flexible()`과 `Expanded()`: 비율 배치**

`Row`나 `Column` 내부에서 공간을 비율로 나누어 차지하게 합니다.

  - `Flexible()`: `flex` 값에 따라 공간을 **비율**로 차지합니다.
  - `Expanded()`: `Flexible(fit: FlexFit.tight)`와 동일하며, 사용 가능한 **남은 공간 전체**를 차지합니다.

<!-- end list -->

```dart
Row(
  children: [
    Flexible(flex: 2, child: Container(color: Colors.blue)), // 2의 비율
    Flexible(flex: 1, child: Container(color: Colors.red)),  // 1의 비율
  ],
)
```

-----

### \#\#\# 페이지 기본 구조: `Scaffold()`

앱 화면의 기본 구조(상단 바, 본문, 하단 바 등)를 쉽게 만들도록 도와주는 뼈대 위젯입니다.

  - `appBar`: 상단 앱 바 영역. `AppBar()` 위젯을 사용합니다.
  - `body`: 화면의 대부분을 차지하는 중앙 본문 영역. (필수)
  - `bottomNavigationBar`: 하단 내비게이션 바 영역.
  - `floatingActionButton`: 화면 위에 떠 있는 원형 버튼.

<!-- end list -->

```dart
Scaffold(
  appBar: AppBar(
    title: Text('My App'),
    leading: Icon(Icons.menu), // 제목 왼쪽
    actions: [Icon(Icons.settings)], // 제목 오른쪽
  ),
  body: Center(child: Text('본문 영역')),
)
```

-----

### \#\#\# 목록: `ListView()` 와 `ListView.builder()`

스크롤이 가능한 목록을 만들 때 사용합니다.

  - **`ListView()`**: 목록의 개수가 정해져 있을 때 간단하게 사용합니다.
  - **`ListView.builder()`**: **동적으로 많은 목록**을 효율적으로 생성할 때 사용합니다. 화면에 보이는 부분만 렌더링하여 성능을 최적화합니다.

<!-- end list -->

```dart
ListView.builder(
  itemCount: 50, // 생성할 목록의 총 개수
  itemBuilder: (context, i) { // 각 항목을 그리는 함수
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('Contact #$i'),
    );
  },
)
```

-----

### \#\#\# 버튼 위젯

  - `TextButton()`: 글자만 있는 버튼
  - `ElevatedButton()`: 입체감이 있는 버튼
  - `IconButton()`: 아이콘만 있는 버튼

<!-- end list -->

```dart
ElevatedButton(
  onPressed: () {
    // 버튼을 눌렀을 때 실행할 코드
    print('버튼 클릭됨!');
  },
  child: Text('Click Me'),
)
```

-----

### \#\#\# 커스텀 위젯 (위젯 재사용)

복잡하고 긴 레이아웃 코드를 별도의 클래스로 분리하여 재사용할 수 있습니다. `stless` 또는 `stful` 키워드로 자동 완성할 수 있습니다.

```dart
// 커스텀 위젯 정의 (StatelessWidget)
class MyCustomWidget extends StatelessWidget {
  const MyCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
    );
  }
}

// 커스텀 위젯 사용
MyCustomWidget()
```

-----

## II. 플러터 주요 기능 구현

### \#\#\# State와 StatefulWidget

**State**는 앱의 '상태'를 저장하는 데이터입니다. 이 값이 변경되면 화면도 함께 변경되어야 합니다.

  - **StatelessWidget**: 한번 그려진 후 내용이 바뀌지 않는 정적인 위젯입니다.
  - **StatefulWidget**: 사용자의 행동 등으로 **State가 변경되면 화면을 다시 그리는(재렌더링)** 동적인 위젯입니다.

`StatefulWidget` 내에서 변수를 선언하면 State가 되며, 이 값을 변경할 때는 반드시 `setState()` 함수로 감싸주어야 화면이 갱신됩니다.

```dart
class Counter extends StatefulWidget {
  const Counter({super.key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0; // State 변수

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count.toString()),
        ElevatedButton(
          onPressed: () {
            setState(() { // 이 함수 안에서 state를 변경해야 재렌더링됨
              count++;
            });
          },
          child: Text('더하기'),
        )
      ],
    );
  }
}
```

> **성능 최적화 Tip**
> `AppBar`, `BottomNavigationBar`처럼 자주 변경되지 않는 부분은 `StatelessWidget`으로, 좋아요 버튼처럼 데이터가 자주 변하는 부분은 `StatefulWidget`으로 만들어야 앱 성능 저하를 막을 수 있습니다.

-----

### \#\#\# 다이얼로그 (팝업): `showDialog()`

사용자에게 알림이나 추가 입력을 받을 때 사용하는 팝업창입니다.

```dart
showDialog(
  context: context, // 현재 위젯의 context 정보
  builder: (context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Text('다이얼로그 내용'),
      ),
    );
  },
);
```

> **`context`란?**
> 위젯 트리에서 **현재 위젯의 위치 정보**를 담고 있는 중요한 변수입니다. `showDialog`, `Navigator` 등 다른 위젯이나 페이지와 상호작용할 때 "누가 누구를 호출했는지" 알려주는 역할을 합니다.

-----

### \#\#\# State 전달 (부모 ↔ 자식)

#### **1. 부모 → 자식으로 State 전달**

자식 위젯을 호출할 때 생성자의 파라미터로 데이터를 전달합니다.

```dart
// 1. 부모 위젯에서 자식 위젯 호출 시 데이터 전달
MyWidget(name: '홍길동', count: 10)

// 2. 자식 위젯에서 데이터 받기
class MyWidget extends StatelessWidget {
  final String name; // 전달받을 데이터의 이름과 타입을 선언
  final int count;

  // 생성자를 통해 데이터를 받음
  const MyWidget({super.key, required this.name, required this.count});

  @override
  Widget build(BuildContext context) {
    // 3. 전달받은 데이터 사용
    return Text('$name님의 카운트: $count');
  }
}
```

#### **2. 자식 → 부모로 State 변경 요청**

자식은 부모의 State를 직접 수정할 수 없습니다. 대신 **부모가 만든 State 변경 함수를 자식에게 전달**하고, 자식은 그 함수를 호출만 합니다.

```dart
// 1. 부모 위젯: State 변경 함수를 정의하고 자식에게 전달
class Parent extends StatefulWidget {
  // ...
  void increment() {
    setState(() { count++; });
  }

  @override
  Widget build(BuildContext context) {
    return Child(
      count: count,
      increment: increment, // 함수 자체를 전달
    );
  }
}

// 2. 자식 위젯: 함수를 받아 버튼 클릭 시 실행
class Child extends StatelessWidget {
  final int count;
  final Function() increment; // 함수를 받을 변수 선언

  const Child({super.key, required this.count, required this.increment});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        increment(); // 전달받은 함수 실행
      },
      child: Text(count.toString()),
    );
  }
}
```
### 혼자서 해볼 응용사항은

- 완료버튼 눌러도 Dialog 닫히게 만들려면? [V]

- 빈칸으로 완료버튼 누르면 추가안되게?   [V]

- 이름옆에 삭제버튼과 기능?     [V]

- 이름들 가나다순 정렬버튼? (sort함수 사용법을 찾아봅시다) [V]

- 전화번호 데이터도 3개 마련해놓고 전화번호도 보여주고 싶으면?



