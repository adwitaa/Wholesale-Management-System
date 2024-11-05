document.addEventListener('DOMContentLoaded', function() {
    fetchData();
});

function fetchData() {
    // Example API calls
    Promise.all([
        fetch('/api/products').then(response => response.json()),
        fetch('/api/orders').then(response => response.json()),
        fetch('/api/customers').then(response => response.json())
    ])
    .then(data => {
        document.getElementById('totalProducts').innerText = data[0].length; // Assuming data is an array
        document.getElementById('totalOrders').innerText = data[1].length;
        document.getElementById('totalCustomers').innerText = data[2].length;

        // Populate inventory, orders, and customers sections
        populateInventory(data[0]);
        populateOrders(data[1]);
        populateCustomers(data[2]);
    })
    .catch(error => {
        console.error('Error fetching data:', error);
        document.getElementById('inventoryList').innerText = 'Error loading inventory.';
        document.getElementById('ordersList').innerText = 'Error loading orders.';
        document.getElementById('customersList').innerText = 'Error loading customers.';
    });
}

function populateInventory(inventory) {
    const inventoryList = document.getElementById('inventoryList');
    inventoryList.innerHTML = ''; // Clear loading text
    inventory.forEach(item => {
        const div = document.createElement('div');
        div.className = 'card mb-2'; // Bootstrap card class for styling
        div.innerHTML = `
            <div class="card-body">
                <h5 class="card-title">${item.name}</h5>
                <p class="card-text">SKU: ${item.sku}</p>
                <p class="card-text">Quantity: ${item.quantity}</p>
                <p class="card-text">Price: $${item.price.toFixed(2)}</p>
            </div>
        `;
        inventoryList.appendChild(div);
    });
}

function populateOrders(orders) {
    const ordersList = document.getElementById('ordersList');
    ordersList.innerHTML = ''; // Clear loading text
    orders.forEach(order => {
        const div = document.createElement('div');
        div.className = 'card mb-2'; // Bootstrap card class for styling
        div.innerHTML = `
            <div class="card-body">
                <h5 class="card-title">Order #${order.id}</h5>
                <p class="card-text">Customer: ${order.customerName}</p>
                <p class="card-text">Total: $${order.total.toFixed(2)}</p>
                <p class="card-text">Status: ${order.status}</p>
            </div>
        `;
        ordersList.appendChild(div);
    });
}

function populateCustomers(customers) {
    const customersList = document.getElementById('customersList');
    customersList.innerHTML = ''; // Clear loading text
    customers.forEach(customer => {
        const div = document.createElement('div');
        div.className = 'card mb-2'; // Bootstrap card class for styling
        div.innerHTML = `
            <div class="card-body">
                <h5 class="card-title">${customer.name}</h5>
                <p class="card-text">Email: ${customer.email}</p>
                <p class="card-text">Phone: ${customer.phone}</p>
                <p class="card-text">Address: ${customer.address}</p>
            </div>
        `;
        customersList.appendChild(div);
    });
}