import { Controller } from "stimulus";

export default class extends Controller {
    static targets = ["form", "nextButton"];
    static values = { step: Number };

    connect() {
        this.step = 1;
    }

    submitForm() {
        if (this.step < 3) {
            this.step++;
            this.hideCurrentStep();
            this.showCurrentStep();
        }
    }

    hideCurrentStep() {
        this.formTarget.querySelector(`[data-category-form-step="${this.step}"]`).classList.add("hidden");
    }

    showCurrentStep() {
        this.formTarget.querySelector(`[data-category-form-step="${this.step}"]`).classList.remove("hidden");
    }
}