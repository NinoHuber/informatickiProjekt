<template>
  <v-app id="inspire">
    <v-app-bar extended>
        <div></div>
      <v-app-bar-title><RouterLink to="/" class="title"><h2>JoyGame</h2></RouterLink></v-app-bar-title>
      <v-btn variant="outlined">+ add game</v-btn>
    </v-app-bar>

    <v-main>
      <v-container v-for="game in games" key="game">
        <Game :game="game"></Game>
      </v-container>
    </v-main>
  </v-app>
</template>

<style scoped>
.title {
    text-decoration: none;
    color: white;
}
</style>

<script setup>
import axios from 'axios'
import { ref, onMounted } from 'vue'

const api = "http://localhost:3001/"
const games = ref([])

onMounted(async () => {
    const response = await axios.get(api + "igre")
    games.value = response.data.igre
})
</script>