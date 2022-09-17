package wood.mike

import grails.converters.JSON

import java.text.DateFormat

class RandomLocaleController {

    def rand = new Random()

    def index() { }

    def fetch() {
        def allLocales = DateFormat.getAvailableLocales()
        render( allLocales[rand.nextInt(allLocales.size()-1)].toString() ) as JSON
    }
}
