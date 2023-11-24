// Access command-line arguments using process.argv
const args = process.argv.slice(2); // The first two elements in process.argv are 'node' and the script filename

// Check if any arguments were provided
if (args.length === 0) {
  console.log("No arguments provided.");
} else {
  const fetch = require("isomorphic-unfetch");
  const { getData, getPreview, getTracks, getDetails } =
    require("spotify-url-info")(fetch);
  args.forEach((arg, index) => {
    getPreview(`${arg}`).then((data) => console.log(data.track, data.artist));
  });
}
