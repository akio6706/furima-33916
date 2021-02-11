window.addEventListener('load', () => {
  
  const item_price = document.getElementById("item-price");
  item_price.addEventListener("input", () => {
    const inputValue = item_price.value;
    console.log(inputValue);

    const tax = document.getElementById("add-tax-price");
    tax.innerHTML = Math.floor(inputValue / 10) ;
    console.log(tax.innerHTML);

    const profit = document.getElementById("profit");
    profit.innerHTML = inputValue - tax.innerHTML ;
    console.log(profit.innerHTML);
  })
});
