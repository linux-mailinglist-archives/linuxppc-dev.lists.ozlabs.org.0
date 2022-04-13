Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB74B4FF520
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 12:50:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdfX05Jxbz3bfC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 20:50:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ty2HOgYp;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=/Ncrqr6U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ty2HOgYp; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=/Ncrqr6U; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdfWM4kn1z2yjc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 20:50:23 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6C46D1F38D;
 Wed, 13 Apr 2022 10:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649847020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt6yq80z8rw+PuUvFymcUW7ayTMDf6vscJkJZ6LgEhM=;
 b=ty2HOgYpwuK67mB6WnHt/XymuiCCjXOtC9cCxPv1MmVlyQ99aMaAYUomZ0xBF5OjKr2/sd
 UNHquqIWuLSYxpV+KITPoqBzQH/2rEPz8dDjDSSXgF40OHuoEd9BDhW7HaRovyiuv9h63Y
 0kZYdcKBJmn+MiFH6slcUJyJPgDKdLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649847020;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wt6yq80z8rw+PuUvFymcUW7ayTMDf6vscJkJZ6LgEhM=;
 b=/Ncrqr6UqataV5PATT69skisn6CDfB9MAv8wcQQXji3nYBywv9Axm5VtAdh2I8nKQ+8XOi
 U98NtyCV8kLrWaAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 248A213AB8;
 Wed, 13 Apr 2022 10:50:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sKbfB+yqVmJvOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 10:50:20 +0000
Message-ID: <b7b5f75c-bf04-8bb6-9628-2790adfe61fc@suse.de>
Date: Wed, 13 Apr 2022 12:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XJByYlM1P0mJ0Gpo2sk9x306"
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------XJByYlM1P0mJ0Gpo2sk9x306
Content-Type: multipart/mixed; boundary="------------F53BndD9Jie3zMIk9lZWAXep";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, robh+dt@kernel.org,
 frowand.list@gmail.com, daniel@ffwll.ch, deller@gmx.de, sam@ravnborg.org,
 linux@roeck-us.net, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, dri-devel@lists.freedesktop.org
Message-ID: <b7b5f75c-bf04-8bb6-9628-2790adfe61fc@suse.de>
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>
In-Reply-To: <23060462-5700-e17a-0abe-a4c5123abe29@redhat.com>

--------------F53BndD9Jie3zMIk9lZWAXep
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDQuMjIgdW0gMTI6NDUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0
aGlzLg0KPiANCj4gT24gNC8xMy8yMiAxMToyNCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBDcmVhdGUgYSBwbGF0Zm9ybSBkZXZpY2UgZm9yIGVhY2ggT0YtZGVjbGFyZWQgZnJh
bWVidWZmZXIgYW5kIGhhdmUNCj4+IG9mZmIgYmluZCB0byB0aGVzZSBkZXZpY2VzLiBBbGxv
d3MgZm9yIHJlYWwgaG90LXVucGx1Z2dpbmcgYW5kIG90aGVyDQo+PiBkcml2ZXJzIGJlc2lk
ZXMgb2ZmYi4NCj4+DQo+PiBPcmlnaW5hbGx5LCBvZmZiIGNyZWF0ZWQgZnJhbWVidWZmZXIg
ZGV2aWNlcyB3aGlsZSBpbml0aWFsaXppbmcgaXRzDQo+PiBtb2R1bGUgYnkgcGFyc2luZyB0
aGUgT0YgZGV2aWNlIHRyZWUuIE5vIGFjdHVhbCBMaW51eCBkZXZpY2Ugd2FzIHNldA0KPj4g
dXAuIFRoaXMgdGllZCBPRiBmcmFtZWJ1ZmZlcnMgdG8gb2ZmYiBhbmQgbWFrZXMgd3JpdGlu
ZyBvdGhlciBkcml2ZXJzDQo+PiBmb3IgdGhlIE9GIGZyYW1lYnVmZmVycyBjb21wbGljYXRl
ZC4gVGhlIGFic2VuY2Ugb2YgYSBMaW51eCBkZXZpY2UNCj4+IHByZXZlbnRlZCByZWFsIGhv
dC11bnBsdWdnaW5nLiBBZGRpbmcgYSBkaXN0aW5jdCBwbGF0Zm9ybSBkZXZpY2UgZm9yDQo+
PiBlYWNoIE9GIGZyYW1lYnVmZmVyIHNvbHZlcyBib3RoIHByb2JsZW1zLiBTcGVjaWZpY2Fs
bHksIGEgRFJNIGRyaXZlcnMNCj4+IGNhbiBub3cgcHJvdmlkZSBncmFwaGljcyBvdXRwdXQg
d2l0aCBtb2Rlcm4gdXNlcnNwYWNlLg0KPj4NCj4+IFNvbWUgb2YgdGhlIG9mZmIgaW5pdCBj
b2RlIGlzIG5vdyBsb2NhdGVkIGluIHRoZSBPRiBpbml0aWFsaXphdGlvbi4NCj4+IFRoZXJl
J3Mgbm93IGFsc28gYW4gaW1wbGVtZW50YXRpb24gb2Ygb2ZfcGxhdGZvcm1fZGVmYXVsdF9w
b3B1bGF0ZV9pbml0KCksDQo+PiB3aGljaCB3YXMgbWlzc2luZyBiZWZvcmUuIFRoZSBPRiBz
aWRlIGNyZWF0ZXMgZGlmZmVyZW50IGRldmljZXMgZm9yDQo+PiBlaXRoZXIgT0YgZGlzcGxh
eSBub2RlcyBvciBib290eCBkaXNwbGF5cyBhcyB0aGV5IHJlcXVpcmUgZGlmZmVyZW50DQo+
PiBoYW5kbGluZyBieSB0aGUgZHJpdmVyLiBUaGUgb2ZmYiBkcml2ZXJzIHBpY2tzIHVwIGVh
Y2ggdHlwZSBvZiBkZXZpY2UNCj4+IGFuZCBydW5zIHRoZSBhcHByb3ByaWF0ZSBmYmRldiBp
bml0aWFsaXphdGlvbi4NCj4+DQo+PiBUZXN0ZWQgd2l0aCBPRiBkaXNwbGF5IG5vZGVzIG9u
IHFlbXUncyBwcGM2NGxlIHRhcmdldC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4gW3NuaXBd
DQo+IA0KPj4gKwlmb3JfZWFjaF9ub2RlX2J5X3R5cGUobm9kZSwgImRpc3BsYXkiKSB7DQo+
PiArCQlpZiAoIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgsb3BlbmVkIiwgTlVMTCkg
fHwNCj4+ICsJCSAgICAhb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxib290LWRpc3Bs
YXkiLCBOVUxMKSkNCj4+ICsJCQljb250aW51ZTsNCj4+ICsJCWRldiA9IG9mX3BsYXRmb3Jt
X2RldmljZV9jcmVhdGUobm9kZSwgIm9mLWRpc3BsYXkiLCBOVUxMKTsNCj4+ICsJCWlmIChX
QVJOX09OKCFkZXYpKQ0KPj4gKwkJCXJldHVybiAtRU5PTUVNOw0KPj4gKwkJYm9vdF9kaXNw
bGF5ID0gbm9kZTsNCj4+ICsJCWJyZWFrOw0KPj4gKwl9DQo+PiArCWZvcl9lYWNoX25vZGVf
YnlfdHlwZShub2RlLCAiZGlzcGxheSIpIHsNCj4+ICsJCWlmICghb2ZfZ2V0X3Byb3BlcnR5
KG5vZGUsICJsaW51eCxvcGVuZWQiLCBOVUxMKSB8fCBub2RlID09IGJvb3RfZGlzcGxheSkN
Cj4+ICsJCQljb250aW51ZTsNCj4+ICsJCW9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9k
ZSwgIm9mLWRpc3BsYXkiLCBOVUxMKTsNCj4gDQo+IFNob3VsZG4ndCBjaGVjayBmb3IgdGhl
IHJldHVybiB2YWx1ZSBoZXJlIHRvbyA/DQoNCkZhaWxpbmcgaXMgcHJvYmFibHkgbm90IHVz
ZWZ1bCwgYXMgaXQncyBub3QgdGhlIG1haW4gRkIgdXNlZCBmb3IgDQpib290aW5nLiBQcmlu
dGluZyBhbiBlcnJvciBtZXNzYWdlIHdvdWxkbid0IGh1cnQsIEkgZ3Vlc3MuIEknbGwgYWxz
byANCnVwZGF0ZSB0aGUgbmV3IGRyaXZlciByZWdpc3RyYXRpb24gaW4gb2ZmYiB3aXRoIGFu
IGVycm9yIG1lc3NhZ2UuDQoNCj4gDQo+IE90aGVyIHRoYW4gdGhpcyBzbWFsbCBuaXQsIGl0
IGxvb2tzIGdvb2QgdG8gbWUuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IA0KDQpUaGFua3MuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------F53BndD9Jie3zMIk9lZWAXep--

--------------XJByYlM1P0mJ0Gpo2sk9x306
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJWqp4FAwAAAAAACgkQlh/E3EQov+Bl
Pw/+KI3InyL3PFmLMwV0DyxWJrmSFbZ+faHHIObiD3JtS4PU0DPCvYwab61BoSdSYdLIl9Lhfvd2
kUsW4u6FuIF7CMK4YIri7W6ku6tuJnsstZUu4qjMQ+SwV69yFHmcWZD9HC3wXKPagCOb2pF7eQZs
IMt1lhl/UB8Gu1CKZV129sRshdDGLsDlzqScte67QHkAWRkoK0Bmwoq4diQcK5VvJSwEB+AhpqrI
6AMRfywnrEDe/JTggpcFCMVkZvOrfnqyyHmcVc2b3Yx/nWjn62sI9E/+SDPXzHKIC3FRsff4ontR
ijnG8gIVv+JnoJSjGlkKwCYSvOmWcM/AXybHbCi7oziaprx8GrtVEXD1IneHhqE7W+uUcuBRlIm5
6LNJs7Eqa7aBxulx56FECOQ8j4H5m2c/Bq/fR5Mjxjbe/CfnL+C+EVNVY6/ns2/Cj08BGlovyYGS
r6f5l3X3MuoxG4TBRti377kv6u4Jt4ceGYJRLP37FVntZnbcs1nNWaTfbqS4v7ei7kkaiJKW2WiD
cAvPP4lT1H/JOe5afe7RiWfmegKFQRY4icpCAY1ezlf2K3KefwXz2SrjS+MIWpMovuh9PxuHejnb
RvYffarcZuf1nBgQv4nQmDDoUGlmo0yI4KfB6N2C/yHzteT5uk68QcyyMlYH49stq453IA4bPHun
AU0=
=kM7Z
-----END PGP SIGNATURE-----

--------------XJByYlM1P0mJ0Gpo2sk9x306--
