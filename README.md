# Flutter Local Push Notifications Module

## 초기화

1. `src/main/AndroidManifest.xml` 파일의 `<application>` 태그 상단에 다음 권한이 필요하다고 선언

```xml
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-permission android:name="android.permission.SCHEDULE_EXACT_ALARM" />
    <uses-permission android:name="android.permission.USE_EXACT_ALARM" />
    <uses-permission
        android:name="android.permission.ACCESS_NOTIFICATION_POLICY"
    />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission
        android:name="android.permission.FOREGROUND_SERVICE_SHORT_SERVICE"
    />
    <application
        android:label="planee"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
    >
    ...
```

2. `<application>` 태그 내부에 다음의 Receiver와 Service 태그 선언

```xml
<receiver
        android:exported="false"
        android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver"
    />
<receiver
        android:exported="false"
        android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver"
    >
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED" />
        <action android:name="android.intent.action.MY_PACKAGE_REPLACED" />
        <action android:name="android.intent.action.QUICKBOOT_POWERON" />
        <action android:name="com.htc.intent.action.QUICKBOOT_POWERON" />
    </intent-filter>
</receiver>
<receiver
        android:exported="false"
        android:name="com.dexterous.flutterlocalnotifications.FlutterLocalNotificationsReceiver"
    />
<receiver
        android:exported="false"
        android:name="com.dexterous.flutterlocalnotifications.ActionBroadcastReceiver"
    />

<service
        android:name="com.dexterous.flutterlocalnotifications.ForegroundService"
        android:exported="false"
        android:stopWithTask="false"
        android:foregroundServiceType="shortService"
    >
</service>
```

3. `build.gradle`에 디슈거링 라이브러리 추가

```python
android {
    compileOptions {
        isCoreLibraryDesugaringEnabled = true
    }
}

dependencies {
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}
```
