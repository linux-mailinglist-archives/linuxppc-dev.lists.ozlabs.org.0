Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E91E582205
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 10:25:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt6KY2Vxhz3chQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 18:25:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O7CDSJGw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ul4mzj8r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=O7CDSJGw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Ul4mzj8r;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt6Jw46WZz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 18:24:48 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 19356204D9;
	Wed, 27 Jul 2022 08:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658910285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zUlHgpZI6WNdFn4NJAbVMjTRQYMTaD17+McXbqOLYU=;
	b=O7CDSJGwzj12/jTlg8fZp2fpshXOPEG0y1pihqyNAAcsyha4+UHNi66DnGc1B00B0MbVfn
	7xAhakpIEjRqoRZT+d7f6h0Sby6oltELes0KpvSaZ0QEAghCwVzxRn8Z22IHtkEm2fy70k
	uLfUdzY/H1Q5GMpIN4WE0gKKaB9h+FQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658910285;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4zUlHgpZI6WNdFn4NJAbVMjTRQYMTaD17+McXbqOLYU=;
	b=Ul4mzj8rbIlHO5YerooMB+8i5reqjpvoNB0X9ZbULotp3Lr99P4Ym9fAwJT1Vs+kzGDGn1
	+QhJf6IRUvZYewBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C531A13A8E;
	Wed, 27 Jul 2022 08:24:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id hZw6L0z24GIcLQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 27 Jul 2022 08:24:44 +0000
Message-ID: <623cde06-62ec-c8be-0f0e-2fd900c2359a@suse.de>
Date: Wed, 27 Jul 2022 10:24:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 06/10] drm/simpledrm: Move some functionality into fwfb
 helper library
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-7-tzimmermann@suse.de>
 <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JzoUj73LI9DE2r1HrxY0yIdE"
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
--------------JzoUj73LI9DE2r1HrxY0yIdE
Content-Type: multipart/mixed; boundary="------------BYTP2siEexbB6EXSfXR9zHI0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <623cde06-62ec-c8be-0f0e-2fd900c2359a@suse.de>
Subject: Re: [PATCH v2 06/10] drm/simpledrm: Move some functionality into fwfb
 helper library
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-7-tzimmermann@suse.de>
 <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>
In-Reply-To: <c411480b-27b2-8c0b-534f-bbabd8018577@redhat.com>

--------------BYTP2siEexbB6EXSfXR9zHI0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjIgdW0gMTg6MjMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gTW92ZSBzb21lIG9mIHNpbXBsZWRybSdzIGZ1bmN0aW9uYWxpdHkgaW50byBhIGhlbHBl
ciBsaWJyYXJ5LiBPdGhlcg0KPj4gZHJpdmVycyBmb3IgZmlybXdhcmUtcHJvdmlkZWQgZnJh
bWVidWZmZXJzIHdpbGwgYWxzbyBuZWVkIGZ1bmN0aW9ucw0KPj4gdG8gaGFuZGxlIGZpeGVk
IG1vZGVzIGFuZCBjb2xvciBmb3JtYXRzLCBvciB1cGRhdGUgdGhlIGJhY2sgYnVmZmVyLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPj4gLS0tDQo+IA0KPiBOaWNlIHBhdGNoIQ0KDQpUQkggaXQgdG9vayBtZSAz
IHRyaWVzIHRvIGdldCBzb21ldGhpbmcgZG9uZSBmb3IgdGhpcyBsaWJyYXJ5IGFuZCBJJ20g
DQpzdGlsbCBub3QgaGFwcHkgd2l0aCB0aGUgcmVzdWx0LiBJIHdhbnQgdG8gc2hhcmUgY29k
ZSBiZXR3ZWVuIHNpbXBsZWRybSANCmFuZCBvZmRybSwgYnV0IHRoYXQgdHVybnMgb3V0IHRv
IGJlIGhhcmRlciB0aGVuIGV4cGVjdGVkLiBBIGdvb2QgcGFydCBvZiANCnRoaXMgY29kZSBh
cHBlYXJzIHRvIGJlbG9uZyBpbnRvIG90aGVyIGxpYnJhcmllcyAoeW91IGFsc28gbWVudGlv
bmVkIA0KdGhpcyBiZWxvdykuDQoNCkkgZG9uJ3Qgd2FudCB0byBkdXBsaWNhdGVkIGNvZGUg
YmV0d2VlbiBzaW1wbGVkcm0gYW5kIG9mZHJtIHdpdGhvdXQgDQpyZWFzb24sIGJ1dCBJIGV4
cGVjdCB0aGF0IHRoaXMgbGlicmFyeSB3aWxsIHNvbWV3aGVuIGJlIHJlZmFjdG9yZWQgYW5k
IA0KZGlzc29sdmVkIGludG8gZXhpc3RpbmcgbGlicmFyaWVzLg0KDQoNCj4gDQo+IFsuLi5d
DQo+IA0KPj4gKw0KPj4gKy8qKg0KPj4gKyAqIERPQzogb3ZlcnZpZXcNCj4+ICsgKg0KPj4g
KyAqIFRoZSBGaXJtd2FyZSBGcmFtZWJ1ZmZlciBsaWJyYXJ5IEZXRkIgcHJvdmlkZXMgaGVs
cGVycyBmb3IgZGV2aWNlcyB3aXRoDQo+PiArICogZml4ZWQtbW9kZSBiYWNraW5nIHN0b3Jh
Z2UuIEl0IGhlbHBzIGRyaXZlcnMgdG8gZXhwb3J0IGEgZGlzcGxheSBtb2RlIG9mDQo+PiAr
ICogdGUgY29ycmVjdCBzaXplIGFuZCBjb3B5IHVwZGF0ZXMgdG8gdGhlIGJhY2tpbmcgc3Rv
cmFnZS4NCj4gDQo+IHRoZQ0KPiANCj4gaXQgaXMgImJhY2tpbmcgc3RvcmFnZSIgb3IgImJh
Y2tpbmcgc3RvcmUiID8gSSBhbHdheXMgdGhvdWdodCB0aGF0IHN0b3JhZ2Ugd2FzDQo+IHVz
ZWQgZm9yIG5vbi12b2xhdGlsZSBtZWRpYSB3aGlsZSAic3RvcmUiIGNvdWxkIGJlIHZvbGF0
aWxlIGFuZCBub24tdm9sYXRpbGUuDQoNCldoeSBzdG9yZT8gSXNuJ3QgdGhhdCBhIGxpdHRs
ZSBzaG9wIGZvciBmYXNoaW9uIG9yIGdyb2Nlcmllcz8gSSdtIG5vIA0KbmF0aXZlIHNwZWFr
ZXI7IEkgY2FuJ3QgdGVsbCBpZiBlaXRoZXIgaW1wbGllcyB0aGF0IHdlJ3JlIHNlbmRpbmcg
DQpwaWN0dXJlcyB0byBhIHdhcmVob3VzZSBvciBiYWtlcnkuIDopDQoNCldvdWxkICdiYWNr
IGJ1ZmZlcicgKGluIGNvbnRyYXN0IHRvICdzaGFkb3cgYnVmZmVyJykgYmUgY2xlYXI/DQoN
Cj4gDQo+IFsuLi5dDQo+IA0KPj4gKy8qKg0KPj4gKyAqIGRybV9md2ZiX2luaXQgLSBJbml0
aWFsaXplcyBhbiBmd2ZiIGJ1ZmZlcg0KPj4gKyAqIEBmd2ZiOiBmd2ZiIGJ1ZmZlcg0KPj4g
KyAqIEBzY3JlZW5fYmFzZTogQWRkcmVzcyBvZiB0aGUgYmFja2luZyBidWZmZXIgaW4ga2Vy
bmVsIGFkZHJlc3Mgc3BhY2UNCj4+ICsgKiBAd2lkdGg6IE51bWJlciBvZiBwaXhlbHMgcGVy
IHNjYW5saW5lDQo+PiArICogQGhlaWdodDogTnVtYmVyIG9mIHNjYW5saW5lcw0KPj4gKyAq
IEBmb3JtYXQ6IENvbG9yIGZvcm1hdA0KPj4gKyAqIEBwaXRjaDogRGlzdGFuY2UgYmV0d2Vl
biB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIGluIGJ5dGVzDQo+PiArICoNCj4+ICsgKiBS
ZXR1cm5zOg0KPj4gKyAqIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJubyBjb2Rl
IG90aGVyd2lzZS4NCj4+ICsgKi8NCj4+ICtpbnQgZHJtX2Z3ZmJfaW5pdChzdHJ1Y3QgZHJt
X2Z3ZmIgKmZ3ZmIsIHN0cnVjdCBpb3N5c19tYXAgKnNjcmVlbl9iYXNlLA0KPj4gKwkJICB1
bnNpZ25lZCBpbnQgd2lkdGgsIHVuc2lnbmVkIGludCBoZWlnaHQsDQo+PiArCQkgIGNvbnN0
IHN0cnVjdCBkcm1fZm9ybWF0X2luZm8gKmZvcm1hdCwgdW5zaWduZWQgaW50IHBpdGNoKQ0K
Pj4gK3sNCj4+ICsJZndmYi0+c2NyZWVuX2Jhc2UgPSAqc2NyZWVuX2Jhc2U7DQo+PiArCWZ3
ZmItPm1vZGUgPSBkcm1fZndmYl9tb2RlKHdpZHRoLCBoZWlnaHQpOw0KPj4gKwlmd2ZiLT5m
b3JtYXQgPSBmb3JtYXQ7DQo+IA0KPiBJdCBzZWVtcyBhIGxpdHRsZSBiaXQgYXJiaXRyYXJ5
IHRvIG1lIHRoYXQgZm9ybWF0IGlzIHRoZSBvbmx5IGZpZWxkIHRoYXQncw0KPiBhIHBvaW50
ZXIgYW5kIHRoZSBvdGhlciBvbmVzIGFyZSBlbWJlZGRlZCBpbnRvIHRoZSBzdHJ1Y3QgZHJt
X2Z3ZmIuIEFueQ0KPiByZWFzb24gZm9yIHRoYXQgb3IgaXMganVzdCBhIGNvbnNlcXVlbmNl
IG9mIGhvdyB0eXBlcyB3ZXJlIHVzZWQgYnkgdGhlDQo+IHNpbXBsZWRybV9kZXZpY2VfY3Jl
YXRlKCkgZnVuY3Rpb24gYmVmb3JlIHRoYXQgY29kZSBtb3ZlZCBpbnRvIGhlbHBlcnMgPw0K
DQpGb3JtYXQgaXMgY29uc3RhbnQgYW5kIGNvbWVzIGZyb20gc3RhdGljYWxseSBpbml0aWFs
aXplZCBtZW1vcnkgaW4gDQpkcm1fZm91cmNjLmMuIEknZCBleHBlY3QgdG8gYmUgYWJsZSB0
byBjb21wYXJlIGZvcm1hdHMgYnkgY29tcGFyaW5nIHRoZSANCnBvaW50ZXJzLiBDb3B5aW5n
IHRoZSBmb3JtYXQgaGVyZSB3b3VsZCBicmVhayB0aGUgYXNzdW1wdGlvbi4NCg0KPiANCj4g
Wy4uLl0NCj4gDQo+PiArc3RhdGljIGJvb2wgaXNfbGlzdGVkX2ZvdXJjYyhjb25zdCB1aW50
MzJfdCAqZm91cmNjcywgc2l6ZV90IG5mb3VyY2NzLCB1aW50MzJfdCBmb3VyY2MpDQo+PiAr
ew0KPj4gKwljb25zdCB1aW50MzJfdCAqZm91cmNjc19lbmQgPSBmb3VyY2NzICsgbmZvdXJj
Y3M7DQo+PiArDQo+PiArCXdoaWxlIChmb3VyY2NzIDwgZm91cmNjc19lbmQpIHsNCj4+ICsJ
CWlmICgqZm91cmNjcyA9PSBmb3VyY2MpDQo+PiArCQkJcmV0dXJuIHRydWU7DQo+PiArCQkr
K2ZvdXJjY3M7DQo+PiArCX0NCj4+ICsJcmV0dXJuIGZhbHNlOw0KPj4gK30NCj4gDQo+IFRo
aXMgc2VlbXMgYSBoZWxwZXIgdGhhdCBjb3VsZCBiZSB1c2VmdWwgYmVzaWRlcyB0aGUgZHJt
X2Z3ZmJfaGVscGVyLmMgZmlsZS4NCj4gDQo+IEkgYmVsaWV2ZSBwYXRjaGVzIDEtNiBzaG91
bGRuJ3Qgd2FpdCBmb3IgdGhlIG90aGVycyBpbiB0aGlzIHNlcmllcyBhbmQgY291bGQNCj4g
anVzdCBiZSBtZXJnZWQgd2hlbiByZWFkeS4gUGF0Y2hlcyA3LTEwIGNhbiBmb2xsb3cgbGF0
ZXIuDQoNClllYWgsIEknZCBsaWtlIHRvIG1vdmUgcGF0Y2hlcyAxIHRvIDUgaW50byBhIG5l
dyBzZXJpZXMgZm9yIG1lcmdpbmcuIA0KUGF0Y2ggNiBpcyBvbmx5IHVzZWZ1bCBmb3Igb2Zk
cm0gYW5kIGFzIEkgc2FpZCwgbWF5YmUgdGhlcmUncyBhIGJldHRlciANCnNvbHV0aW9uIHRo
ZW4gdGhpcyBsaWJyYXJ5LiBJJ2QgcmF0aGVyIGtlZXAgaXQgaGVyZSBmb3Igbm93Lg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------BYTP2siEexbB6EXSfXR9zHI0--

--------------JzoUj73LI9DE2r1HrxY0yIdE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLg9kwFAwAAAAAACgkQlh/E3EQov+CI
7Q/+JXdnY/MwcJOyU7tp5HA47tfFE28WpwBiSBIBffpJDh1ZZA/nxWXrRCB7ycwEW1lcNOynWX6f
zzAUlNPg/91kFKYSOnRau6XNKslEw+d4F/H35+O/VxsfMich+2VCh2xUBlVC31E/SoZe3zPwxQJ4
3qjW1iR+PLF7itpjmDOBRd2bMt52edU5UmALvkRUDWjj7uzQPYFVrlFLECTj6p2xr4tkBBGBdg2I
W7Yv+2dz31GNQNRpWrVqOQaPyW8e3Ty+iAoEWMDwlKYYIML8ZR2pA2nnJiXGHkol8NcLrvIfHAqa
TvhTI1a9gGB25eiZBb/gLAE3RkbJzK153mApLzKTpvuh9RX9st6f+whAHN9d6aUlfUeHhFQ10oUb
9JdgSWtRYFGOeH1nCN19XRFgSlFzyn4nzimI9V5OIBoiN17XsE8pbAsDvLlc5qYD/ljRTnmbrg2c
FRSrpxaWFmOyXfp6nLyJt0CUJaKBbnZpLPXIZWLe8mpkUCAULIayyFr0Nbt2X5GzOMVPzMcKed/D
in8p4lxU1j1tNzjcOflz9zNLojXMs6mAKf2PglhpXl6KnF3uDCAjw3fDA5hgLK13Gr6UTvqXMOsr
VZsX9JzYmfqEzOwLFV9nzV3r2waibeLtOK5v206HF3toJQGhlH8vvz02i2XhmMtmJoV0EZQYdfkG
f+g=
=Fkgi
-----END PGP SIGNATURE-----

--------------JzoUj73LI9DE2r1HrxY0yIdE--
