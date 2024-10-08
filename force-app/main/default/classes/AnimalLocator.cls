public with sharing class AnimalLocator {

    public class Animal_cls{
        public Integer id;
        public String name;
        public String eats;
        public String says;
    }

    public class JSONOutput{
        public Animal_cls animal;
    }
    
    public static String getAnimalNameById(Integer animalId){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + animalId);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        System.debug(response.getStatusCode());
        if(response.getStatusCode() == 200) {
            //Deserialize the JSON string into collections of primitive data types.
            JSONOutput results = (JSONOutput) JSON.deserialize(response.getBody(), JSONOutput.class);
            return (results.animal.name);
        }else{
            return null;
        }
    }
}