import { LightningElement } from 'lwc';
import retriveDataFromCacheController from '@salesforce/apex/WhishListController.retriveDataFromCacheController'

export default class RetriveDataToComaparator extends LightningElement {

    retriveDataFromCache(){
        retriveDataFromCacheController().then(data =>{
            console.log(data);
        })

    }
}