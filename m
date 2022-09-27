Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362165EC7D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 17:33:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McNvN2jRbz3cFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 01:33:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XF4yO1eH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SCl/rPmR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=XF4yO1eH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=SCl/rPmR;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McNtg5sjQz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 01:33:15 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 72A6621A5C;
	Tue, 27 Sep 2022 15:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1664292791; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi0hNi61uzt29JHAE0HhY8KMe8OoUKb8eX4Yo4wVoj0=;
	b=XF4yO1eHQkjHeSmhInHYQ0xeRuzwGNi0aEQyau9ZWMvZc6LY0s+mmzH15WFJvk9T2s/dRO
	x0340qGpPKGq+TdtxjfX8JlgnQRM/MhXC9n+aqEVx8Bm7EMSETljQy9zSs1SesHQzreCRA
	yruMLkk0/hF/KqBtpVVd5HSJwvVY8uo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1664292791;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mi0hNi61uzt29JHAE0HhY8KMe8OoUKb8eX4Yo4wVoj0=;
	b=SCl/rPmRUb4JjrIpdj71X0Ih2a7xchqFv8Et0fWwdazWKjvEjk4X6brTntDYqotqfXSP66
	lnQCTEp4dKgGd9CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30700139BE;
	Tue, 27 Sep 2022 15:33:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Cy3YCrcXM2PxWwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Sep 2022 15:33:11 +0000
Message-ID: <7d7bc5b6-2725-b43c-91a6-abcef50765b5@suse.de>
Date: Tue, 27 Sep 2022 17:33:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-2-tzimmermann@suse.de>
 <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vUFJOhfb4n1ttBcE8WdbUHq9"
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
Cc: linux-fbdev@vger.kernel.org, sam@ravnborg.org, airlied@linux.ie, deller@gmx.de, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vUFJOhfb4n1ttBcE8WdbUHq9
Content-Type: multipart/mixed; boundary="------------YXxC0cjTC70UcMr63EXK8BVv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, mpe@ellerman.id.au,
 deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, paulus@samba.org,
 maxime@cerno.tech, msuchanek@suse.de, sam@ravnborg.org
Message-ID: <7d7bc5b6-2725-b43c-91a6-abcef50765b5@suse.de>
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-2-tzimmermann@suse.de>
 <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
In-Reply-To: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>

--------------YXxC0cjTC70UcMr63EXK8BVv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMDk6MTQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgU2VwIDIyLCAyMDIyIGF0IDE6MzMgUE0g
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4gT3Bl
biBGaXJtd2FyZSBwcm92aWRlcyBiYXNpYyBkaXNwbGF5IG91dHB1dCB2aWEgdGhlICdkaXNw
bGF5JyBub2RlLg0KPj4gRFQgcGxhdGZvcm0gY29kZSBhbHJlYWR5IHByb3ZpZGVzIGEgZGV2
aWNlIHRoYXQgcmVwcmVzZW50cyB0aGUgbm9kZSdzDQo+PiBmcmFtZWJ1ZmZlci4gQWRkIGEg
RFJNIGRyaXZlciBmb3IgdGhlIGRldmljZS4gVGhlIGRpc3BsYXkgbW9kZSBhbmQNCj4+IGNv
bG9yIGZvcm1hdCBpcyBwcmUtaW5pdGlhbGl6ZWQgYnkgdGhlIHN5c3RlbSdzIGZpcm13YXJl
LiBSdW50aW1lDQo+PiBtb2Rlc2V0dGluZyB2aWEgRFJNIGlzIG5vdCBwb3NzaWJsZS4gVGhl
IGRpc3BsYXkgaXMgdXNlZnVsIGR1cmluZw0KPj4gZWFybHkgYm9vdCBzdGFnZXMgb3IgYXMg
ZXJyb3IgZmFsbGJhY2suDQo+Pg0KPj4gU2ltaWxhciBmdW5jdGlvbmFsaXR5IGlzIGFscmVh
ZHkgcHJvdmlkZWQgYnkgZmJkZXYncyBvZmZiIGRyaXZlciwNCj4+IHdoaWNoIGlzIGluc3Vm
ZmljaWVudCBmb3IgbW9kZXJuIHVzZXJzcGFjZS4gVGhlIG9sZCBkcml2ZXIgaW5jbHVkZXMN
Cj4+IHN1cHBvcnQgZm9yIEJvb3RYIGRldmljZSB0cmVlLCB3aGljaCBjYW4gYmUgZm91bmQg
b24gb2xkIDMyLWJpdA0KPj4gUG93ZXJQQyBNYWNpbnRvc2ggc3lzdGVtcy4gSWYgdGhlc2Ug
YXJlIHN0aWxsIGluIHVzZSwgdGhlDQo+PiBmdW5jdGlvbmFsaXR5IGNhbiBiZSBhZGRlZCB0
byBvZmRybSBvciBpbXBsZW1lbnRlZCBpbiBhIG5ldw0KPj4gZHJpdmVyLiBBcyB3aXRoIHNp
bXBsZWRybSwgdGhlIGZiZGV2IGRyaXZlciBjYW5ub3QgYmUgc2VsZWN0ZWQgaWYNCj4+IG9m
ZHJtIGlzIGFscmVhZHkgZW5hYmxlZC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+PiBUaGUgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCBvbiBxZW11J3MgcHBjNjRsZSBl
bXVsYXRpb24uIFRoZSBkZXZpY2UNCj4+IGhhbmQtb3ZlciBoYXMgYmVlbiB0ZXN0ZWQgd2l0
aCBib2Nocy4NCj4gDQo+IE9oLCB0ZXN0ZWQgb24gbGl0dGxlLWVuZGlhbiBvbmx5IDstKQ0K
PiANCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L29m
ZHJtLmMNCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZGlzcGxh
eV9nZXRfdmFsaWRhdGVkX2Zvcm1hdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgdTMyIGRlcHRoKQ0KPj4gK3sNCj4+ICsgICAgICAgY29uc3Qgc3RydWN0IGRy
bV9mb3JtYXRfaW5mbyAqaW5mbzsNCj4+ICsgICAgICAgdTMyIGZvcm1hdDsNCj4+ICsNCj4+
ICsgICAgICAgc3dpdGNoIChkZXB0aCkgew0KPj4gKyAgICAgICBjYXNlIDg6DQo+PiArICAg
ICAgICAgICAgICAgZm9ybWF0ID0gZHJtX21vZGVfbGVnYWN5X2ZiX2Zvcm1hdCg4LCA4KTsN
Cj4+ICsgICAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgY2FzZSAxNToNCj4+ICsg
ICAgICAgY2FzZSAxNjoNCj4+ICsgICAgICAgICAgICAgICBmb3JtYXQgPSBkcm1fbW9kZV9s
ZWdhY3lfZmJfZm9ybWF0KDE2LCBkZXB0aCk7DQo+PiArICAgICAgICAgICAgICAgYnJlYWs7
DQo+PiArICAgICAgIGNhc2UgMzI6DQo+PiArICAgICAgICAgICAgICAgZm9ybWF0ID0gZHJt
X21vZGVfbGVnYWN5X2ZiX2Zvcm1hdCgzMiwgMjQpOw0KPiANCj4gU2hvdWxkbid0IGFsbCBv
ZiB0aGVzZSB1c2UgZHJtX2RyaXZlcl9sZWdhY3lfZmJfZm9ybWF0KCkgKGFuZCB0aGUNCj4g
ZHJpdmVyIHNldCBkcm1fbW9kZV9jb25maWcucXVpcmtfYWRkZmJfcHJlZmVyX2hvc3RfYnl0
ZV9vcmRlcikgdG8gaGF2ZQ0KPiBhIGNoYW5jZSBvZiB3b3JraW5nIG9uIHRyYWRpdGlvbmFs
IGJpZy1lbmRpYW4gUFBDPw0KDQpCaWcgdGhhbmtzIHRvIE1pY2hhbCBTdWNoYW5laywgd2hv
IHBvaW50ZWQgbWUgdG8gYSBUdW1ibGV3ZWVkIGluc3RhbGxlciANCmZvciBiaWctZW5kaWFu
IFBQQzY0LiBJJ3ZlIGFkZGVkIGNvZGUgdG8gc3VwcG9ydCBCRSBzY2Fub3V0IGJ1ZmZlcnMu
IA0KSSdsbCBhZGQgdGhlIHBhdGNoIHRvIHRoZSBuZXh0IGl0ZXJhdGlvbi4gQnV0IFVzZXJz
cGFjZSBpc24ndCByZWFsbHkgDQpyZWFkeSB5ZXQuIFBpeG1hbiBtb3N0bHkgd29ya3Mgb24g
bXkgdGVzdCBzeXN0ZW0sIGJ1dCBHTCByZW5kZXJpbmcgDQpkaXNwbGF5cyBpbmNvcnJlY3Qg
Y29sb3JzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBHcntvZXRqZSxlZXRp
bmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0N
Cj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQg
aWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVy
c2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIu
IEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------YXxC0cjTC70UcMr63EXK8BVv--

--------------vUFJOhfb4n1ttBcE8WdbUHq9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMzF7YFAwAAAAAACgkQlh/E3EQov+BP
zQ/6Axs3j3AKy1kWerkYJyF+XS98mE0/2mHVkUp7LuV4d5cpr1m+9IxUP70iWVvcN1sWWh49FA5x
bwbmCw96jaFpZB0NoZyGoZRbutFE/eVgrIJffIu3asSeEq4fDiUIVg+nci2xQoWcnTgokxE7jQIw
K4L8lB1+PihBzTXjGGyBUYsO2JrmqDpIfr/Mnh4/xojbtGrSTq7lpm5Jy4g2QZPmbRdU0QIKZKkc
gCdE+FvG6GHrjzeUe3Y9bHLWbRvNVMgaIlyHgK6G+r9ruQoj4wDd4OtEQEjEs7eJXUVNkQPfRe9P
QtSSUyrFBrVZrBmZIPgbibdGTablpxRPLlw42/YApu/KP9OJLXZ6FA/1ahH0Nrh++mCayod91YGz
vm8zNMXkdIz8hIzck093OEB1FS58DTN+qx4Lb4dkx5PRNLTg9DwEY/1doYTRtrJ+oW3bqApIcycb
z7kbt5s1AHa6DNLnaDoIr/BCSYmH8vrgycwH7sDUCy8mMJj0ao+Vi1qx5tCGz4cN+o0wpqP2LfGz
uxmvAh23Q09N4hxY5IVujWk0D3J+Ap4UGH4CJT1sTS+fLG9YhGDkSb7dteDQ7ZhgBAcKiCVu4zRH
51tx64xgzErHBylj0boEq1TbLufQm6nASoK56sDRFMjHe5tg29Q2Xg7g+Ol0aPyeIv3uEaYS8nXY
raE=
=rLtd
-----END PGP SIGNATURE-----

--------------vUFJOhfb4n1ttBcE8WdbUHq9--
