window.addEventListener('load', function() {
  let itemPrice = document.getElementById("item-price");
  let addTaxPrice = document.getElementById("add-tax-price");
  let profit = document.getElementById("profit");

  itemPrice.addEventListener('input',function() {
    let inputPrice = document.getElementById("item-price").value;
    addTaxPrice.innerHTML = Math.floor(inputPrice * 0.1);
    profit.innerHTML = Math.floor(inputPrice * 0.9);
  })
})