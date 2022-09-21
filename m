Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE85BFD0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 13:42:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXc374Ntnz3c99
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 21:42:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nw6fmS4H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zEsTulyr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=nw6fmS4H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zEsTulyr;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXc2Q0j9rz2yxw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 21:41:49 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2C4AB21A80;
	Wed, 21 Sep 2022 11:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663760503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImOVLGm8WanuenvY2MlPjkeh8t5kpVfbaUJRUoT/FFM=;
	b=nw6fmS4Hv1KyovKTMUpW9pfRCfeJyFq45AJQtIPpQhZJ4+kT4UZOF4cyHp475ad+njnOO2
	DksaSlxK12ibJVaU8avJu1dyn1/ifyVgJZtAhS0sedSIyR2eWnJLTnooawtRENvzGZhpZA
	nFyOxliJgPk2S5UVR0WSxE/xj+yhQ6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663760503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ImOVLGm8WanuenvY2MlPjkeh8t5kpVfbaUJRUoT/FFM=;
	b=zEsTulyrMIwx4sTVvIn+WWTcLU/kOpMBHQZ4Jkai41GzxxRXgPdDSeyUvwacHfvBK1fKPB
	eEFjoZ61tXnTaPAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D7FCB13A00;
	Wed, 21 Sep 2022 11:41:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id epXBM3b4KmMVCQAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 21 Sep 2022 11:41:42 +0000
Message-ID: <7e1a2e1d-4635-cb1f-232e-3101ec7b83dc@suse.de>
Date: Wed, 21 Sep 2022 13:41:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 07/10] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-8-tzimmermann@suse.de>
 <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------j0PuR9rfI0QFS6R4CVP67qPQ"
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
--------------j0PuR9rfI0QFS6R4CVP67qPQ
Content-Type: multipart/mixed; boundary="------------Y1Dje9YKgCc2YIKBIZaj0TW8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Message-ID: <7e1a2e1d-4635-cb1f-232e-3101ec7b83dc@suse.de>
Subject: Re: [PATCH v2 07/10] drm/ofdrm: Add ofdrm for Open Firmware
 framebuffers
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-8-tzimmermann@suse.de>
 <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>
In-Reply-To: <c08842d4-f01e-8d75-2b1d-01cf36b55a10@redhat.com>

--------------Y1Dje9YKgCc2YIKBIZaj0TW8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjIgdW0gMTU6MTcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDcvMjAvMjIgMTY6MjcsIFRob21h
cyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gT3BlbiBGaXJtd2FyZSBwcm92aWRlcyBiYXNpYyBk
aXNwbGF5IG91dHB1dCB2aWEgdGhlICdkaXNwbGF5JyBub2RlLg0KPj4gRFQgcGxhdGZvcm0g
Y29kZSBhbHJlYWR5IHByb3ZpZGVzIGEgZGV2aWNlIHRoYXQgcmVwcmVzZW50cyB0aGUgbm9k
ZSdzDQo+PiBmcmFtZWJ1ZmZlci4gQWRkIGEgRFJNIGRyaXZlciBmb3IgdGhlIGRldmljZS4g
VGhlIGRpc3BsYXkgbW9kZSBhbmQNCj4+IGNvbG9yIGZvcm1hdCBpcyBwcmUtaW5pdGlhbGl6
ZWQgYnkgdGhlIHN5c3RlbSdzIGZpcm13YXJlLiBSdW50aW1lDQo+PiBtb2Rlc2V0dGluZyB2
aWEgRFJNIGlzIG5vdCBwb3NzaWJsZS4gVGhlIGRpc3BsYXkgaXMgdXNlZnVsIGR1cmluZw0K
Pj4gZWFybHkgYm9vdCBzdGFnZXMgb3IgYXMgZXJyb3IgZmFsbGJhY2suDQo+Pg0KPiANCj4g
SSdtIG5vdCBmYW1pbGlhciB3aXRoIE9GIGRpc3BsYXkgYnV0IHRoZSBkcml2ZXIgbG9va3Mg
Z29vZCB0byBtZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxs
YXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQo+IEkganVzdCBoYXZlIGEgZmV3IHF1ZXN0
aW9ucyBiZWxvdy4NCj4gDQo+IFsuLi5dDQo+IA0KPj4gK3N0YXRpYyBpbnQgb2Zkcm1fcHJp
bWFyeV9wbGFuZV9oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LA0KPj4gKwkJCQkJCSAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpuZXdfc3RhdGUpDQo+
PiArew0KPj4gKwlzdHJ1Y3QgZHJtX3BsYW5lX3N0YXRlICpuZXdfcGxhbmVfc3RhdGUgPSBk
cm1fYXRvbWljX2dldF9uZXdfcGxhbmVfc3RhdGUobmV3X3N0YXRlLCBwbGFuZSk7DQo+PiAr
CXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqbmV3X2NydGNfc3RhdGU7DQo+PiArCWludCByZXQ7
DQo+PiArDQo+PiArCWlmICghbmV3X3BsYW5lX3N0YXRlLT5mYikNCj4+ICsJCXJldHVybiAw
Ow0KPj4gKw0KPj4gKwluZXdfY3J0Y19zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X25ld19jcnRj
X3N0YXRlKG5ld19zdGF0ZSwgbmV3X3BsYW5lX3N0YXRlLT5jcnRjKTsNCj4+ICsNCj4+ICsJ
cmV0ID0gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUobmV3X3BsYW5lX3N0
YXRlLCBuZXdfY3J0Y19zdGF0ZSwNCj4+ICsJCQkJCQkgIERSTV9QTEFORV9IRUxQRVJfTk9f
U0NBTElORywNCj4+ICsJCQkJCQkgIERSTV9QTEFORV9IRUxQRVJfTk9fU0NBTElORywNCj4+
ICsJCQkJCQkgIGZhbHNlLCBmYWxzZSk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4g
cmV0Ow0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+IA0KPiBUaGlzIHNlZW1zIHRv
IGJlIGV4YWN0bHkgdGhlIHNhbWUgY2hlY2sgdGhhbiB1c2VkIGluIHRoZSBzaW1wbGVkcm0g
ZHJpdmVyLg0KPiBNYXliZSBjb3VsZCBiZSBtb3ZlZCB0byB0aGUgZndmYiBoZWxwZXIgbGli
cmFyeSB0b28gPw0KDQpJJ3ZlIG1lYW53aGlsZSBkcm9wcGVkIGZ3ZmIgaGVscGVycy4gQ29s
b3IgbWFuYWdlbWVudCByZXF1aXJlcyBzcGVjaWZpYyANCmNvZGUgaGVyZSwgc28gdGhlcmUn
cyBubyBtdWNoIHRvIHNoYXJlIGFueXdheS4NCg0KPiANCj4gWy4uLl0NCj4gDQo+PiArDQo+
PiArc3RhdGljIHZvaWQgb2Zkcm1fY3J0Y19oZWxwZXJfYXRvbWljX2Rpc2FibGUoc3RydWN0
IGRybV9jcnRjICpjcnRjLA0KPj4gKwkJCQkJICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqb2xkX3N0YXRlKQ0KPj4gK3sNCj4+ICsJLyoNCj4+ICsJICogQWx3YXlzIGVuYWJsZWQ7
IGRpc2FibGluZyBjbGVhcnMgdGhlIHNjcmVlbiBpbiB0aGUNCj4+ICsJICogcHJpbWFyeSBw
bGFuZSdzIGF0b21pY19kaXNhYmxlIGZ1bmN0aW9uLg0KPj4gKwkgKi8NCj4+ICt9DQo+PiAr
DQo+IA0KPiBTYW1lIGNvbW1lbnQgdGhhbiBmb3Igc2ltcGxlZHJtLCBhcmUgdGhlc2Ugbm8t
b3AgaGVscGVycyByZWFsbHkgbmVlZGVkID8NCg0KSW4gc2ltcGxlZHJtLCBJJ3ZlIG1lYW53
aGlsZSByZW1vdmVkIHRoZW0uIEknbGwgZG8gc28gaGVyZSBhcyB3ZWxsLg0KDQo+IA0KPiBb
Li4uXQ0KPiANCj4+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBvZmRybV9v
Zl9tYXRjaF9kaXNwbGF5W10gPSB7DQo+PiArCXsgLmNvbXBhdGlibGUgPSAiZGlzcGxheSIs
IH0sDQo+PiArCXsgfSwNCj4+ICt9Ow0KPj4gK01PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG9m
ZHJtX29mX21hdGNoX2Rpc3BsYXkpOw0KPj4gKw0KPiANCj4gSSBkb24ndCBzZWUgYSBiaW5k
aW5nIGZvciB0aGlzIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5Lg0KPiBEbyB3ZSBuZWVkIG9uZSBvciBpdCdzIHRoYXQgb25seSByZXF1aXJlZCBmb3Ig
RkRUIGFuZCBub3QgT3BlbiBGaXJtd2FyZSBEVCA/DQo+IA0KDQpObyBpZGVhLiBUaGUgZGV2
aWNlIGlzIGJlaW5nIGNyZWF0ZWQgaW4gZHJpdmVycy9vZi9wbGF0Zm9ybS5jLiBJZiBvZmZi
IA0KZGlkbid0IG5lZWQgdGhlc2UgYmluZGluZ3MsIG9mZHJtIHByb2JhYmx5IHdvbid0IG5l
ZWQgdGhlbSBlaXRoZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------Y1Dje9YKgCc2YIKBIZaj0TW8--

--------------j0PuR9rfI0QFS6R4CVP67qPQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMq+HYFAwAAAAAACgkQlh/E3EQov+Cx
wA//VBG6IeLkuCWOJd7C12HRN8Jl4mWlbdTJLeAsI4ETPGC8QMR6cZm/pDKvnJ4QQkDNP6Wo3szP
rZiRcUlMQw5xhOEp0Ud30ggAtHZ4sLqJDXLP339/Xzqshc2KOKFU2fq3vaFGt+77bui0/yCX93bA
IdgdLzrbcZwWCSx1/UulYwL3AkEV+gj8jTkOB33I/3cQY3/pKXTb/J2fOCrx4IQf28NmuLtB8URh
eR83PCktYcZ0G/XSag/3TkP8LD7n1xHr0iTT4JFNed+aseiNZwxgEn3CbmKoeuoCwO0VyhWpZ4+d
+DVSwz+tGdY7waVxZzsSG5pWz9/i1rxLQ0IV78W8WHthRdi6PtLv3C+r22idJU4S/cRwpn+cXy1H
tVGAnuZra1KWFD2loW2mx6wUybVQFIGvpObt08qBuq6plpbNU+gsa1YCE9bxar9rZ69coYW700oY
UJI8BKPQrzAZnUSm02KyCTdmtdcv6Cggde8urx85FPfcrlygZe/T2Yo8IFBR87phO7Y4i6kT+urc
zR7OeMD2P418BlDg0r5qhLv5wf7oJtckVBISnxOiIINPKpxfpM1oiofgt+7rx5njnYNazdJ6o8ZT
LHD8nGJwJMUc37ZCx/aEMdkC+ij4aLYKBTkEez7kUlems/eTcA9lL8Fh4QxIVdQLQG18s2KQOCEx
4zk=
=ccz8
-----END PGP SIGNATURE-----

--------------j0PuR9rfI0QFS6R4CVP67qPQ--
