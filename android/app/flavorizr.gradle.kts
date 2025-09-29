import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.example_cicd"
            resValue(type = "string", name = "app_name", value = "Example CICD Dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.example_cicd.prod"
            resValue(type = "string", name = "app_name", value = "Example CICD Prod")
        }
    }
}