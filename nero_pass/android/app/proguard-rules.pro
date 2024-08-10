# Keep all classes and members annotated with @SerializedName (if using Gson or similar libraries)
-keepclassmembers class * {
    @com.google.gson.annotations.SerializedName <fields>;
}

# Keep everything in the package related to JSON serialization
-keep class com.example.nero_pass.model.** { *; }

# For json_serializable specifically, keep the generated code intact
-keep class com.example.nero_pass.generated.** { *; }

# Prevent obfuscation of all data classes and their members in your package
-keep class com.example.nero_pass.** { *; }

# If you're using Retrofit or similar libraries that use reflection
-keep class com.example.nero_pass.network.** { *; }

# Keep your main application class and all its members
-keep class com.example.nero_pass.MainActivity { *; }
-keep class com.example.nero_pass.MainApplication { *; }
