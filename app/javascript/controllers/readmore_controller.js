import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "moreButton", "lessButton"];

  static classes = ["hide"];

  static values = { fullContent: String };

  connect() {
    this.truncatedContent = this.contentTarget.textContent.trim();
    console.log(this.fullContentValue);
    console.log(this.contentTarget);
    if (this.truncatedContent != this.fullContentValue) {
      this.showLess();
    } else {
      this.hide(this.moreButtonTarget);
      this.hide(this.lessButtonTarget);
    }
  }

  showMore() {
    this.contentTarget.textContent = this.fullContentValue;
    this.hide(this.moreButtonTarget);
    this.show(this.lessButtonTarget);
  }

  showLess() {
    this.contentTarget.textContent = this.truncatedContent;
    this.hide(this.lessButtonTarget);
    this.show(this.moreButtonTarget);
  }

  show(target) {
    target.classList.remove(this.hideClass);
  }

  hide(target) {
    target.classList.add(this.hideClass);
  }
}
