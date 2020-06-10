package academy.softserve.message

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RestController
import java.net.InetAddress

@RestController
class MessageController(private val properties: DemoProperties) {
	val version = "1.0"

	@GetMapping("/hello/{name}")
	fun hello(@PathVariable name: String): Map<String, String> {
		val response = mutableMapOf<String, String>()
		val hostname = InetAddress.getLocalHost().hostName
		val greeting = properties.greeting
				.replace("\$name", name)
				.replace("\$hostname", hostname)
				.replace("\$version", version)
		response["greeting"] = greeting
		response["version"] = version
		response["hostname"] = hostname

		return response
	}
}