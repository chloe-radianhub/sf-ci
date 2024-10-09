import { LightningElement, api } from "lwc";
import addOne from "@salesforce/apex/ExampleClass.addOne";

export default class Example extends LightningElement {
  @api hi;
  test;

  async connectedCallback() {
    // setTimeout(async () => {
    // this.test = await addOne(4);
    // })
    this.test = await addOne({ num: 4 });
  }
}
