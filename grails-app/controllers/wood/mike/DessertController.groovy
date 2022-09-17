package wood.mike

import grails.converters.JSON

class DessertController {

    def index() {}

    def wine() {
        log.info('Providing wine')
        render( ['Merlot', 'Cabernet sauvignon', 'Chateauneuf du pape', 'Chardonnay', 'Pinot noir'] as JSON )
    }
}
