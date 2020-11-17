<script>
  import { onMount } from 'svelte';

  $: posts = [];

  onMount(async () => {
    const res = await fetch('https://www.reddit.com/r/all.json');
    const { data } = await res.json();
    posts = data.children;

    console.log(posts[1]);
  });
</script>

<style>
</style>

<div class="row row-cols-1 row-cols-md-4 g-4">
  {#if posts}
    {#each posts as { data } (data.id)}
      <div class="col">
        <div class="card" style="width: 18rem;">
          {#if data.is_video}
            <video controls width="auto" autoplay muted>
              <track kind="captions" />
              <source
                src={data.media.reddit_video.scrubber_media_url || data.media.reddit_video.fallback_url}
                type="video/mp4" />

              Sorry, your browser doesn't support embedded videos.
            </video>
          {:else}
            <img
              src={data.thumbnail || data.url || data.preview.images[0].source.url}
              class="card-img-top"
              alt={data.thumbnail || data.url} />
          {/if}
          <div class="card-body">
            <p class="card-text">{data.title}</p>
            <a href={data.permalink} class="btn btn-primary">View</a>
          </div>
        </div>
      </div>
    {/each}
  {/if}
</div>
