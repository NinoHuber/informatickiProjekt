<template>
    <v-card class="card px-5" height="100px">
        <h3>{{ game.title }}</h3>
        <p style="overflow-y:auto; max-height: 100px;">{{ game.description }}</p>
        <h3>release date: {{ game.year }}</h3>
        <v-container>
            <v-chip class="mx-1">{{ game.genres.split(',')[0] }}</v-chip>
            <v-chip class="mx-1"> {{ game.genres.split(',')[1] }}</v-chip>
        </v-container>
        <v-btn color="primary">download</v-btn>
        <v-btn color="primary" @click="changeFormType(2)">edit</v-btn>
        <v-btn color="primary" @click="deleteGame(game)">x</v-btn>
    </v-card>
</template>

<style scoped>
.card {
    display: grid;
    grid-template-columns: 0.8fr 3fr auto auto 0.8fr 0.5fr 0.2fr;
    gap: 5px;
    align-items: center;
}
</style>

<script setup>
    import { defineProps, defineEmits } from 'vue';
    const props = defineProps({
        game: Object
    })
    const emit = defineEmits(['updateFormType', 'deleteGame', 'sendID'])
    function changeFormType(type) {
        emit('updateFormType', type)
        emit('sendID', props.game.ID)
    }

    function deleteGame(game) {
        emit('deleteGame', game.ID)
    }
</script>