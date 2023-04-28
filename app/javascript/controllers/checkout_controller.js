import { Controller } from "stimulus";
import { loadStripe } from "@stripe/stripe-js";

export default class extends Controller {
  async connect() {
    const stripePublicKey = document.querySelector("meta[name='stripe-public-key']").content;
    const stripe = await loadStripe(stripePublicKey);

    const form = document.getElementById("checkout-form");
    if (form) {
      form.addEventListener("submit", async (event) => {
        event.preventDefault();
        const response = await fetch("/checkout/create", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector("meta[name='csrf-token']").content,
          },
        });
        const { id } = await response.json();
        stripe.redirectToCheckout({ sessionId: id });
      });
    }
  }
}
