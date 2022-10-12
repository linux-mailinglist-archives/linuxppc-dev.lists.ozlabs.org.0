Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FCC5FC15A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 09:41:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnPhx4XP8z3c4S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:41:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mLrnQNBd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q53uEFG/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=mLrnQNBd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Q53uEFG/;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnPgw66Jpz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 18:40:12 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BFB8E21F7E;
	Wed, 12 Oct 2022 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665560408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pkcpB05ZdJW9pb9Cmj06/X7CU2uaPEFbeKE7TiHx4iA=;
	b=mLrnQNBdJJijgbLOjAadwejM4p74WO4P/yCMxmMupc6ATwjSbFtcskwW+hztZQxwpCg9rN
	xh1Wj0xp8nD6YF1NZHgDEnEzyJMGkbjmCrodvp5UasTSwm0FqVik79b4zGzSCWKgO8Lp1G
	ES1sq+hrPq8CqqzBobjz1I19e/HfnP4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665560408;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pkcpB05ZdJW9pb9Cmj06/X7CU2uaPEFbeKE7TiHx4iA=;
	b=Q53uEFG/PpIMG6OoGIsl7RdspeqvaNVFssJXYf50EhgaQcBSwH09rX4f3bCSrHt2Z1pqdO
	YVBnpZG1iBnr7nAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 614D413A5C;
	Wed, 12 Oct 2022 07:40:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1cZBFlhvRmN3RAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 12 Oct 2022 07:40:08 +0000
Message-ID: <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
Date: Wed, 12 Oct 2022 09:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 Michal Suchanek <msuchanek@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m0r9sMWiaapFS5KSHO5C0Xo2"
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m0r9sMWiaapFS5KSHO5C0Xo2
Content-Type: multipart/mixed; boundary="------------GqWk9yPgD2SNVN32dHYYV6fj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@arndb.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, maxime@cerno.tech, sam@ravnborg.org,
 Michal Suchanek <msuchanek@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
 benh@kernel.crashing.org, Paul Mackerras <paulus@samba.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
In-Reply-To: <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>

--------------GqWk9yPgD2SNVN32dHYYV6fj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTAuMjIgdW0gMDk6MTcgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBP
biBXZWQsIE9jdCAxMiwgMjAyMiwgYXQgODo0NiBBTSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBBbSAxMS4xMC4yMiB1bSAyMjowNiBzY2hyaWViIEFybmQgQmVyZ21hbm46DQo+
Pj4gT24gVHVlLCBPY3QgMTEsIDIwMjIsIGF0IDE6MzAgUE0sIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4+PiBBbSAxMS4xMC4yMiB1bSAwOTo0NiBzY2hyaWViIEphdmllciBNYXJ0
aW5leiBDYW5pbGxhczoNCj4+Pj4+PiArc3RhdGljIGJvb2wgZGlzcGxheV9nZXRfYmlnX2Vu
ZGlhbl9vZihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9m
X25vZGUpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiArCWJvb2wgYmlnX2VuZGlhbjsNCj4+Pj4+PiAr
DQo+Pj4+Pj4gKyNpZmRlZiBfX0JJR19FTkRJQU4NCj4+Pj4+PiArCWJpZ19lbmRpYW4gPSB0
cnVlOw0KPj4+Pj4+ICsJaWYgKG9mX2dldF9wcm9wZXJ0eShvZl9ub2RlLCAibGl0dGxlLWVu
ZGlhbiIsIE5VTEwpKQ0KPj4+Pj4+ICsJCWJpZ19lbmRpYW4gPSBmYWxzZTsNCj4+Pj4+PiAr
I2Vsc2UNCj4+Pj4+PiArCWJpZ19lbmRpYW4gPSBmYWxzZTsNCj4+Pj4+PiArCWlmIChvZl9n
ZXRfcHJvcGVydHkob2Zfbm9kZSwgImJpZy1lbmRpYW4iLCBOVUxMKSkNCj4+Pj4+PiArCQli
aWdfZW5kaWFuID0gdHJ1ZTsNCj4+Pj4+PiArI2VuZGlmDQo+Pj4+Pj4gKw0KPj4+Pj4+ICsJ
cmV0dXJuIGJpZ19lbmRpYW47DQo+Pj4+Pj4gK30NCj4+Pj4+PiArDQo+Pj4+Pg0KPj4+Pj4g
QWgsIEkgc2VlLiBUaGUgaGV1cmlzdGljIHRoZW4gaXMgd2hldGhlciB0aGUgYnVpbGQgaXMg
QkUgb3IgTEUgb3IgaWYgdGhlIERldmljZQ0KPj4+Pj4gVHJlZSBoYXMgYW4gZXhwbGljaXQg
bm9kZSBkZWZpbmluZyB0aGUgZW5kaWFuZXNzLiBUaGUgcGF0Y2ggbG9va3MgZ29vZCB0byBt
ZToNCj4+Pj4NCj4+Pj4gWWVzLiBJIHRvb2sgdGhpcyB0ZXN0IGZyb20gb2ZmYi4NCj4+Pg0K
Pj4+IEhhcyB0aGUgZHJpdmVyIGJlZW4gdGVzdGVkIHdpdGggbGl0dGxlLWVuZGlhbiBrZXJu
ZWxzIHRob3VnaD8gV2hpbGUNCj4+PiBwcGMzMiBrZXJuZWxzIGFyZSBhbHdheXMgQkUsIHlv
dSBjYW4gYnVpbGQga2VybmVscyBhcyBlaXRoZXIgYmlnLWVuZGlhbg0KPj4+IG9yIGxpdHRs
ZS1lbmRpYW4gZm9yIG1vc3QgKG1vZGVybikgcG93ZXJwYzY0IGFuZCBhcm0vYXJtNjQgaGFy
ZHdhcmUsDQo+Pj4gYW5kIEkgZG9uJ3Qgc2VlIHdoeSB0aGF0IHNob3VsZCBjaGFuZ2UgdGhl
IGRlZmF1bHRzIG9mIHRoZSBkcml2ZXINCj4+PiB3aGVuIGRlc2NyaWJpbmcgdGhlIHNhbWUg
ZnJhbWVidWZmZXIgaGFyZHdhcmUuDQo+Pg0KPj4gWWVzLCBJIHRlc3RlZCB0aGlzIG9uIHFl
bXUncyBwcGM2NGxlIGFuZCBwcGM2NC4NCj4gDQo+IERvZXMgcWVtdSBtYXJrIHRoZSBkZXZp
Y2UgaGFzIGhhdmluZyBhIHBhcnRpY3VsYXIgZW5kaWFuZXNzIHRoZW4sIG9yDQo+IGRvZXMg
aXQgc3dpdGNoIHRoZSBsYXlvdXQgb2YgdGhlIGZyYW1lYnVmZmVyIHRvIG1hdGNoIHdoYXQg
dGhlIENQVQ0KPiBkb2VzPw0KDQpUaGUgbGF0dGVyLiBPbiBuZWl0aGVyIGFyY2hpdGVjdHVy
ZSBkb2VzIHFlbXUgZXhwb3NlIHRoaXMgZmxhZy4gVGhlIA0KZGVmYXVsdCBlbmRpYW5lc3Mg
Y29ycmVzcG9uZHMgdG8gdGhlIGhvc3QuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEkndmUgc2VlbiBvdGhlciBjYXNlcyB3aGVyZSBkZXZpY2VzIGluIHFlbXUgd2VyZSBk
ZWZpbmVkIHVzaW5nIGFuDQo+IGFyYml0cmFyeSBkZWZpbml0aW9uIG9mICJjcHUtZW5kaWFu
Iiwgd2hpY2ggaXMgZ2VuZXJhbGx5IG5vdCBob3cNCj4gcmVhbCBoYXJkd2FyZSB3b3Jrcy4N
Cj4gDQo+ICAgICAgQXJuZA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Ck1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwg
QUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------GqWk9yPgD2SNVN32dHYYV6fj--

--------------m0r9sMWiaapFS5KSHO5C0Xo2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNGb1cFAwAAAAAACgkQlh/E3EQov+A7
7w/+Ly6LSMnw+d+n6FQrcQudX70numqMvBlnUrI6NxvXgyUgUVPmaIlNeW/gZ6e+VoiQZzajW1RA
iqoR1npZLvJ2xYpnNf8rqTzywwtNoCg01E4/RdBFpAKEPOpTW2cLOwhKo1F5PV3YFs7vniAwMhAW
QdVnNF9KPhEFsfrlBcaM68kHfL82/jnqilBTVZ8DvKG8dyxbDIBOma5CWHl+x9TH5/V64+wDnTpN
RVMO6cY2UXweTSxLwXeajlJyk4dYGa6EG4akOkOoThVB8AJWvyp+efAKjN0kxj5ZSDZ8ELouT1ge
bCgRZbFYtynJQ6d5DS+ZvmPcagdYiI3reuDv8W8S9dxHnhLicdxf+nr1Rxa2i86JxqrH7d13MWVH
2AVcw0c6eOI1gWHA/OVccT+aHa+ZesznelQnsdraAiMR8Xd+hX1OF+cJrL/lmLjK9OfnZV4qHz+L
53OFC35MxvJofwRB2cLHd0EnuM811SS1IxLnCV67H2fW5cL6hjoeLtKXJ3klnPg6H2e5N806oLI8
LkZxBpSJoTMfCwHZK5eZKQyU+iq3KH7nRARF1N2lASamyDgGRmnmem0tLoCE7kCLW/T+Vie/e9oC
OZyFkvppw6dGeomNORHHlip+NO1wjV4jh6UgqsXhmUxZjatgz/GMUc3XBqXGJm0a3aglvbpBx4g6
Tio=
=NdXv
-----END PGP SIGNATURE-----

--------------m0r9sMWiaapFS5KSHO5C0Xo2--
