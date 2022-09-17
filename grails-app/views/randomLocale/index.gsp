<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Random locale</title>
</head>

<body>
    <h1 style="text-align: center">Random locale <span class="badge badge-primary" data-bind='text: randomLocale'></span></h1>

<g:javascript>
    function RandomLocaleModel() {
        let self = this;

        self.randomLocale = ko.observable('UK');

        setInterval(function () {
            $.ajax({
                url: "/randomLocale/fetch",
                success: function (data) {
                    self.randomLocale(data);
                }})
        }, 2000);
    }
    ko.applyBindings(new RandomLocaleModel());
</g:javascript>
</body>
</html>