Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72459063D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 20:26:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3Zyh5kF5z3bf5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 04:26:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=igSDV18O;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RBOzN2Lw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=igSDV18O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=RBOzN2Lw;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Zxt61yrz2xk9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 04:26:10 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71D8120CD9;
	Thu, 11 Aug 2022 18:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1660242362; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Evt2V79tzbtV7su2NzxU13qv6eZNOQwgPrEPCv2shE=;
	b=igSDV18OSz9SWt559xkotV+C0/38cLzOimYiM2ngYL5Dltdql+UX/rtoMMNNTos697JA+O
	FLrvLJZrGJKyAJOy70SopyysXNv+7EQH8h1K2ZfISZCynzPo39BUuEq2FPmAWnBjW9HQ9y
	ZzTAWHtb/132ynPrxjwhvXOnV0y08/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1660242362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Evt2V79tzbtV7su2NzxU13qv6eZNOQwgPrEPCv2shE=;
	b=RBOzN2LwWUkWwwFa2p85FlZ1majRQO8hZ3KEjyGTzkYyYSqiABft9QMOXVW2sZhiuUYsGW
	re37NtTw+fzs6jCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC3161342A;
	Thu, 11 Aug 2022 18:26:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id rDnQLrlJ9WJoawAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 11 Aug 2022 18:26:01 +0000
Message-ID: <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
Date: Thu, 11 Aug 2022 20:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
 <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------maUWoRsPXczniKbRzx7qYboj"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>, David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Javier Martinez Canillas <javierm@redhat.com>, DRI Development <dri-devel@lists.freedesktop.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Paul Mackerras <paulus@samba.org>, Michal Suchanek <msuchanek@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------maUWoRsPXczniKbRzx7qYboj
Content-Type: multipart/mixed; boundary="------------knbY9dhxWhTYz9JlrI0Fp7eU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, David Airlie <airlied@linux.ie>,
 Helge Deller <deller@gmx.de>, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>, Michal Suchanek <msuchanek@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
 <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
In-Reply-To: <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>

--------------knbY9dhxWhTYz9JlrI0Fp7eU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGFuaWVsDQoNCkFtIDExLjA4LjIyIHVtIDE5OjIzIHNjaHJpZWIgRGFuaWVsIFZldHRl
cjoNCj4gT24gV2VkLCAyNyBKdWwgMjAyMiBhdCAwOTo1MywgVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMjUu
MDcuMjIgdW0gMTc6MTMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4g
SGVsbG8gR2VlcnQsDQo+Pj4NCj4+PiBPbiA3LzIxLzIyIDE2OjQ2LCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+Pj4+IEhpIFRob21hcywNCj4+Pj4NCj4+Pj4gT24gV2VkLCBKdWwg
MjAsIDIwMjIgYXQgNDoyNyBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4gd3JvdGU6DQo+Pj4+PiBDb21wdXRlIHRoZSBmcmFtZWJ1ZmZlcidzIHNjYW5saW5l
IHN0cmlkZSBsZW5ndGggaWYgbm90IGdpdmVuIGJ5DQo+Pj4+PiB0aGUgc2ltcGxlZmIgZGF0
YS4NCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4NCj4+Pj4NCj4+Pj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0K
Pj4+Pg0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+Pj4+PiBAQCAt
NzQzLDYgKzc0Myw5IEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSAqc2ltcGxl
ZHJtX2RldmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgIGRybV9lcnIoZGV2LCAibm8gc2ltcGxlZmIgY29uZmlndXJhdGlvbiBm
b3VuZFxuIik7DQo+Pj4+PiAgICAgICAgICAgICAgICAgICByZXR1cm4gRVJSX1BUUigtRU5P
REVWKTsNCj4+Pj4+ICAgICAgICAgICB9DQo+Pj4+PiArICAgICAgIGlmICghc3RyaWRlKQ0K
Pj4+Pj4gKyAgICAgICAgICAgICAgIHN0cmlkZSA9IGZvcm1hdC0+Y3BwWzBdICogd2lkdGg7
DQo+Pj4+DQo+Pj4+IERJVl9ST1VORF9VUChkcm1fZm9ybWF0X2luZm9fYnBwKGZvcm1hdCkg
KiB3aWR0aCwgOCkNCj4+Pj4NCj4+Pg0KPj4+IEkgdGhpbmsgeW91IG1lYW50IGhlcmU6DQo+
Pj4NCj4+PiBESVZfUk9VTkRfVVAoZHJtX2Zvcm1hdF9pbmZvX2JwcChmb3JtYXQsIDApICog
d2lkdGgsIDgpID8NCj4+DQo+PiBJIGd1ZXNzLCB0aGF0J3MgdGhlIHJpZ2h0IGZ1bmN0aW9u
LiBNeSBvcmlnaW5hbCBjb2RlIGlzIGNvcnJlY3QsIGJ1dCBjcHANCj4+IGlzIGFsc28gZGVw
cmVjYXRlZC4NCj4gDQo+IFlvdSBhbGwgbWVhbiBkcm1fZm9ybWF0X2luZm9fbWluX3BpdGNo
KCkuDQoNClRoYW5rcyBhIGxvdC4gSSB3YXNuJ3QgZXZlbiBhd2FyZSBvZiB0aGlzIGZ1bmN0
aW9uLCBidXQgSSBoYWQgYWxtb3N0IA0Kd3JpdHRlbiBteSBvd24gaW1wbGVtZW50YXRpb24g
b2YgaXQuICBJJ2xsIHVwZGF0ZSB0aGUgcGF0Y2ggYWNjb3JkaW5nbHkuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IEkgcmVhbGx5IGRvbid0IHdhbnQgZHJpdmVycyB0byBn
byBncmFiIGFueSBvZiB0aGUgbGVnYWN5IGZvcm1hdCBpbmZvDQo+IGZpZWxkcyBsaWtlIGJw
cCBvciBkZXB0aC4gc3dpdGNoKCkgc3RhdGVtZW50cyBvbiB0aGUgZm91cmNjIGNvZGUgZm9y
DQo+IHByb2dyYW1taW5nIHJlZ2lzdGVycywgb3Igb25lIG9mIHRoZSByZWFsIGhlbHBlciBm
dW5jdGlvbnMgaW4NCj4gZHJtX2ZvdXJjYy5jICh0aGVyZSBtaWdodCBiZSBzb21lIGdhcHMp
LCBidXQgbm90IGV2ZXIgZ29pbmcgdGhyb3VnaA0KPiBsZWdhY3kgY29uY2VwdHMuIEFueXRo
aW5nIGVsc2UganVzdCBsZWFkcyB0byBzdWJ0bGUgYnVncyB3aGVuIG5ldw0KPiBmb3JtYXRz
IGdldCBhZGRlZCBhbmQgb29wcyBzdWRkZW5seSB0aGUgYXNzdW1wdGlvbnMgZG9uJ3QgaG9s
ZC4NCj4gDQo+IFRob3NlIHNob3VsZCBiZSBzdHJpY3RseSBsaW1pdGVkIHRvIGxlZ2FjeSAo
aS5lLiBub3QgZHJtX2ZvdXJjYyBhd2FyZSkNCj4gaW50ZXJmYWNlcy4gSGVjayBJIHRoaW5r
IGV2ZW4gZmJkZXYgZW11bGF0aW9uIHNob3VsZCBjb21wbGV0ZWx5IHN3aXRjaA0KPiBvdmVy
IHRvIGRybV9mb3VyY2MvZHJtX2Zvcm1hdF9pbmZvLCBidXQgYWxhcyB0aGF0J3MgYSBwaWxl
IG9mIHdvcmsgYW5kDQo+IG5vdCBtdWNoIHBheW9mZi4NCj4gDQo+IEknbSB0cnlpbmcgdG8g
dm9sdW50ZWVyIFNhbWUgdG8gYWRkIGEgbGVnYWN5X2JwcCB0YWcgdG8gdGhlIGFib3ZlDQo+
IGhlbHBlciBhbmQgYXBwcm9wcmlhdGVseSBsaW1pdCBpdCwgSSB0aGluayBsaW1pdGluZyB0
byBmb3JtYXRzIHdpdGgNCj4gZGVwdGghPTAgaXMgcHJvYmFibHkgdGhlIHJpZ2h0IHRoaW5n
LiBBbmQgdGhlbiB3ZSBzaG91bGQgcHJvYmFibHkNCj4gcmVtb3ZlIGEgcGlsZSBvZiB0aGUg
Y2FyZ28tY3VsdGVkIGRlcHRoIT0wIGVudHJpZXMgdG9vLg0KPiAtRGFuaWVsDQo+IA0KPj4N
Cj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4+DQo+Pj4gV2l0aCB0aGF0IGNo
YW5nZSwNCj4+Pg0KPj4+IEFja2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4+Pg0KPj4NCj4+IC0tDQo+PiBUaG9tYXMgWmltbWVybWFu
bg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------knbY9dhxWhTYz9JlrI0Fp7eU--

--------------maUWoRsPXczniKbRzx7qYboj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmL1SbkFAwAAAAAACgkQlh/E3EQov+B1
lg//Ym6ehziJBzhSMwPC8lDOsIrzuYMuJkHN0hR3O142eRbdc6Ffh0PhynnA70H4i/YgECu6xdTT
xDGuFiO7BJi+JKyTR6OObSdfXS3uwkRGnz9OLV2qNDa6HVQeQwz5xl09pgM9Wt4NvqjTpEWDB5PC
ERHe1YCcjp4o5MVufdcp0lDW6j9qWWyBdnZJrmJ7SO9XEjDsKvWpkxu5QE+jcxrpwQ+DPqgJU6YD
wGc6LxlLDkSANq2/APAOUS11ZeRcfVv2ZYeu+vRypzfsj4u1FKbhpVGIFFYU4MzXMT9D/EQY+SY0
zLX0EFv65GaWzxlfDhcBLHO944P8V6fyo1K8Q3WOITnLdgM9yY11IvhL3eFUehGvPbN/Mxvk7gxd
kZuoF3l3m/vPTc6zRr+00YuGCR2bqnQs66pTN/wssHgaQJSPhkqPzH1ddG7VJ0aWqQ+EvOnxewev
ktZ/jzoCfDUx1/0kc/F8HY5g8a7jjSkSK5e8Xaj6PR7bEOM3BuMWWktDVmrl9xVO/VD8fsXdF+mR
Is5dA67JP7kV2cy32X7+05eJLdORDlJw4i21APRWznP1jgBi0G2/tYyjYGbr+JFfQAjycQaYXsyT
Vux2gtVlmlm3gCPE6D3DPze7GDbWMW2urBZyCFR9+CPGRGe4ZBniw4JGL4poJCbTz6DT4t9E6kPr
Mbw=
=rKDi
-----END PGP SIGNATURE-----

--------------maUWoRsPXczniKbRzx7qYboj--
