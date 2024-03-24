# AnyObject

In 2016, when there was no Combine, the concept of data binding intrigued me quite a bit. and I spent several weeks on it.
Based on the knowledge about it, refer to a letter that existed at that time as Bond. I tested it and wrote it.
After 10 years, I saw this old project again on my computer. A little change, Moving from Swift 3 -> Swift 5.

## Warning
Warning: This project is for learning only, please do not use it for real projects

## How to use

```swift

    private var cancelables: [any Cancelable] = []
    @Object var anObjectYouWantObser: String? = "asdasdasd"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // listent event
        let event = self.$anObjectYouWantObser.sink {
            print("$anObjectYouWantObser changed: ", $0 ?? "")
        }

        self.cancelables.append(event)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            
            // cancel if need
            //self.cancelables.removeAll()
            
            // or
            // self.cancelables.forEach { $0.cancel() }
            
            // or
            // cancel if need
            //event.cancel()
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                for i in (0...5) {
                    self.anObjectYouWantObser = "anObjectYouWantObser change \(i)"
                }
            }
        }
    }

```

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/


