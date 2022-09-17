<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="dessert.css" />
    <title>Test data</title>
</head>

<body>
    <div class="container">
        <form>
            <h3>Select dessert</h3>
            <div class="form-row">
                <div class="col-6">
                    <select id="cheese" data-bind="options: cheese, value: selectedCheese, event: { change: addCurrent }" class="form-control"></select>
                </div>

                <div class="col">
                    <select id="wine" data-bind="options: wine, value: selectedWine, event: { change: addCurrent }" class="form-control"></select>
                </div>
            </div>
        </form>

        <h2>Current selection, <span data-bind='text: cheeseAndWine'> </span>!</h2>

        <table class="table table-bordered">
            <caption>Previous selections</caption>
            <thead>
                <tr>
                    <th>Cheese</th>
                    <th>Wine</th>
                    <th>Selection time</th>
                </tr>
            </thead>
            <tbody data-bind="foreach: previousSelections">
                <tr>
                    <td data-bind="class: $data.cls"></td>
                    <td data-bind="text: $data.wi"></td>
                    <td data-bind="text: $data.ts"></td>
                </tr>
            </tbody>
        </table>

        <g:javascript>
            function MyViewModel() {
                let self = this;
                self.cheese = ['Stilton', 'Cheddar', 'Edam', 'Brie', 'Dairylea'];
                self.selectedCheese = ko.observable("Cheddar");
                self.wine = ko.observableArray([]);
                self.selectedWine = ko.observable('');
                self.previousSelections = ko.observableArray([])

                self.cheeseAndWine = ko.computed(function() {
                    return self.selectedCheese() + " and " + self.selectedWine();
                }, this);

                self.addCurrent = function (obj, event) {
                    if( event.originalEvent ) {
                        self.previousSelections.push({ch: self.selectedCheese(),
                            wi: self.selectedWine(),
                            ts: currentTime(),
                            cls: 'icon-' + self.selectedCheese().toLowerCase()})

                        if( self.previousSelections().length > 5 ) {
                            alert("You are too indecisive, come back another time");
                            self.previousSelections([]);
                        }
                    }
                };

                function currentTime() {
                    var today = new Date();
                    return today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                }

                $.getJSON( "/dessert/wine",
                    function(data) {
                        self.wine(data);
                });
            }
            ko.applyBindings(new MyViewModel());
        </g:javascript>
    </div>
</body>
</html>