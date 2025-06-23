<template>
  <div class="modal-overlay" @click.self="changeFormType(0)" v-if="formType === 1 || formType === 2">
    <v-form class="modal-card" @submit.prevent>
      <h2 class="form-title">
        {{ formType === 1 ? 'Add Game' : 'Edit Game' }}
      </h2>

      <div class="form-grid">
        <v-text-field label="Title" outlined dense v-model="changedGame.title"></v-text-field>
        <v-text-field label="Description" outlined dense v-model="changedGame.description"></v-text-field>
        <v-select chips :items="allGenres" label="Genre 1" outlined dense v-model="genre1"></v-select>
        <v-select chips :items="allGenres" label="Genre 2" outlined dense v-model="genre2"></v-select>
      </div>

      <div class="button-group">
        <v-btn color="primary" class="mx-2" @click="changeGame(changedGame)">
          {{ formType === 1 ? 'Add Game' : 'Edit Game' }}
        </v-btn>
        <v-btn color="primary" class="mx-2" @click="changeFormType(0)">
          Cancel
        </v-btn>
      </div>
    </v-form>
  </div>
</template>

<style scoped>
.modal-overlay {
  position: fixed;
  inset: 0;
  background-color: rgba(0, 0, 0, 0.6);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-card {
  background-color: #2e2e2e;
  padding: 2rem;
  border-radius: 16px;
  width: 90%;
  max-width: 600px;
  box-shadow: 0 12px 30px rgba(0, 0, 0, 0.4);
  display: flex;
  flex-direction: column;
  align-items: stretch;
  gap: 1.5rem;
}

.form-title {
  font-size: 1.5rem;
  color: #fff;
  margin-bottom: 0.5rem;
}

.form-grid {
  display: grid;
  grid-template-columns: 1fr;
  gap: 1rem;
}

.button-group {
  display: flex;
  justify-content: center;
  gap: 1rem;
}
</style>

<script setup>
import { defineProps, defineEmits, ref } from 'vue'

const allGenres = ref([])
allGenres.value = ['Action', 'Strategy', 'Roguelike', 'Horror', 'Historical', 'Platformer', 'FPS', 'Crafting', 'Mythology', 'PVP', 'Card game', 'Survival', 'Realistic', 'Multiplayer', 'Open-world', 'Souls-like', 'Economy', 'Simulation', 'Difficult']

const changedGame = ref({})
const genre1 = ref("")
const genre2 = ref("")

const props = defineProps({
    formType: Number
})

const emit = defineEmits(['updateFormType', 'addGame', 'editGame'])

function changeFormType(type) {
    emit('updateFormType', type)
    changedGame.value = {}
    genre1 = ""
    genre2 = ""
}

function changeGame(gameObj) {
    if(props.formType == 1) {
        const d = new Date()
        gameObj.releaseDate = d.getFullYear()
        gameObj.genres = genre1.value + ", " + genre2.value
        emit('addGame', gameObj)
    }else {
        gameObj.genres = genre1.value + ", " + genre2.value
        emit('editGame', gameObj)
    }
    changeFormType(0)
    changedGame.value = {}
    genre1.value = ""
    genre2.value = ""
}
</script>