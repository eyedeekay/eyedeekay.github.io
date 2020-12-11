for (var i = document.links.length; i-- > 0; ) {
  console.log("hostname", document, "link:", document.links[i].href);
  if (document.URL.includes(".i2p/")) {
    if (document.links[i].href.includes("https://github.com/eyedeekay/"))
      document.links[i].href = document.links[i].href.replace(
        "https://github.com/eyedeekay/",
        "http://git.idk.i2p/idk/"
      );
    if (document.links[i].href.includes("https://geti2p.net"))
      document.links[i].href = document.links[i].href.replace(
        "https://geti2p.net",
        "http://i2p-projekt.i2p"
      );
  }
}

for (var i = document.links.length; i-- > 0; ) {
  console.log("hostname", document, "link:", document.links[i].href);
  if (document.URL.includes("github.io/")) {
    if (document.links[i].href.includes("http://git.idk.i2p/idk/"))
      document.links[i].href = document.links[i].href.replace(
        "http://git.idk.i2p/idk/",
        "https://github.com/eyedeekay/"
      );
    if (document.links[i].href.includes("http://i2p-projekt.i2p"))
      document.links[i].href = document.links[i].href.replace(
        "http://i2p-projekt.i2p",
        "https://geti2p.net"
      );
  }
}
