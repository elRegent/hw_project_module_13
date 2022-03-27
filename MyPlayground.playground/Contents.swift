import UIKit

/* Создайте кортеж для двух человек с одинаковыми типами данных и параметрами.
При том одни значения доставайте по индексу, а другие — по параметру. */


let firstPerson = (age: 18, firstname: "Inav", surname: "Ivanov")
let secondPerson = (age: 22, firstname: "Petr", surname: "Petrov")

print("Первый - \(firstPerson.1) \(firstPerson.2), возраст \(firstPerson.0)" )
print("Второй - \(secondPerson.firstname) \(secondPerson.surname), возраст \(secondPerson.age)" )

/* Создайте массив «дни в месяцах» (12 элементов содержащих количество дней в соответствующем месяце). Используя цикл for и этот массив:
 выведите количество дней в каждом месяце
 используйте еще один массив с именами месяцев чтобы вывести название месяца + количество дней
 сделайте тоже самое, но используя массив кортежей с параметрами (имя месяца, количество дней)
 сделайте тоже самое, только выводите дни в обратном порядке (порядок в исходном массиве не меняется)
 для произвольно выбранной даты (месяц и день) посчитайте количество дней до конца года */

let daysInMohths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print("просто выводим месяца")
for item in daysInMohths {
    print(item)
}

print("выводим месяца через forEach")
daysInMohths.forEach {print($0)}

print("выводим с номером месяца")
for i in 0...daysInMohths.count - 1 {
    print("В месяце \(i+1) дней: \(daysInMohths[i])")
}

let monthNames = ["январь", "февраль", "март", "апрель", "май", "июнь", "июль", "август", "сентябрь", "октярь", "ноябрь", "декабрь"]

print("выводим с названием месяца из двух массивов")
for i in 0...daysInMohths.count - 1 {
    print("дней в месяце \(monthNames[i]): \(daysInMohths[i])")
}

// кортежи
let months = [
    (days: 31, name: "январь"),
    (days: 28, name: "февраль"),
    (days: 31, name: "март"),
    (days: 30, name: "апрель"),
    (days: 31, name: "май"),
    (days: 30, name: "июнь"),
    (days: 31, name: "июль"),
    (days: 31, name: "август"),
    (days: 30, name: "сентябрь"),
    (days: 31, name: "октябрь"),
    (days: 30, name: "ноябрь"),
    (days: 31, name: "декабрь")
]

print("выводим с названием месяца, используя кортежи")
months.forEach {print("дней в месяце \($0.name): \($0.days)")}

print("выводим с названием месяца в обратном порядке, используя кортежи")
for i in 0...months.count - 1 {
    print("дней в месяце \(months[i].name): \(months[i].days)")
}

// сколько дней осталось до конца года с даты
func getDaysUntilEndOfYear(monthNum: Int, dayNum: Int) -> Int {
    let months = [
        (days: 31, name: "январь"),
        (days: 28, name: "февраль"),
        (days: 31, name: "март"),
        (days: 30, name: "апрель"),
        (days: 31, name: "май"),
        (days: 30, name: "июнь"),
        (days: 31, name: "июль"),
        (days: 31, name: "август"),
        (days: 30, name: "сентябрь"),
        (days: 31, name: "октябрь"),
        (days: 30, name: "ноябрь"),
        (days: 31, name: "декабрь")
    ]

    // индексы, в отличие от реального номера месяца, начинаются с нуля
    let indexMonthNum = monthNum - 1;

    // в результат добавляем остаток дней в текущем месяце
    var result = months[indexMonthNum].days - dayNum
    
    if (indexMonthNum + 1 == months.count) {
        return result
    }

    // добавляем остальные числа
    for i in indexMonthNum + 1...months.count - 1 {
        result += months[i].days
    }
    
    return result
}

print("Сегодня 27 марта, до конца года \(getDaysUntilEndOfYear(monthNum: 3, dayNum: 27)) дней")
print("Сегодня 31 декабря, до конца года \(getDaysUntilEndOfYear(monthNum: 12, dayNum: 31)) дней")
print("Сегодня 29 ноября, до конца года \(getDaysUntilEndOfYear(monthNum: 11, dayNum: 29)) дней")

/* Создайте словарь, как журнал студентов, где имя и фамилия студента это ключ, а оценка за экзамен — значение.
Повысьте студенту оценку за экзамен
Если оценка положительная (4 или 5) или удовлетворительная (3), то выведите сообщение с поздравлением, отрицательная (1, 2) - отправьте на пересдачу
Добавьте еще несколько студентов — это ваши новые одногруппники!
Удалите одного студента — он отчислен
Посчитайте средний балл всей группы по итогам экзамена. */

var examResults: [String: Int] = ["Иван Иванов": 5, "Петр Петров": 4, "Сидор Сидоров": 2, "Степан Степанов": 3]

// увеличение оценки студента
func increaseResult(student: String) {
    if (examResults[student] == nil) {
        print("Нет такого студента \(student)")
        return
    }

    if (examResults[student] == 5) {
        print("У студента \(student) уже наивысшая оценка")
        return
    }
    
    examResults[student] = examResults[student]! + 1
    
    print("Теперь у студента \(student) оценка \(examResults[student]!)")
}

increaseResult(student: "Иван Иванов")
increaseResult(student: "Степан Степанов")
increaseResult(student: "Случайный текст")

// нужна ли пересдача
func checkResult(student: String) {
    if (examResults[student] == nil) {
        print("Нет такого студента")
        return
    }

    if (examResults[student] == 1 || examResults[student] == 2) {
        print("\(student). Нужна пересдача")
    } else {
        print("\(student). Поздравляем, эксзамен сдан")
    }
}

checkResult(student: "Иван Иванов")
checkResult(student: "Сидор Сидоров")

// добавляю новых студентов
examResults["Михаил Михайлов"] = 4
examResults["Дмитрий Дмитриев"] = 1

// удаляем одного студента
examResults["Сидор Сидоров"] = nil

func avgResult() -> Double {
    var sum: Double = 0
    var count: Double = 0
    
    for (_, mark) in examResults {
        sum += Double(mark)
        count += 1
    }
    
    if (count > 0) {
        return Double(sum)/Double(count)
    }
    
    return sum
}

print("Средний результат \(avgResult())")

