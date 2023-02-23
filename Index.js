
const tokenizationSpecification = {
    type: 'PAYMENT_GATEWAY',
    parameters: {
        gateway: 'example',
        gatewayMerchantId: 'gatewayMerchantId',
    }
};



const cardPaymentMethod = {
    type: 'CARD',
    tokenizationSpecification: tokenizationSpecification,
    parameters: {
       allowedCardNetworks: ['VISA','MASTERCARD'],
       allowedAuthMethods: ['PAN_ONLY', 'CRYPTOGRAM_3DS'],//tokenised card
       /*phoneNumberRequired: true*/
    }
};




const googlePayConfiguration = {
    apiVersion: 2,
    apiVersionMinor: 0,
    allowedPaymentMethods: [cardPaymentMethod],
};



let googlePayClient;




function onGooglePayLoaded() {
    /*console.log("abcd");*/
    googlePayClient = new google.payments.api.PaymentsClient({
        environment: 'TEST',
    });

    googlePayClient.isReadyToPay(googlePayConfiguration)
        .then(response => {
            if (response.result) {
                createAndAddButton();
            }
            else {
                //
            }
        })
        .catch(error => console.error('isReadyToPay error: ', error));
}

function createAndAddButton() {
    const googlePayButton = googlePayClient.createButton({
        onClick: onGooglePayButtonClicked,
    });
    

    document.getElementById('buy-now').appendChild(googlePayButton);
}

function onGooglePayButtonClicked() {

    const paymentDataRequest = { ...googlePayConfiguration };
    paymentDataRequest.merchantInfo = {
        merchantId: 'BCR2DN4TQCVIZNIK',
        merchantName: 'Demo Orange Shop',
    };

    paymentDataRequest.transactionInfo = {
        totalPriceStatus: 'FINAL',
        totalPrice: '100',
        currencyCode: 'INR',
        /*countryCode: '+91',*/
    };

    googlePayClient.loadPaymentData(paymentDataRequest)
        .then(paymentData => processPaymentData(paymentData))
        .catch(error => console.error('loadPaymentData error: ', error));
}

function processPaymentData(paymentData) {
    console.log("devtest", paymentData);
    console.log("devtest", paymentData.paymentMethodData.type);

    /*window.location.href = "Success.html";*/

    //const url = "https://localhost:44351/api/NewApi"
    //let xhr = new XMLHttpRequest()

    //xhr.open('POST', url, true)
    //xhr.setRequestHeader('Content-type', 'application/json; charset=UTF-8')
    //xhr.send({
    //    "Id": "12",
    //    "Title": "de",
    //    "Quantity": "24",
    //    "Message": "bad",
    //    "City": "kr"
    //});
    //console.log("heloo", paymentData);

    //xhr.onload = function () {
    //    if (xhr.status === 201) {
    //        console.log("Post successfully created!")
    //    }
    //    else {
    //        console.log("Error");
    //    }
    //}


    $.ajax({
        url: 'https://localhost:44351/api/NewApi',
        type: "POST",
        data: {
            "Id": "32",
            "Title": paymentData.paymentMethodData.description,
            "Quantity": "27",
            "Message": paymentData.paymentMethodData.type,
            "City": "VISA",
        },
        success: function (data, textStatus, jqXHR) {
            console.log("taran");
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert(errorThrown);
        }

    });
}

