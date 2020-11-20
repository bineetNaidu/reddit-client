<script>
  import { onMount } from 'svelte';
  import Loaders from './Loaders.svelte';
  import Navbar from './Navbar.svelte';
  import RedditPost from './RedditPost.svelte';
  $: posts = [];
  let loading = true;
  onMount(async () => {
    const res = await fetch('https://www.reddit.com/r/all.json');
    const { data } = await res.json();
    posts = data.children;
    loading = false;
  });
</script>

<style>
  .loader {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 60vh;
  }
</style>

<Navbar />

{#if loading}
  <div class="loader">
    <Loaders />
  </div>
{:else}
  <div class="row row-cols-1 row-cols-md-4 g-4">
    {#each posts as { data } (data.id)}
      <RedditPost {data} />
    {/each}
  </div>
{/if}
