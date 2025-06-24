<template>
  <v-app id="inspire">
    <v-snackbar v-model="snackbar.visible" :timeout="3000" top right>
      {{ snackbar.message }}
      <template #actions>
        <v-btn text @click="snackbar.visible = false">✕</v-btn>
      </template>
    </v-snackbar>
    <header>
      <v-app-bar-title><RouterLink to="/" class="title"><h2>JoyGame</h2></RouterLink></v-app-bar-title>
      <div></div>
      <v-btn variant="outlined" @click="addForm">+ add game</v-btn>
    </header>

    <v-container class="my-4">
  <v-row>
    <v-col cols="12" md="6">
      <v-text-field
        v-model="searchQuery"
        label="Search by title or description"
        clearable
        append-icon="mdi-magnify"
      />
    </v-col>

      <v-col cols="12" md="6">
        <v-select
          v-model="selectedGenre"
          :items="availableGenres"
          label="Filter by genre"
          clearable
        />
      </v-col>
    </v-row>
  </v-container>

    <v-main>
      <v-container v-for="game in games" key="game">
        <v-card class="game-card pa‑4 my‑3" variant="text">
          <Game :game="game" @update-form-type="formType = $event" @deleteGame="deleteGame($event)" @sendID="editID = $event" @download="download()"></Game>
        </v-card>
      </v-container>
    </v-main>

    <v-pagination :length="Math.ceil(pages/10)" v-model="page"></v-pagination>

    <Form :formType="formType" @update-form-type="formType = $event" @addGame="addGame($event)" @editGame="editGame($event)"></Form>
  </v-app>
</template>

<style scoped>
.title {
    text-decoration: none;
    color: white;
}

header {
    display: grid;
    grid-template-columns: 1fr 70% 1fr;
    height: 80px;
    align-items: center;
    background-color: #333;
    padding: 2px 10px;
}

@media (max-width: 600px) {
  header {
    grid-template-columns: 1fr;
    grid-template-rows: auto auto auto;
    justify-items: center;
    text-align: center;
    height: auto;
    padding: 10px;
  }

  .title h2 {
    font-size: 1.5rem;
  }

  header v-btn {
    width: 100%;
  }
}
</style>

<script setup>
import axios from 'axios'
import { ref, onMounted, watch, computed, nextTick } from 'vue'
import { animate, stagger } from 'animejs'

const api = "http://localhost:3001/"
const games = ref([])
const pages = ref()
const page = ref(1)
const formType = ref(0)
const editID = ref()
const snackbar = ref({ visible: false, message: '' })

onMounted(async () => {
    getData()
    animateGames()
})

async function getData() {
    const response = await axios.get(api + "igre", {
        params: {
            page: page.value, 
            limit: 10,
            search: searchQuery.value,
            genre: selectedGenre.value
          }
    })
    pages.value = response.data.total
    games.value = response.data.igre
}

watch(page, () => {getData();window.scrollTo(0, 0)})

function addForm() {
  formType.value = 1
}

async function addGame(game) {
  const response = await axios.post(api + "dodaj", game)
  getData()
  snackbar.value = { visible: true, message: 'Game added successfully.' }
}

async function deleteGame(id) {
  const response = await axios.delete(api + "izbrisi/" + id)
  getData()
  snackbar.value = { visible: true, message: 'Game deleted successfully.' }
}

async function editGame(game) {
  game.ID = editID.value
  const response = await axios.put(api + "promjeni/" + game.ID, game)
  getData()
  snackbar.value = { visible: true, message: 'Game updated successfully.' }
}

function download() {
  snackbar.value = { visible: true, message: 'Download starting...' }
}

const searchQuery = ref('')
const selectedGenre = ref('')

// Extract genres dynamically from all games
const availableGenres = computed(() => {
  const genres = new Set()
  games.value.forEach(g => {
    g.genres.split(',').forEach(genre => genres.add(genre.trim()))
  })
  return Array.from(genres)
})

watch([searchQuery, selectedGenre], () => {
  page.value = 1
  getData()
})

function animateGames() {
  nextTick(() => {
    animate('.game-card', {
      translateX: { from: -200, to: 0 },
      opacity: { from: 0, to: 1 },
      delay: stagger(90),
      duration: 500,
    })
  })
}

watch(games, animateGames)
</script>