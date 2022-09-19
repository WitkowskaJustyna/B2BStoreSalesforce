public with sharing class WhishListController {

    //@AuraEnabled(cacheable = true)
    //public static String getProductFromWhishList() {

    //     Id userId = UserInfo.getUserId();

    //     List<Id> wishListIds = [SELECT Id FROM Wishlist WHERE AccountId = ] //bez sensu

        

        
        
    //     List<WishlistItem> whishListItem = [SELECT Product2Id FROM WishlistItem WHERE WishlistId =: ];

    //     List<Id> whishListProductId = new List<Id>();
        
    //     for(WishlistItem w : whishListItem){
    //       whishListProductId.add(w.Product2Id);
    //     }
    //     System.debug(whishListProductId); 

    //     List<Product2> productDetailList = [SELECT Id, Name, StockKeepingUnit, Description FROM Product2 WHERE Id =:whishListProductId ];
      
        //==========================================================================
        // @AuraEnabled(cacheable=false)
        // public static ConnectApi.WishlistItemCollection getWishlistItems(
        //   String communityId, 
        //   String effectiveAccountId, 
        //   String wishlistId, 
        //   String productFields, 
        //   String pageParam, 
        //   ConnectApi.WishlistItemSortOrder sortItemsBy){

        //     String webstoreId = B2BUtils.resolveCommunityIdToWebstoreId(communityId);

        //     List<Wishlist> wishlistIdFromSelect = [SELECT Id FROM Wishlist WHERE AccountId = :effectiveAccountId AND WebStoreId =: webstoreId ];
        //     wishlistId = String.valueOf(wishlistIdFromSelect.get(0));

        //     ConnectApi.WishlistItemCollection result = ConnectApi.WishlistItemCollection(
        //       webstoreId,
        //       effectiveAccountId,
        //       wishlistId,
        //       productFields,
        //       pageParam,
        //       sortItemsBy
        //     );
              
        //     return result;
        //   }

          

          //===============================================================

          // public static ConnectApi.Wishlist getWishlist(
          //   String webstoreId, 
          //   String effectiveAccountId, 
          //   String wishlistId, 
          //   String productFields, 
          //   Integer pageSize, 
          //   ConnectApi.WishlistItemSortOrder sortItemsBy){

          //     String webstoreId = B2BUtils.resolveCommunityIdToWebstoreId(communityId);
          //   }


          
            
            

        //=======================================================================

        
    //     List<DataWrapper> dwList = new List<DataWrapper>();
    //     DataWrapper dw = new DataWrapper();
    //     dw.Name = 'Name';
    //     dw.SKU = 'SKU';
    //     dw.Descr = 'Description';
    //     dw.Price = 'Price';

    //     dwList.add(dw);

    //     for(Product2 p : productDetailList ) {
    //       DataWrapper dww = new DataWrapper();
    //       dww.Name = p.Name;
    //       dww.SKU = p.StockKeepingUnit;
    //       dww.Descr = p.Description;
    //       dww.Price = p.Id;

    //       dwList.add(dww);

    //     }

    //     System.debug(dwList);
    //     return JSON.serialize(dwList);

    // }

    // @AuraEnabled(cacheable=true)
    // public static ConnectApi.ProductPrice getProductPrice(
    //   String communityId,
    //   String productId,
    //   String effectiveAccountId
    // ) {
    //   // Lookup the webstore ID associated with the community
    //   String webstoreId = B2BUtils.resolveCommunityIdToWebstoreId(communityId);
  
    //   // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_ConnectAPI_CommerceStorePricing_static_methods.htm#apex_ConnectAPI_CommerceStorePricing_static_methods
    //   return ConnectApi.CommerceStorePricing.getProductPrice(
    //     webstoreId,
    //     productId,
    //     effectiveAccountId
    //   );
    // }

    // @AuraEnabled(cacheable=true)

    //       public static ConnectApi.PricingResult getProductPrices(
    //         String communityId,
    //          String effectiveAccountId,
    //           List<String> productIds){

    //       String webstoreId = B2BUtils.resolveCommunityIdToWebstoreId(communityId);
      
    //       // https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_ConnectAPI_CommerceStorePricing_static_methods.htm#apex_ConnectAPI_CommerceStorePricing_static_methods
    //       return ConnectApi.CommerceStorePricing.getProductPrice(
    //         webstoreId,
    //         effectiveAccountId,
    //         productId
    //       );
    //     }

    // private class DataWrapper{
        
    //     string Name;
    //     string SKU;
    //     string Descr;
    //     string Price;

      //img????

    //=======================================================

  
// // Get partition
// Cache.SessionPartition sessionPart = Cache.Session.getPartition('xxx.yyyyy');
// // Retrieve cache value from the partition
// if (sessionPart.contains('BookTitle')) {
//     String cachedProduct = (String)sessionPart.get('BookTitle');
// }
// // Add cache value to the partition
// sessionPart.put('OrderDate', Date.today());
// }

//==============================================================

//Solution with RecentlyViewed object

// @AuraEnabled (cacheable = true)
// public static String getLastViewedProducts(){

//   List<RecentlyViewed> lastVisitedProducts = [SELECT Id, Name 
//   FROM RecentlyViewed WHERE Type = 'Product2' 
//   ORDER BY LastViewedDate 
//   DESC LIMIT 5];

//   List<String> productsIds = new List<String>();
  
  

//    for (RecentlyViewed product : lastVisitedProducts) {
//         productsIds.add(product.Id);
//   }                                      

//   List<Product2> product2List =  [SELECT Id, Name, StockKeepingUnit, Description, (SELECT UnitPrice FROM PricebookEntries ORDER BY UnitPrice LIMIT 1) 
//   FROM Product2 WHERE IsActive = True AND Id IN :productsIds LIMIT 4];

//   List<DataWrapper> dwList = new List<DataWrapper>();
//         DataWrapper dw = new DataWrapper();
//         dw.Name = 'Name';
//         dw.SKU = 'SKU';
//         dw.Descr = 'Description';
//         dw.Price = 'Price';

//         dwList.add(dw);

//         for(Product2 p : product2List ) {
//           DataWrapper dww = new DataWrapper();
//           dww.Name = p.Name;
//           dww.SKU = p.StockKeepingUnit;
//           dww.Descr = p.Description;
//           dww.Price = p.Id;

//           dwList.add(dww);

//         }

//         System.debug(dwList);
//         return JSON.serialize(dwList);

// }
//==========================================================================



@AuraEnabled (cacheable=true)
public static Boolean storeDataToCacheController(String recordId){

  Cache.SessionPartition sessionPart = Cache.Session.getPartition('local.ProductPartition');
  Boolean result = false;

  if(sessionPart.contains('ProductsToCompareList')){
    
    Object objectToList = sessionPart.get('ProductsToCompareList');
    List <String> listOfRecordsFromCache = (List<String>) JSON.deserialize(JSON.serialize(objectToList), List<String>.class);

    if(listOfRecordsFromCache.contains(recordId) == false) {
      System.Debug(recordId);
      listOfRecordsFromCache.add(recordId);
      sessionPart.put('ProductsToCompareList', listOfRecordsFromCache);
      System.Debug('result after add');
      System.Debug(result);

      result = true;
      System.Debug(result);
      return result;

    } else {
      System.Debug('already in compare list');
      System.Debug(result);
      result = false;
      return result;
    }

  } else {

    List<String> listOfRecords = new List<String>();
    listOfRecords.add(recordId);
    sessionPart.put('ProductsToCompareList', listOfRecords);
    System.Debug('result new list');
    System.Debug(result);

    result = true;
    return result;
  }
}
  

@AuraEnabled (cacheable=true)
public static String retriveDataFromCacheController(String communityId, String effectiveAccountId){

  Cache.SessionPartition sessionPart = Cache.Session.getPartition('local.ProductPartition');
  Object objectToList = sessionPart.get('ProductsToCompareList');
  List <String> listOfRecordsFromCache = (List<String>) JSON.deserialize(JSON.serialize(objectToList), List<String>.class);

  List<ConnectApi.ProductDetail> productConnectApiList = new List<ConnectApi.ProductDetail>();
  Map<ConnectApi.ProductDetail, ConnectApi.ProductPrice> mapOfPrices = new Map<ConnectApi.ProductDetail, ConnectApi.ProductPrice>();


  for(Integer i = 0; i < listOfRecordsFromCache.size(); i ++) {

    String productId = listOfRecordsFromCache.get(i);


    ConnectApi.ProductDetail pdw = B2BGetInfo.getProduct(
     communityId,
     productId,
     effectiveAccountId
    );

    productConnectApiList.add(pdw);

    ConnectApi.ProductPrice ppw = B2BGetInfo.getProductPrice(
      communityId,
      productId,
      effectiveAccountId
    );

    mapOfPrices.put(pdw, ppw);
    
  }

  List<DataWrapper> dwList = new List<DataWrapper>();
        DataWrapper dw = new DataWrapper();
        dw.Image = null;
        dw.Name = 'Name';
        dw.SKU = 'SKU';
        dw.Descr = 'Description';
        dw.Price = 'Price';

        dwList.add(dw);

  for(ConnectApi.ProductDetail prod : productConnectApiList){

      ConnectApi.ProductPrice price = mapOfPrices.get(prod);

      DataWrapper dww = new DataWrapper();
      dww.Image = prod.defaultImage.url;
      dww.Name = prod.fields.get('Name');
      dww.SKU = prod.fields.get('StockKeepingUnit');
      dww.Descr = prod.fields.get('Description');
      dww.Price = price.unitPrice;

      // if(dwList.contains())

      dwList.add(dww);

  }

  System.debug(dwList);
  return JSON.serialize(dwList);
  
}
private class DataWrapper{

  String Image;      
  String Name;
  String SKU;
  String Descr;
  String Price;
}

 
}
