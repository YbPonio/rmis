import { createRouter, createWebHistory } from "vue-router";

const routes = [
  {
    path: "/",
    component: () => import('../layout/AppLayout.vue'),
  },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
