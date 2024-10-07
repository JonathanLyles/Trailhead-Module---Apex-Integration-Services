public with sharing class AnimalLocator {
    public AnimalLocator() {

    }
    public String getAnimalNameById(Integer idNumber){
        String animalReturned;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + idNumber);
        request.setMethod('POST');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
        animalReturned = response.getBody();
        }
        return animalReturned;
    }
}

