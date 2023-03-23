function getData()
{
    listview.model.clear()
    var xmlhttp = new XMLHttpRequest();
    var url = "https://cat-fact.herokuapp.com/facts"; // Идентификатор ресурса
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200)
        {
            print(xmlhttp.responseText)
            parseStaff(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function getOneRandomFact()
{
    listview.model.clear()
    var xmlhttp = new XMLHttpRequest();
    var url = "https://cat-fact.herokuapp.com/facts/random"; // Идентификатор ресурса
    xmlhttp.onreadystatechange = function()
    {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200)
        {
            print(xmlhttp.responseText)
            parseStaff(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function parseStaff(response)
{
    var jsonObj = JSON.parse(response);
    if(jsonObj.length > 0)
        for(var i = 0; i < jsonObj.length; i++)
        {

            listview.model.append( {listdata:"User"+ jsonObj[i].user +"; "+ jsonObj[i].type +"; "+ jsonObj[i].text})
        }
    else
        listview.model.append( {listdata:"User"+ jsonObj.user +"; "+ jsonObj.type +"; "+ jsonObj.text})
}



