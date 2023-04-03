window.addEventListener('load', function(){

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
      const tax = Math.floor(inputValue * 0.1);
      addTaxDom.innerHTML = tax;
    const profitDom = document.getElementById("profit");
      const profit = Math.floor(inputValue * 0.9);
      profitDom.innerHTML = profit;
    localStorage.setItem('addTaxValue', tax);
    localStorage.setItem('profitValue', profit);
  });

  const addTaxDom = document.getElementById("add-tax-price");
    const storedAddTaxValue = localStorage.getItem('addTaxValue');
    addTaxDom.innerHTML = storedAddTaxValue;
  const profitDom = document.getElementById("profit");
    const storedProfitValue = localStorage.getItem('profitValue');
    profitDom.innerHTML = storedProfitValue;
});