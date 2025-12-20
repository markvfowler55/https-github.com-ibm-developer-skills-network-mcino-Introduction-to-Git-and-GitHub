function calculateInterest() {
  let principal = document.getElementById("principal").value;
  let rate = document.getElementById("rate").value;
  let time = document.getElementById("time").value;

  if (principal === "" || rate === "" || time === "") {
    document.getElementById("result").innerHTML = "Please fill all fields";
    return;
  }

  let interest = (principal * rate * time) / 100;
  let totalAmount = parseFloat(principal) + interest;

  document.getElementById("result").innerHTML =
    `Simple Interest: ₹${interest}<br>Total Amount: ₹${totalAmount}`;
}
