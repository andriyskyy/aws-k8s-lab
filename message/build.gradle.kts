import org.jetbrains.kotlin.gradle.tasks.KotlinCompile

plugins {
	kotlin("kapt")
}

java.sourceCompatibility = JavaVersion.VERSION_1_8

repositories {
	mavenCentral()
}

extra["springCloudVersion"] = "Hoxton.SR5"

dependencyManagement {
	imports {
		mavenBom("org.springframework.cloud:spring-cloud-dependencies:${property("springCloudVersion")}")
	}
}
dependencies {
	kapt("org.springframework.boot:spring-boot-configuration-processor")
}

tasks.withType<KotlinCompile> {
	kotlinOptions {
		freeCompilerArgs = listOf("-Xjsr305=strict")
		jvmTarget = "1.8"
	}
}

docker {
	name="${System.getenv("ACCOUNT_ID")}.dkr.ecr.${System.getenv("REGION")}.amazonaws.com/${System.getenv("REPO_PREFIX")}-message:latest"
	tag("v1", "${System.getenv("ACCOUNT_ID")}.dkr.ecr.${System.getenv("REGION")}.amazonaws.com/${System.getenv("REPO_PREFIX")}-message:v1")
	tag("v2", "${System.getenv("ACCOUNT_ID")}.dkr.ecr.${System.getenv("REGION")}.amazonaws.com/${System.getenv("REPO_PREFIX")}-message:v2")
	files("$buildDir/libs/")
}
