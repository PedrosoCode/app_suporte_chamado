<script setup lang="ts">
import { useRouter } from 'vue-router'
const router = useRouter()

// import { ref } from "vue";
// import { invoke } from "@tauri-apps/api/core";

// const greetMsg = ref("");
// const name = ref("");

// async function greet() {
//   // Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
//   greetMsg.value = await invoke("greet", { name: name.value });
// }

async function NovaSessao() {
  router.push({
    name: 'nova_sessao',
  })
}

</script>

<!-- <template>
  <div class="container border border-secondary">
    <div class="row px-3 py-1">
      <div class="col-md-2">a</div>
      <div class="col-md-4">a</div>
    </div>
  </div>
</template> -->
<template>
  <div class="min-vh-100 bg-dark text-white p-4">
    <div class="container">
      <div class="row justify-content-center g-4">
        <!-- Primeiro Card -->
        <div class="col-12 col-md-8 col-lg-6">
          <div class="card bg-dark border-secondary h-100"> <!-- Added h-100 -->
            <div class="card-body p-4 d-flex flex-column">
              <h5 class="card-title mb-4 text-primary">Solicitar nova sessão</h5>
              <div class="mt-auto"> <!-- Push button to bottom -->
                <button class="btn btn-primary w-100 py-2" type="submit" @click="NovaSessao()">
                  Solicitar Suporte 
                </button>
              </div>
            </div>
          </div>
        </div>

        <!-- Segundo Card -->
        <div class="col-12 col-md-8 col-lg-6">
          <div class="card bg-dark border-secondary h-100"> <!-- Added h-100 -->
            <div class="card-body p-4 d-flex flex-column">
              <h5 class="card-title mb-4 text-primary">Código existente</h5>
              <form class="d-flex flex-column gap-3 flex-grow-1">
                <div class="form-group">
                  <input
                    type="text"
                    class="form-control bg-dark text-white border-secondary"
                    placeholder="Insira um código de sessão"
                  />
                </div>
                <div class="mt-auto"> <!-- Push button to bottom -->
                  <button class="btn btn-outline-light w-100 py-2" type="submit">
                    Acessar Sessão
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>