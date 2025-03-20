import { createApp } from "vue";
import App from "./App.vue";
import { createMemoryHistory, createRouter } from "vue-router";
import userHome from "./views/userHome.vue";
import ChatView from "./views/chatView.vue";

import './styles/css/bootstrap.min.css'
import './styles/js/bootstrap.bundle.min.js'

const routes = [
  { path: "/", 
    name: "home", 
    component: userHome },
  { path: "/nova_sessao", 
    name: "nova_sessao", 
    component: ChatView },
];

const router = createRouter({
  history: createMemoryHistory(),
  routes,
});

const app = createApp(App);

app.use(router).mount("#app");
