function FindProxyForURL(url, host) {
    if (dnsDomainIs(host, ".i2p")) {
        return "PROXY localhost:4444";
    } else if (dnsDomainIs(host, ".onion")) {
        return "PROXY localhost:9050";
    }
    return "DIRECT";
}
