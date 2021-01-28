const HEADERS_TO_STRIP_LOWERCASE = [
  'content-security-policy',
  'x-frame-options',
];

chrome.webRequest.onHeadersReceived.addListener(
  details => ({
    responseHeaders: details.responseHeaders.filter(header =>
        !HEADERS_TO_STRIP_LOWERCASE.includes(header.name.toLowerCase()))
  }),
  {
      urls: ['https://www.twitch.tv/*']
  },
  ['blocking', 'responseHeaders']);

