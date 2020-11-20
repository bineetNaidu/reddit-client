<script>
  export let data;
</script>

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
