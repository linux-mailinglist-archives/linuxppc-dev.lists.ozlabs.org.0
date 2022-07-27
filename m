Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7245821A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 09:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt5lr2JBVz3by0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 17:59:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1EWbUmC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WnllXQ83;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1EWbUmC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WnllXQ83;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt5lC4fGKz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 17:59:03 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A6529348A8;
	Wed, 27 Jul 2022 07:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658908740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOvwwx0ITLquWkW22Zh+vbGQyEd1ZvaL/HMJnDRJdLE=;
	b=u1EWbUmCSESyTiCZZ8FXZiHCDzWDOu79cDUv0rGcmWAPxDRdJta4RS9S1o+q587AnVmTzx
	o73RruJU8GPOfY6EoTVKBSwcTpbuOcYYE5mY3lj+N33xAEcjCzUBUqxdXi4t2iaPiJ63Rk
	7Ya1BlHQCewSwlaKMgDJv5TC5PW6QbI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658908740;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOvwwx0ITLquWkW22Zh+vbGQyEd1ZvaL/HMJnDRJdLE=;
	b=WnllXQ83MjducR7rHl/dmMAvB1kGnRHGgC6m1wWfC2lEqh04gyo35rs5GNbufQSgZ/0VhP
	I4gjlqA4gYVPi3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DD1413AD7;
	Wed, 27 Jul 2022 07:59:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id jIRbCkTw4GLUHwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 07:59:00 +0000
Message-ID: <f2575e8e-2c9e-7f1a-f681-418a2725b4ef@suse.de>
Date: Wed, 27 Jul 2022 09:58:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/10] drm/simpledrm: Convert to atomic helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-6-tzimmermann@suse.de>
 <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1enSdAK5XocaDrylNwunWey0"
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
--------------1enSdAK5XocaDrylNwunWey0
Content-Type: multipart/mixed; boundary="------------A0NDaS2ad8imxpVrI0WvpdAo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <f2575e8e-2c9e-7f1a-f681-418a2725b4ef@suse.de>
Subject: Re: [PATCH v2 05/10] drm/simpledrm: Convert to atomic helpers
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-6-tzimmermann@suse.de>
 <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>
In-Reply-To: <3d2de29a-2a96-867d-907f-6b85573586ab@redhat.com>

--------------A0NDaS2ad8imxpVrI0WvpdAo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjIgdW0gMTc6NDYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gUmVwbGFjZSB0aGUgc2ltcGxlLUtNUyBoZWxwZXJzIHdpdGggdGhlIHJlZ3VsYXIgYXRv
bWljIGhlbHBlcnMuIFRoZQ0KPj4gcmVndWxhciBoZWxwZXJzIGFyZSBiZXR0ZXIgYXJjaGl0
ZWN0dXJlZCBhbmQgdGhlcmVmb3JlIGFsbG93IGZvciBlYXNpZXINCj4+IGNvZGUgc2hhcmlu
ZyBhbW9uZyBkcml2ZXJzLiBObyBmdW5jdGlvbmFsIGNoYW5nZXMuDQo+Pg0KPiANCj4gQWNr
ZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
PiANCj4gQnV0IEkndmUgYSBxdWVzdGlvbiBiZWxvdy4uLg0KPiAgIA0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0N
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAyODMgKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTgwIGluc2Vy
dGlvbnMoKyksIDEwMyBkZWxldGlvbnMoLSkNCj4gDQo+IFsuLi5dDQo+IA0KPj4gK3N0YXRp
YyB2b2lkIHNpbXBsZWRybV9jcnRjX2hlbHBlcl9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywNCj4+ICsJCQkJCQlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqb2xkX3N0
YXRlKQ0KPj4gK3sNCj4+ICsJLyoNCj4+ICsJICogQWx3YXlzIGVuYWJsZWQ7IHNjcmVlbiB1
cGRhdGVzIGFyZSBwZXJmb3JtZWQgYnkNCj4+ICsJICogdGhlIHByaW1hcnkgcGxhbmUncyBh
dG9taWNfdXBkYXRlIGZ1bmN0aW9uLg0KPj4gKwkgKi8NCj4+ICt9DQo+PiArDQo+PiArc3Rh
dGljIHZvaWQgc2ltcGxlZHJtX2NydGNfaGVscGVyX2F0b21pY19kaXNhYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0YywNCj4+ICsJCQkJCQkgc3RydWN0IGRybV9hdG9taWNfc3RhdGUgKm9s
ZF9zdGF0ZSkNCj4+ICt7DQo+PiArCS8qDQo+PiArCSAqIEFsd2F5cyBlbmFibGVkOyBkaXNh
YmxpbmcgY2xlYXJzIHRoZSBzY3JlZW4gaW4gdGhlDQo+PiArCSAqIHByaW1hcnkgcGxhbmUn
cyBhdG9taWNfZGlzYWJsZSBmdW5jdGlvbi4NCj4+ICsJICovDQo+PiArfQ0KPiANCj4gLi4u
ZG8gd2UgcmVhbGx5IG5lZWQgdG8gaGF2ZSB0aGVzZSA/IENhbid0IHdlIGp1c3Qgbm90IHNl
dCB0aGVtID8NCj4gDQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19o
ZWxwZXJfZnVuY3Mgc2ltcGxlZHJtX2NydGNfaGVscGVyX2Z1bmNzID0gew0KPj4gKwkubW9k
ZV92YWxpZCA9IHNpbXBsZWRybV9jcnRjX2hlbHBlcl9tb2RlX3ZhbGlkLA0KPj4gKwkuYXRv
bWljX2NoZWNrID0gc2ltcGxlZHJtX2NydGNfaGVscGVyX2F0b21pY19jaGVjaywNCj4+ICsJ
LmF0b21pY19lbmFibGUgPSBzaW1wbGVkcm1fY3J0Y19oZWxwZXJfYXRvbWljX2VuYWJsZSwN
Cj4+ICsJLmF0b21pY19kaXNhYmxlID0gc2ltcGxlZHJtX2NydGNfaGVscGVyX2F0b21pY19k
aXNhYmxlLA0KPj4gK307DQo+PiArDQo+IGxvb2tpbmcgYXQgaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9o
ZWxwZXJfdnRhYmxlcy5oI0w3MDMNCj4gdGhhdCBzYXlzIHRoZSAuYXRvbWljX3tlbixkaXN9
YWJsZSBoYW5kbGVycyBhcmUgb3B0aW9uYWwuDQo+IA0KDQpUaGUgY29kZSBhbHNvIGxvb2tz
IGxpa2Ugd2UgZG9uJ3QgbmVlZCB0aGUgaGVscGVycy4gSSBtb3N0bHkgYWRkZWQgdGhlbSAN
CmZvciB0aGUgY29tbWVudHMgdGhleSBjb250YWluLCBidXQgSSBjYW4gYWxzbyBhZGQgdGhv
c2UgbmV4dCB0byANCnNpbXBsZWRybV9jcnRjX2hlbHBlcl9mdW5jcy4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------A0NDaS2ad8imxpVrI0WvpdAo--

--------------1enSdAK5XocaDrylNwunWey0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg8EMFAwAAAAAACgkQlh/E3EQov+A/
rA/+JZ8e/Zq0/NO2+GXJb1wGZC+bUhUrfa/iRuEHm6PHKXaqs3VNEQgOqeXg4hKvyMxxuiNfAqa4
afh0rquQBa8rOFJusQoMzKSbcR8SwU0SZfH+FWCDHYE8xGwu0Ix1hH3lhcICQK4UAfgGLRNo1Noy
KK7otffQ1Fvnmo2KIoiuwfH6lIF8m28X7KrQiaSVCqDlgX0idQwjKv7yuHbcvwSmfSh13jcQC9e9
fwEvAf6/0xFEWWnbJRTHAQBSEOhbFIJ2+4MWlc65c/rqFapBXGnTKVWFgQGPnnE8dq7k98CpikYe
7WAjmiIOj8X5DrI2mlb3EYFVmBDuNANBvJC853D/UFzI8kd0mO5oHEQfa1zneFKaRltFwY/ogfbm
cM54gJ69m7R0gzzL67QKr8r54yrUqK5t3gmtSP3r9JMwXXRlLqcaA9h5xyljTs/FNSqB0QhrVuWB
Dxq0B7i9xlAyRSjR/BPmAezRQGYgrNaTOFxhrGT3+zTsy+R3xXj5+Nl3/DfoyuqXbzd+SwEB4tlb
J3pGPliSrSqUqeNebG/aRHR949Kcze8QK8mWT1KHY+Rc8ZUcTCMICpqiTMmae8LhL8EDwo+GYzFx
8j2C9CwsSbJ4W1E48U3fpFsaJQIeJoME0K8XcZyTIDq0p0MEB9zkfz1fQkbfdPRPQxF0qhRsHNWP
1PM=
=/PvB
-----END PGP SIGNATURE-----

--------------1enSdAK5XocaDrylNwunWey0--
