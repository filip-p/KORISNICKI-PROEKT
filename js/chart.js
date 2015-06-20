var adminChart;
var donutChart;
$(document).ready(function () {

    var books = $('input[id$=booksNumber]').val();
    var users = $('input[id$=usersNumber]').val();
    adminChart = c3.generate({
        bindto: '#userBookRatioChart',
        data: {
            // iris data from 
            columns: [
                ['Number of Books added for exchange', books],
                ['Number of Registered Users', users],
            ],
            type: 'pie',
            onclick: function (d, i) { console.log("onclick", d, i); },
            onmouseover: function (d, i) { console.log("onmouseover", d, i); },
            onmouseout: function (d, i) { console.log("onmouseout", d, i); }
        }
    });
});
