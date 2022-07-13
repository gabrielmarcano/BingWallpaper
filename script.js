let response = fetch('https://peapix.com/bing/feed?country=jp').then(res => res.json())

console.log(response)