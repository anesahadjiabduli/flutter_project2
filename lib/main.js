import { requestNotificationPermission } from './firebase/firebase'; // Adjust path if needed

requestNotificationPermission()
  .then((token) => {
    if (token) {
      console.log("FCM Token received:", token);
    }
  })
  .catch((err) => {
    console.error("Error getting notification permission:", err);
  });
