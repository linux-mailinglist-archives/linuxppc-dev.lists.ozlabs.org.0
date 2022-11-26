Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8525563963C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Nov 2022 14:41:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKCZH3H9Wz3f24
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 00:41:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SIyt6qAc;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iXiYIYfZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SIyt6qAc;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=iXiYIYfZ;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKCYG6VpDz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 00:40:50 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1A2C221B3D;
	Sat, 26 Nov 2022 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1669470041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BoGl6Fm7p2wFv2CwtdQxNHqKs/HFx08iy/uRCX9zFjU=;
	b=SIyt6qAciTDNvEAg09j748/wQATsUA/Uj85V8pa3X798Hb7CVGZYXJmBzTBPlvGd1ERn21
	Jo1hoFCv0CEpbCLESRyBHQoyg9TLmLcEulzdYD3+pYn7dnV6xrJuZX7prlLm9yC+OW3PqA
	ERg9P2ARB71DVcyHnT72oVHdAT8SBNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1669470041;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BoGl6Fm7p2wFv2CwtdQxNHqKs/HFx08iy/uRCX9zFjU=;
	b=iXiYIYfZymLvkVxSItVy4pxnnMwc0LmU+cd++qbaXJUzKvdIyCBDd9FFUIVkuFjM7kLC4C
	zk1AZU+49bs0XgDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7D411326E;
	Sat, 26 Nov 2022 13:40:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 4jGuM1gXgmO+EgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Sat, 26 Nov 2022 13:40:40 +0000
Message-ID: <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
Date: Sat, 26 Nov 2022 14:40:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] fbdev: make offb driver tristate
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20221126000401.25302-1-rdunlap@infradead.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221126000401.25302-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ki0pK44NuJYH6e0YyzbOqHJf"
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Helge Deller <deller@gmx.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ki0pK44NuJYH6e0YyzbOqHJf
Content-Type: multipart/mixed; boundary="------------vJuoS16oKQcn9uhxcFoFCUdr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <46e8cf0d-ab47-59b1-6c87-53d2d63a5bf6@suse.de>
Subject: Re: [PATCH] fbdev: make offb driver tristate
References: <20221126000401.25302-1-rdunlap@infradead.org>
In-Reply-To: <20221126000401.25302-1-rdunlap@infradead.org>

--------------vJuoS16oKQcn9uhxcFoFCUdr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjExLjIyIHVtIDAxOjA0IHNjaHJpZWIgUmFuZHkgRHVubGFwOg0KPiBNYWtl
IHRoZSBvZmZiIChPcGVuIEZpcm13YXJlIGZyYW1lIGJ1ZmZlcikgZHJpdmVyIHRyaXN0YXRl
LA0KPiBpLmUuLCBzbyB0aGF0IGl0IGNhbiBiZSBidWlsdCBhcyBhIGxvYWRhYmxlIG1vZHVs
ZS4NCj4gDQo+IEhvd2V2ZXIsIGl0IHN0aWxsIGRlcGVuZHMgb24gdGhlIHNldHRpbmcgb2Yg
RFJNX09GRFJNDQo+IHNvIHRoYXQgYm90aCBvZiB0aGVzZSBkcml2ZXJzIGNhbm5vdCBiZSBi
dWlsdGluIGF0IHRoZSBzYW1lIHRpbWUNCj4gbm9yIGNhbiBvbmUgYmUgYnVpbHRpbiBhbmQg
dGhlIG90aGVyIG9uZSBhIGxvYWRhYmxlIG1vZHVsZS4NCj4gDQo+IEJ1aWxkLXRlc3RlZCBz
dWNjZXNzZnVsbHkgd2l0aCBhbGwgY29tYmluYXRpb24gb2YgRFJNX09GRFJNIGFuZCBGQl9P
Ri4NCj4gDQo+IFRoaXMgZml4ZXMgYSBidWlsZCBpc3N1ZSB0aGF0IE1pY2hhbCByZXBvcnRl
ZCB3aGVuIEZCX09GPXkgYW5kDQo+IERSTV9PRkRSTT1tOg0KPiANCj4gcG93ZXJwYzY0LWxp
bnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L29mZmIubzooLmRhdGEucmVsLnJvKzB4NTgp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZmJfZmlsbHJlY3QnDQo+IHBvd2VycGM2NC1s
aW51eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9vZmZiLm86KC5kYXRhLnJlbC5ybysweDYw
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY2ZiX2NvcHlhcmVhJw0KPiBwb3dlcnBjNjQt
bGludXgtbGQ6IGRyaXZlcnMvdmlkZW8vZmJkZXYvb2ZmYi5vOiguZGF0YS5yZWwucm8rMHg2
OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNmYl9pbWFnZWJsaXQnDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gU3Vn
Z2VzdGVkLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiBDYzogTWFzYWhp
cm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4NCj4gQ2M6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPiBDYzogTWljaGFsIFN1Y2jDoW5layA8bXN1
Y2hhbmVrQHN1c2UuZGU+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogSGVsZ2UgRGVs
bGVyIDxkZWxsZXJAZ214LmRlPg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3Jn
DQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQoNCkFja2VkLWJ5OiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiANCj4gLS0tDQo+
ICAgZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIHwgICAgNCArKy0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L0tjb25maWcNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+ICsrKyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPiBAQCAtNDU2LDggKzQ1Niw4IEBAIGNv
bmZpZyBGQl9BVEFSSQ0KPiAgIAkgIGNoaXBzZXQgZm91bmQgaW4gQXRhcmlzLg0KPiAgIA0K
PiAgIGNvbmZpZyBGQl9PRg0KPiAtCWJvb2wgIk9wZW4gRmlybXdhcmUgZnJhbWUgYnVmZmVy
IGRldmljZSBzdXBwb3J0Ig0KPiAtCWRlcGVuZHMgb24gKEZCID0geSkgJiYgUFBDICYmICgh
UFBDX1BTRVJJRVMgfHwgUENJKQ0KPiArCXRyaXN0YXRlICJPcGVuIEZpcm13YXJlIGZyYW1l
IGJ1ZmZlciBkZXZpY2Ugc3VwcG9ydCINCj4gKwlkZXBlbmRzIG9uIEZCICYmIFBQQyAmJiAo
IVBQQ19QU0VSSUVTIHx8IFBDSSkNCj4gICAJZGVwZW5kcyBvbiAhRFJNX09GRFJNDQo+ICAg
CXNlbGVjdCBBUEVSVFVSRV9IRUxQRVJTDQo+ICAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------vJuoS16oKQcn9uhxcFoFCUdr--

--------------Ki0pK44NuJYH6e0YyzbOqHJf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOCF1gFAwAAAAAACgkQlh/E3EQov+CJ
vw/+ONumJQjV+7LoEpcMdQywoYRDLqpBwO/cB5TlRWktE2eLaRwMG88S2rOde8UcNu++iKAndzYZ
q6v9TbZGx2dFV6dWPxefOd6UxgZVuPVffPlzGs71iaaDmr33yoQXvA+XYMs62JX2RSLmxx9lW5lU
BsloOKY15g7sh64e7UfL3V2nlC+I6nScpa8lmC+tOkX0pzEEpDlMmBa7QsNhfvf0oZ0VJFzvDoIL
lMgxjVpBv5YAmhOaMf2pQXgjfHbJnEL18o4iRvWLWKaU0B12J46KxTqTafok/TmASdRugRH5NIP1
wa5V7f1twwtJdczhLCfPzq1Iiv86JgD0CyN3af/LIBwN/FwZkI3LftRvWJtgU7ikD5FymPmhhc+a
YcxjmVhwUcUnh4vhA0CuhA3zA77XJFbBdtrBP2gchSvA4tZ/vJqtZm1DOSVdzGt1xqwvdzamwUse
mDome8RBkhqbbFmQZAjvJiAOxHkdtFaOy8NS0hYH7bgRCc34eccBz+t3vjtB9k/bcx3c9DASN5Rd
uWcXN6yuRce4HuwVHTidZKWmclxRZiZYfwJmLGLEpf8ReJvTetBtuMmoJ7i0OG26K4Kh4Kmag8t3
UjqXVYGVY4stIdA3/sq3H9u9h6hp6jSDJiWlq4Or5iNGuiL4wd/WZyAyODk2+HxXpx5SwIhll1Xi
J9c=
=nzHm
-----END PGP SIGNATURE-----

--------------Ki0pK44NuJYH6e0YyzbOqHJf--
