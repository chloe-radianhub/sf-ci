import { LightningElement,api } from 'lwc';
import addOne from "@salesforce/apex/ExampleClass.addOne";

export default class Example extends LightningElement {
    @api hi;
    test;

    connectedCallback() {
        setTimeout(async () => {
        this.test = await addOne(4);
        })
    }
}