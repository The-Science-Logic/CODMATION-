# This is a configuration file for ProGuard.
# http://proguard.sourceforge.net/index.html#manual/usage.html

# Common ProGuard rules for Android apps

# Keep line numbers for stack traces
-keepattributes SourceFile,LineNumberTable
-renamesourcefileattribute SourceFile

# Keep all public classes and their public members
-keep public class * {
    public protected *;
}

# Keep all classes in com.codmation package
-keep class com.codmation.** { *; }

# Preserve stack trace information
-keepattributes *Annotation*
-keepattributes Signature
-keepattributes InnerClasses

# Keep enums
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# Keep Parcelable implementation
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Hilt - Dependency Injection
-keep class com.google.dagger.hilt.** { *; }
-keep class dagger.hilt.** { *; }
-keep class javax.inject.** { *; }

# Kotlin specific rules
-keepclassmembers class kotlin.Metadata {
    public <methods>;
}
-dontwarn kotlin.**
-dontwarn kotlinx.**

# Jetpack Compose
-keep class androidx.compose.** { *; }
-dontwarn androidx.compose.**

# Room Database
-keep class androidx.room.** { *; }
-dontwarn androidx.room.**

# Coroutines
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# GSON
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# FFmpeg
-keep class com.arthenica.ffmpeg.** { *; }
-dontwarn com.arthenica.ffmpeg.**

# Timber Logging
-keep class timber.log.Timber** { *; }
-dontwarn timber.log.Timber**

# Android lifecycle
-keep class androidx.lifecycle.** { *; }
-dontwarn androidx.lifecycle.**

# ViewModel
-keep class androidx.lifecycle.ViewModel
-keepclasseswithmembernames class * extends androidx.lifecycle.ViewModel {
    <init>(...);
}

# Remove logging calls in release build
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# Optimization settings
-optimizationpasses 5
-verbose
