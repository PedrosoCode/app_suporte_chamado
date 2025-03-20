import { createApp } from "vue";
import App from "./App.vue";
import { createMemoryHistory, createRouter } from "vue-router";
import userHome from "./views/userHome.vue"; // Verifique se o caminho está correto

import './styles/css/bootstrap.min.css'
import './styles/js/bootstrap.bundle.min.js'

const routes = [
  { path: "/", component: userHome },
];

const router = createRouter({
  history: createMemoryHistory(),
  routes,
});

const app = createApp(App);

app.use(router).mount("#app");
