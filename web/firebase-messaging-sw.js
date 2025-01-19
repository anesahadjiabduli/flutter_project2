// firebase-messaging-sw.js
importScripts('https://www.gstatic.com/firebasejs/9.1.3/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/9.1.3/firebase-messaging.js');


const firebaseConfig = {
  apiKey: "AIzaSyCV6ghKcjsCyc-J8mTZ_Sv9tVH2UjkpEeA",
  authDomain: "jokeapp-c973c.firebaseapp.com",
  projectId: "jokeapp-c973c",
  storageBucket: "jokeapp-c973c.appspot.com",
  messagingSenderId: "553856176880",
  appId: "1:553856176880:web:f2e97f6539092c388f6835",
  measurementId: "G-X9W6T9YPFT"
};


firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();


messaging.onBackgroundMessage(function(payload) {
  console.log("Background message received: ", payload);
  const notificationTitle = "Joke of the Day!";
  const notificationOptions = {
    body: payload.notification.body,
    icon: "/firebase-logo.png", 
  };


  self.registration.showNotification(notificationTitle, notificationOptions);
});
