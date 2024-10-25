Return-Path: <linuxppc-dev+bounces-2575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1639AFD4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 10:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZc8X6c9dz2xrJ;
	Fri, 25 Oct 2024 19:56:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.86.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729846588;
	cv=none; b=M6RJMPbmZ60reKvGOFrtXH6fbcB4lyprTC6Ha7qqsoBZoL29/tEHLiM5DjRZQ3tGmXPoHfN0YnSSekHRB6Xgmkb/u2Bh00/4IPU4DKiutoN1R6IUk5bTypj00J1MQJwmx8Iovnsx1qQ22Ks2CvYa8DhhPxklAO959uOqJafKx60jPM/l2kfG0K8MRG+wCzNz+bAh87Bue8lImjzzOL09wp2mhXPPAWRQsFYoTIi2eQMjh3keV/Y4NtwUD/u6Lc1jwiHNH6e/+glEyImOlaIBvHjDnpbpK5zavPDxYDJG8ljnghsRnxXRQRMEkwBgQrusRIWHNuhqSN6X4dzTaP3FrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729846588; c=relaxed/relaxed;
	bh=14mKf9sU3tanO9OBPICmONADv2MiV+fGtEUzxaR2oN4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=ePvUwNwjw4WoR2t7NZM1fBQ6crABgFajPzLUAZ1q7TUP3JFP1EiRSyafDWXolNkfQ4Zd9z8iNNKMM338rvIq6BY7Xl6knyiTZfok4sqWDfFAaWtQEEhzFtQqN3XRoN9aTfS3Mp/Fg8hs/FoAB37SkrliageOcdHC2hnA+71hzPpNz0kILHPd4YsxUggbWHpm/rcYGrTI2K9HgsqnzHN854na7gwHZmwHUXTufkphPuO8iWmcv86Dw0KxMnHmlGGu17KxIQbtS1gEt7KptOiN2iYQkUcJWWDra79lsxpYVWw9J0WQZ8cx6/igEJDZuN0YHOonxBLqLp26jkmmI/74mg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZc8W0WQgz2xjH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 19:56:24 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-317-L51LojkgMNeCZ8cmXDGCPw-1; Fri, 25 Oct 2024 09:56:17 +0100
X-MC-Unique: L51LojkgMNeCZ8cmXDGCPw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 25 Oct
 2024 09:56:16 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 25 Oct 2024 09:56:16 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>
CC: Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, "Kirill A. Shutemov"
	<kirill@shutemov.name>, "x86@kernel.org" <x86@kernel.org>, Thomas Gleixner
	<tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
	"Michael Ellerman" <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Topic: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Index: AQHbJYiO0jpEiXw2TU+KrR/vXcxF6bKVniVggABwnwCAARQTIA==
Date: Fri, 25 Oct 2024 08:56:16 +0000
Message-ID: <4a43ca4f0f28412fbdca4accb1719663@AcuMS.aculab.com>
References: <CAHk-=wjAoiCmPSi1OwrJofifmtRYEzecjUeu3UUUELMbJHopUA@mail.gmail.com>
 <CAHk-=wgDrG-aKVGrd-9gQsC0pMs936oo8XEFmEn6ciaT9=nfDg@mail.gmail.com>
 <20241014035436.nsleqolyj3xxysrr@treble>
 <CAHk-=widMFN2wDeS2K65f8FnW8L6gPZa6CNO4OWkv--0G2LXhw@mail.gmail.com>
 <r5ruxmop7vewd7aq6gu2zve4hfmcu4byhlebygswbqkgz43qfq@rsajyfiypcsd>
 <064d7068-c666-49f0-b7df-774c2e281abc@citrix.com>
 <20241020224444.zhoscljpe7di5yv3@treble>
 <CAHk-=wikKPKDECP=zBEEnxBB44n-uLsnMoOG=aCy6FwDNc9mxA@mail.gmail.com>
 <20241020231112.erso2jzqwkbin4kh@treble>
 <CAHk-=wiUaWnHGgusaMOodypgm7bVztMVQkB6JUvQ0HoYJqDNYA@mail.gmail.com>
 <20241023094448.GAZxjFkEOOF_DM83TQ@fat_crate.local>
 <CAHk-=wgDKPt554sAyzHvW1U+Opx_2Ofu4znjjroMWr1x90SU7A@mail.gmail.com>
 <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
 <c40199a2a319440d89bfcc5c06ec4b3a@AcuMS.aculab.com>
 <CAHk-=whY3P=hH1SV2LV8C3-A=ZjOJ1Sd+qLJQaai+Tiy2vHVvg@mail.gmail.com>
In-Reply-To: <CAHk-=whY3P=hH1SV2LV8C3-A=ZjOJ1Sd+qLJQaai+Tiy2vHVvg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Li4uDQo+IGFjY2Vzc19vaygpIGl0c2VsZiBpcyBzbyByYXJlbHkgdXNlZCB0aGVzZSBkYXlzIHRo
YXQgd2UgY291bGQgb3V0LWxpbmUNCj4gaXQuICBCdXQgdGhlIGNvZGUgY29zdCBvZiBhIGZ1bmN0
aW9uIGNhbGwgaXMgbGlrZWx5IGhpZ2hlciB0aGFuDQo+IGlubGluaW5nIHRoZSA4LWJ5dGUgY29u
c3RhbnQgYW5kIGEgY291cGxlIG9mIGluc3RydWN0aW9uczogbm90IGJlY2F1c2UNCj4gdGhlIGNh
bGwgaW5zdHJ1Y3Rpb24gaXRzZWxmLCBidXQgYmVjYXVzZSBvZiB0aGUgY29kZSBnZW5lcmF0aW9u
IHBhaW4NCj4gYXJvdW5kIGl0IChyZWdpc3RlciBzYXZlL3Jlc3RvcmUgZXRjKS4NCg0KSSB3YXMg
dGhpbmtpbmcgaXQgbWlnaHQgbmVlZCBhIG5vbi1zdGFuZGFyZCBjYWxsIHNlcXVlbmNlIHNvIHRo
YXQNCml0IGNvdWxkIHJldHVybiB5ZXMvbm8gYW5kIG1hc2sgdGhlIGFkZHJlc3MuDQoNCkkgZGlk
IG9uY2Ugd29uZGVyIHdoZXRoZXIgaXQgY291bGQganVzdCBtYXNrIHRoZSBhZGRyZXNzLg0KQ29u
dmVydGluZyBrZXJuZWwgYWRkcmVzc2VzIGludG8gb25lcyB0aGF0IHdlcmUgZ3VhcmFudGVlZA0K
dG8gZmF1bHQgbGF0ZXIuDQpBbm5veWluZ2x5IEkgZG9uJ3QgdGhpbmsgdGhhdCBOVUxMIGNhbiBi
ZSB1c2VkLCBtYXliZSB+MCBmYXVsdHMNCmZvciBieXRlIGFjY2Vzc2VzIC0gb3IgaXMgYSB2ZXJ5
IGJvcmluZyBieXRlLg0KQ2VydGFpbmx5IGxvYWRpbmcgdGhlIFRMQi9jYWNoZSBsaW5lIGZvciB+
MCBpc24ndCBnb2luZyB0byBiZSB1c2VmdWwuDQoNCi4uLg0KPiBBbmQgd2l0aCBob3cgc2xvdyAn
cmV0JyBpbnN0cnVjdGlvbnMgY2FuIGJlLCB3ZSByZWFsbHkgZG9uJ3Qgd2FudA0KPiBzbWFsbCBm
dW5jdGlvbiBjYWxscy4NCg0KQ2FuIHRoYXQgbWF0dGVyIGZvciBsZWFmIGZ1bmN0aW9ucz8NCklJ
UkMgdGhlIGlzc3VlIGlzIHJldHVybiBzdGFjayB1bmRlcmZsb3cgY2F1c2luZyBpbmRpcmVjdCBi
cmFuY2gNCnByZWRpY3Rpb24gYmUgdXNlZCAtIHByb2JhYmx5IHdvcnNlIHRoYW4ganVzdCB1c2lu
ZyB3cmFwcGVkDQpyZXR1cm4gc3RhY2sgdmFsdWUhDQpUaGF0IHdvbid0IGhhcHBlbiBmb3IgYSBs
ZWFmIGZ1bmN0aW9uIHVubGVzcyB5b3UgZ2V0IGFuIGludGVycnVwdC4NClN0YXRpYyBhbmFseXNp
cyBjb3VsZCBkZXRlcm1pbmUgZnVuY3Rpb24gcmV0dXJucyB0aGF0IGNhbiBuZXZlcg0KdW5kZXJm
bG93IHRoZSByZXR1cm4gc3RhY2suDQoNCj4gSW4gZmFjdCwgaXQgcmVhbGx5IG1ha2VzIG1lIHdv
bmRlciBpZiB3ZSBzaG91bGQgaW5saW5lICdnZXRfdXNlcigpJyBlbnRpcmVseS4NCg0KSSB0aGlu
ayB0aGF0IHdvdWxkIGJsb2F0IHNvbWUgY29sZCBwYXRocy4NCkkga25vdyBJJ3ZlIHB1dCBhIHdy
YXBwZXIgb24gY29weV90by9mcm9tX3VzZXIoKSBpbiB0aGUgcGFzdC4NCihJIGRvbid0IHRoaW5r
IHRoYXQgaXMgaW5saW5lZCBhdCBhbGwgdGhlc2UgZGF5cz8pDQpTbyB5b3UgbWlnaHQgd2FudCB0
d28gY29waWVzLg0KDQpBbiBlbnRpcmVseSBob3JyaWQgd2F5IGlzIHRvIGhhdmUgI2RlZmluZSBn
ZXRfdXNlcihhcmdzKSBpbmxpbmUgaXQNCnRoZW4gKGdldF91c2VyKShhcmdzKSB3b3VsZCBjYWxs
IHRoZSByZWFsIGZ1bmN0aW9uLg0KDQpNaW5kIHlvdSB0aGVyZSBhcmUgYSBsb3Qgb2YgZ2V0X3Vz
ZXIoKSBhbmQgcHV0X3VzZXIoKSBpbiB0aGUgZ2V0c29ja29wdCgpDQpmdW5jdGlvbnMgLSB3aGlj
aCBjb3VsZCBhbGwgaGF2ZSBhIGtlcm5lbCBhZGRyZXNzIHBhc3NlZCBhbmQNCnRoYXQgYWNjZXNz
IGRvbmUgYnkgdGhlIHdyYXBwZXIuDQpBIHNpbXBsZSBjaGFuZ2UgdG8gYSBrZXJuZWwgYWRkcmVz
cyBkb2Vzbid0IGNoYW5nZSB0aGUgcHJvdG90eXBlDQpzbyB0aGUgY29tcGxpZXIgZG9lc24ndCBk
ZXRlY3QgdW5jaGFuZ2VkIGNvZGUuDQpJJ3ZlIHRyaWVkIGNoYW5naW5nIGl0IHRvOg0KCW5ld19z
aXplX29yX2Vycm5vID0gZ2V0c29ja29wdCguLi4sIG9sZF9zaXplKQ0KYnV0IHRoZXJlIGFyZSBh
IGZldyBwbGFjZXMgdGhhdCB3YW50IHRvIHJldHVybiBhbiBlcnJvciBhbmQNCnVwZGF0ZSB0aGUg
c2l6ZS4NClBsYXVzaWJseSByZXR1cm5pbmcgKGVycm5vIDw8IG4gfCBzaXplKSBmcm9tIHRob3Nl
IHBsYWNlcyB3b3VsZA0Kc29sdmUgdGhlIHByb2JsZW0gLSBhbmQgdGhlIGV4dHJhIGNoZWNrIHdv
dWxkIGJlIGluIHRoZSBlcnJvciBwYXRoLg0KDQpUcm91YmxlIGlzIGl0IGlzIGEgbWFzc2l2ZSBw
YXRjaCBzZXJpZXMgOi0oDQoNCj4gPiBFc3BlY2lhbGx5IGlmIHRoZXJlIGlzIGFsd2F5cyBhIChQ
QUdFIHNpemVkKSBnYXAgYmV0d2VlbiB0aGUgaGlnaGVzdA0KPiA+IHVzZXIgYWRkcmVzcyBhbmQg
dGhlIGxvd2VzdCBrZXJuZWwgYWRkcmVzcyBzbyB0aGUgJ3NpemUnIGFyZ3VtZW50DQo+ID4gdG8g
YWNjZXNzX29rKCkgY2FuIGJlIGlnbm9yZWQgb24gdGhlIGFzc3VtcHRpb24gdGhhdCB0aGUgYWNj
ZXNzZXMNCj4gPiBhcmUgKHJlYXNvbmFibHkpIGxpbmVhci4NCj4gDQo+IFllcywgdGhhdCdzIHdo
YXQgd2UgZG8gcmlnaHQgbm93IGZvciB0aGUgaW5saW5lIGNvZGUgZ2VuZXJhdGlvbiBhbnl3YXku
DQoNCklzIHRoYXQgZ2FwIHRoZXJlIG9uIGFsbCBhcmNoaXRlY3R1cmVzPw0KDQo+IChPaywgd2Ug
YWN0dWFsbHkgZG8gdGFrZSB0aGUgJ3NpemUnIHZhbHVlIGludG8gYWNjb3VudCB3aGVuIGl0J3Mg
bm90DQo+IGNvbnN0YW50LCBvciB3aGVuIGl0J3MgaHVnZSwgYnV0IGV2ZW4gdGhhdCBpcyBqdXN0
IG91dCBvZiBhIHNpbGx5DQo+IGFidW5kYW5jZSBvZiBjYXV0aW9uIGFuZCBub3QgYSB2ZXJ5IGNv
bW1vbiBjYXNlKS4NCg0KSG1tIHRoZSBidWZmZXJzIGZvciBhbGwgcmVhZC93cml0ZSAoZXRjKSBj
YWxscyBhcmUgdmFyaWFibGUgbGVuZ3RoLg0KU28gaXQgaXMgYSBtb2RlcmF0ZWx5IGNvbW1vbiBj
YXNlLg0KDQoJRGF2aWQNCg0KPiANCj4gICAgICAgICAgICAgICAgIExpbnVzDQoNCi0NClJlZ2lz
dGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24g
S2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==


