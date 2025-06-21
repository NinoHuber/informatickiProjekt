<template>
  <div class="landing-page">
    <section class="hero">
      <v-card flat class="hero-card">
        <h1 class="text-h2 font-weight-bold">JoyGame</h1>
        <p class="subtitle">All your favorite games. In one place.</p>
        <p class="description">
          An online distribution platform for video games and software. Discover the latest titles or publish your own games with ease.
        </p>
        <RouterLink to="/games"><v-btn rounded color="primary" class="mt-6" large>Start Browsing</v-btn></RouterLink>
      </v-card>
    </section>

    <section class="features px-12 py-8">
      <v-row justify="center" align="center" dense>
        <v-col cols="12" sm="4" class="text-center">
          <v-icon size="40" color="primary">mdi-controller</v-icon>
          <h3 class="mt-2">Huge Game Library</h3>
          <p>From indie gems to AAA titles, explore a curated catalog of awesome games.</p>
        </v-col>
        <v-col cols="12" sm="4" class="text-center">
          <v-icon size="40" color="primary">mdi-account-group</v-icon>
          <h3 class="mt-2">Active Community</h3>
          <p>Join forums, leave reviews, and connect with players from around the world.</p>
        </v-col>
        <v-col cols="12" sm="4" class="text-center">
          <v-icon size="40" color="primary">mdi-cloud-download</v-icon>
          <h3 class="mt-2">Instant Downloads</h3>
          <p>Install your games instantly. No waiting, just playing.</p>
        </v-col>
      </v-row>
    </section>

    <v-expansion-panels class="my-14 px-10" variant="popout">
      <v-expansion-panel title="About" text="JoyGame is a digital distribution platform built for gamers, by gamers. Whether you're into indie gems or epic adventures, JoyGame makes it easy to discover, download, and enjoy your favorite titles — all in one place. We believe games should be fun to find and easy to play. From trending hits to hidden gems, our platform helps you explore and enjoy the best games with just a few clicks."></v-expansion-panel>
      <v-expansion-panel title="Terms of Service" text="By using JoyGame, you agree to our basic terms: You must be at least 13 years old to create an account. You may not use JoyGame for illegal or harmful activities. All content (games, images, and text) is provided for demonstration purposes only. We are not responsible for any damages or data loss resulting from use of the platform. Your personal data (if collected) will be handled responsibly and not shared with third parties."></v-expansion-panel>
      <v-expansion-panel title="Contact" text="For business inquiries: joygame@email.com"></v-expansion-panel>
    </v-expansion-panels>

    <AppFooter />
  </div>
</template>

<style scoped>
.landing-page {
  font-family: 'Segoe UI', sans-serif;
}

.hero {
  background: linear-gradient(145deg, #121b26, #1e2a3a);
  color: white;
  padding: 80px 20px;
  text-align: center;
}

.hero-card {
  background: transparent;
  box-shadow: none;
  max-width: 600px;
  margin: 0 auto;
}

.subtitle {
  font-size: 20px;
  opacity: 0.9;
  margin-top: 10px;
}

.description {
  font-size: 16px;
  margin-top: 20px;
  max-width: 500px;
  margin-left: auto;
  margin-right: auto;
}

.features h3 {
  font-weight: 600;
  margin-top: 10px;
}

.features p {
  font-size: 14px;
  opacity: 0.8;
  margin-top: 8px;
}
</style>
