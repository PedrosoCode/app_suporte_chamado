<script setup lang="ts">
// import { useRouter } from 'vue-router'
// const router = useRouter()
</script>

<template>
  <div class="container mt-4">
    <h4>O acesso do chamado é:</h4>
    <div class="border rounded p-3 overflow-auto" style="height: 60vh">
      <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
      <p>Mais conteúdo...</p>
    </div>
  </div>
  <div class="container border border-subtle p-1 mt-5 rounded">
    <div class="row">
      <div class="col-md-10">
        <input type="text" class="form-control" placeholder="digite a mensagem...">
      </div>
      <div class="col-md-2">
        <button class="btn btn-primary mx-1">Enviar</button>
        <button class="btn btn-secondary mx-1">Anexo</button>
      </div>
    </div>
  </div>
</template>
