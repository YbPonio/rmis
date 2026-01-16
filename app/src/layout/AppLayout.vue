<template>
  <Suspense>
    <div>
      <app-header></app-header>
      <!-- <app-sidebar></app-sidebar> -->
      <div>
        <router-view></router-view>
      </div>
      <app-footer></app-footer>
    </div>
  </Suspense>
</template>

<script setup>
import { Suspense } from "vue";
import AppHeader from "./AppHeader.vue";
import AppSidebar from "./AppSidebar.vue";
import AppFooter from "./AppFooter.vue";
</script>

<style lang="scss" scoped>
</style>