plugins {
    id("org.springframework.boot") version "2.3.0.RELEASE" apply false
    kotlin("jvm") version "1.3.72" apply false
    kotlin("plugin.spring") version "1.3.72" apply false
    id("com.palantir.docker") version "0.25.0" apply false
}
buildscript {
    repositories {
        mavenCentral()
        maven {
            url = uri("https://plugins.gradle.org/m2/")
        }
        jcenter()
    }
    dependencies {
        classpath("io.spring.gradle:dependency-management-plugin:1.0.9.RELEASE")
    }
}

allprojects {
    repositories {
        mavenCentral()
        jcenter()
    }
}

configure(subprojects) {

    apply(plugin = "org.springframework.boot")
	apply(plugin = "io.spring.dependency-management")
	apply(plugin = "org.jetbrains.kotlin.jvm")
	apply(plugin = "org.jetbrains.kotlin.plugin.spring")
	apply(plugin = "com.palantir.docker")

    dependencies {
        "implementation"("org.jetbrains.kotlin:kotlin-reflect")
        "implementation"("org.jetbrains.kotlin:kotlin-stdlib-jdk8")
        "implementation"("org.springframework.boot:spring-boot-starter-actuator")
        "implementation"("org.springframework.boot:spring-boot-starter-web")
        "implementation"("org.springframework.cloud:spring-cloud-starter-sleuth")
        "implementation"("org.springframework.cloud:spring-cloud-starter-zipkin")
        "implementation"("com.fasterxml.jackson.module:jackson-module-kotlin")
    }

    group = "academy.softserve"
    version = "0.0.1-SNAPSHOT"
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
