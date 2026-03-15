# Swift 继承 Demo

## 简介

本 demo 展示 Swift 类的继承、多层继承、向下转型。继承是面向对象编程的核心概念，允许类复用和扩展其他类的行为。

## 基本原理

### 什么是继承？

继承允许一个类（子类）复用另一个类（父类）的属性和方法：

```
Vehicle (父类)
  │
  ├── speed
  ├── move()
  └── description()
      │
      ▼
  Car (子类)
  ├── brand
  ├── move() (重写)
  └── charge() (新增)
```

### 继承的限制

- Swift 中**类和结构体**不同：结构体不支持继承
- Swift 只支持**单继承**（一个类只能有一个父类）
- Swift 使用**协议**实现多重继承的效果

---

## 启动和使用

### 环境要求

- Swift 5.0+
- macOS 或 Linux

### 安装和运行

```bash
cd swift-inheritance-demo
swift run
---

## 教程

### 继承语法

```swift
class Vehicle {
    var speed: Double = 0

    func move() {
        print("交通工具移动")
    }

    func description() -> String {
        return "速度: \(speed) km/h"
    }
}

class Car: Vehicle {  // Car 继承自 Vehicle
    var brand: String

    init(brand: String) {
        self.brand = brand
        super.init()
    }

    override func move() {  // 重写父类方法
        print("\(brand) 汽车行驶中...")
    }
}
```

### 重写方法

使用 `override` 关键字重写父类方法：

```swift
class Car: Vehicle {
    override func move() {
        print("\(brand) 汽车行驶中...")
    }
}
```

Swift 会确保你确实在重写父类的方法，避免意外重写。

### 多层继承

```swift
class ElectricCar: Car {
    var batteryLevel: Double = 100

    init(brand: String) {
        super.init(brand: brand)
    }

    override func move() {
        print("\(brand) 电动汽车静音行驶...")
    }

    func charge() {
        print("充电中... 当前电量: \(batteryLevel)%")
    }
}

let tesla = ElectricCar(brand: "Tesla")
tesla.speed = 150
tesla.move()
tesla.charge()
```

### 构造器继承

子类的构造器需要调用父类的构造器：

```swift
class Person {
    var name: String

    init(name: String) {
        self.name = name
    }
}

class Employee: Person {
    var salary: Double

    init(name: String, salary: Double) {
        self.salary = salary
        super.init(name: name)  // 先初始化父类
    }
}

let emp = Employee(name: "Tom", salary: 5000)
print("员工: \(emp.name), 薪资: \(emp.salary)")
```

### 类型检查和向下转型

Swift 提供了类型检查和向下转型：

```swift
let vehicles: [Vehicle] = [car, tesla]
for vehicle in vehicles {
    if let electricCar = vehicle as? ElectricCar {
        print("\(electricCar.brand) 是电动汽车，电量: \(electricCar.batteryLevel)%")
    } else if let car = vehicle as? Car {
        print("\(car.brand) 是普通汽车")
    }
}
```

**类型检查**：
- `is`：检查实例是否是某类型
- `as?`：安全转型，返回可选值
- `as!`：强制转型（危险，可能崩溃）

```swift
print("\n类型检查:")
print("tesla is Vehicle: \(tesla is Vehicle)")         // true
print("tesla is Car: \(tesla is Car)")                // true
print("tesla is ElectricCar: \(tesla is ElectricCar)") // true
```

---

## 关键代码详解

### 继承的内存布局

```
ElectricCar 实例
┌─────────────────────────────┐
│ Vehicle 部分                 │
│   speed: Double            │
├─────────────────────────────┤
│ Car 部分                   │
│   brand: String            │
├─────────────────────────────┤
│ ElectricCar 部分           │
│   batteryLevel: Double     │
└─────────────────────────────┘
```

子类实例包含父类的所有属性。

### super 的使用

- `super.init()`：调用父类构造器
- `super.someMethod()`：调用父类方法

---

## 总结

继承是面向对象编程的核心：

1. **代码复用** — 子类复用父类的属性和方法
2. **扩展** — 子类可以添加新功能
3. **多态** — 不同子类可以有不同的实现
4. **类型检查** — is、as?、as! 安全的类型转换

注意事项：
- Swift 中优先使用**协议**而非继承
- 继承层次不要太深（建议不超过 3 层）
- 优先使用**组合**而非继承
