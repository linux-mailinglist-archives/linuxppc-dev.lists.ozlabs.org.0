Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03E4FFD4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 19:59:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kdr2M60vwz3bpT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Apr 2022 03:59:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=IbuXHU0E;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ZmTGR35F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=IbuXHU0E; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ZmTGR35F; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kdr1d3Hp9z2yn1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 03:58:44 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF8FF1FCFE;
 Wed, 13 Apr 2022 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649872720; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bv6Og2Y6u9sZQHh0iURfZY3HfiS2oyBm5g0KVmIZw68=;
 b=IbuXHU0EiVcI600YIOG68JlKqVRtfsvMdQjccNjCS6xK6+pothIelxwRhmLaxDr61yG+Zc
 NUUhe+Nct21963jnB21XDoe+gWRHRC6jUyd4Q1l4m8DhjB4AwqmtezWxcYtdGVaqJVtN+f
 RKVNBA6cvF8deWEdbcL7Ru+25mh0/F4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649872720;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bv6Og2Y6u9sZQHh0iURfZY3HfiS2oyBm5g0KVmIZw68=;
 b=ZmTGR35Fz3j75kTlSbT7LNak06Ie5opuIVXFuQ/cIzNg1DGy0TNu0ctPzStd48WQB0c7Dk
 fox8yyRxohvDFuBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7485B13AB8;
 Wed, 13 Apr 2022 17:58:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OmhjG1APV2KragAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Apr 2022 17:58:40 +0000
Message-ID: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
Date: Wed, 13 Apr 2022 19:58:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
Content-Language: en-US
To: Rob Herring <robh+dt@kernel.org>
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3Al99uJhIAJi7jC8hRvxXFko"
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
Cc: devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Helge Deller <deller@gmx.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Paul Mackerras <paulus@samba.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3Al99uJhIAJi7jC8hRvxXFko
Content-Type: multipart/mixed; boundary="------------k5w2Mb1IRd0PlbA8aGczVd86";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Sam Ravnborg <sam@ravnborg.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, devicetree@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <b31df06c-6cce-37dd-5ec1-661fdc8151da@suse.de>
Subject: Re: [PATCH 1/2] of: Create platform devices for OF framebuffers
References: <20220413092454.1073-1-tzimmermann@suse.de>
 <20220413092454.1073-2-tzimmermann@suse.de>
 <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>
In-Reply-To: <CAL_JsqK4oT47Q=XFTZ0a=g3-DiB1JsW7_j9M1qRzpeahhz0muA@mail.gmail.com>

--------------k5w2Mb1IRd0PlbA8aGczVd86
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDQuMjIgdW0gMTQ6NTEgc2NocmllYiBSb2IgSGVycmluZzoNCj4gT24g
V2VkLCBBcHIgMTMsIDIwMjIgYXQgNDoyNCBBTSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gQ3JlYXRlIGEgcGxhdGZvcm0gZGV2aWNl
IGZvciBlYWNoIE9GLWRlY2xhcmVkIGZyYW1lYnVmZmVyIGFuZCBoYXZlDQo+PiBvZmZiIGJp
bmQgdG8gdGhlc2UgZGV2aWNlcy4gQWxsb3dzIGZvciByZWFsIGhvdC11bnBsdWdnaW5nIGFu
ZCBvdGhlcg0KPj4gZHJpdmVycyBiZXNpZGVzIG9mZmIuDQo+Pg0KPj4gT3JpZ2luYWxseSwg
b2ZmYiBjcmVhdGVkIGZyYW1lYnVmZmVyIGRldmljZXMgd2hpbGUgaW5pdGlhbGl6aW5nIGl0
cw0KPj4gbW9kdWxlIGJ5IHBhcnNpbmcgdGhlIE9GIGRldmljZSB0cmVlLiBObyBhY3R1YWwg
TGludXggZGV2aWNlIHdhcyBzZXQNCj4+IHVwLiBUaGlzIHRpZWQgT0YgZnJhbWVidWZmZXJz
IHRvIG9mZmIgYW5kIG1ha2VzIHdyaXRpbmcgb3RoZXIgZHJpdmVycw0KPj4gZm9yIHRoZSBP
RiBmcmFtZWJ1ZmZlcnMgY29tcGxpY2F0ZWQuIFRoZSBhYnNlbmNlIG9mIGEgTGludXggZGV2
aWNlDQo+PiBwcmV2ZW50ZWQgcmVhbCBob3QtdW5wbHVnZ2luZy4gQWRkaW5nIGEgZGlzdGlu
Y3QgcGxhdGZvcm0gZGV2aWNlIGZvcg0KPj4gZWFjaCBPRiBmcmFtZWJ1ZmZlciBzb2x2ZXMg
Ym90aCBwcm9ibGVtcy4gU3BlY2lmaWNhbGx5LCBhIERSTSBkcml2ZXJzDQo+PiBjYW4gbm93
IHByb3ZpZGUgZ3JhcGhpY3Mgb3V0cHV0IHdpdGggbW9kZXJuIHVzZXJzcGFjZS4NCj4+DQo+
PiBTb21lIG9mIHRoZSBvZmZiIGluaXQgY29kZSBpcyBub3cgbG9jYXRlZCBpbiB0aGUgT0Yg
aW5pdGlhbGl6YXRpb24uDQo+PiBUaGVyZSdzIG5vdyBhbHNvIGFuIGltcGxlbWVudGF0aW9u
IG9mIG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCgpLA0KPj4gd2hpY2ggd2Fz
IG1pc3NpbmcgYmVmb3JlLiBUaGUgT0Ygc2lkZSBjcmVhdGVzIGRpZmZlcmVudCBkZXZpY2Vz
IGZvcg0KPj4gZWl0aGVyIE9GIGRpc3BsYXkgbm9kZXMgb3IgYm9vdHggZGlzcGxheXMgYXMg
dGhleSByZXF1aXJlIGRpZmZlcmVudA0KPj4gaGFuZGxpbmcgYnkgdGhlIGRyaXZlci4gVGhl
IG9mZmIgZHJpdmVycyBwaWNrcyB1cCBlYWNoIHR5cGUgb2YgZGV2aWNlDQo+PiBhbmQgcnVu
cyB0aGUgYXBwcm9wcmlhdGUgZmJkZXYgaW5pdGlhbGl6YXRpb24uDQo+Pg0KPj4gVGVzdGVk
IHdpdGggT0YgZGlzcGxheSBub2RlcyBvbiBxZW11J3MgcHBjNjRsZSB0YXJnZXQuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9vZi9wbGF0Zm9ybS5jICAgICAgfCA3MyArKysr
KysrKysrKysrKysrKysrKysrKysrKy0tDQo+PiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYvb2Zm
Yi5jIHwgOTggKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0NCj4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAxMzQgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcGxhdGZvcm0uYyBiL2RyaXZlcnMvb2Yv
cGxhdGZvcm0uYw0KPj4gaW5kZXggYTE2Yjc0ZjMyYWE5Li40YzYzYjlhNzM1ODcgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL29mL3BsYXRmb3JtLmMNCj4+ICsrKyBiL2RyaXZlcnMvb2Yv
cGxhdGZvcm0uYw0KPj4gQEAgLTQ0Nyw2ICs0NDcsNjAgQEAgaW50IG9mX3BsYXRmb3JtX2J1
c19wcm9iZShzdHJ1Y3QgZGV2aWNlX25vZGUgKnJvb3QsDQo+PiAgIH0NCj4+ICAgRVhQT1JU
X1NZTUJPTChvZl9wbGF0Zm9ybV9idXNfcHJvYmUpOw0KPj4NCj4+ICtzdGF0aWMgaW50IF9f
aW5pdCBvZl9wbGF0Zm9ybV9wb3B1bGF0ZV9mcmFtZWJ1ZmZlcnModm9pZCkNCj4+ICt7DQo+
PiArICAgICAgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqYm9vdF9kaXNwbGF5ID0gTlVMTDsNCj4+
ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpub2RlOw0KPj4gKyAgICAgICBzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpkZXY7DQo+PiArICAgICAgIGludCByZXQ7DQo+PiArDQo+PiAr
ICAgICAgIG5vZGUgPSBvZl9nZXRfY29tcGF0aWJsZV9jaGlsZChvZl9jaG9zZW4sICJzaW1w
bGUtZnJhbWVidWZmZXIiKTsNCj4+ICsgICAgICAgb2ZfcGxhdGZvcm1fZGV2aWNlX2NyZWF0
ZShub2RlLCBOVUxMLCBOVUxMKTsNCj4+ICsgICAgICAgb2Zfbm9kZV9wdXQobm9kZSk7DQo+
PiArDQo+IA0KPiBUaGUgcmVzdCBpcyBQUEMgb25seSwgc28gYmFpbCBvdXQgaGVyZSBpZiAh
UFBDLg0KPiANCj4+ICsgICAgICAgLyogQ2hlY2sgaWYgd2UgaGF2ZSBhIE1hY09TIGRpc3Bs
YXkgd2l0aG91dCBhIG5vZGUgc3BlYyAqLw0KPj4gKyAgICAgICBpZiAob2ZfZ2V0X3Byb3Bl
cnR5KG9mX2Nob3NlbiwgImxpbnV4LGJvb3R4LW5vc2NyZWVuIiwgTlVMTCkpIHsNCj4+ICsg
ICAgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAgICAqIFRoZSBvbGQgY29kZSB0
cmllZCB0byB3b3JrIG91dCB3aGljaCBub2RlIHdhcyB0aGUgTWFjT1MNCj4+ICsgICAgICAg
ICAgICAgICAgKiBkaXNwbGF5IGJhc2VkIG9uIHRoZSBhZGRyZXNzLiBJJ20gZHJvcHBpbmcg
dGhhdCBzaW5jZSB0aGUNCj4+ICsgICAgICAgICAgICAgICAgKiBsYWNrIG9mIGEgbm9kZSBz
cGVjIG9ubHkgaGFwcGVucyB3aXRoIG9sZCBCb290WCB2ZXJzaW9ucw0KPj4gKyAgICAgICAg
ICAgICAgICAqICh1c2VycyBjYW4gdXBkYXRlKSBhbmQgd2l0aCB0aGlzIGNvZGUsIHRoZXkn
bGwgc3RpbGwgZ2V0DQo+PiArICAgICAgICAgICAgICAgICogYSBkaXNwbGF5IChqdXN0IG5v
dCB0aGUgcGFsZXR0ZSBoYWNrcykuDQo+PiArICAgICAgICAgICAgICAgICovDQo+PiArICAg
ICAgICAgICAgICAgZGV2ID0gcGxhdGZvcm1fZGV2aWNlX2FsbG9jKCJib290eC1ub3NjcmVl
biIsIDApOw0KPj4gKyAgICAgICAgICAgICAgIGlmIChXQVJOX09OKCFkZXYpKQ0KPj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiArICAgICAgICAgICAg
ICAgcmV0ID0gcGxhdGZvcm1fZGV2aWNlX2FkZChkZXYpOw0KPj4gKyAgICAgICAgICAgICAg
IGlmIChXQVJOX09OKHJldCkpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHBsYXRm
b3JtX2RldmljZV9wdXQoZGV2KTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVy
biByZXQ7DQo+PiArICAgICAgICAgICAgICAgfQ0KPj4gKyAgICAgICB9DQo+PiArDQo+PiAr
ICAgICAgIC8qDQo+PiArICAgICAgICAqIEZvciBPRiBmcmFtZWJ1ZmZlcnMsIGZpcnN0IGNy
ZWF0ZSB0aGUgZGV2aWNlIGZvciB0aGUgYm9vdCBkaXNwbGF5LA0KPj4gKyAgICAgICAgKiB0
aGVuIGZvciB0aGUgb3RoZXIgZnJhbWVidWZmZXJzLiBPbmx5IGZhaWwgZm9yIHRoZSBib290
IGRpc3BsYXk7DQo+PiArICAgICAgICAqIGlnbm9yZSBlcnJvcnMgZm9yIHRoZSByZXN0Lg0K
Pj4gKyAgICAgICAgKi8NCj4+ICsgICAgICAgZm9yX2VhY2hfbm9kZV9ieV90eXBlKG5vZGUs
ICJkaXNwbGF5Iikgew0KPj4gKyAgICAgICAgICAgICAgIGlmICghb2ZfZ2V0X3Byb3BlcnR5
KG5vZGUsICJsaW51eCxvcGVuZWQiLCBOVUxMKSB8fA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAhb2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJsaW51eCxib290LWRpc3BsYXkiLCBOVUxMKSkN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKyAgICAgICAgICAg
ICAgIGRldiA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9kZSwgIm9mLWRpc3BsYXki
LCBOVUxMKTsNCj4+ICsgICAgICAgICAgICAgICBpZiAoV0FSTl9PTighZGV2KSkNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPj4gKyAgICAgICAgICAg
ICAgIGJvb3RfZGlzcGxheSA9IG5vZGU7DQo+PiArICAgICAgICAgICAgICAgYnJlYWs7DQo+
PiArICAgICAgIH0NCj4+ICsgICAgICAgZm9yX2VhY2hfbm9kZV9ieV90eXBlKG5vZGUsICJk
aXNwbGF5Iikgew0KPj4gKyAgICAgICAgICAgICAgIGlmICghb2ZfZ2V0X3Byb3BlcnR5KG5v
ZGUsICJsaW51eCxvcGVuZWQiLCBOVUxMKSB8fCBub2RlID09IGJvb3RfZGlzcGxheSkNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gKyAgICAgICAgICAgICAg
IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9kZSwgIm9mLWRpc3BsYXkiLCBOVUxMKTsN
Cj4+ICsgICAgICAgfQ0KPj4gKw0KPj4gKyAgICAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiAr
DQo+PiAgIC8qKg0KPj4gICAgKiBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSgpIC0gUG9wdWxhdGUg
cGxhdGZvcm1fZGV2aWNlcyBmcm9tIGRldmljZSB0cmVlIGRhdGENCj4+ICAgICogQHJvb3Q6
IHBhcmVudCBvZiB0aGUgZmlyc3QgbGV2ZWwgdG8gcHJvYmUgb3IgTlVMTCBmb3IgdGhlIHJv
b3Qgb2YgdGhlIHRyZWUNCj4+IEBAIC01NDEsOSArNTk1LDcgQEAgc3RhdGljIGludCBfX2lu
aXQgb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZV9pbml0KHZvaWQpDQo+PiAgICAgICAg
ICAgICAgICAgIG9mX25vZGVfcHV0KG5vZGUpOw0KPj4gICAgICAgICAgfQ0KPj4NCj4+IC0g
ICAgICAgbm9kZSA9IG9mX2dldF9jb21wYXRpYmxlX2NoaWxkKG9mX2Nob3NlbiwgInNpbXBs
ZS1mcmFtZWJ1ZmZlciIpOw0KPj4gLSAgICAgICBvZl9wbGF0Zm9ybV9kZXZpY2VfY3JlYXRl
KG5vZGUsIE5VTEwsIE5VTEwpOw0KPj4gLSAgICAgICBvZl9ub2RlX3B1dChub2RlKTsNCj4+
ICsgICAgICAgb2ZfcGxhdGZvcm1fcG9wdWxhdGVfZnJhbWVidWZmZXJzKCk7DQo+Pg0KPj4g
ICAgICAgICAgLyogUG9wdWxhdGUgZXZlcnl0aGluZyBlbHNlLiAqLw0KPj4gICAgICAgICAg
b2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZShOVUxMLCBOVUxMLCBOVUxMKTsNCj4gDQo+
IEknbSBwcmV0dHkgc3VyZSBpdCdzIGp1c3QgdGhpcyBjYWxsIHRoYXQncyB0aGUgcHJvYmxl
bSBmb3IgUFBDIHRob3VnaA0KPiBub25lIG9mIHRoZSBhYm92ZSBleGlzdGVkIHdoZW4gYWRk
aW5nIHRoaXMgY2F1c2VkIGEgcmVncmVzc2lvbi4gQ2FuIHdlDQo+IHJlbW92ZSB0aGUgaWZk
ZWYgYW5kIGp1c3QgbWFrZSB0aGlzIGNhbGwgY29uZGl0aW9uYWwgb24NCj4gIUlTX0VOQUJM
RUQoQ09ORklHX1BQQykuDQoNClRvZ2V0aGVyIHdpdGggdGhlIGNoYW5nZXMgaW4gb2ZfcGxh
dGZvcm1fcG9wdWxhdGVfZnJhbWVidWZmZXJzKCksIHRoZSANCmNvZGUgaXMgbW9yZSBvciBs
ZXNzIGFuICJpZi1lbHNlIiBkZXBlbmRpbmcgb24gUFBDLiBJJ2xsIGRyb3AgDQpvZl9wbGF0
Zm9ybV9wb3B1bGF0ZV9mcmFtZWJ1ZmZlcnMoKSBmcm9tIHRoZSBwYXRjaCBhbmQgbWFrZSBh
IHNlcGFyYXRlIA0KaW1wbGVtZW50YXRpb24gb2Ygb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1
bGF0ZV9pbml0IGZvciBQUEMuIFNlZW1zIGxpa2UgDQp0aGUgZWFzaWVzdCBzb2x1dGlvbiB0
byBtZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQo+PiBAQCAtNTUxLDYg
KzYwMywyMCBAQCBzdGF0aWMgaW50IF9faW5pdCBvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVs
YXRlX2luaXQodm9pZCkNCj4+ICAgICAgICAgIHJldHVybiAwOw0KPj4gICB9DQo+PiAgIGFy
Y2hfaW5pdGNhbGxfc3luYyhvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQpOw0K
Pj4gKyNlbHNlDQo+PiArc3RhdGljIGludCBfX2luaXQgb2ZfcGxhdGZvcm1fZGVmYXVsdF9w
b3B1bGF0ZV9pbml0KHZvaWQpDQo+PiArew0KPj4gKyAgICAgICBkZXZpY2VfbGlua3Nfc3Vw
cGxpZXJfc3luY19zdGF0ZV9wYXVzZSgpOw0KPj4gKw0KPj4gKyAgICAgICBpZiAoIW9mX2hh
dmVfcG9wdWxhdGVkX2R0KCkpDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7
DQo+PiArDQo+PiArICAgICAgIG9mX3BsYXRmb3JtX3BvcHVsYXRlX2ZyYW1lYnVmZmVycygp
Ow0KPj4gKw0KPj4gKyAgICAgICByZXR1cm4gMDsNCj4+ICt9DQo+PiArYXJjaF9pbml0Y2Fs
bF9zeW5jKG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCk7DQo+PiArI2VuZGlm
DQo+Pg0KPj4gICBzdGF0aWMgaW50IF9faW5pdCBvZl9wbGF0Zm9ybV9zeW5jX3N0YXRlX2lu
aXQodm9pZCkNCj4+ICAgew0KPj4gQEAgLTU1OCw3ICs2MjQsNiBAQCBzdGF0aWMgaW50IF9f
aW5pdCBvZl9wbGF0Zm9ybV9zeW5jX3N0YXRlX2luaXQodm9pZCkNCj4+ICAgICAgICAgIHJl
dHVybiAwOw0KPj4gICB9DQo+PiAgIGxhdGVfaW5pdGNhbGxfc3luYyhvZl9wbGF0Zm9ybV9z
eW5jX3N0YXRlX2luaXQpOw0KPj4gLSNlbmRpZg0KPj4NCj4+ICAgaW50IG9mX3BsYXRmb3Jt
X2RldmljZV9kZXN0cm95KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkNCj4+ICAg
ew0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------k5w2Mb1IRd0PlbA8aGczVd86--

--------------3Al99uJhIAJi7jC8hRvxXFko
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJXD0IFAwAAAAAACgkQlh/E3EQov+CU
OQ/9HPP5mfzGjy3+GL3qp0PgTQCAK5sFehZsISHwKHLNGqmSigVPEUh+W1Q3V2AQCJb/1t6g1lG8
zqTuFEpfGq0tNUD+6Iy4YGZfsA8Vn773GOcLveCoDG/3FEoUMeyOfmcZlYKebrLS22qsBk0+0U7V
sjQgxPPMvDholGjaFSFjAkbVFWCrwpbx7BHqQ4sJp3AwtvAw0WDd5nJryIHTqedeBlWsCD40RGy+
Sw2Xj1xNXrGNFDkvkHFzcgKH4SYpD723XCh79MWAGzRkg0p98zUYnexGSZOUdb0US95mOGnqHQ4t
WU8iU8OdVjJEzQNd5qAIu5iDSoXJ2eCH5OPDrhbzk/OeTpdLZe2+vtFks518FSRHM5OvBRc8583n
jJb9qmPVlb/15QtDABD+nhBxy6kEUp9M3TtVJiV1+Zt2NJrzWPfjJKw5rBVjji+ow1iPh0+eUBiQ
8aNLxP0UWxiYxHwuXqpizAFuaXgBi4SGF6CSEMHtPkJjmnaTf+HRD2M34FOb1OqHCJcv6ckf/H5j
DEXDUXpBWCv60dvXAMvgdXD3WSXHkAQvUApO9HhVk5sW0q3Ideu8OQ3zj9lvydwRKuwo8bcV6c2A
Fo15UTPL+0pJTzoVDmjjgauvV2sTPMt+0yS5RHhLvk3JqtdexXmbM2/lCAi/6PGza44+UN3OTGBN
IqQ=
=Cec6
-----END PGP SIGNATURE-----

--------------3Al99uJhIAJi7jC8hRvxXFko--
