const pay = () => {
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const num = document.getElementById("card-number");
    const exp_month = document.getElementById("card-exp-month");
    const exp_year = document.getElementById("card-exp-year");
    const cvc = document.getElementById("card-cvc");
  });
};

window.addEventListener("load", pay);