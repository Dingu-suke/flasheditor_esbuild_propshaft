// esbuild.config.js
const esbuild = require("esbuild");

esbuild.build({
  entryPoints: ["app/javascript/helloesbuild.js"],
  bundle: true,
  outdir: "app/assets/builds",
  watch: process.argv.includes("--watch"),
}).catch(() => process.exit(1));