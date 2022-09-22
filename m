Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8365E5CE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 10:06:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY7Cs5Rlkz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 18:06:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yh/AozUv;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Tdw+PW2T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=yh/AozUv;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Tdw+PW2T;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY7CC58QJz3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 18:06:15 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CF8731F388;
	Thu, 22 Sep 2022 08:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663833971; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kcsOHDh2p7nChNst12Hxc0pHwS2JQyiBVmmobHF3T0=;
	b=yh/AozUveqQhKxehU/OqKEadCFAvcYFhe8il1t/PtvxPOwaOF1+XDTvjPGCRE6SXITt1N0
	raR64G3tvIv8ks6NvuULMyvZReJMWDHgzGuavvIDdycV2oghGYGNH6YF86YlgtY+z5o7ZK
	qkihHBmTi+llo/mSUtSIhLv+L7hVV8o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663833971;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1kcsOHDh2p7nChNst12Hxc0pHwS2JQyiBVmmobHF3T0=;
	b=Tdw+PW2TAW0IspQU3cPBoo2eYvZd7mDkXetL8UN3LG9MYSI2Ttd/H7ZK2pUZD3cd9d9l6e
	1zWmM/iwmPFnhVDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A77E13AA5;
	Thu, 22 Sep 2022 08:06:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id FZPZIHMXLGOyWQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 08:06:11 +0000
Message-ID: <5338647a-0005-8d86-2ac0-7610ffe6c6b3@suse.de>
Date: Thu, 22 Sep 2022 10:06:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
 <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
 <20220922072803.giqo6dhqktnyjncv@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220922072803.giqo6dhqktnyjncv@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eK2CnmllzDOHV1T9CtYT4Rq4"
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, linuxppc-dev@lists.ozlabs.org, mark.cave-ayland@ilande.co.uk, javierm@redhat.com, dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>, daniel@ffwll.ch, paulus@samba.org, msuchanek@suse.de, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eK2CnmllzDOHV1T9CtYT4Rq4
Content-Type: multipart/mixed; boundary="------------5fn0IKrHyZqYD6pzq7BGY8pR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, javierm@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, paulus@samba.org,
 mark.cave-ayland@ilande.co.uk, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Message-ID: <5338647a-0005-8d86-2ac0-7610ffe6c6b3@suse.de>
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <4715518d0a6ec60349c76414815ae3f6e4ed977e.camel@kernel.crashing.org>
 <350bdc4b-7fb3-f04f-06ba-0a3a266041a0@suse.de>
 <CAMuHMdVE0X=8tXQAUPR8zUe9vSY1YKiavCxQQ0i7h5Dr1v4HZw@mail.gmail.com>
 <e6326381-0f5e-1fe3-e72e-fdfa804e6574@suse.de>
 <20220922072803.giqo6dhqktnyjncv@houat>
In-Reply-To: <20220922072803.giqo6dhqktnyjncv@houat>

--------------5fn0IKrHyZqYD6pzq7BGY8pR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDkuMjIgdW0gMDk6Mjggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBUaHUsIFNlcCAyMiwgMjAyMiBhdCAwODo0MjoyM0FNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMjEuMDkuMjIgdW0gMTg6NDggc2Nocmll
YiBHZWVydCBVeXR0ZXJob2V2ZW46DQo+Pj4gSGkgVGhvbWFzLA0KPj4+DQo+Pj4gT24gV2Vk
LCBTZXAgMjEsIDIwMjIgYXQgMjo1NSBQTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4+IEFtIDA1LjA4LjIyIHVtIDAyOjE5IHNjaHJpZWIg
QmVuamFtaW4gSGVycmVuc2NobWlkdDoNCj4+Pj4+IE9uIFdlZCwgMjAyMi0wNy0yMCBhdCAx
NjoyNyArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+Pj4gKyNpZiAhZGVm
aW5lZChDT05GSUdfUFBDKQ0KPj4+Pj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgb3V0Xzgodm9p
ZCBfX2lvbWVtICphZGRyLCBpbnQgdmFsKQ0KPj4+Pj4+ICt7IH0NCj4+Pj4+PiArc3RhdGlj
IGlubGluZSB2b2lkIG91dF9sZTMyKHZvaWQgX19pb21lbSAqYWRkciwgaW50IHZhbCkNCj4+
Pj4+PiAreyB9DQo+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGluX2xlMzIo
Y29uc3Qgdm9pZCBfX2lvbWVtICphZGRyKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gKyAgICAgICBy
ZXR1cm4gMDsNCj4+Pj4+PiArfQ0KPj4+Pj4+ICsjZW5kaWYNCj4+Pj4+DQo+Pj4+PiBUaGVz
ZSBndXlzIGNvdWxkIGp1c3QgYmUgcmVwbGFjZWQgd2l0aCByZWFkYi93cml0ZWwvcmVhZGwg
cmVzcGVjdGl2ZWx5DQo+Pj4+PiAoYmV3YXJlIG9mIHRoZSBhcmd1bWVudCBzd2FwKS4NCj4+
Pj4NCj4+Pj4gSSBvbmx5IGFkZGVkIHRoZW0gZm9yIENPTVBJTEVfVEVTVC4gVGhlcmUgYXBw
ZWFycyB0byBiZSBubyBwb3J0YWJsZQ0KPj4+PiBpbnRlcmZhY2UgdGhhdCBpbXBsZW1lbnRz
IG91dF9sZTMyKCkgYW5kIGluX2xlMzIoKT8NCj4+Pg0KPj4+IGlvd3JpdGUzMigpIGFuZCBp
b3JlYWQzMigpPw0KPj4NCj4+IERvIHRoZXkgYWx3YXlzIHVzZSBsaXR0bGUgZW5kaWFuLCBh
cyB0aGVzZSAqX2xlMzIgaGVscGVycyBkbz8gSSB0aG91Z2ggdGhleQ0KPj4gdXNlIGhvc3Qg
Ynl0ZSBvcmRlci4NCj4gDQo+IFRoZXkgdXNlIGVpdGhlciBvdXRsIG9yIHdyaXRlbCB1bmRl
ciB0aGUgaG9vZCwgd2hpY2ggYXJlIGFsd2F5cyBsaXR0bGUtZW5kaWFuDQoNCkkgc2VlLiBJ
J2xsIHJlcGxhY2UgdGhlIGN1c3RvbSBoZWxwZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------5fn0IKrHyZqYD6pzq7BGY8pR--

--------------eK2CnmllzDOHV1T9CtYT4Rq4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMsF3MFAwAAAAAACgkQlh/E3EQov+Ad
cxAAsjbRMFc4kEbDJdUrM2wUw6ogdQwOVjiyug5+wx91IN3z+J1WC5XJSY5VHABBPNEwN8oycX5X
yy1plLHS0BLjXFWgt9X1SS+wQ9SuHswQsaFuCPsXxjDKeVDD6ieFll4rQ2E8BPqlonpFNrXMdlax
vOZU+2CKdURD+GVvUWJab7tsL6v2Ggm9Kb1vfIdxX5Bd6cEHUryx7hCSm4IpRv8V3F67i5oY9yYd
IjbN0jXuAT4FATEOUf55y2xs4upspI+S6QCM0mFdM0Ij5JMsGwKWLYt7B6Uz1k6c5DCuGjhNl2LG
JFIFMGbiSEO4AnQRLsjz33c18Z4nfQY8cnLHt+IFQqvRrfiXUu72ZXV0DQOW490gqAaN1W+o1tR2
XU5jKSBlqjf6R0ooDsv9Vbu73/AeR4qoFINoDMMMpEmwIFXdKRwA6CHEdMxrTELSm2RpPl0C6C3i
I6KP4DlUgzH6LZ3My8B6ym8TtKHWNz8WwR5qfGGafgQjuvulZZVRArUIM+yqC+py2PeJ7Eqb0d2r
4xK11y309lE3zYNXkKXz25sWmQR5U32+ncixTRwRLqTqiTB//m58Zf7AbR0MVSJofHjfcXkyLTQW
vpsT4Ap/JkRJMr2BqXnnUffOIwDCdJmXMSOyZrn9fC9doIGleosLVsLs5W0h0GyDgb3SVQbcQiD4
NdA=
=llRm
-----END PGP SIGNATURE-----

--------------eK2CnmllzDOHV1T9CtYT4Rq4--
