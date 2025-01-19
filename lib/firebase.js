
import { initializeApp } from "firebase/app";
import { getMessaging, getToken, onMessage } from "firebase/messaging";


const firebaseConfig = {
  apiKey: "AIzaSyCV6ghKcjsCyc-J8mTZ_Sv9tVH2UjkpEeA",
  authDomain: "jokeapp-c973c.firebaseapp.com",
  projectId: "jokeapp-c973c",
  storageBucket: "jokeapp-c973c.appspot.com",
  messagingSenderId: "553856176880",
  appId: "1:553856176880:web:f2e97f6539092c388f6835",
  measurementId: "G-X9W6T9YPFT"
};


const app = initializeApp(firebaseConfig);
const messaging = getMessaging(app);

Notification.requestPermission().then((permission) => {
  if (permission === "granted") {
    console.log("Notification permission granted.");

    // Get Firebase Cloud Messaging token
    getToken(messaging, {
      vapidKey: "BNq2vNixaPDRG5tq2smesuNwRwBM_vFeDHVln1caUY2xRl9jBIvJY0-eXRgrjv2mRlwN8BECHQMQz6KeMzBOWMM"
    }).then((currentToken) => {
      if (currentToken) {
        console.log("FCM Token: ", currentToken);
        // You can save this token in your server to target specific devices for notifications
      } else {
        console.log("No token available.");
      }
    }).catch((err) => {
      console.log("Error getting FCM token: ", err);
    });
  } else {
    console.log("Notification permission denied.");
  }
});

onMessage(messaging, (payload) => {
  console.log("Message received: ", payload);
  const notificationTitle = payload.notification.title;
  const notificationOptions = {
    body: payload.notification.body,
    icon: payload.notification.icon,
  };

  // Show notification in the browser
  new Notification(notificationTitle, notificationOptions);
});
