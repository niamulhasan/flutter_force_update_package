A flutter widget to show the user if there is an update available of your app from an api endpoint.

## Features

* A widget to show if you have an update of your app
* Note that this is an `widget` not a page (not a route) so use this widget as an overlay, (see the
  example at bottom)

## Getting started

No extra dependency is required.  
Just install the package and you are ready to go.

## Usage

Use The provided `ForceUpdatePrompt()` widget to show if your app has an update.

Usage:

##### Example:

```plaintext
ForceUpdatePrompt(
                    androidVersionName: "2.33.4533,
                    androidVersionCode: "22,
                    iosVersionName: "4.34.5434,
                    iosVersionCode: "43,
                    androidPriorityIsHigh: true,
                    iosPriorityIsHigh: false,
                    backgroundColor: Colors.purple,
                    logo: Image.asset("asset/new/icon_app.png"),
                    transparentBackground: true,
                    message: "New version available",
                    updateButton: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: MyButton(
                        text: "Update Now",
                      ),
                    ),
                    skipButton: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: MyButton(
                        text: "Skip",
                      ),
                    ),
                  );
```

## Implementation of `validate()`

**It has an helper** `**ForceUpdateUtils.getRemoteUpdateStatus()**` **method if you want to fetch
latest version info from an API endpoint**

##### Example

```plaintext
ForceUpdateUtils.getRemoteUpdateStatus("https://62b43f19530b26da4cb9fcc0.mockapi.io/check-update")
```

If you want to use this build in helper you response must look like this

```plaintext
[
  {
    "message": "New Update is available!",
    "android_version_name": "1.1.20220624",
    "android_version_code": "17",
    "android_priority_is_high": false,
    "ios_version_name": "1.1.20220624",
    "ios_version_code": "17",
    "ios_priority_is_high": true
  }
]
```

As the helper using a internal data model class for this specific JSON formate

**A Full Example**  
Notice that the widget is used as an overlay

### If you want to make the update decision on client side.

```plaintext
Stack(
          children: [
            isLoading
                ? Splash()
                : isRegistered
                    ? Home()
                    : isAuth
                        ? ProfileNameImageDOB()
                        : IntroPage(),

            FutureBuilder(
              future: ForceUpdateUtils.getRemoteUpdateStatus("https://62b43f19530b26da4cb9fcc0.mockapi.io/check-update"),
              builder: (context, AsyncSnapshot<ForceUpdateRemoteData?> snapshot){
                if(snapshot.hasData && snapshot.data != null){
                  return ForceUpdatePrompt(
                    androidVersionName: snapshot.data!.androidVersionName,
                    androidVersionCode: snapshot.data!.androidVersionCode,
                    iosVersionName: snapshot.data!.iosVersionName,
                    iosVersionCode: snapshot.data!.iosVersionCode,
                    androidPriorityIsHigh: snapshot.data!.androidPriorityIsHigh,
                    iosPriorityIsHigh: snapshot.data!.iosPriorityIsHigh,
                    backgroundColor: Colors.purple,
                    logo: Image.asset("asset/new/icon_app.png"),
                    transparentBackground: true,
                    message: snapshot.data!.message ?? "New version available",
                    updateButton: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: MyButton(
                        text: "Update Now",
                      ),
                    ),
                    skipButton: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: MyButton(
                        text: "Skip",
                      ),
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              } ,
            ),
          ],
        );
```

### If you want to make the update decision on server side.

```plaintext
FutureBuilder(
future: ForceUpdateUtils.postLocalInfoForRemoteDecision(
"https://developers.romoni.com.bd/api/v3.0/check-version"),
builder: (context, sn) {
if (sn.hasData && sn.data != null) {
ForceUpdateRemoteDecision data =
sn.data as ForceUpdateRemoteDecision;
return UpdateWidget(
transparentBackground: true,
backgroundColor: Colors.red,
logo: Image.network("https://picsum.photos/200"),
message: data.message ?? "New version available",
textColor: Colors.purple,
updateButton: Padding(
padding: const EdgeInsets.symmetric(horizontal: 40.0),
child: MyButton(
text: "Update Now",
),
),
skipButton: Padding(
padding: const EdgeInsets.symmetric(horizontal: 40.0),
child: MyButton(
text: "Skip",
),
), isPriorityHigh: data.isMajor ?? false,);
}
return Text("Loading");
},
)
```

## Additional information

If you want to contribute to the project please go to our github
repo [GitHub](https://github.com/niamulhasan/flutter_force_update_package)