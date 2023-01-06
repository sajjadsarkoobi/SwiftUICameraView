# Camera View - SwiftUI - Combine
Creating Camera View based on Combine &amp; SwiftUI

Presenting the camera view and accessing each frame have never been so much easier rather than this.




![Preview](https://github.com/sajjadsarkoobi/SwiftUICameraView/blob/main/SwiftUICameraView/Assets.xcassets/preview.dataset/preview.gif)



### How it works

SwiftUI is a declarative program, which means that it creates its views each time something changes in the data that it should be presented.

So with the help of `AvFoundation` and accessing the camera as an input device for `AVSession,` we can have each frame as a `CVImageBuffer` as an output.

So then with the help of `Combine` we can publish each frame and present it. The huge benefit of that you can manipulate and add filters or even change one frame :).

### Best Use cases:
- Creating a filter app
- Computer vision
- Image processing


### Author:

- [@Sajjad Sarkoobi](https://www.github.com/sajjadsarkoobi)
- [LinkedIn](https://www.linkedin.com/in/sajjad-sarkoobi/)
- sajjadsarkoobi@gmail.com
