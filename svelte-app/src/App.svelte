<script>
  export let name;
  let me = "testings";
  let glucose, bmi, diab;

  import { onMount } from "svelte";
  const url =
    "http://localhost:8000/predict?diabetesPedigreeFunction=32&bmi=31&glucose=1";
  let data = [];

  onMount(async function () {
    const response = await fetch(url, {});
    data = await response.json();
  });
</script>

<style>
  main {
    text-align: center;
    padding: 1em;
    max-width: 240px;
    margin: 0 auto;
  }

  h1 {
    color: #ff3e00;
    text-transform: uppercase;
    font-size: 4em;
    font-weight: 100;
  }

  @media (min-width: 640px) {
    main {
      max-width: none;
    }
  }
</style>

<main>
  <h1>Predict Diabetes</h1>

  <form class="content">
    <label>Glucose</label>
    <input type="number" bind:value={glucose} />
    <label>BMI</label>
    <input type="number" bind:value={bmi} />
    <label>DiabetesPedigreeFunction</label>
    <input type="number" bind:value={diab} />
  </form>

  <p>{data}</p>
  <p>Glucose: {glucose}</p>
</main>
