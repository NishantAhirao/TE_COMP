var mapFunction = function() {   print(this.state,  this.pop )
                       emit(this.state,  this.pop );
 
                   };

var reduceFunction =  function(key, value){
    // statePop = {state: key, population:Array.sum(value)};
     return Array.sum(value);
}

db.zips.mapReduce(mapFunction,reduceFunction,{query: {},out: "statePop"} );