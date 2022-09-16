package wood.mike

import grails.converters.JSON

import java.text.DateFormat

class TestDataController {

    def rand = new Random()

    def index() {}

    def wine() {
        log.info('Providing wine')
        render( ['Merlot', 'Cabernet sauvignon', 'Chateauneuf du pape', 'Chardonnay', 'Pinot noir'] as JSON )
    }

    def randomLocale() {
        def allLocales = DateFormat.getAvailableLocales()
        render( allLocales[rand.nextInt(allLocales.size()-1)].toString() ) as JSON
    }
}
