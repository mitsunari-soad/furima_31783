function count(){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("input", ()=>{
    const taxPrice = itemPrice.value;
    num1 = Math.floor(Number(taxPrice)*0.1);
    const AddTaxPrice = document.getElementById("add-tax-price");
    AddTaxPrice.innerHTML = `${num1}`;
    num2 = Math.floor(Number(taxPrice)*0.9);
    const Profit = document.getElementById("profit");
    Profit.innerHTML = `${num2}`;
  });
}

window.addEventListener('load', count);