import { LightningElement, wire, api, track } from 'lwc';
import getAllOpinions from '@salesforce/apex/OpinionController.getAllOpinions';
const columns = [
    {label:'Opinion about product', fieldName: 'Opinion_about_product__c', type: 'text'},
    {label:'Opinion from 1 to 5', fieldName: 'Opinion15__c', type: 'number'}
  ]

export default class ShowAllOpinions extends LightningElement {

    columns = columns;
    @wire(getAllOpinions, {recordId: '$recordId'}) opinions;

    get hasResults() {
		return (this.opinions.data.length > 0);
	}

    // @track clickedButtonLabel = 'Show';  
    // @track boolVisible = false;  

    

    //    handleClick(event) {  
    //     const label = event.target.label;  
    //     const annoucement = this.template.querySelector('p').key;
    //     if ( label === 'Show' ) {  
        
    //         this.clickedButtonLabel = 'Hide';  
    //         this.boolVisible = true;  
        
    //     } else if  ( label === 'Hide' ) {  
                
    //         this.clickedButtonLabel = 'Show';  
    //         this.boolVisible = false;  
        
    //     }

}