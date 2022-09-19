public with sharing class OrderTriggerHandler {
    // public static void substractQuantityOfProduct(List<Order> newListOfOrders, List<Order> oldListOfOrders) {
    //     System.Debug(newListOfOrders);
    //     System.Debug(oldListOfOrders);
    //     System.Debug('triggerek');
    //     Set<Id> oldOrdersIds = (new Map<Id,Order>(oldListOfOrders)).keySet();
    //     System.Debug(oldOrdersIds);

    //     Set<Id> newOrdersIds = (new Map<Id,Order>(newListOfOrders)).keySet();
    //     System.Debug(newOrdersIds);

    //     newOrdersIds.removeAll(oldOrdersIds); //Set of newIds contains only Ids just added
    //     System.Debug(newOrdersIds);
    //     List<OrderItem> listOfOrderitems = [SELECT Id, Product2Id, Quantity FROM OrderItem WHERE OrderId =: newOrdersIds];
        
    //     Map<Id, Decimal> mapOfProductsIdAndOrderQuantity = new Map<Id, Decimal>();

    //     for(OrderItem item : listOfOrderitems){

    //         mapOfProductsIdAndOrderQuantity.put(item.Product2Id, item.Quantity);

    //     }

    //     Set<Id> productsIds = mapOfProductsIdAndOrderQuantity.keySet();

    //     List<Product2> products = [SELECT Id, QuantityInStock__c FROM Product2 WHERE Id =:productsIds ];
        
    //     Map<Id, Decimal> mapOfProductsIdAndQuantityInStock = new Map<Id, Decimal>();
        
    //     for(Product2 prod : products){

    //         mapOfProductsIdAndQuantityInStock.put(prod.Id, prod.QuantityInStock__c);

    //     }

    //     for( Id key : mapOfProductsIdAndOrderQuantity.keySet() ){

    //         Decimal quantityOfOrder = mapOfProductsIdAndOrderQuantity.get(key);

    //         Decimal quantityOfProduct = mapOfProductsIdAndQuantityInStock.get(key);

    //         Decimal newQuantityOfProduct = quantityOfProduct - quantityOfOrder;

    //         List<Product2> oneProduct = [SELECT Id, QuantityInStock__c FROM Product2 WHERE Id =:key LIMIT 1];

    //         for(Product2 prod : oneProduct ){
    //             prod.QuantityInStock__c = newQuantityOfProduct;
    //             update prod;
    //         }


    //     }

    // }

    public static void substractQuantityOfProduct(List<Order> newListOfOrders) {
        System.Debug(newListOfOrders);
        
        System.Debug('triggerek');
        
        Set<Id> newOrdersIds = (new Map<Id,Order>(newListOfOrders)).keySet();
        System.Debug(newOrdersIds);

        List<OrderItem> listOfOrderitems = new List<OrderItem>();

        listOfOrderitems = [SELECT Id, Product2Id, Quantity, OrderId FROM OrderItem WHERE OrderId IN :newOrdersIds];
        System.Debug(listOfOrderitems);
        Map<Id, Decimal> mapOfProductsIdAndOrderQuantity = new Map<Id, Decimal>();
        

        for(OrderItem item : listOfOrderitems){

            mapOfProductsIdAndOrderQuantity.put(item.Product2Id, item.Quantity);

        }
        System.Debug(mapOfProductsIdAndOrderQuantity);

        Set<Id> productsIds = mapOfProductsIdAndOrderQuantity.keySet();

        List<Product2> products = [SELECT Id, QuantityInStock__c FROM Product2 WHERE Id =:productsIds ];
        System.Debug(products);
        Map<Id, Decimal> mapOfProductsIdAndQuantityInStock = new Map<Id, Decimal>();
        
        for(Product2 prod : products){

            mapOfProductsIdAndQuantityInStock.put(prod.Id, prod.QuantityInStock__c);

        }
        System.Debug(mapOfProductsIdAndQuantityInStock);

        for( Id key : mapOfProductsIdAndOrderQuantity.keySet() ){

            Decimal quantityOfOrder = mapOfProductsIdAndOrderQuantity.get(key);

            Decimal quantityOfProduct = mapOfProductsIdAndQuantityInStock.get(key);

            Decimal newQuantityOfProduct = quantityOfProduct - quantityOfOrder;

            List<Product2> oneProduct = [SELECT Id, QuantityInStock__c FROM Product2 WHERE Id =:key LIMIT 1];

            for(Product2 prod : oneProduct ){
                prod.QuantityInStock__c = newQuantityOfProduct;
                update prod;
            }


        }

    }
}
