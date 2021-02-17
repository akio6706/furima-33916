window.addEventListener('load', () => {

  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", () => {
    const inputValue = itemPrice.value;

    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = Math.floor(inputValue / 10) ;

    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax.innerHTML ;
  })
});
