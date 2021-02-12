window.addEventListener('load', () => {
  
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("input", () => {
    const inputValue = item_price.value;

    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = Math.floor(inputValue / 10) ;

    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax.innerHTML ;
  })
});
