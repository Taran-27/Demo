document.addEventListener('DOMContentLoaded', async () => {
    const stripe = Stripe('pk_test_51LZqHkSE8raO5OCP4NXfIkkUzerYKGE3fhTSSlC4uFpHL4heHttY1hGQmrEGMhI5wLeUSjohmcvlNqdmTD5Qti9x0036IMoGhI');

    const paymentRequest = stripe.paymentRequest({
        currency: 'usd',
        country: 'US',
        requestPayerName: true,
        requestPayerEmail: true,
        total: {
            label: 'Test payment',
            amount: 1999,
        }
    });

    const elements = stripe.elements();
    const prButton = elements.create('paymentRequestButton', {
        paymentRequest: paymentRequest,
    });

    

    paymentRequest.canMakePayment().then((result) => {
        alert("tgb");
        if (result) {
            prButton.mount('#payment-request-button');
        } else {
            document.getElementById('payment-request-button').style.display = 'none';
            /*addMessage('apple-pay');*/
        }
    });

    paymentRequest.on('paymentmethod', async (e) => {
        alert("tfvt")
        console.log(e);
    });
});