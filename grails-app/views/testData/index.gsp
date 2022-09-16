<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Test data</title>
</head>

<body>

    <form>
        <h3>Select dessert</h3>
        <div class="form-row">
            <div class="col-6">
                <select id="cheese" data-bind="options: cheese, value: selectedCheese" class="form-control"></select>
            </div>

            <div class="col">
                <select id="wine" data-bind="options: wine, value: selectedWine" class="form-control"></select>
            </div>
        </div>
    </form>

    <h2>Selection, <span data-bind='text: cheeseAndWine'> </span>!</h2>


    <h1>Random locale <span class="badge badge-primary" data-bind='text: randomLocale'></span></h1>

    <g:javascript>
        function MyViewModel() {
            let self = this;
            self.cheese = ['Stilton', 'Cheddar', 'Edam', 'Brie', 'Dairylea'];
            self.selectedCheese = ko.observable("Cheddar");
            self.wine = ko.observableArray([]);
            self.selectedWine = ko.observable('');
            self.randomLocale = ko.observable('UK');

            self.cheeseAndWine = ko.computed(function() {
                return self.selectedCheese() + " and " + self.selectedWine();
            }, this);

            $.getJSON( "/testData/wine",
                function(data) {
                    self.wine(data);
            });

            setInterval(function () {
                $.ajax({
                    url: "/testData/randomLocale",
                    success: function (data) {
                        self.randomLocale(data);
                    }})
            }, 2000);
        }
        ko.applyBindings(new MyViewModel());
    </g:javascript>
</body>
</html>