Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7705BFE10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 14:38:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXdHX73yRz3c4S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 22:38:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u3uBtj1m;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/m0exgHk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u3uBtj1m;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/m0exgHk;
	dkim-atps=neutral
X-Greylist: delayed 3136 seconds by postgrey-1.36 at boromir; Wed, 21 Sep 2022 22:37:38 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXdGp6kgHz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 22:37:38 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 815F821AE9;
	Wed, 21 Sep 2022 12:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663763854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1DQcj5L4TAl4uuX44y/RQFf53uG70ciwYuYneMltK0k=;
	b=u3uBtj1mQy5m2OjMSwkR/SMELSQs0A/uVMMItcHdK4zoguCGv+JSURzBLY86b/Z/ziUhOj
	40y7uDPumhzVZBqbd+872GIqscWQ+sG3WhaY4Z2TzeGomRm0NcBC0VJ4fe9+/oD/Oukz2j
	piYoYYg+ROn6gRcnLfFcDjJlRKZs4RU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663763854;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1DQcj5L4TAl4uuX44y/RQFf53uG70ciwYuYneMltK0k=;
	b=/m0exgHk/ZsyD2YhoI1SXe1YcyFLrt+wOBv5Zl9DLugUkvwqtzdrhJNYBYwlifyNH+DYm5
	pcMECEzG63BCqjBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39EA213A89;
	Wed, 21 Sep 2022 12:37:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id nQBLDY4FK2NIJAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 12:37:34 +0000
Message-ID: <39e692cd-717a-a1f2-d330-7ff14cb9d1eb@suse.de>
Date: Wed, 21 Sep 2022 14:37:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
 <a9822ef5fba5599ddcee5daa4dbd17d8aaca8390.camel@kernel.crashing.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <a9822ef5fba5599ddcee5daa4dbd17d8aaca8390.camel@kernel.crashing.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J7ZJQ22hMiBNS7g8WBOOaqnQ"
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de, mark.cave-ayland@ilande.co.uk, linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org, paulus@samba.org, maxime@cerno.tech, daniel@ffwll.ch, geert@linux-m68k.org, sam@ravnborg.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J7ZJQ22hMiBNS7g8WBOOaqnQ
Content-Type: multipart/mixed; boundary="------------tFMA1N913dYeGh59nKAste9g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: airlied@linux.ie, daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech,
 sam@ravnborg.org, mpe@ellerman.id.au, paulus@samba.org,
 geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <39e692cd-717a-a1f2-d330-7ff14cb9d1eb@suse.de>
Subject: Re: [PATCH v2 09/10] drm/ofdrm: Add per-model device function
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-10-tzimmermann@suse.de>
 <7b1a2807-59c7-d524-af8e-1ec634c740a7@redhat.com>
 <20220726144024.GP17705@kitsune.suse.cz>
 <a9822ef5fba5599ddcee5daa4dbd17d8aaca8390.camel@kernel.crashing.org>
In-Reply-To: <a9822ef5fba5599ddcee5daa4dbd17d8aaca8390.camel@kernel.crashing.org>

--------------tFMA1N913dYeGh59nKAste9g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDguMjIgdW0gMDI6MjIgc2NocmllYiBCZW5qYW1pbiBIZXJyZW5zY2ht
aWR0Og0KPiBPbiBUdWUsIDIwMjItMDctMjYgYXQgMTY6NDAgKzAyMDAsIE1pY2hhbCBTdWNo
w6FuZWsgd3JvdGU6DQo+PiBIZWxsbywNCj4+DQo+PiBPbiBUdWUsIEp1bCAyNiwgMjAyMiBh
dCAwMzozODozN1BNICswMjAwLCBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgd3JvdGU6DQo+
Pj4gT24gNy8yMC8yMiAxNjoyNywgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+IEFk
ZCBhIHBlci1tb2RlbCBkZXZpY2UtZnVuY3Rpb24gc3RydWN0dXJlIGluIHByZXBhcmF0aW9u
IG9mIGFkZGluZw0KPj4+PiBjb2xvci1tYW5hZ2VtZW50IHN1cHBvcnQuIERldGVjdGlvbiBv
ZiB0aGUgaW5kaXZpZHVhbCBtb2RlbHMgaGFzIGJlZW4NCj4+Pj4gdGFrZW4gZnJvbSBmYmRl
didzIG9mZmIuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiAtLS0NCj4+Pg0KPj4+IFJldmlld2VkLWJ5
OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+Pg0K
Pj4+IFsuLi5dDQo+Pj4NCj4+Pj4gK3N0YXRpYyBib29sIGlzX2F2aXZvKF9fYmUzMiB2ZW5k
b3IsIF9fYmUzMiBkZXZpY2UpDQo+Pj4+ICt7DQo+Pj4+ICsJLyogVGhpcyB3aWxsIG1hdGNo
IG1vc3QgUjV4eCAqLw0KPj4+PiArCXJldHVybiAodmVuZG9yID09IDB4MTAwMikgJiYNCj4+
Pj4gKwkgICAgICAgKChkZXZpY2UgPj0gMHg3MTAwICYmIGRldmljZSA8IDB4NzgwMCkgfHwg
KGRldmljZSA+PSAweDk0MDApKTsNCj4+Pj4gK30NCj4+Pg0KPj4+IE1heWJlIGFkZCBzb21l
IGNvbnN0YW50IG1hY3JvcyB0byBub3QgaGF2ZSB0aGVzZSBtYWdpYyBudW1iZXJzID8NCj4+
DQo+PiBUaGlzIGlzIGJhc2VkIG9uIHRoZSBleGlzdGluZyBmYmRldiBpbXBsZW1lbnRhdGlv
bidzIG1hZ2ljIG51bWJlcnM6DQo+Pg0KPj4gZHJpdmVycy92aWRlby9mYmRldi9vZmZiLmM6
ICAgICAgICAgICAgICAgICAoKCpkaWQgPj0gMHg3MTAwICYmICpkaWQgPCAweDc4MDApIHx8
DQo+Pg0KPj4gT2YgY291cnNlLCBpdCB3b3VsZCBiZSBncmVhdCBpZiBzb21lYm9keSBrbm93
bGVkZ2VhYmxlIGNvdWxkIGNsYXJpZnkNCj4+IHRob3NlLg0KPiANCj4gSSBkb24ndCB0aGlu
ayBhbnlib2R5IHJlbWVtYmVycyA6LSkgVmVuZG9yIDB4MTAwMiBpcyBQQ0lfVkVORE9SX0lE
X0FUSSwNCg0KSSBkbyA6KQ0KDQo+IGJ1dCB0aGUgcmVzdCBpcyBiYXNpY2FsbHkgcmFuZ2Vz
IG9mIFBDSSBJRHMgZm9yIHdoaWNoIHdlIGRvbid0IGhhdmUNCj4gc3ltYm9saWMgY29uc3Rh
bnRzLg0KDQpTaG91bGQgd2UgYWRkIHRoZW0gdG8gdGhlIG9mZmljaWFsIGxpc3QgaW4gcGNp
X2lkcy5oPyAgSSBjYW5ub3QgZmluZCANCjB4NzgwMC4gVGhlIG90aGVycyBhcmUgUjUyMCBh
bmQgUjYwMC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQ2hlZXJzLA0KPiBC
ZW4uDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tFMA1N913dYeGh59nKAste9g--

--------------J7ZJQ22hMiBNS7g8WBOOaqnQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMrBY0FAwAAAAAACgkQlh/E3EQov+BL
FRAAla16EWn6KwL9Ar+FVldXx4f2y1XdVqUBNapsPFs48Ft7QgcB4X0LorN7n2RAJ4ag/so4kvWU
kc7lrt+vJx+MYEH2NqsN0MnXLtbmbVLCR4nzWOEduKY2VngZU/DJIS2vBbDbXlJgI/jebEMGX3Ao
SqZUBmgqTXWEJOeyzZkf+tI5DaZtIHQVwMj8Zlsv9sMc02ya7YHsblZRR97uxP/0fUJGVTUhTeJk
D04uZ5iTk/iJuj+j+sURQDWPZFMuRlLrK4kqqs1drK0RE79BRUdw1snIQLkbXOohna9gF8Fj8g4M
t7UFmsvUdRqIbrWZrKCaAGZMP1t/nXGcTMvfj8LXlafSzZbvnnhGJeuyI/AB4XDTTNMoP7j++18o
EwUqWhN0VP/luO+SV4WC+4BYgIOqtu+QiTsQUzp1XO0ML650eCj25XpW55UHDQuaZ8pK9YezZXbT
D2orSQf8nVH5P27dxXjJ9OMoSaIH+wMccI53QgWU2vS/+UxMh+WpyImRGg4t9KgCVBt3uj4gGUzq
DlGOZbpwYD2tJy5PBqQ7i+sPU70KO8CHTwkrU8e7dzxjAyZ6fTN407zmNyPjJoOdmpqXKMnuIITJ
AFTpobMsnjcaUWqw9Q3xtdji+1iu6/dooTLeTEn7HvB9SbFBPbI6Xu8xCFGKdOCKB1Y55JO1EBe6
+b0=
=4BcL
-----END PGP SIGNATURE-----

--------------J7ZJQ22hMiBNS7g8WBOOaqnQ--
