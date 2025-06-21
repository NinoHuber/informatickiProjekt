<template>
  <v-app id="inspire">
    <v-app-bar extended>
        <div></div>
      <v-app-bar-title><RouterLink to="/" class="title"><h2>JoyGame</h2></RouterLink></v-app-bar-title>
      <v-btn variant="outlined">+ add game</v-btn>
    </v-app-bar>

    <v-main>
      <v-container>
        <Game></Game>
        <Game></Game>
        <Game></Game>
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