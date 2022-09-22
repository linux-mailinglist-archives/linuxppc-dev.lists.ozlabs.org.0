Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AC35E5B93
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 08:43:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY5MG2LKFz3cCL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 16:43:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y1M0EIQN;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vr2QgvSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Y1M0EIQN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=vr2QgvSt;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY5Lc3Vzmz3bq5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 16:42:31 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 274441F8B0;
	Thu, 22 Sep 2022 06:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663828944; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OnRmSH/W/6HCqxIlF+wHjSgoSEZ0tvBMLxk64QHsds=;
	b=Y1M0EIQNK+TKYpLKhxMa7Nryt54pY0QWBCxF/fd78c7LxFfygE3E9/XjBmUc89/y+qSPO6
	qtqQkqSPoRm2gUVoBD4rKQ+dKRQ6sbMKv1K6sZ1IITiHzJPkZrj1ylwDKrY/8Q890NYMxR
	wDLc93NOLH837pGCDZsC1gxNAW/6f6w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663828944;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8OnRmSH/W/6HCqxIlF+wHjSgoSEZ0tvBMLxk64QHsds=;
	b=vr2QgvStRc+WEUHEXfEO2Zg4t50RkWWxjlp8NYhI0HVA6cmJxwySXDFuzQlpRZy/E/wfZ+
	Qu3fdBUQxMM1WxAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D305D1346B;
	Thu, 22 Sep 2022 06:42:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8GaGMs8DLGNBNwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 06:42:23 +0000
Message-ID: <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
Date: Thu, 22 Sep 2022 08:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S0VI6j0NpGxhSwu05hBHJU4d"
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, msuchanek@suse.de, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S0VI6j0NpGxhSwu05hBHJU4d
Content-Type: multipart/mixed; boundary="------------yWStpXhby2nB0Rs0GOZNtiXR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
 mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Message-ID: <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
In-Reply-To: <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>

--------------yWStpXhby2nB0Rs0GOZNtiXR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjIgdW0gMTg6NDggc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFdlZCwgU2VwIDIxLCAyMDIyIGF0IDI6NTUgUE0g
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gQW0g
MDUuMDguMjIgdW0gMDI6MTkgc2NocmllYiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0Og0KPj4+
IE9uIFdlZCwgMjAyMi0wNy0yMCBhdCAxNjoyNyArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4g
d3JvdGU6DQo+Pj4+ICsjaWYgIWRlZmluZWQoQ09ORklHX1BQQykNCj4+Pj4gK3N0YXRpYyBp
bmxpbmUgdm9pZCBvdXRfOCh2b2lkIF9faW9tZW0gKmFkZHIsIGludCB2YWwpDQo+Pj4+ICt7
IH0NCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBvdXRfbGUzMih2b2lkIF9faW9tZW0gKmFk
ZHIsIGludCB2YWwpDQo+Pj4+ICt7IH0NCj4+Pj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQg
aW50IGluX2xlMzIoY29uc3Qgdm9pZCBfX2lvbWVtICphZGRyKQ0KPj4+PiArew0KPj4+PiAr
ICAgICAgIHJldHVybiAwOw0KPj4+PiArfQ0KPj4+PiArI2VuZGlmDQo+Pj4NCj4+PiBUaGVz
ZSBndXlzIGNvdWxkIGp1c3QgYmUgcmVwbGFjZWQgd2l0aCByZWFkYi93cml0ZWwvcmVhZGwg
cmVzcGVjdGl2ZWx5DQo+Pj4gKGJld2FyZSBvZiB0aGUgYXJndW1lbnQgc3dhcCkuDQo+Pg0K
Pj4gSSBvbmx5IGFkZGVkIHRoZW0gZm9yIENPTVBJTEVfVEVTVC4gVGhlcmUgYXBwZWFycyB0
byBiZSBubyBwb3J0YWJsZQ0KPj4gaW50ZXJmYWNlIHRoYXQgaW1wbGVtZW50cyBvdXRfbGUz
MigpIGFuZCBpbl9sZTMyKCk/DQo+IA0KPiBpb3dyaXRlMzIoKSBhbmQgaW9yZWFkMzIoKT8N
Cg0KRG8gdGhleSBhbHdheXMgdXNlIGxpdHRsZSBlbmRpYW4sIGFzIHRoZXNlICpfbGUzMiBo
ZWxwZXJzIGRvPyBJIHRob3VnaCANCnRoZXkgdXNlIGhvc3QgYnl0ZSBvcmRlci4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRA
bGludXgtbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBz
b21ldGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtLSBMaW51cyBUb3J2YWxkcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------yWStpXhby2nB0Rs0GOZNtiXR--

--------------S0VI6j0NpGxhSwu05hBHJU4d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMsA88FAwAAAAAACgkQlh/E3EQov+C0
JhAAhn2vG5W7iFSIRzBsN7l86MBbE+lOjzUfGiY9xK3wPg9flwnf4zS5uAtlAkSBQOeA/JGEiHzZ
Oa0QyWwX6BpkXAZnEQdxG0PMYf44Wyuzb2nh1u+UTMbIeuLmiFYlNQM3MFtd83cucCs/3r421/ZT
XcPiQei/KyOGTdkog50jTzLnhK9cnMEQ5II1Hdy/OX8fdfzN5zopnmGmtwXvNdNYdDdo88sFsscX
kn/WGru/3gzOnlhOeo96UBWJfHfSxISw5XXybBA8fjKxOfp3Oo39HiFeRTKxoTYBAEZ54txYXKGO
BH0uaXLkC64vseq2w2DrkG5sGXhhp6NuO0KCPvmJDYm2QNNvlECuHYT9ryjdJssa9q2jZidmDA7q
uh+qZlZ3tSp1npxzqRYvHF0EAAMSN8dSXRjLCyxheiSFgUEatx5vZ1S8eRFDsKEL5IO/FdqPe4Cd
DhgwJZUrPZPRtu0U+C5C7cPxNElrxr8Dh5tw1Ir3/dWX7qrv4uvsG65OLfk0NoG9/iyLGpTEli8h
bxed1ytAacLFmNKDBvQ5eeAnpW2ePGgPMJ+FIqn1QzCHIILpkUSRaJeEwX9b0yV9rVSl9mbpGG0K
J7Nf8CX4m+5tv4octpzpzDWxN58kbyeJedv08dy0ExGtBxqY2HLM3HZEe7EUAqOH5etSHHvHhOKd
KI0=
=5qHN
-----END PGP SIGNATURE-----

--------------S0VI6j0NpGxhSwu05hBHJU4d--
