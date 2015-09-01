This bug presents itself when using the Local Datastore and saveEventually on iOS.

When an object is created and updated while offline, the updates go to the backend as new objects.

View a demonstration here:
https://youtu.be/kVvfT7gtu4M

To run this project:

1. Create a new Parse app on Parse.com
2. Create a test user in the Parse app (the source code assumes user: `test@test.com`, password: `test`)
3. Run a `pod install` to install the Parse pod.
4. Set your app credentials in `StartParse.swift`

To demonstrate the bug

1. Take your device offline
2. Tap the save button 5 times
3. Tap the Update button 3 times
4. Go online and look at the `Thingy` object records. The 5 Thingy objects were not created.
