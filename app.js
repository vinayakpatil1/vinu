var http=require('http');   // module
//object----- model
var product ={
    title:"Rosy",
    description:"Valentine Flower",
    unitprice:55,
    likes:500,
    quantity:10000
};

var count=45;
count++;
var controller=function(request,response)
{
	response.writeHead(200,
	                {"Content-Type" : "text/plain"});
	                response.end( JSON.stringify(product));
};
var server=http.createServer(controller);
server.listen(7000);
console.log("listening on port 7000");