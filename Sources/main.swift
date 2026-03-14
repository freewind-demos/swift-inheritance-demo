// swift-inheritance-demo.swift

// ============ 基类 ============
class Vehicle {
    var speed: Double = 0

    func move() {
        print("交通工具移动")
    }

    func description() -> String {
        return "速度: \(speed) km/h"
    }
}

// ============ 子类 ============
class Car: Vehicle {
    var brand: String

    init(brand: String) {
        self.brand = brand
        super.init()
    }

    override func move() {
        print("\(brand) 汽车行驶中...")
    }
}

let car = Car(brand: "Toyota")
car.speed = 120
car.move()
print(car.description())

// ============ 多层继承 ============
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

// ============ 向下转型 ============
let vehicles: [Vehicle] = [car, tesla]
for vehicle in vehicles {
    if let electricCar = vehicle as? ElectricCar {
        print("\(electricCar.brand) 是电动汽车，电量: \(electricCar.batteryLevel)%")
    } else if let car = vehicle as? Car {
        print("\(car.brand) 是普通汽车")
    }
}

// ============ is 和 as ============
print("\n类型检查:")
print("tesla is Vehicle: \(tesla is Vehicle)")
print("tesla is Car: \(tesla is Car)")
print("tesla is ElectricCar: \(tesla is ElectricCar)")

// ============ 构造器继承 ============
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
        super.init(name: name)
    }
}

let emp = Employee(name: "Tom", salary: 5000)
print("员工: \(emp.name), 薪资: \(emp.salary)")
