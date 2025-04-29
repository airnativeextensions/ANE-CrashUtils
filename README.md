![](images/hero.png)

# CrashUtils

The [CrashUtils](https://airnativeextensions.com/extension/com.distriqt.CrashUtils) extension gives you access to crash logs from previous terminations of your application.


### Features

- Improve app quality by processing your application crashes
- Single API interface - your code works across supported platforms with no modifications
- Sample project code and ASDocs reference



## Documentation

The [documentation site](https://docs.airnativeextensions.com/docs/crashutils) forms the best source of detailed documentation for the extension along with the [asdocs](https://docs.airnativeextensions.com/asdocs/crashutils). 

Quick Example: 

```actionscript title="AIR"
var reasons:Array = CrashUtils.service.getHistoricalProcessExitReasons();
for each (var reason:ApplicationExitInfo in reasons)
{
    trace( "Reason: " + reason.reason );
    trace( "Description: " + reason.description );
    trace( "Trace: " + reason.traceInputStream );
}
```

![](images/promo.png)
