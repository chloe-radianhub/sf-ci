import { LightningElement } from "lwc";
import addOne from "@salesforce/apex/ExampleClass.addOne";

export default class Example extends LightningElement {
  test;

  async addOne() {
    this.test = await addOne({ num: 4 });
  }
}
