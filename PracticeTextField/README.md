# PracticeTextField(iOS)

`storyboard` `text field` `delegate pattern` `responder`
<br><br>
델리게이트 패턴 연습용 어플리케이션<br>

### main screen

<img src="https://github.com/slaveshin/practice-applications-iOS/assets/68256612/30cb3d9f-92e9-4d4f-b8b8-768f35092213" width="400"/>

### Delegate 패턴이란?

Delegate라는 단어는 '위임하다'라는 사전적 의미를 가지고 있다. Delegate 패턴은 위임자를 갖고 있는 객체가 다른 객체에게 자신의 일을 위임하는 형태의 디자인 패턴이라고 할 수 있다.

위임자들은 그저 일을 시킬뿐이고, 일을 어떻게 처리해야하는지는 모른다. 일을 처리하는 방법은 그 일을 수행하는 객체에 구현되어 있다. 따라서, Delegate 패턴을 사용하면, 동일한 작업이지만 객체마다 다른 내용을 처리할 수 있도록 할 수 있기 때문에 코드의 재사용성이 높아지고 유지보수에 용이하다.

<br>

### Delegate 예제

```Swift
protocol RemoteControlDelegate {
  func channelUp()
  func channelDown()
}

class RemoteControl {
  var delegate: RemoteControlDelegate?

  func doSomething() {
    print("리모콘의 조작이 일어나고 있음")
  }

  func channelUp() {
    delegate?.channelUp()
  }

  func channelDown() {
    delegate?.channelDown()
  }
}
```

<br>

### Delegate 채택 예제

```Swift
class TV: RemoteControlDelegate {
  func channelUp() {
    print("TV의 채널이 올라간다")
  }

  func channelDown() {
    print("TV의 채널이 내려간다")
  }
}

let remote = RemoteControl()
let samsungTV = TV()

remote.delegate = samsungTV

remote.channelUp()
remote.channelDown()
```
