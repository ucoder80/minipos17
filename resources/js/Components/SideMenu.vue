<template lang="">
<!-- Menu -->

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
 
<div class="app-brand demo ">
  <a href="/" class="app-brand-link">
    <span class="app-brand-logo demo"></span>
    <span class="demo menu-text fw-bold fs-2 text-primary">Web POS</span>
  </a>

  <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
    <i class="bx bx-chevron-left bx-sm align-middle"></i>
  </a>
</div>

<div class="menu-inner-shadow"></div>



  <ul class="menu-inner py-1">
      <!-- Dashboards -->
      <li class="menu-item ">
          <router-link to="/store" class="menu-link">
              <i class='bx bx-store menu-icon'></i>
              <div data-i18n="Dashboards">ສະຕ໋ອກສີນຄ້າ</div>
          </router-link>
      </li>
      <li class="menu-item ">
          <router-link to="/pos" class="menu-link">
              <i class='bx bx-shopping-bag menu-icon'></i>
              <div data-i18n="Dashboards">ຂາຍ POS</div>
          </router-link>
      </li>
      <li class="menu-item ">
          <router-link to="/transection" class="menu-link">
              <i class='bx bx-bar-chart-alt menu-icon' ></i>
              <div data-i18n="Dashboards">ການເຄື່ອນໄຫວ</div>
          </router-link>
      </li>
      <li class="menu-item ">
          <router-link to="/report" class="menu-link">
              <i class='bx bx-receipt menu-icon' ></i>
              <div data-i18n="Dashboards">ລາຍງານ</div>
          </router-link>
      </li>
  </ul>

</aside>
<!-- / Menu -->
</template>
<script>
export default {
    
}
</script>
<style lang="">
    
</style>