<template>
  <v-card class="pa-4 my-3">
    <v-row align="center" class="mb-2">
      <v-col cols="12" md="2">
        <h3 class="text-h6">{{ game.title }}</h3>
        <h4 class="text-subtitle-2">Release date: {{ game.year }}</h4>
      </v-col>

      <v-col cols="12" md="8">
        <p class="mb-2" style="max-height: 100px; overflow-y: auto;">
          {{ game.description }}
        </p>
        <div class="d-flex flex-wrap my-2">
          <v-chip
            v-for="(genre, index) in game.genres.split(',')"
            :key="index"
            class="ma-1"
            size="small"
          >
            {{ genre }}
          </v-chip>
        </div>

        <div class="d-flex flex-wrap mt-3">
          <v-btn color="primary" class="ma-1" @click="$emit('download')">Download</v-btn>
          <v-btn color="secondary" class="ma-1" @click="changeFormType(2)">Edit</v-btn>
          <v-btn color="error" class="ma-1" @click="deleteGame(game)">Delete</v-btn>
        </div>
      </v-col>
    </v-row>
  </v-card>
</template>

<script setup>
    import { defineProps, defineEmits } from 'vue';
    const props = defineProps({
        game: Object
    })
    const emit = defineEmits(['updateFormType', 'deleteGame', 'sendID', 'download'])
    function changeFormType(type) {
        emit('updateFormType', type)
        emit('sendID', props.game.ID)
    }

    function deleteGame(game) {
        emit('deleteGame', game.ID)
    }
</script>