package academy.softserve.guestbook

import brave.Tracer
import org.aspectj.lang.ProceedingJoinPoint
import org.aspectj.lang.annotation.Around
import org.aspectj.lang.annotation.Aspect
import org.aspectj.lang.annotation.Pointcut
import org.springframework.stereotype.Component

@Aspect
@Component
class JdbcTraceAspect(private val tracer: Tracer) {

    @Around("execution (@org.springframework.data.rest.core.annotation.RepositoryRestResource *)")
    fun traceJdbcCall(pjp: ProceedingJoinPoint): Any {
        val name = pjp.signature.name.toLowerHyphen()
        val span = tracer.nextSpan().name("jdbc:/${name}").start()
        return try {
            pjp.proceed()
        } finally {
            span.finish()
        }
    }
}

val String.MAX_NAME_LENGTH
    get() = 50

fun String.shorten(): String {
    if (this.isBlank()) {
        return this
    }
    val maxLength = if (this.length > MAX_NAME_LENGTH) MAX_NAME_LENGTH else this.length
    return this.substring(0, maxLength)
}

fun String.toLowerHyphen(): String {
    val result = StringBuilder()
    for (i in this.indices) {
        val c = this[i]
        if (c.isUpperCase()) {
            if (i != 0) {
                result.append('-')
            }
            result.append(c.toLowerCase())
        } else {
            result.append(c)
        }
    }
    return result.toString().shorten()
}