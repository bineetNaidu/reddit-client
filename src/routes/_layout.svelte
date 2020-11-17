<script>
  import Nav from '../components/Nav.svelte';
</script>

<style>
  main {
    position: relative;
    background-color: white;
    padding: 2em;
    margin: 0 auto;
    box-sizing: border-box;
  }
</style>

<Nav />

<svelte:head>
  <!-- CSS only -->
  <link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-CuOF+2SnTUfTwSZjCXf01h7uYhfOBuxIhGKPbfEJ3+FqH/s6cIFN9bGr1HmAg4fQ"
    crossorigin="anonymous" />

  <title>Reddit-Client</title>
</svelte:head>

<main>
  <slot />
</main>
