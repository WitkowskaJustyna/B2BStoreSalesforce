trigger OrderTrigger on Order (after insert, after update) {

    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        OrderTriggerHandler.substractQuantityOfProduct(Trigger.New);

    }

}