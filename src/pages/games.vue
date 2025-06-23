<template>
  <v-app id="inspire">
    <header>
      <v-app-bar-title><RouterLink to="/" class="title"><h2>JoyGame</h2></RouterLink></v-app-bar-title>
      <div></div>
      <v-btn variant="outlined" @click="addForm">+ add game</v-btn>
    </header>

    <v-main>
      <v-container v-for="game in games" key="game">
          <Game :game="game" @update-form-type="formType = $event" @deleteGame="deleteGame($event)" @sendID="editID = $event"></Game>
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
</style>

<script setup>
import axios from 'axios'
import { ref, onMounted, watch } from 'vue'

const api = "http://localhost:3001/"
const games = ref([])
const pages = ref()
const page = ref(1)
const formType = ref(0)
const editID = ref()

onMounted(async () => {
    getData()
    
})

async function getData() {
    const response = await axios.get(api + "igre", {
        params: {
            page: page.value, 
            limit: 10} 
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
}

async function deleteGame(id) {
  const response = await axios.delete(api + "izbrisi/" + id)
  getData()
}

async function editGame(game) {
  game.ID = editID.value
  const response = await axios.put(api + "promjeni/" + game.ID, game)
  getData()
}

</script>