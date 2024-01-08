import { Controller } from 'stimulus';

export default class extends Controller {
    static targets = ['password'];

    toggleVisibility() {
        const passwordInput = this.passwordTarget;

        if (passwordInput.type === 'password') {
            passwordInput.type = 'text';
        } else {
            passwordInput.type = 'password';
        }
    }
}