Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C5859063F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 20:28:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3b0S0jkYz3blj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 04:28:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1ivS7gU;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l404YYu4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u1ivS7gU;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l404YYu4;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3Zzl3x5Bz2xk9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 04:27:47 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E2E165D033;
	Thu, 11 Aug 2022 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1660242463; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmhGtB6FXSZpLzfrvvfB9H7akA33XGJaU66I9ObAa3o=;
	b=u1ivS7gURKRWmEt3SXvUEtkL3QdLoHAzWiVE2QsZ7n2EM5A+XqHTfpiVO/S7O+XfwbiPbg
	VYUxJBj/nGIU9oF96DEipj+lUnsVElot/YVyoE/bnjjxbzy/0WBCpvL4f3l19UWrTEycRV
	s/IotquVKESwOFjEXDjGgvikkznD81E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1660242463;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mmhGtB6FXSZpLzfrvvfB9H7akA33XGJaU66I9ObAa3o=;
	b=l404YYu47umALBgsxVPOPQ9jesQsx8So3N/7pQFVxNFq8BPMx5GXWep75aydnOZPHxG+Dn
	Qkujjw9Ht72sCSAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C8BE1342A;
	Thu, 11 Aug 2022 18:27:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id KV8HHR9K9WIDbAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 11 Aug 2022 18:27:43 +0000
Message-ID: <b22b363c-187b-0783-32ab-f9683af2e20a@suse.de>
Date: Thu, 11 Aug 2022 20:27:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
 <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
 <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
In-Reply-To: <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LSZZYhOrrqcsK5J9MO0ldbZw"
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
--------------LSZZYhOrrqcsK5J9MO0ldbZw
Content-Type: multipart/mixed; boundary="------------w8q008snlhRGhtZ4sZOSVr2W";
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
Message-ID: <b22b363c-187b-0783-32ab-f9683af2e20a@suse.de>
Subject: Re: [PATCH v2 04/10] drm/simpledrm: Compute framebuffer stride if not
 set
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-5-tzimmermann@suse.de>
 <CAMuHMdWEah62Ho4C8NQr-qwz62pKQiJiTi8Fa4KcXNRzo7ySJA@mail.gmail.com>
 <4a7c2c1d-2bf9-84e7-9257-41fcfd66ab9d@redhat.com>
 <20f4e5e6-2ff2-af21-1f85-70a545d147bc@suse.de>
 <CAKMK7uGr_SbHAm7r5VNWgpM2cPMFYpCmyE_Aq8TYc84rOAtJpA@mail.gmail.com>
 <33ce5744-5d41-2501-6105-2585529820d2@suse.de>
In-Reply-To: <33ce5744-5d41-2501-6105-2585529820d2@suse.de>

--------------w8q008snlhRGhtZ4sZOSVr2W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDExLjA4LjIyIHVtIDIwOjI2IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpIERhbmllbA0KPiANCj4gQW0gMTEuMDguMjIgdW0gMTk6MjMgc2NocmllYiBEYW5pZWwg
VmV0dGVyOg0KPj4gT24gV2VkLCAyNyBKdWwgMjAyMiBhdCAwOTo1MywgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IA0KPj4gd3JvdGU6DQo+Pj4NCj4+PiBIaQ0K
Pj4+DQo+Pj4gQW0gMjUuMDcuMjIgdW0gMTc6MTMgc2NocmllYiBKYXZpZXIgTWFydGluZXog
Q2FuaWxsYXM6DQo+Pj4+IEhlbGxvIEdlZXJ0LA0KPj4+Pg0KPj4+PiBPbiA3LzIxLzIyIDE2
OjQ2LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+Pj4+PiBIaSBUaG9tYXMsDQo+Pj4+
Pg0KPj4+Pj4gT24gV2VkLCBKdWwgMjAsIDIwMjIgYXQgNDoyNyBQTSBUaG9tYXMgWmltbWVy
bWFubiANCj4+Pj4+IDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90ZToNCj4+Pj4+PiBDb21w
dXRlIHRoZSBmcmFtZWJ1ZmZlcidzIHNjYW5saW5lIHN0cmlkZSBsZW5ndGggaWYgbm90IGdp
dmVuIGJ5DQo+Pj4+Pj4gdGhlIHNpbXBsZWZiIGRhdGEuDQo+Pj4+Pj4NCj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
Pj4+DQo+Pj4+PiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+Pj4+Pg0KPj4+Pj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+Pj4+PiBAQCAtNzQzLDYgKzc0Myw5IEBA
IHN0YXRpYyBzdHJ1Y3Qgc2ltcGxlZHJtX2RldmljZSANCj4+Pj4+PiAqc2ltcGxlZHJtX2Rl
dmljZV9jcmVhdGUoc3RydWN0IGRybV9kcml2ZXIgKmRydiwNCj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9lcnIoZGV2LCAibm8gc2ltcGxlZmIgY29u
ZmlndXJhdGlvbiBmb3VuZFxuIik7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCj4+Pj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgfQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqAgaWYgKCFzdHJpZGUpDQo+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RyaWRlID0gZm9ybWF0LT5jcHBbMF0g
KiB3aWR0aDsNCj4+Pj4+DQo+Pj4+PiBESVZfUk9VTkRfVVAoZHJtX2Zvcm1hdF9pbmZvX2Jw
cChmb3JtYXQpICogd2lkdGgsIDgpDQo+Pj4+Pg0KPj4+Pg0KPj4+PiBJIHRoaW5rIHlvdSBt
ZWFudCBoZXJlOg0KPj4+Pg0KPj4+PiBESVZfUk9VTkRfVVAoZHJtX2Zvcm1hdF9pbmZvX2Jw
cChmb3JtYXQsIDApICogd2lkdGgsIDgpID8NCj4+Pg0KPj4+IEkgZ3Vlc3MsIHRoYXQncyB0
aGUgcmlnaHQgZnVuY3Rpb24uIE15IG9yaWdpbmFsIGNvZGUgaXMgY29ycmVjdCwgYnV0IGNw
cA0KPj4+IGlzIGFsc28gZGVwcmVjYXRlZC4NCj4+DQo+PiBZb3UgYWxsIG1lYW4gZHJtX2Zv
cm1hdF9pbmZvX21pbl9waXRjaCgpLg0KPiANCj4gVGhhbmtzIGEgbG90LiBJIHdhc24ndCBl
dmVuIGF3YXJlIG9mIHRoaXMgZnVuY3Rpb24sIGJ1dCBJIGhhZCBhbG1vc3QgDQo+IHdyaXR0
ZW4gbXkgb3duIGltcGxlbWVudGF0aW9uIG9mIGl0LsKgIEknbGwgdXBkYXRlIHRoZSBwYXRj
aCBhY2NvcmRpbmdseS4NCg0KQXJnaGgsIHRvbyBsYXRlLiBJIG1lcmdlZCB0aGF0IHBhdGNo
IGFscmVhZHkuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pg0KPj4g
SSByZWFsbHkgZG9uJ3Qgd2FudCBkcml2ZXJzIHRvIGdvIGdyYWIgYW55IG9mIHRoZSBsZWdh
Y3kgZm9ybWF0IGluZm8NCj4+IGZpZWxkcyBsaWtlIGJwcCBvciBkZXB0aC4gc3dpdGNoKCkg
c3RhdGVtZW50cyBvbiB0aGUgZm91cmNjIGNvZGUgZm9yDQo+PiBwcm9ncmFtbWluZyByZWdp
c3RlcnMsIG9yIG9uZSBvZiB0aGUgcmVhbCBoZWxwZXIgZnVuY3Rpb25zIGluDQo+PiBkcm1f
Zm91cmNjLmMgKHRoZXJlIG1pZ2h0IGJlIHNvbWUgZ2FwcyksIGJ1dCBub3QgZXZlciBnb2lu
ZyB0aHJvdWdoDQo+PiBsZWdhY3kgY29uY2VwdHMuIEFueXRoaW5nIGVsc2UganVzdCBsZWFk
cyB0byBzdWJ0bGUgYnVncyB3aGVuIG5ldw0KPj4gZm9ybWF0cyBnZXQgYWRkZWQgYW5kIG9v
cHMgc3VkZGVubHkgdGhlIGFzc3VtcHRpb25zIGRvbid0IGhvbGQuDQo+Pg0KPj4gVGhvc2Ug
c2hvdWxkIGJlIHN0cmljdGx5IGxpbWl0ZWQgdG8gbGVnYWN5IChpLmUuIG5vdCBkcm1fZm91
cmNjIGF3YXJlKQ0KPj4gaW50ZXJmYWNlcy4gSGVjayBJIHRoaW5rIGV2ZW4gZmJkZXYgZW11
bGF0aW9uIHNob3VsZCBjb21wbGV0ZWx5IHN3aXRjaA0KPj4gb3ZlciB0byBkcm1fZm91cmNj
L2RybV9mb3JtYXRfaW5mbywgYnV0IGFsYXMgdGhhdCdzIGEgcGlsZSBvZiB3b3JrIGFuZA0K
Pj4gbm90IG11Y2ggcGF5b2ZmLg0KPj4NCj4+IEknbSB0cnlpbmcgdG8gdm9sdW50ZWVyIFNh
bWUgdG8gYWRkIGEgbGVnYWN5X2JwcCB0YWcgdG8gdGhlIGFib3ZlDQo+PiBoZWxwZXIgYW5k
IGFwcHJvcHJpYXRlbHkgbGltaXQgaXQsIEkgdGhpbmsgbGltaXRpbmcgdG8gZm9ybWF0cyB3
aXRoDQo+PiBkZXB0aCE9MCBpcyBwcm9iYWJseSB0aGUgcmlnaHQgdGhpbmcuIEFuZCB0aGVu
IHdlIHNob3VsZCBwcm9iYWJseQ0KPj4gcmVtb3ZlIGEgcGlsZSBvZiB0aGUgY2FyZ28tY3Vs
dGVkIGRlcHRoIT0wIGVudHJpZXMgdG9vLg0KPj4gLURhbmllbA0KPj4NCj4+Pg0KPj4+IEJl
c3QgcmVnYXJkcw0KPj4+IFRob21hcw0KPj4+DQo+Pj4+DQo+Pj4+IFdpdGggdGhhdCBjaGFu
Z2UsDQo+Pj4+DQo+Pj4+IEFja2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4+Pj4NCj4+Pg0KPj4+IC0tIA0KPj4+IFRob21hcyBaaW1t
ZXJtYW5uDQo+Pj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4+IFNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KPj4+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+PiBH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo+Pg0KPj4NCj4+DQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------w8q008snlhRGhtZ4sZOSVr2W--

--------------LSZZYhOrrqcsK5J9MO0ldbZw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmL1Sh8FAwAAAAAACgkQlh/E3EQov+D6
4xAAsJryU49DynqjRGt9N/fzFXv0iDF/YcwezcE5z4p5vpSXpAYKL352fTnb7AHgWe6+wGHTgO0E
ZCD+47CYuUT0DZQsXpKq86Z1b9AfGtq9w0+GJmwmleYur3btaIvKhp4jHGElC5l+Q/QaYjJ+6nFQ
0Lb4ikSeoNB6eK9R7sG2i40nM2kiYi/NiGX7mNn3wr0hPDc9SkE37UxBfxq8m1G/Ze85DrYfP8L9
9xfgdjriZUlRI/xTISWd/hxjigXhJC+ah9V08/weF4sCXDzVV2chbYVYOZj0zb0RjNjWa6LijvJb
0JN4CMGiG8yO3uYZPDhxq2LLnSXuY9sdrB7oo5ahchYswy5fNgjL8wEPXmYxA/lKCS/iekyJgxkK
Whod+K8GmnNhKRpu7CD9Ndl+Swln0LuuVYDZ90yCL94/9RZ1r17lm4V5GKJXedfsS1hcvRORvStq
rsLEZvq9XO1INJtZLBa+x7nyCFHGarrDzMiVG7FLy4D6hZkeBLWtJIzOBKddXEkrmOyRJBq9Vbsh
R7ei0TWBxozp4PkvPzvUuuSUae4T/dTc/9PWrv/zqmmx3UpRaSEbnQSDii8eH3q6VDx9jmUh+i1P
r+5b1799hnkVpWdGN1eMWT9xxTqnjLpSsntj3IKTKEaeZ/tg/+kISy1G24jypqRDpuqW2jMSEv/E
i4A=
=1ZG4
-----END PGP SIGNATURE-----

--------------LSZZYhOrrqcsK5J9MO0ldbZw--
