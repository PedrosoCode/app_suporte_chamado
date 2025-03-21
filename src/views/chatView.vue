<script setup lang="ts">
// import { useRouter } from 'vue-router'
// const router = useRouter()
</script>

<template>
  <div class="container my-4">
    <h4>O acesso do chamado é:</h4>
    <div class="row my-2 mt-5">
      <div class="col-md-12">
        <div class="border rounded overflow-auto" style="height: 60vh">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit...</p>
          <p>Mais conteúdo...</p>
        </div>
      </div>
    </div>

    <div class="row my-5 align-items-center">
      <div class="col-md-10">
        <input
          type="text"
          class="form-control"
          placeholder="digite a mensagem..."
        />
      </div>
      <div class="col-md-2 d-flex gap-2">
        <button class="btn btn-primary flex-fill">Enviar</button>
        <button class="btn btn-secondary flex-fill">Anexo</button>
      </div>
    </div>
  </div>
</template>
