Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C0369A883
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ6PB5rPxz3chc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:45:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DgtkVbGz;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hqtB/w5b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=DgtkVbGz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hqtB/w5b;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ6ND5myZz3bfs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:44:28 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 23C7E33800;
	Fri, 17 Feb 2023 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1676627064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dL6/95Fegbbl5slnLaTk5k1Tpgb9eIQT0YaN2Huo9U=;
	b=DgtkVbGzwfbN5G0Ff0QP/ziYrZPEjdGeMmQCd8UomOPJUCLI5lggCv95uTLOWM2BqAXAls
	cCrI5HWs3eWnPpjXs0Nr2MPg/5vKJ8LJxGpt2u1tcYGaJlFPZmL9+8rdWimQ18uAYOhR/H
	tavY4aKjJn0X5X8lW0Ix5jYkothf1yk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1676627064;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3dL6/95Fegbbl5slnLaTk5k1Tpgb9eIQT0YaN2Huo9U=;
	b=hqtB/w5byc5ESerWx+fvZr1YA9kuwehkoHQdSpClE8xrXGiEL7VMEioPptKtw1N/q2ZBz/
	sWH0Fdebx5FR3uDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5A2113274;
	Fri, 17 Feb 2023 09:44:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 1gAtMndM72NvGwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 09:44:23 +0000
Message-ID: <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
Date: Fri, 17 Feb 2023 10:44:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
 <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ITRwa6yShm5EYQpkqwgyyuqC"
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
--------------ITRwa6yShm5EYQpkqwgyyuqC
Content-Type: multipart/mixed; boundary="------------ma8N3q656ZIqoXJqiV7Sx6qs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@gmail.com, deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geoff@infradead.org, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Message-ID: <2c589464-bc37-4138-d9a6-b38cd05e5f99@suse.de>
Subject: Re: [PATCH 02/11] fbdev: Transfer video= option strings to caller;
 clarify ownership
References: <20230209135509.7786-1-tzimmermann@suse.de>
 <20230209135509.7786-3-tzimmermann@suse.de>
 <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87a61cy9et.fsf@minerva.mail-host-address-is-not-set>

--------------ma8N3q656ZIqoXJqiV7Sx6qs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDIuMjMgdW0gMDk6Mzcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gSW4gZmJfZ2V0X29wdGlvbnMoKSwgYWx3YXlzIGR1cGxpY2F0ZSB0aGUg
cmV0dXJuZWQgb3B0aW9uIHN0cmluZyBhbmQNCj4+IHRyYW5zZmVyIG93bmVyc2hpcCBvZiB0
aGUgbWVtb3J5IHRvIHRoZSBmdW5jdGlvbidzIGNhbGxlci4NCj4+DQo+PiBVbnRpbCBub3cs
IG9ubHkgdGhlIGdsb2JhbCBvcHRpb24gc3RyaW5nIGdvdCBkdXBsaWNhdGVkIGFuZCB0cmFu
c2ZlcnJlZA0KPj4gdG8gdGhlIGNhbGxlcjsgdGhlIHBlci1kcml2ZXIgb3B0aW9ucyB3ZXJl
IG93bmVkIGJ5IGZiX2dldF9vcHRpb25zKCkuDQo+PiBJbiB0aGUgZW5kLCBpdCB3YXMgaW1w
b3NzaWJsZSBmb3IgdGhlIGZ1bmN0aW9uJ3MgY2FsbGVyIHRvIGRldGVjdCBpZg0KPj4gaXQg
aGFkIHRvIHJlbGVhc2UgdGhlIHN0cmluZydzIG1lbW9yeSBidWZmZXIuIEhlbmNlLCBhbGwg
Y2FsbGluZyBkcml2ZXJzDQo+PiBsZWFrIHRoZSBtZW1vcnkgYnVmZmVyLiBUaGUgbGVha3Mg
aGF2ZSBleGlzdGVkIGV2ZXIgc2luY2UsIGJ1dCBkcml2ZXJzDQo+PiBvbmx5IGNhbGwgZmJf
Z2V0X29wdGlvbigpIG9uY2UgYXMgcGFydCBvZiBtb2R1bGUgaW5pdGlhbGl6YXRpb24uIFNv
IHRoZQ0KPj4gYW1vdW50IG9mIGxlYWtlZCBtZW1vcnkgaXMgbm90IHNpZ25pZmljYW50Lg0K
Pj4NCj4+IEZpeCB0aGUgc2VtYW50aWNzIG9mIGZiX2dldF9vcHRpb24oKSBieSB1bmNvbmRp
dGlvbmFsbHkgdHJhbnNmZXJyaW5nDQo+PiBvd25lcnNoaXAgb2YgdGhlIG1lbW9yeSBidWZm
ZXIgdG8gdGhlIGNhbGxlci4gTGF0ZXIgcGF0Y2hlcyBjYW4gcmVzb2x2ZQ0KPj4gdGhlIG1l
bW9yeSBsZWFrcyBpbiB0aGUgZmJkZXYgZHJpdmVycy4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5
OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiAN
Cj4gWy4uLl0NCj4gDQo+PiArCWlmIChvcHRpb24pIHsNCj4+ICsJCWlmIChvcHRpb25zKQ0K
Pj4gKwkJCSpvcHRpb24gPSBrc3RyZHVwKG9wdGlvbnMsIEdGUF9LRVJORUwpOw0KPj4gKwkJ
ZWxzZQ0KPj4gKwkJCSpvcHRpb24gPSBOVUxMOw0KPj4gKwl9DQo+Pg0KPiANCj4gSSBrbm93
IHRoZSBvbGQgY29kZSB3YXNuJ3QgY2hlY2tpbmcgaWYga3N0cmR1cCgpIHN1Y2NlZWRlZCwg
YnV0IHlvdSBzaG91bGQNCg0KS3N0cmR1cCB1c2VzIGttYWxsb2MsIHdoaWNoIGFscmVhZHkg
d2FybnMgYWJvdXQgZmFpbGVkIGFsbG9jYXRpb25zLiBJIA0KdGhpbmsgaXQncyBkaXNjb3Vy
YWdlZCB0byB3YXJuIGFnYWluLiAoV2Fzbid0IHRoZXJlIGEgd2FybmluZyBpbiBzcGFyc2Ug
DQpvciBjaGVja3BhdGNoPykgIFNvIEknZCByYXRoZXIgbGVhdmUgaXQgYXMgaXMuDQoNCj4g
ZG8gaXQgaGVyZSBhbmQgbGV0IHRoZSBjYWxsZXIga25vdy4gQW5kIHNhbWUgaWYgKCFvcHRp
b25zKS4gU28gSSBndWVzcyB0aGUNCj4gZm9sbG93aW5nIGNoZWNrIGNhbiBiZSBhZGRlZCAo
dG8gYmUgY29uc2lzdGVudCB3aXRoIHRoZSByZXN0IG9mIHRoZSBjb2RlKToNCj4gDQo+IAlp
ZiAoISpvcHRpb24pDQo+IAkJcmV0dmFsID0gMTsNCg0KV2h5IGlzIHRoYXQgbmVlZGVkIGZv
ciBjb25zaXN0ZW5jeT8NCg0KUmV0dmFsIGlzIHRoZSBzdGF0ZSBvZiB0aGUgb3V0cHV0OiBl
bmFibGVkIG9yIG5vdC4gSWYgdGhlcmUgYXJlIG5vIA0Kb3B0aW9ucywgcmV0dmFsIHNob3Vs
ZCBiZSAwKD1lbmFibGVkKS4gMSg9ZGlzYWJsZWQpIGlzIG9ubHkgc2V0IGJ5IA0KdmlkZW89
b2ZmIG9yIHRoYXQgb2Zvbmx5IHRoaW5nLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPj4gICAJcmV0dXJuIHJldHZhbDsNCj4+ICAgfQ0KPj4gLS0gDQo+PiAyLjM5LjENCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gSmF2aWVyDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------ma8N3q656ZIqoXJqiV7Sx6qs--

--------------ITRwa6yShm5EYQpkqwgyyuqC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvTHcFAwAAAAAACgkQlh/E3EQov+Cz
aQ//aXm93WpLHkKiD7UBqR5DpHU0R5lVw9TU/Z/4+M9g2KbVBGCH7H+1Ar5siY+BZUVc8SI1/uCN
5IkuCcIRXWhmFxb1MnqNnmYXd1lyB3bjApFercDBpLsuFoUU8dFW/CvJaHAf+6URjBYKMk/USAAk
yyyZuIk8rUQiY8O1DxSD7SFAr01H77GZewV2FOMOgKOFX/4LIN0KWbZX1KmHiJdswECDYB7TY7g1
deG2pf1Kk+TEyu1lgMYK1K97ryCQh78r4zXTSbhoIv/rGR+/RjpgKaS8T9EnNWm5G+ZDlxYloEDf
qJfMiOWON6DACiJ3GOq93aypKK7pCPaS+dFBF73OjaZSuw4zaeJpAObsFLpzrJyZh+qsCnwLuNKb
GGhG4VhLdFr2ZBApnFS8bNOeoPFMPQxzQZ8+THjuXRqBVaRYAdILK353QzHYp+gbARNfKGv+Cn/h
+ItBnw2AiNInX5sYhZz7JccOyK5jyOfbBj2cM/5i67XdGkvWPXvPF60NT5zMKgNNKXIHCEjk96FE
IyFoFz+isR2ggIuAnNkZg3N3g84jPKN0o7+mAjHdPl7AT3/l2v1cykgYxit7YgZqkXbbR1Yu9alg
uJNUDozmU4qE4WuWj/mfCkk4apVI0o15n/+azZHfKgcYmH309S7NoRh8GIjRPT9+kn+C9+ACbM3m
Vws=
=L+vl
-----END PGP SIGNATURE-----

--------------ITRwa6yShm5EYQpkqwgyyuqC--
