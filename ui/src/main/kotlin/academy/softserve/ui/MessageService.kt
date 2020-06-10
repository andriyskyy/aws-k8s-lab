package academy.softserve.ui

import org.springframework.web.client.RestTemplate
import org.springframework.web.client.getForObject

class MessageService(private val restTemplate: RestTemplate, private val endpoint: String) {
    fun message(name: String): Map<String, String> {
        return restTemplate.getForObject("$endpoint/$name")
    }
}