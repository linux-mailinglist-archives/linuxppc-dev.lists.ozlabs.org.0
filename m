Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D26AD673D61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 16:21:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NyRDt4Y2jz3fGs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 02:21:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aLJ7Vi2t;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WY5LGUnA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=aLJ7Vi2t;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WY5LGUnA;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NyRCx3JsFz3bWF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jan 2023 02:21:01 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9E6515CF87;
	Thu, 19 Jan 2023 15:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1674141658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bijK/57LraMRcjjukMyAka7jOBDKoo0azbec51CHr4=;
	b=aLJ7Vi2tZbfSMbh9ss7dORVlM8id/4iLLKhIrCjiomfNdmWwR9UZ1xfTak0JsTkNhgLkpM
	a+gUmPYK5M/Qf5eij+TyiJimAONbBWFm+PvPAusQQWq5mTZULw34cUpolO2ZstwpL3RZOj
	oZ1tGvug+b533OVKzZW6/7+dpFV+jYE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1674141658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+bijK/57LraMRcjjukMyAka7jOBDKoo0azbec51CHr4=;
	b=WY5LGUnAknFE8AiMAiWsO2W8ECPmG4VaLrnp26dq8MSXkOMt3uLo3hVHWdWphPfwCx95h6
	r5AlzaN3yNBKD7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 697F7134F5;
	Thu, 19 Jan 2023 15:20:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id mKmTGNpfyWMIRAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 19 Jan 2023 15:20:58 +0000
Message-ID: <190c1c68-0249-a291-f2ab-45c9a7f716d7@suse.de>
Date: Thu, 19 Jan 2023 16:20:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
Content-Language: en-US
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
 <57e026bf-c412-0c47-8956-b565894948e0@suse.de>
 <20230119132330.GP16547@kitsune.suse.cz>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230119132330.GP16547@kitsune.suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hrL0XHWHA5bbnro0AHMZM0MN"
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
Cc: "Erhard F." <erhard_f@mailbox.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Javier Martinez Canillas <javierm@redhat.com>, open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hrL0XHWHA5bbnro0AHMZM0MN
Content-Type: multipart/mixed; boundary="------------hXohnY0kZhhQ8LRpKgUVVVWJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Erhard F." <erhard_f@mailbox.org>, Rob Herring <robh+dt@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE"
 <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-ID: <190c1c68-0249-a291-f2ab-45c9a7f716d7@suse.de>
Subject: Re: [PATCH v2] of: Fix of platform build on powerpc due to bad of
 disaply code
References: <20230119095323.4659-1-msuchanek@suse.de>
 <8a9f7ba5-37a4-0927-4ab2-d212f1b098a9@csgroup.eu>
 <57e026bf-c412-0c47-8956-b565894948e0@suse.de>
 <20230119132330.GP16547@kitsune.suse.cz>
In-Reply-To: <20230119132330.GP16547@kitsune.suse.cz>

--------------hXohnY0kZhhQ8LRpKgUVVVWJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjMgdW0gMTQ6MjMgc2NocmllYiBNaWNoYWwgU3VjaMOhbmVrOg0K
PiBPbiBUaHUsIEphbiAxOSwgMjAyMyBhdCAwMjoxMToxM1BNICswMTAwLCBUaG9tYXMgWmlt
bWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTkuMDEuMjMgdW0gMTE6MjQgc2No
cmllYiBDaHJpc3RvcGhlIExlcm95Og0KPj4+DQo+Pj4NCj4+PiBMZSAxOS8wMS8yMDIzIMOg
IDEwOjUzLCBNaWNoYWwgU3VjaGFuZWsgYSDDqWNyaXTCoDoNCj4+Pj4gVGhlIGNvbW1pdCAy
ZDY4MWQ2YTIzYTEgKCJvZjogTWFrZSBvZiBmcmFtZWJ1ZmZlciBkZXZpY2VzIHVuaXF1ZSIp
DQo+Pj4+IGJyZWFrcyBidWlsZCBiZWNhdXNlIG9mIHdyb25nIGFyZ3VtZW50IHRvIHNucHJp
bnRmLiBUaGF0IGNlcnRhaW5seQ0KPj4+PiBhdm9pZHMgdGhlIHJ1bnRpbWUgZXJyb3IgYnV0
IGlzIG5vdCB0aGUgaW50ZW5kZWQgb3V0Y29tZS4NCj4+Pj4NCj4+Pj4gQWxzbyB1c2Ugc3Rh
bmRhcmQgZGV2aWNlIG5hbWUgZm9ybWF0IG9mLWRpc3BsYXkuTiBmb3IgYWxsIGNyZWF0ZWQN
Cj4+Pj4gZGV2aWNlcy4NCj4+Pj4NCj4+Pj4gRml4ZXM6IDJkNjgxZDZhMjNhMSAoIm9mOiBN
YWtlIG9mIGZyYW1lYnVmZmVyIGRldmljZXMgdW5pcXVlIikNCj4+Pj4gU2lnbmVkLW9mZi1i
eTogTWljaGFsIFN1Y2hhbmVrIDxtc3VjaGFuZWtAc3VzZS5kZT4NCj4+Pj4gLS0tDQo+Pj4+
IHYyOiBVcGRhdGUgdGhlIGRldmljZSBuYW1lIGZvcm1hdA0KPj4+PiAtLS0NCj4+Pj4gICAg
IGRyaXZlcnMvb2YvcGxhdGZvcm0uYyB8IDEyICsrKysrKysrLS0tLQ0KPj4+PiAgICAgMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcGxhdGZvcm0uYyBiL2RyaXZlcnMvb2YvcGxh
dGZvcm0uYw0KPj4+PiBpbmRleCBmMmE1ZDY3OWEzMjQuLjhjMWIxZGUyMjAzNiAxMDA2NDQN
Cj4+Pj4gLS0tIGEvZHJpdmVycy9vZi9wbGF0Zm9ybS5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMv
b2YvcGxhdGZvcm0uYw0KPj4+PiBAQCAtNTI1LDcgKzUyNSw5IEBAIHN0YXRpYyBpbnQgX19p
bml0IG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxhdGVfaW5pdCh2b2lkKQ0KPj4+PiAgICAg
CWlmIChJU19FTkFCTEVEKENPTkZJR19QUEMpKSB7DQo+Pj4+ICAgICAJCXN0cnVjdCBkZXZp
Y2Vfbm9kZSAqYm9vdF9kaXNwbGF5ID0gTlVMTDsNCj4+Pj4gICAgIAkJc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqZGV2Ow0KPj4+PiAtCQlpbnQgZGlzcGxheV9udW1iZXIgPSAxOw0KPj4+
PiArCQlpbnQgZGlzcGxheV9udW1iZXIgPSAwOw0KPj4+PiArCQljaGFyIGJ1ZlsxNF07DQo+
Pj4NCj4+PiBDYW4geW91IGRlY2xhcmUgdGhhdCBpbiB0aGUgZm9yIGJsb2NrIHdoZXJlIGl0
IGlzIHVzZWQgaW5zdGVhZCA/DQo+Pj4NCj4+Pj4gKwkJY2hhciAqb2ZfZGlzcGxheV9mb3Jt
YXQgPSAib2YtZGlzcGxheS4lZCI7DQo+Pj4NCj4+PiBTaG91bGQgYmUgY29uc3QgPw0KPj4N
Cj4+IFRoYXQgc2hvdWxkIGJlIHN0YXRpYyBjb25zdCBvZl9kaXNwbGF5X2Zvcm1hdFtdID0g
dGhlbg0KPiANCj4gV2h5PyBJdCBzb3VuZHMgY29tcGxldGVseSBmaW5lIHRvIGhhdmUgYSBj
b25zdCBwb2ludGVyIHRvIGEgc3RyaW5nDQo+IGNvbnN0YXRudC4NCg0KR2VuZXJhbGx5IHNw
ZWFraW5nOg0KDQonc3RhdGljJyBiZWNhdXNlIHlvdXIgY29uc3QgcG9pbnRlciBpcyB0aGVu
IG5vdCBhIGxvY2FsIHZhcmlhYmxlLCBzbyBpdCANCnRha2VzIHByZXNzdXJlIG9mZiB0aGUg
c3RhY2suIEZvciBnbG9iYWwgdmFyaWFibGVzLCB5b3UgZG9uJ3Qgd2FudCB0aGVtIA0KdG8g
c2hvdyB1cCBpbiBhbnkgbGlua2VyIHN5bWJvbCB0YWJsZXMuDQoNClRoZSBzdHJpbmcgIm9m
LWRpc3BsYXkuJWQiIGlzIHN0b3JlZCBhcyBhbiBhcnJheSBpbiB0aGUgRUxGIGRhdGEgDQpz
ZWN0aW9uLiBBbmQgeW91ciBjaGFyIHBvaW50ZXIgaXMgYSByZWZlcmVuY2UgdG8gdGhhdCBh
cnJheS4gRm9yIHN0YXRpYyANCnBvaW50ZXJzLCB0aGVzZSBpbmRpcmVjdGlvbnMgdGFrZSBD
UFUgY3ljbGVzIHRvIHVwZGF0ZSB3aGVuIHRoZSBsb2FkZXIgDQpoYXMgdG8gcmVsb2NhdGUg
c2VjdGlvbnMuIElmIHlvdSBkZWNsYXJlIG9mX2Rpc3BsYXlfZm9ybWF0W10gZGlyZWN0bHkg
YXMgDQphcnJheSwgeW91IGF2b2lkIHRoZSByZWZlcmVuY2UgYW5kIHdvcmsgZGlyZWN0bHkg
d2l0aCB0aGUgYXJyYXkuDQoNCk9mIGNvdXJzZSwgdGhpcyBpcyBhIGtlcm5lbCBtb2R1bGUg
YW5kIHRoZSBzdHJpbmcgaXMgc2VsZi1jb250YWluZWQgDQp3aXRoaW4gdGhlIGZ1bmN0aW9u
LiBTbyB0aGUgY29tcGlsZXIgY2FuIHByb2JhYmx5IGRldGVjdCB0aGF0IGFuZCANCm9wdGlt
aXplIHRoZSBjb2RlIHRvIGJlIGxpa2UgdGhlICdzdGF0aWMgY29uc3QgW10nIHZlcnNpb24u
IEl0J3Mgc3RpbGwgDQpnb29kIHRvIGZvbGxvdyBiZXN0IHByYWN0aWNlcywgYXMgc29tZW9u
ZSBtaWdodCBjb3B5IGZyb20gdGhpcyBmdW5jdGlvbi4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gVGhhbmtzDQo+IA0KPiBNaWNoYWwNCj4gDQo+Pg0KPj4+DQo+Pj4+ICAg
ICAJCWludCByZXQ7DQo+Pj4+ICAgICAJCS8qIENoZWNrIGlmIHdlIGhhdmUgYSBNYWNPUyBk
aXNwbGF5IHdpdGhvdXQgYSBub2RlIHNwZWMgKi8NCj4+Pj4gQEAgLTU1Niw3ICs1NTgsMTAg
QEAgc3RhdGljIGludCBfX2luaXQgb2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZV9pbml0
KHZvaWQpDQo+Pj4+ICAgICAJCQlpZiAoIW9mX2dldF9wcm9wZXJ0eShub2RlLCAibGludXgs
b3BlbmVkIiwgTlVMTCkgfHwNCj4+Pj4gICAgIAkJCSAgICAhb2ZfZ2V0X3Byb3BlcnR5KG5v
ZGUsICJsaW51eCxib290LWRpc3BsYXkiLCBOVUxMKSkNCj4+Pj4gICAgIAkJCQljb250aW51
ZTsNCj4+Pj4gLQkJCWRldiA9IG9mX3BsYXRmb3JtX2RldmljZV9jcmVhdGUobm9kZSwgIm9m
LWRpc3BsYXkiLCBOVUxMKTsNCj4+Pj4gKwkJCXJldCA9IHNucHJpbnRmKGJ1Ziwgc2l6ZW9m
KGJ1ZiksIG9mX2Rpc3BsYXlfZm9ybWF0LCBkaXNwbGF5X251bWJlcisrKTsNCj4+Pj4gKwkJ
CWlmIChyZXQgPj0gc2l6ZW9mKGJ1ZikpDQo+Pj4+ICsJCQkJY29udGludWU7DQo+Pj4NCj4+
Pg0KPj4+IENhbiB5b3UgbWFrZSBidWYgYmlnIGVub3VnaCB0byBhdm9pZCB0aGF0ID8NCj4+
Pg0KPj4+IEFuZCBieSB0aGUgd2F5IGNvdWxkIGl0IGJlIGNhbGxlZCBzb21ldGhpbmcgZWxz
ZSB0aGFuICdidWYnID8NCj4+Pg0KPj4+IFNlZSBleGVtcGxlIGhlcmUgOg0KPj4+IGh0dHBz
Oi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEvc291cmNlL2RyaXZlcnMvZnNpL2Zz
aS1vY2MuYyNMNjkwDQo+Pj4NCj4+Pg0KPj4+PiArCQkJZGV2ID0gb2ZfcGxhdGZvcm1fZGV2
aWNlX2NyZWF0ZShub2RlLCBidWYsIE5VTEwpOw0KPj4+PiAgICAgCQkJaWYgKFdBUk5fT04o
IWRldikpDQo+Pj4+ICAgICAJCQkJcmV0dXJuIC1FTk9NRU07DQo+Pj4+ICAgICAJCQlib290
X2Rpc3BsYXkgPSBub2RlOw0KPj4+PiBAQCAtNTY0LDEwICs1NjksOSBAQCBzdGF0aWMgaW50
IF9faW5pdCBvZl9wbGF0Zm9ybV9kZWZhdWx0X3BvcHVsYXRlX2luaXQodm9pZCkNCj4+Pj4g
ICAgIAkJfQ0KPj4+PiAgICAgCQlmb3JfZWFjaF9ub2RlX2J5X3R5cGUobm9kZSwgImRpc3Bs
YXkiKSB7DQo+Pj4+IC0JCQljaGFyICpidWZbMTRdOw0KPj4+PiAgICAgCQkJaWYgKCFvZl9n
ZXRfcHJvcGVydHkobm9kZSwgImxpbnV4LG9wZW5lZCIsIE5VTEwpIHx8IG5vZGUgPT0gYm9v
dF9kaXNwbGF5KQ0KPj4+PiAgICAgCQkJCWNvbnRpbnVlOw0KPj4+PiAtCQkJcmV0ID0gc25w
cmludGYoYnVmLCAib2YtZGlzcGxheS0lZCIsIGRpc3BsYXlfbnVtYmVyKyspOw0KPj4+PiAr
CQkJcmV0ID0gc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgb2ZfZGlzcGxheV9mb3JtYXQs
IGRpc3BsYXlfbnVtYmVyKyspOw0KPj4+PiAgICAgCQkJaWYgKHJldCA+PSBzaXplb2YoYnVm
KSkNCj4+Pj4gICAgIAkJCQljb250aW51ZTsNCj4+Pj4gICAgIAkJCW9mX3BsYXRmb3JtX2Rl
dmljZV9jcmVhdGUobm9kZSwgYnVmLCBOVUxMKTsNCj4+DQo+PiAtLSANCj4+IFRob21hcyBa
aW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0KPiANCj4gDQo+IA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------hXohnY0kZhhQ8LRpKgUVVVWJ--

--------------hrL0XHWHA5bbnro0AHMZM0MN
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPJX9kFAwAAAAAACgkQlh/E3EQov+Ap
thAAluEwlz7dsOI61KA7WGHTsw934yyIYBEvpfpsoRZmIesT9cWO7JcK8NogJ+kjFcQuiNtL3Bbl
9DdCQWgzg5N/G8HbRezeApkF/mN4wnaxgKiwEnCHha93PDzoxizE0uRvtCdL8p44fxe22Ua4dktr
Wcer/VjPC+c5e2UqnfpT7NQWrsmBBqnW1DcYc9m1+9nf4BJnuGdFHbyB0vTkDG4g0XSFrS/AnwAi
rCCdluB9ge2dS2o6Homp1dOn4t+DSKz25mmD8lHMtNrp7cmK+oG0BGICvJzD5cfPkKUvDuOJb88B
zx4GOpVJQUKMgagWE0cLQlTLnT6idtZi9bd5FprelUrmY41xLxILAoSnty8J6mMOPBwPcFFRxjx/
f6kNTtQ7qRJ49uBtde4NNEMXsgPLX88agNRofGraXI4zpYmkXEa4NMFA5qDM5Xpe/sd1E+XEzjs/
oMpN1CEIwXfvTuWODmBHdJiBC9IJ9dd0aspM8IeL4fR71hcEsO7O9AeF0Wvdrw9ekRgHHtkyGjpF
Z0XQGTYkL0+Y4GG+WbwdWoCX528SBpvPMXXEA7+DNb2UtLLB+kfYqP1j1FdDGtgrxPY5tG+Z/O5l
vlegW9csMIx0y/kytWgmGG4Wt5ksf6A00A/drWDU+XUqqYWWnr841zO6KNVzsRYk1zBaBTjeYEgX
Jok=
=YC4Z
-----END PGP SIGNATURE-----

--------------hrL0XHWHA5bbnro0AHMZM0MN--
