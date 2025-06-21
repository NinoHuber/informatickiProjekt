<template>
    <v-card class="card pa-6 my-4" max-height="100px">
        <h3>title</h3>
        <p style="overflow-y:auto; max-height: 100px;">desc</p>
        <h3>release date: 2025</h3>
        <v-container>
            <v-chip class="mx-1">action</v-chip>
            <v-chip class="mx-1">roleplaying</v-chip>
        </v-container>
        <v-btn color="primary">download</v-btn>
        <v-btn color="primary">edit</v-btn>
        <v-btn color="primary">x</v-btn>
    </v-card>
</template>

<style scoped>
.card {
    display: grid;
    grid-template-columns: 1fr 4fr 1fr 1.5fr 0.8fr 0.5fr 0.2fr;
    gap: 5px;
    align-items: center;
}
</style>