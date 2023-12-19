document.addEventListener('DOMContentLoaded', function () {
    const descriptionInput = document.getElementById('description');
    const counterDisplay = document.getElementById('word-count');

    if (descriptionInput && counterDisplay) {
        descriptionInput.addEventListener('input', function () {
            const wordCount = this.value.split(/\s+/).filter(function (word) {
                return word.length > 0;
            }).length;

            counterDisplay.textContent = wordCount;

            if (wordCount > 21) {
                counterDisplay.classList.add('text-red-500');
            } else {
                counterDisplay.classList.remove('text-red-500');
            }
        });
    }
});