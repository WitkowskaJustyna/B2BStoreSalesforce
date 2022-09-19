import { LightningElement, api, track } from 'lwc';
import storeDataToCacheController from '@salesforce/apex/WhishListController.storeDataToCacheController';
import {refreshApex} from '@salesforce/apex';

export default class AddToCompare extends LightningElement {

    @track isShowModal = false;
    @api recordId;
    @api resultFromApex;

    // storeDataToCache(){

    //     console.log('cacheeee')
    //     storeDataToCacheController({recordId :this.recordId}).then(result=>{
    //         console.log('stored')

    //         if(storeDataToCacheController({recordId :this.recordId}) == true) {

    //             this.isShowModal = true;
    //             console.log('trueee')
    //              return refreshApex(this.recordId);
    //         } else if(storeDataToCacheController({recordId :this.recordId}) == false) {
    //             console.log('falseee')
    //             this.isShowModal = false;
    //         }
    //     }).catch((error)=>{
    //         console.error(error);
    //     })

        
    //         console.log('cosiedzieje')
    //         console.log(storeDataToCacheController({recordId :this.recordId}));

       
    // }
    // hideModalBox() {  
    //     this.isShowModal = false;
    // }


    storeDataToCache(){

        storeDataToCacheController({recordId :this.recordId});

       this.resultFromApex = storeDataToCacheController({recordId :this.recordId});
       console.log(storeDataToCacheController({recordId :this.recordId}));
       console.log(this.resultFromApex);


        if(this.resultFromApex === true)  {

            this.isShowModal = true;
            console.log('truee');

        } else if(this.resultFromApex === false ) {

            this.isShowModal = false;
            console.log('falsee');
        }

    }

    hideModalBox() {  

        this.isShowModal = false;

    }
    
}
// storeDataToCacheController({recordId :this.recordId}).then(result=>{
//     console.log('stored')
    
// }).catch((error)=>{
//     console.error(error);
// })

// storeDataToCacheController({recordId :this.recordId}).then(()=>{
//     console.log('stored2');
    
//     //console.log(recordId);
    
// })