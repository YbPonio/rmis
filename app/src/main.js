import "./style.css";
import { createApp } from "vue";
import App from "./App.vue";
import router from "./router/index.js";
import axios from "axios";
import PrimeVue from "primevue/config";
import Aura from "@primeuix/themes/aura";

axios.defaults.baseURL = "http://localhost:8066/api/public/";

const app = createApp(App);

app.use(PrimeVue, {
  theme: { preset: Aura },
});
app.use(router);
app.mount("#app");
