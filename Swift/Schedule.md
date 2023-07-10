# Schedule: Simple Timer

- [Schedule: Simple Timer](#schedule-simple-timer)
  - [Init](#init)
  - [Control: pause, resume, cancel](#control-pause-resume-cancel)
    - [Tag: Control by tag](#tag-control-by-tag)
  - [Lifecycle: set dead time](#lifecycle-set-dead-time)
  - [Operator](#operator)
  - [Action: add function on Schedule](#action-add-function-on-schedule)
  - [Reference](#reference)


## Init

```swift
Schedule.after(3.seconds).do {
    print("3 seconds passed!")
}

// Do Repeate after 3s:
Schedule.every(3.seconds).do { }

// Do After 1h, repeate every 1 minute
Schedule.after(1.hour, repeating: 1.minute).do { }

// Do at 1s, 5s, 10s
Schedule.of(1.second, 5.second, 10.second).do { }`

// Do at 5:00AM o'clock
Schedule.at("5: 00").do { }`

// Do at 9:00AM Monday & Tuesday every week
Schedule.every(.monday, .tuesday).at("9:00:00").do { }`

// Do at 10:30AM, date: 30 september
Schedule.every(.september(30)).at(10, 30).do { }`

// Do at date0, date1, date2
Schedule.of(date0, date1, date2).do { }
```

## Control: pause, resume, cancel

```swift
let task = Schedule.every(1.minute).do { }
task.suspend()		// will increase task's suspensions
task.resume() 		// will decrease task's suspensions, but no over resume at all, I will handle this for you~
task.cancel() 		// cancel a task will remove it from the internal holder, that is, will decrease task's reference count by one, if there are no other holders, task will be released
```

### Tag: Control by tag

```swift
let s = Schedule.every(1.day)
let task0 = s.do(queue: myTaskQueue, tag: "log") { }
let task1 = s.do(queue: myTaskQueue, tag: "log") { }

task0.addTag("database")
task1.removeTag("log")

Task.suspend(byTag: "log")
Task.resume(byTag: "log")
Task.cancel(byTag: "log")
```

## Lifecycle: set dead time

```swift
task.setLifetime(10.hours) // will be cancelled after 10 hours.
task.addLifetime(1.hour)  // will add 1 hour to tasks lifetime
task.restOfLifetime == 11.hours
```

## Operator

```swift
/// Concat
let s0 = Schedule.at(birthdate)
let s1 = Schedule.every(1.year)
let birthdaySchedule = s0.concat.s1
birthdaySchedule.do { 
    print("Happy birthday")
}

/// Merge
let s3 = Schedule.every(.january(1)).at("8:00")
let s4 = Schedule.every(.october(1)).at("9:00 AM")
let holiday = s3.merge(s4)
holidaySchedule.do {
    print("Happy holiday")
}

/// First
let s5 = Schedule.after(5.seconds).concat(Schedule.every(1.day))
let s6 = s5.first(10)

/// Until
let s7 = Schedule.every(.monday).at(11, 12)
let s8 = s7.until(date)
```

## Action: add function on Schedule

```swift
let dailyTask = Schedule.every(1.day)
dailyTask.addAction {
    print("open eyes")
}
dailyTask.addAction {
    print("get up")
}
let key = dailyTask.addAction {
    print("take a shower")
}
dailyTask.removeAction(byKey: key)
```

---

## Reference

- <https://viblo.asia/p/swift-su-dung-timer-don-gian-hon-voi-thu-vien-schedule-maGK7jbB5j2>
