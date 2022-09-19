//poprzednie rozwiązanie
import { LightningElement, wire, api, track } from 'lwc';
import getOpinions from '@salesforce/apex/OpinionController.getOpinions';
import getAllOpinions from '@salesforce/apex/OpinionController.getAllOpinions';

//import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = [
    {label:'Opinion about product', fieldName: 'Opinion_about_product__c', type: 'text'},
    {label:'Opinion from 1 to 5', fieldName: 'Opinion15__c', type: 'number'}
  ]

export default class ShowOpinion extends LightningElement {

    @api recordId;
    @api opinions;
    @api displayTable = false;

    //buttonShowMore;
    @api opin;

    //@wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    @wire(getOpinions, {recordId: '$recordId', fields: FIELDS}) opinions;
    @wire(getAllOpinions, {recordId: '$recordId', fields: FIELDS}) allOpinions;

    @track ifShowMoreClicked = false;

    connectedCallback(){
       
        getOpinions( {recordId: this.recordId}).then(res =>{
            
            this.opinions = res;
            this.displayTable = true;
            });

            console.log('xxxx');

         }

       

         handleClick(){
          console.log('xzzzzzzz');
          this.ifShowMoreClicked = true; 
          //this.buttonShowMore = this.allOpinions;
          getAllOpinions({recordId: this.recordId}).then(result=>{this.opin = result;});
          
          
         }

}

     //poprzednie rozwiązanie     
        // get opinionAboutProduct() {
        //     return (this.opinions.Opinion_about_product__c);
        // }
        // get opinionAboutProductInNumber() {
        //     return (this.opinions.Opinion15__c);
        // }


//===========================================================================

  //  import { LightningElement, wire, api, track } from 'lwc';
  //  import getOpinions from '@salesforce/apex/OpinionController.getOpinions';

  //  export default class ShowOpinion extends LightningElement{

  //   @track columns = [
  //     {label:'Opinion about product', fieldName: 'Opinion_about_product__c', type: 'text'},
  //     {label:'Opinion from 1 to 5', fieldName: 'Opinion15__c', type: 'number'}
  //   ];

  //   @track oppList;
  //   @track displayList = [];
  //   @track error;
  //   @track showMoreButton;

  //   @api recordId;

  //   @wire(getOpinions, {recordId: '$recordId'})
  //   opinions({ error, data}){
  //     console.log(data); 
  //     if (data) {
  //       this.oppList = data;
  //       this.displayList = [this.oppList].splice(0,5);
  //     } else if(error) {
  //       this.error = error;
  //     }
  //   }
  //   handleClick(event){
  //     this.displayList = [this.oppList];
  //   }

  //  }