'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "c4c690d1f543534a4c8a599c2d37834d",
"version.json": "37d6876c2c1d89f89696385dbb96eb40",
"manifest.json": "43b26b834f0bfbde0e7cc79c5b94e4b4",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"index.html": "e8668c4f76cadee6f89ce8e83e7710b5",
"/": "e8668c4f76cadee6f89ce8e83e7710b5",
"assets/NOTICES": "63540a40decdbb49e8e6d82c7c0f32ce",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "711a4d3fff09d7c8b3432715d50d6201",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/ic_cross.png": "ed469a289666cc1a68a271a57e749ce3",
"assets/assets/ic_home.png": "52f8b1cf26a42c75773fc4b3cf354d01",
"assets/assets/ic_profile.png": "6f3aa7c2849eb57ab1be8a27364d5fa1",
"assets/assets/back.png": "66f08f73272527cfee03806e9f2b1ba6",
"assets/assets/onboarding_slide_1.png": "e9c7e6d58f82960bfe7c4a53ea008df3",
"assets/assets/ic_signin.png": "5b413385b5973e74cdb2b3f0964d277f",
"assets/assets/ic_calendar.png": "29caa735f4c694b085ba7d9b77da0142",
"assets/assets/logo.png": "c60a1e295b64a53618891f9a746ea0d7",
"assets/assets/ic_bell.png": "a4f07193d16f8d1f6f674970cc4149ad",
"assets/assets/brand_bisleri.png": "6c411b4783159a784518f076aaf10586",
"assets/assets/ic_star.png": "f86e8f53f7f6aad35d6e92c260d891e4",
"assets/assets/ic_setting.png": "6119a24d03b52bf5e6885e2ceee751b0",
"assets/assets/ic_logout.png": "16a3a2fd9c77f903d76f3ea6d477af9a",
"assets/assets/cross.png": "63e3773b9a0f5134a4b53df44f0d85fb",
"assets/assets/ic_order.png": "62f7618a42eaa4074da26b5e5f72cbe9",
"assets/assets/ic_lock.png": "023c6dabe18f15bbfb4892587679ce7b",
"assets/assets/location_image.png": "28c354e4205994eab6ad27d6228fe35d",
"assets/assets/allow_notification_art.png": "8e5b6436b56759c1024edc8b15a713f6",
"assets/assets/ic_menu.png": "ebc746f0e0699f5e47db2a6ece280628",
"assets/assets/ic_locationpin.png": "a573d6ba25b6ebd47957615e410d94a7",
"assets/assets/ic_contact.png": "e5aa9d55ce8689ab093993fe4a821d5e",
"assets/assets/ic_watch.png": "c0c49c8e814ea3189fbc33c8c00aaffe",
"assets/assets/ic_settings.png": "14e45b80c369caf608ba598429a2f0e6",
"assets/assets/map_dummy.png": "5488b64edc36877ae7e125cc18b2a9fe",
"assets/assets/onboarding_slide_3.png": "af63162c352baadf189e294fedddd810",
"assets/assets/ic_search.png": "cc48ac9b73979d20e288b5bf4a52ec4c",
"assets/assets/ic_repeat.png": "691838e60425f5e54f1a49dac353e3ed",
"assets/assets/logo_colored.png": "b7ad218a7e787d5f27fc8093e69c3545",
"assets/assets/tick.png": "fffeeabfd34c14cdb4fcc0e7c52c9015",
"assets/assets/onboarding_final.png": "49f30660c0cdffc6315fae1f73f9a615",
"assets/assets/location_cursor.png": "c199e5c49c2a5fbc34b35bf577f71894",
"assets/assets/onboarding_slide_2.png": "926a48bc2f8ffecf747a9c7baa4b7564",
"assets/assets/india_flag.png": "e0cd8cde71e30afff7776c647d1fe7d0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "b14fcf3ee94e3ace300b192e9e7c8c5d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
