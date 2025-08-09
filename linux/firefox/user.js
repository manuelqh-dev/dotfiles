// Privacidad y Seguridad Básica
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("privacy.trackingprotection.cryptomining.enabled", true);
user_pref("privacy.trackingprotection.fingerprinting.enabled", true);
user_pref("network.cookie.cookieBehavior", 1); // Bloquear cookies de terceros
user_pref("privacy.resistFingerprinting", true);
user_pref("security.mixed_content.block_active_content", true);
user_pref("security.mixed_content.block_display_content", true);
user_pref("security.tls.version.min", 3); // TLS 1.2 mínimo
user_pref("network.stricttransportsecurity.preloadlist", true);
user_pref("dom.security.https_only_mode", true); // HTTPS-Only Mode
user_pref("permissions.default.camera", 2); // Bloquear cámara
user_pref("permissions.default.microphone", 2); // Bloquear micrófono
user_pref("permissions.default.geo", 2); // Bloquear geolocalización
user_pref("dom.event.clipboardevents.enabled", false); // No notificar cuando copias/pegas

// Seguridad adicional
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.enterprise_roots.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", true);
user_pref("browser.safebrowsing.phishing.enabled", true);

// Mejoras UI y rendimiento para evitar fugas
user_pref("media.peerconnection.enabled", false); // Bloquear WebRTC (evitar fugas IP)
