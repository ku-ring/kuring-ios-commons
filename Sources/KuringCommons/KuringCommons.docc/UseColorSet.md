# 색상 사용하기

``ColorSet`` 통해 쿠링 색상들을 목적에 맞게 사용해보세요. 색상 사용에 대한 설명을 따라 적절한 UI 색상을 그릴 수 있습니다.

## 개요

쿠링에서 사용하는 색상들은 각각의 용도를 갖습니다. 
예를 들어, 연한 초록색인 ``ColorSet/secondaryGreen``은 ``ColorSet/Background``의 ``ColorSet/Background/green``과 상응하며, 말 그대로 주로 배경색을 목적으로 사용됩니다.
배경색이 ``ColorSet/Background``의 ``ColorSet/Background/green``을 사용하는 경우에는 글자색에는 ``ColorSet/Label``의 ``ColorSet/Label/green``을 사용할 것을 권장합니다.

이렇게 모든 색상은 각각의 용도를 갖으며 이를 모아둔 것이 ``ColorSet`` 입니다. 이 ``ColorSet``은 쿠링의 UI 에 통일성을 가져다 주어 쿠링의 테마 색상을 명확하게 해줍니다. 

![쿠링 색상들의 용도를 보여주는 스크린샷](colorset.overview.png)

## 색상 목록

쿠링에서 사용하는 색상들의 목록은 아래와 같습니다. **글자색**, **배경색** 등의 카테고리에 따라 색상들을 확인할 수 있습니다.

### 기본

| 색상 | 명칭 | 용도 |
| --- | --- | --- |
| ![ColorSet.green](ColorSet.green.png) | `ColorSet.primary` | 쿠링의 메인 테마 색상입니다. 기본값은 `General.green` 입니다. 값을 변경할 수도 있습니다. |
| ![ColorSet.green](ColorSet.green.png) | `ColorSet.green` | 쿠링 초록색 입니다. 버튼의 배경색상, 테두리 색상 등에 사용되며 다른 초록색 계열과 함께 사용되지 않도록 해야합니다. |
| ![ColorSet.secondaryGreen](ColorSet.secondaryGreen.png) | `ColorSet.secondaryGreen` | 쿠링 연한 초록색 입니다. (다크모드는 진한 초록색) 진한 초록색상과 동일한 컴포넌트에서 초록색상을 써야할 때 사용합니다. |
| ![ColorSet.tertiaryGreen](ColorSet.tertiaryGreen.png) | `ColorSet.tertiaryGreen` | 쿠링 3순위 초록색입니다. 살짝만 초륵색의 느낌을 주고 싶을 때 사용합니다. 주로 selector 의 배경색에 사용됩니다. |
| ![ColorSet.pink](ColorSet.pink.png) | `ColorSet.pink` | 쿠링 분홍색입니다. 에러나 삭제와 같이 위험성을 강조해야하는 경우에 사용됩니다. |
| ![ColorSet.blue](ColorSet.blue.png) | `ColorSet.blue` | 쿠링 파란색입니다. 가급적 사용을 지양하며 초록색을 쓰는 것을 권장합니다. |
| ![ColorSet.gray](ColorSet.gray.png) | `ColorSet.gray` | 쿠링 회색입니다. |
| ![ColorSet.secondaryGray](ColorSet.secondaryGray.png) | `ColorSet.secondaryGray` | 쿠링 연한 회색입니다. (다크모드는 진한 회색) |

### 일반 (ColorSet.General)

특정 카테고리에 속하지 않는 일반 색상입니다.

> Tip: 간단하게 사용하고 싶다면 ``ColorSet/General``에 접근할 필요 없이 `ColorSet.green` 와 같이 ``ColorSet`` 의 타입 프로퍼티에 직접 접근할 수 있습니다. 

| 색상 | 명칭 | 용도 |
| --- | --- | --- |
| ![ColorSet.green](ColorSet.green.png) | `ColorSet.General.green` | 쿠링 초록색 입니다. 버튼의 배경색상, 테두리 색상 등에 사용되며 다른 초록색 계열과 함께 사용되지 않도록 해야합니다. |
| ![ColorSet.secondaryGreen](ColorSet.secondaryGreen.png) | `ColorSet.General.secondaryGreen` | 쿠링 연한 초록색 입니다. (다크모드는 진한 초록색) 진한 초록색상과 동일한 컴포넌트에서 초록색상을 써야할 때 사용합니다. |
| ![ColorSet.tertiaryGreen](ColorSet.tertiaryGreen.png) | `ColorSet.General.tertiaryGreen` | 쿠링 3순위 초록색입니다. 살짝만 초륵색의 느낌을 주고 싶을 때 사용합니다. 주로 selector 의 배경색에 사용됩니다. |
| ![ColorSet.pink](ColorSet.pink.png) | `ColorSet.General.pink` | 쿠링 분홍색입니다. 에러나 삭제와 같이 위험성을 강조해야하는 경우에 사용됩니다. |
| ![ColorSet.blue](ColorSet.blue.png) | `ColorSet.General.blue` | 쿠링 파란색입니다. 가급적 사용을 지양하며 초록색을 쓰는 것을 권장합니다. |
| ![ColorSet.gray](ColorSet.gray.png) | `ColorSet.General.gray` | 쿠링 회색입니다. |
| ![ColorSet.secondaryGray](ColorSet.secondaryGray.png) | `ColorSet.General.secondaryGray` | 쿠링 연한 회색입니다. (다크모드는 진한 회색) |


### 글자색 (ColorSet.Label)

라벨, 텍스트에 사용하는 것을 목적으로 하는 색상입니다.

| 색상 | 명칭 | 용도 |
| --- | --- | --- |
| ![ColorSet.Label.primary](ColorSet.Label.primary.png) | `ColorSet.Label.primary` | 쿠링의 일반 글자색입니다. 기본은 검정색이며, 다크모드는 흰색입니다. |
| ![ColorSet.Label.secondary](ColorSet.Label.secondary.png) | `ColorSet.Label.secondary` | 쿠링의 2순위 글자색입니다. 기본은 진한 회색이며, 다크모드는 연한 흰색입니다. |
| ![ColorSet.Label.tertiary](ColorSet.Label.tertiary.png) | `ColorSet.Label.tertiary` | 쿠링의 3순위 글자색입니다. 기본은 회색입니다. `secondary` 가 쓰이고 있는 경우에만 사용하는 것을 권장합니다. |
| ![ColorSet.Label.green](ColorSet.Label.green.png) | `ColorSet.Label.green` | 쿠링 텍스트용 초록색입니다. `ColorSet.green` 보다 진한 초록색입니다. 배경에 `Background.green` 또는 `ColorSet.secondaryGreen`이 쓰이는 경우 사용하는 것을 권장합니다. |

### 배경색 (ColorSet.Background)

배경에 사용하는 것을 목적으로 하는 색상입니다.

| 색상 | 명칭 | 용도 |
| --- | --- | --- |
| ![ColorSet.Background.primary](ColorSet.Background.primary.png) | `ColorSet.Background.primary` | 쿠링 기본 배경색입니다. 기본은 흰색이며, 다크모드는 매우 짙은 회색입니다. |
| ![ColorSet.secondaryGreen](ColorSet.secondaryGreen.png) | `ColorSet.Background.green` | 쿠링 배경용 초록색입니다. `ColorSet.green` 보다 연한 초록색입니다. 글자색으로 `Label.green` 을 사용하는 컴포넌트의 배경색으로 사용합니다. |

## SwiftUI 에서 사용하기

`SwiftUI` 에서 `Color` 타입으로 사용하고 싶을 땐 객체에 `.color` 를 붙여주기만 하면 됩니다.

```swift
Text("쿠링에 오신 것을 환영합니다")
    .foregroundColor(ColorSet.green.color)
```
