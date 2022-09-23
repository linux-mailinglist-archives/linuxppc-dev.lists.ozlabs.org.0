Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDE35E750A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 09:42:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYkck0pCQz3cCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 17:41:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ee7gz6EA;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8Yum5bkx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ee7gz6EA;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=8Yum5bkx;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYkc42KJ4z3cgt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 17:41:24 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9DB30219CE;
	Fri, 23 Sep 2022 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663918880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MixGtf6XlGUYA0vR4YxCqSkg8gP1qXH1N0CGkhI3jh0=;
	b=ee7gz6EAin02m1W7B+d9rEsCEdOARRI/z3WxQIhA1GXtVz2HpfKAgMq34DycgtRGChVO67
	Hcg2L4f0dUtHXOtDAZY2FppTSWgwuuIszlnxv/vxXz1bFdmXkXAaTqb3k1O7i5KmAeJZZe
	cNZYrTt/QVNCGnZYZY9BMYGk6dfS9fA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663918880;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MixGtf6XlGUYA0vR4YxCqSkg8gP1qXH1N0CGkhI3jh0=;
	b=8Yum5bkx+necVqMUpvlXtAYKbzm3GXFE749NcZtfUubNm51toekxFfslTRgGbDhhNCdWVt
	sCnRQznu1p83CXAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54BA813A00;
	Fri, 23 Sep 2022 07:41:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MJO9EyBjLWN7dAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 07:41:20 +0000
Message-ID: <be027064-32f2-03ec-ded6-23688aed749f@suse.de>
Date: Fri, 23 Sep 2022 09:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-2-tzimmermann@suse.de>
 <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------H91OYNMtRx6prswFu5pEb1hk"
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
--------------H91OYNMtRx6prswFu5pEb1hk
Content-Type: multipart/mixed; boundary="------------fzfqo0wFS1mmeexNmEqnr0AQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: javierm@redhat.com, airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de,
 maxime@cerno.tech, sam@ravnborg.org, msuchanek@suse.de, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, mark.cave-ayland@ilande.co.uk,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <be027064-32f2-03ec-ded6-23688aed749f@suse.de>
Subject: Re: [PATCH v3 1/4] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
References: <20220922113306.11251-1-tzimmermann@suse.de>
 <20220922113306.11251-2-tzimmermann@suse.de>
 <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>
In-Reply-To: <CAMuHMdW1echz6wc6Y2cfjrkPa2vZW+X4s83rXo7VebJ0E+qaqg@mail.gmail.com>

--------------fzfqo0wFS1mmeexNmEqnr0AQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR2VlcnQNCg0KQW0gMjMuMDkuMjIgdW0gMDk6MTQgc2NocmllYiBHZWVydCBVeXR0ZXJo
b2V2ZW46DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgU2VwIDIyLCAyMDIyIGF0IDE6
MzMgUE0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0K
Pj4gT3BlbiBGaXJtd2FyZSBwcm92aWRlcyBiYXNpYyBkaXNwbGF5IG91dHB1dCB2aWEgdGhl
ICdkaXNwbGF5JyBub2RlLg0KPj4gRFQgcGxhdGZvcm0gY29kZSBhbHJlYWR5IHByb3ZpZGVz
IGEgZGV2aWNlIHRoYXQgcmVwcmVzZW50cyB0aGUgbm9kZSdzDQo+PiBmcmFtZWJ1ZmZlci4g
QWRkIGEgRFJNIGRyaXZlciBmb3IgdGhlIGRldmljZS4gVGhlIGRpc3BsYXkgbW9kZSBhbmQN
Cj4+IGNvbG9yIGZvcm1hdCBpcyBwcmUtaW5pdGlhbGl6ZWQgYnkgdGhlIHN5c3RlbSdzIGZp
cm13YXJlLiBSdW50aW1lDQo+PiBtb2Rlc2V0dGluZyB2aWEgRFJNIGlzIG5vdCBwb3NzaWJs
ZS4gVGhlIGRpc3BsYXkgaXMgdXNlZnVsIGR1cmluZw0KPj4gZWFybHkgYm9vdCBzdGFnZXMg
b3IgYXMgZXJyb3IgZmFsbGJhY2suDQo+Pg0KPj4gU2ltaWxhciBmdW5jdGlvbmFsaXR5IGlz
IGFscmVhZHkgcHJvdmlkZWQgYnkgZmJkZXYncyBvZmZiIGRyaXZlciwNCj4+IHdoaWNoIGlz
IGluc3VmZmljaWVudCBmb3IgbW9kZXJuIHVzZXJzcGFjZS4gVGhlIG9sZCBkcml2ZXIgaW5j
bHVkZXMNCj4+IHN1cHBvcnQgZm9yIEJvb3RYIGRldmljZSB0cmVlLCB3aGljaCBjYW4gYmUg
Zm91bmQgb24gb2xkIDMyLWJpdA0KPj4gUG93ZXJQQyBNYWNpbnRvc2ggc3lzdGVtcy4gSWYg
dGhlc2UgYXJlIHN0aWxsIGluIHVzZSwgdGhlDQo+PiBmdW5jdGlvbmFsaXR5IGNhbiBiZSBh
ZGRlZCB0byBvZmRybSBvciBpbXBsZW1lbnRlZCBpbiBhIG5ldw0KPj4gZHJpdmVyLiBBcyB3
aXRoIHNpbXBsZWRybSwgdGhlIGZiZGV2IGRyaXZlciBjYW5ub3QgYmUgc2VsZWN0ZWQgaWYN
Cj4+IG9mZHJtIGlzIGFscmVhZHkgZW5hYmxlZC4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaCENCj4gDQo+PiBUaGUgZHJpdmVyIGhhcyBiZWVuIHRlc3RlZCBvbiBxZW11J3MgcHBj
NjRsZSBlbXVsYXRpb24uIFRoZSBkZXZpY2UNCj4+IGhhbmQtb3ZlciBoYXMgYmVlbiB0ZXN0
ZWQgd2l0aCBib2Nocy4NCj4gDQo+IE9oLCB0ZXN0ZWQgb24gbGl0dGxlLWVuZGlhbiBvbmx5
IDstKQ0KDQpJIHdpc2ggaXQgd2FzIGVhc2llciB0byB0ZXN0LiBCdXQgaXQncyBoYXJkIHRv
IGZpbmQgaGFyZHdhcmUgYW5kIGEgTGludXggDQpmb3IgUG93ZXJQQyB0aGVzZSBkYXlzLCBz
byBJIGhhdmUgbGltaXRlZCBvcHRpb25zIGZvciB0ZXN0aW5nLiBJdCdzIGp1c3QgDQpxZW11
ICsgYSBjb21wYXRpYmxlIGRpc3RyaWJ1dGlvbiBmb3IgbWUuIE15IGFzc3VtcHRpb24gaGFz
IGJlZW4gdGhhdCANCnBlb3BsZSB3aG8gd2hhdCB0byB1c2UgaXQgb24gYW55dGhpbmcgZWxz
ZSB3b3VsZCBzZW5kIG1lIGEgcGF0Y2guDQoNCj4gDQo+PiAtLS0gL2Rldi9udWxsDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jDQo+PiArc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fZm9ybWF0X2luZm8gKmRpc3BsYXlfZ2V0X3ZhbGlkYXRlZF9mb3JtYXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHUzMiBkZXB0aCkNCj4+ICt7
DQo+PiArICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmluZm87DQo+PiAr
ICAgICAgIHUzMiBmb3JtYXQ7DQo+PiArDQo+PiArICAgICAgIHN3aXRjaCAoZGVwdGgpIHsN
Cj4+ICsgICAgICAgY2FzZSA4Og0KPj4gKyAgICAgICAgICAgICAgIGZvcm1hdCA9IGRybV9t
b2RlX2xlZ2FjeV9mYl9mb3JtYXQoOCwgOCk7DQo+PiArICAgICAgICAgICAgICAgYnJlYWs7
DQo+PiArICAgICAgIGNhc2UgMTU6DQo+PiArICAgICAgIGNhc2UgMTY6DQo+PiArICAgICAg
ICAgICAgICAgZm9ybWF0ID0gZHJtX21vZGVfbGVnYWN5X2ZiX2Zvcm1hdCgxNiwgZGVwdGgp
Ow0KPj4gKyAgICAgICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICBjYXNlIDMyOg0KPj4g
KyAgICAgICAgICAgICAgIGZvcm1hdCA9IGRybV9tb2RlX2xlZ2FjeV9mYl9mb3JtYXQoMzIs
IDI0KTsNCj4gDQo+IFNob3VsZG4ndCBhbGwgb2YgdGhlc2UgdXNlIGRybV9kcml2ZXJfbGVn
YWN5X2ZiX2Zvcm1hdCgpIChhbmQgdGhlDQo+IGRyaXZlciBzZXQgZHJtX21vZGVfY29uZmln
LnF1aXJrX2FkZGZiX3ByZWZlcl9ob3N0X2J5dGVfb3JkZXIpIHRvIGhhdmUNCj4gYSBjaGFu
Y2Ugb2Ygd29ya2luZyBvbiB0cmFkaXRpb25hbCBiaWctZW5kaWFuIFBQQz8NCg0KVGhhdCdz
IGEgZ29vZCBwb2ludC4gVGhlIG9mZmIgZHJpdmVyIHJlYWRzIHRoZSBlbmRpYW5lc3MgcHJv
cGVydHkuIE9mZHJtIA0KY291bGQgZG8gdGhpcyBhbmQgc2V0IHRoZSBxdWlyayBiaXQgYWNj
b3JkaW5nbHkuIEkgd29uJ3QgaGF2ZSB0aGUgb3B0aW9uIA0KdG8gdGVzdCBpdCwgYnV0IHRo
ZSBjb2RlIHNlZW1zIGVhc3kgZW5vdWdoIHRvIGFkZCBpdC4gSSdsbCBtYWtlIGFuIGV4dHJh
IA0KcGF0Y2ggZm9yIHRoaXMgaW4gdGhlIG5leHQgaXRlcmF0aW9uLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVu
IC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1t
NjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNh
bCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxr
aW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExp
bnVzIFRvcnZhbGRzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------fzfqo0wFS1mmeexNmEqnr0AQ--

--------------H91OYNMtRx6prswFu5pEb1hk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtYx8FAwAAAAAACgkQlh/E3EQov+D0
fw//d5p+dv2wxW6Ft0+t/oE82gNR6WJD2p98G3tg+X3MZ6LKPI0NtIfjAAbzLer+1794p1q9YvYn
TXEO9B9HwXx91GHxkL6HonzxVNIQaUmpjjrLoEHpdpxnWTTvHEVASSGEASLSn5FGvSjN125NZt0g
uYcpZPiZupfVU6fg1MbgtAAYKOud/D54+WJqWUXJkaKoQ7DMp18FqalwBJjhlRzMYBRqjyPp0s9M
4zvwhjgZKRyyRW15F0MkBU4YD4094YEiLBbpktuB4R4Bz7BV2OF+m3jj92BItH60gmIT2ui5cLYP
avfqcD6D1biq1CIpMEd0bDYNvFcXZEpuP92ivSuz5dqtG7eufj+aF+JdiAtmAVHtDHG5G62NGvX0
D6nchMfvII5cJi5nmu4iaWFvm76g85LF6XGZWeGjI6o3vbvXyihW6GPJoAjmghlRYXDxhYkwaQmq
31UuCRfJaaq27evIBNZN39EqD18n1Y8xloljhT9dYfPXCxuTFjlpaUahMtNz/2JGjztC8ABJrFpX
WwwRD26dXni0XScQSfp9SrMaZDocktYsXxwvEtjI2MfWrQFK1fnJCj4py1kcFcK227820lwZlBL4
utCeQbh5Q4HWJJ2pL1Waejdw4lXW5jmy/6SZb5MUehrV8qv72VFKRUR249TgGms3XUYOdMhAiHFN
h6Y=
=Odhd
-----END PGP SIGNATURE-----

--------------H91OYNMtRx6prswFu5pEb1hk--
