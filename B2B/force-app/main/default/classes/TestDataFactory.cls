public with sharing class TestDataFactory {
    public static Order getOrder(Product2 product) {

        return(new Order (Product2Id = product.Id) );
        
    }

    public static Product2 getProduct(){
        return (new Product2());
    }
}
