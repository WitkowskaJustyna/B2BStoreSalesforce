import { LightningElement, wire, api, track } from 'lwc';
import communityId from '@salesforce/community/Id';
//import getProductFromWhishList from '@salesforce/apex/WhishListController.getProductFromWhishList';
//import getLastViewedProducts from '@salesforce/apex/WhishListController.getLastViewedProducts';
//import getWishlistItems from '@salesforce/apex/WhishListController.getWishlistItems';
import retriveDataFromCacheController from '@salesforce/apex/WhishListController.retriveDataFromCacheController'

import {refreshApex} from '@salesforce/apex';


export default class ProductComparator2 extends LightningElement {

    // const FIELDS = [
    //     {label:'Name', fieldName: 'Name', type: 'text'},
    //     {label:'SKU', fieldName: 'StockKeepingUnit', type: 'number'},
    //     {label:'Description', fieldName: 'Description', type: 'text'}

    //   ]

    productList;
    listOfLastViewedProducts;

  
    @api
    get effectiveAccountId() {
        console.log('wejszlo getter');
        return this._effectiveAccountId;
    }

    set effectiveAccountId(value) {
        console.log('wejszlo setter');
        this._effectiveAccountId = value;
    }
    // @api
    // effectiveAccountId;





    

    // @wire(getProductFromWhishList) 
    // productsFromWhishList({errr, data}) {
    //     console.log(data);
    //     if(data) {   
    //         this.productList = JSON.parse(data);
    //     } else if (errr) {
    //         console.error(errr);
    //     }
    // }


    // @wire(getLastViewedProducts) 
    // lastViewedProducts({error, data}) {
    //     console.log(data);
    //     if(data) {   
    //         this.listOfLastViewedProducts = JSON.parse(data);
    //     } else if (error) {
    //         console.error(error);
    //     }

    // }
    @track filtered;
    retriveResult = null;

    @wire(retriveDataFromCacheController,{communityId : communityId, effectiveAccountId : '$resolvedEffectiveAccountId' }) 
    // productsFromCache({error, data}) {
        productsFromCache(result) {
        this.retriveResult = result;
        const {error, data} = result;
        // console.log('wejszlo')
        // console.log('data ', data);
        // console.log('comId ', communityId);
        // console.log('eff ', this.effectiveAccountId );
        
        
        if(data) {

            this.productList = JSON.parse(data);
            this.filtered = this.productList.slice(0,4);

            console.log(this.filtered);

            console.log('ent data');
            console.log(data);
            return refreshApex(result);
        } else if (error) {
            console.error(error);
        }

    }

    // connectedCallback(){
    //     console.log('dupa', this._effectiveAccountId);
    // }

//=====================================================
//     @wire getWishlistItems({
//         communityId: communityId,
//         effectiveAccountId: this.resolvedEffectiveAccountId,
//         wishlistId: 
//         productFields:
//         pageParam:
//     })

// //================================================================
//     @api
//     get effectiveAccountId() {
//         return this._effectiveAccountId;
//     }

    

//     @wire(getProductPrice, {
//         communityId: communityId,
//         productId: '$whishListProductId',
//         effectiveAccountId: '$resolvedEffectiveAccountId'
//     })
//     productPrice;

//     get resolvedEffectiveAccountId() {
//         const effectiveAccountId = this.effectiveAccountId || '';
//         let resolved = null;

//         if (
//             effectiveAccountId.length > 0 &&
//             effectiveAccountId !== '000000000000000'
//         ) {
//             resolved = effectiveAccountId;
//         }
//         return resolved;
//     }


//=========================================================================

get displayableProduct() {

    return {
        
         description: this.product.data.fields.Description,
        image: {
            alternativeText: this.product.data.defaultImage.alternativeText,
            url: resolve(this.product.data.defaultImage.url)
        },
       
        name: this.product.data.fields.Name,
        price: {
            currency: ((this.productPrice || {}).data || {})
                .currencyIsoCode,
            negotiated: ((this.productPrice || {}).data || {}).unitPrice
        },
        sku: this.product.data.fields.StockKeepingUnit,
        
    };
}

get resolvedEffectiveAccountId() {
    const effectiveAccountId = this.effectiveAccountId || '';
    let resolved = null;

    if (
        effectiveAccountId.length > 0 &&
        effectiveAccountId !== '000000000000000'
    ) {
        resolved = effectiveAccountId;
    }
    return resolved;
}


}