<template>
    <div class="modal-overlay" @click.self="changeFormType(0)" v-if="formType == 1 || formType == 2">
        <div class="modal-card">
            <h1 v-if="formType == 1">Add game</h1>
            <h1 v-if="formType == 2">Edit game</h1>
            <v-text-field label="Title"></v-text-field>
            <v-text-field label="Description"></v-text-field>
            <v-select chips :items="allGenres" label="Genre 1"></v-select>
            <v-select chips :items="allGenres" label="Genre 2"></v-select>
            <v-btn v-if="formType == 1" class="mx-8">Add game</v-btn>
            <v-btn v-if="formType == 2" class="mx-8">Edit game</v-btn>
            <v-btn @click="changeFormType(0)">Cancel</v-btn>
        </div>
    </div>
</template>

<style scoped>
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.5);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 1000;
}

.modal-card {
  background: #333;
  padding: 30px;
  border-radius: 12px;
  height: 90%;
  width: 60%;
  box-shadow: 0 6px 20px rgba(0,0,0,0.3);
  text-align: center;
}
</style>

<script setup>
import { defineProps, defineEmits, ref } from 'vue';
const allGenres = ref([])
allGenres.value = ['Action', 'Strategy', 'Roguelike', 'Horror', 'Historical', 'Platformer', 'FPS', 'Crafting', 'Mythology', 'PVP', 'Card game', 'Survival', 'Realistic', 'Multiplayer', 'Open-world', 'Souls-like', 'Economy', 'Simulation', 'Difficult']
const props = defineProps({
    formType: Number
})
const emit = defineEmits(['updateFormType'])
function changeFormType(type) {
    emit('updateFormType', type)
}
</script>