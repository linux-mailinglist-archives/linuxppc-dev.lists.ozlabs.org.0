Return-Path: <linuxppc-dev+bounces-3500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA51E9D5C0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 10:39:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xvqmn3Ptfz2yvk;
	Fri, 22 Nov 2024 20:39:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.85.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732268345;
	cv=none; b=bfRala3yIvSVsrzMlN8tUvJZC0qOUChczzIlLvE7qf7+0iDUct918zKvxrc32/pnGTEDjlUdtXyqNBfoAlWkxilyxjbZBTghTHl4jGNZ3wvBWXQTqu0WHvFgmkGR5BM2cVa4MFtNyqmkkl2bFNIEnKUHL2wMq1y2bNaHXP1gBioN7y9FNtE1kLHyHUN3AsWjnsovcleBlkNAz/qgMNtlqk5lGWN7MZ09SOhcbeQz7LptXISoHtzxBGcrV1bmrh++w1Fg1cvKzLwFBznOvppNGVqwIsd1HHhOrQN5fCpSZZNKjn0WKDE+M96+EoyNUZJLfgODBcQY+bz1efgk29WSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732268345; c=relaxed/relaxed;
	bh=SuzWKNOXUZMQHDR0Kku5yVc2ekp4VwnlSRv5FpuXgyQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=i+fdoGKLpZpoJcWuoGEa9AmUUVXFLx7yU8Vd2ICTQSQCZ0abVxCt6ydnHhJKuEbfn13yIhKL57DE7bA4lBfNAd/25sh7l66BIr4T57Dc4L6Iyp1FijJtPVRrIGda9eQyQxeghpuvBGDwmRXIi0MhoVbD/woYwg9L68sbDT6HQlzRC+lmprP8/30QeNwlm9xNcgmwe7d7nB6sF8hRmxXT99U92swC7tiNHXgfZP2UGfvkLbhQgX/icpWhgvWqlbhnfz1h80jujLu5XADtK4tAhRCky0V1gzUV5pwLgLlqSb+GWYkz3FwqoSr/KeLXljJJk4conMc3JcP2rUzUUr0bAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xvqml1j4fz2yn9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 20:39:00 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-128-UG2JqAuiOjWX8iJNPGW7NA-1; Fri, 22 Nov 2024 09:38:54 +0000
X-MC-Unique: UG2JqAuiOjWX8iJNPGW7NA-1
X-Mimecast-MFC-AGG-ID: UG2JqAuiOjWX8iJNPGW7NA
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 22 Nov
 2024 09:38:52 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 22 Nov 2024 09:38:52 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Josh Poimboeuf
	<jpoimboe@kernel.org>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, "Pawan
 Gupta" <pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov"
	<kirill@shutemov.name>
Subject: RE: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Thread-Topic: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Thread-Index: AQHbKc6je06svG7vU0mpJNDFnNBsh7Ktq5PQgBTG9C+AALjbIA==
Date: Fri, 22 Nov 2024 09:38:52 +0000
Message-ID: <b2c0acf3e9af4ca9bf1595f8b66aee78@AcuMS.aculab.com>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
 <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe>
 <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
In-Reply-To: <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
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
X-Mimecast-MFC-PROC-ID: KXZCEs7RiZfZo3UBJm8Oj3O4oaSOEyOZ3V5aAhbAimM_1732268333
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMjEgTm92ZW1iZXIgMjAyNCAyMjoxNg0KPiAN
Cj4gT24gVGh1LCAyMSBOb3YgMjAyNCBhdCAxMzo0MCwgSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9l
QGtlcm5lbC5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gVGhlIHByb2ZpbGUgaXMgc2hvd2luZyBmdXRl
eF9nZXRfdmFsdWVfbG9ja2VkKCk6DQo+IA0KPiBBaGguDQo+IA0KPiA+IFRoYXQgaGFzIHNldmVy
YWwgY2FsbGVycywgc28gd2UgY2FuIHByb2JhYmx5IGp1c3QgdXNlIGdldF91c2VyKCkgdGhlcmU/
DQo+IA0KPiBZZWFoLCB0aGF0J3MgdGhlIHNpbXBsZXN0IHRoaW5nLiBUaGF0IHRoaW5nIGlzbid0
IGV2ZW4gc29tZSBpbmxpbmUNCj4gZnVuY3Rpb24sIHNvIHRoZSByZWFsIGNvc3QgaXMgdGhlIGNh
bGwuDQo+IA0KPiBUaGF0IHNhaWQsIGV4YWN0bHkgYmVjYXVzZSBpdCdzIG5vdCBpbmxpbmVkLCBh
bmQgY2FsbHMgYXJlIGV4cGVuc2l2ZSwNCj4gYW5kIHRoaXMgaXMgYXBwYXJlbnRseSByZWFsbHkg
Y3JpdGljYWwsIHdlIGNhbiBqdXN0IGRvIGl0IHdpdGggdGhlDQo+IGZ1bGwgInVuc2FmZV9nZXRf
dXNlcigpIiBtb2RlbC4NCj4gDQo+IEl0J3Mgbm90IHNvIGNvbXBsaWNhdGVkLiBUaGUgYXR0YWNo
ZWQgcGF0Y2ggaXMgdW50ZXN0ZWQsIGJ1dCBJIGRpZA0KPiBjaGVjayB0aGF0IGl0IGdlbmVyYXRl
cyBhbG1vc3QgcGVyZmVjdCBjb2RlOg0KPiANCj4gICAgIG1vdiAgICAlZ3M6MHgwLCVyYXggICAg
ICAgICAgICAgICAgICMgY3VycmVudA0KPiAgICAgaW5jbCAgIDB4MWE5YyglcmF4KSAgICAgICAg
ICAgICAgICAgIyBjdXJyZW50LT5wYWdlZmF1bHRfZGlzYWJsZSsrDQo+ICAgICBtb3ZhYnMgJDB4
MTIzNDU2Nzg5YWJjZGVmLCVyY3ggICAgICAjIG1hZ2ljIHZpcnR1YWwgYWRkcmVzcyBzaXplDQo+
ICAgICBjbXAgICAgJXJzaSwlcmN4ICAgICAgICAgICAgICAgICAgICAjIGFkZHJlc3MgbWFza2lu
Zw0KPiAgICAgc2JiICAgICVyY3gsJXJjeA0KPiAgICAgb3IgICAgICVyc2ksJXJjeA0KPiAgICAg
c3RhYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIyBlbmFibGUgdXNlciBzcGFjZSBh
Y2NjZXNzDQo+ICAgICBtb3YgICAgKCVyY3gpLCVlY3ggICAgICAgICAgICAgICAgICAjIGdldCB0
aGUgdmFsdWUNCj4gICAgIGNsYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICMgZGlz
YWJsZSB1c2VyIHNwYWNlIGFjY2Vzcw0KPiAgICAgZGVjbCAgIDB4MWE5YyglcmF4KSAgICAgICAg
ICAgICAgICAgIyBjdXJyZW50LT5wYWdlZmF1bHRfZGlzYWJsZS0tDQo+ICAgICBtb3YgICAgJWVj
eCwoJXJkaSkgICAgICAgICAgICAgICAgICAjIHNhdmUgdGhlIHZhbHVlDQo+ICAgICB4b3IgICAg
JWVheCwlZWF4ICAgICAgICAgICAgICAgICAgICAjIHJldHVybiAwDQo+ICAgICByZXQNCj4gDQo+
ICh3aXRoIHRoZSBlcnJvciBjYXNlIGZvciB0aGUgcGFnZSBmYXVsdCBhbGwgb3V0LW9mLWxpbmUp
Lg0KDQpJIHByZXN1bWUgeW91IGFyZSBhc3N1bWluZyBhbiBlYXJsaWVyIGFjY2Vzc19vaygpIGNh
bGw/IA0KDQpJSVJDIGFsbCB4ODYgZnJvbSAyODYgb253YXJkcyBmYXVsdCBhY2Nlc3NlcyB0aGF0
IGNyb3NzIHRoZSB+MCB0byAwIGJvdW5kYXJ5Lg0KU28geW91IGRvbid0IG5lZWQgdG8gaGF2ZSBj
YWxsZWQgYWNjZXNzX29rKCkgcHJpb3IgdG8gdGhlIGFib3ZlDQpmb3Igbm9uLWJ5dGUgYWNjZXNz
ZXMuDQpFdmVuIGZvciBieXRlIGFjY2Vzc2VzIChhbmQgd2l0aCB+MCBiZWluZyBhIHZhbGlkIGFk
ZHJlc3MpIGRvIHRoZQ0KYWRkcmVzcyBtYXNrIGJlZm9yZSBwYWdlZmF1bHRfZGlzYWJsZSsrIGFu
ZCB0aGUgZXJyb3IgdGVzdCBpcyAnamMgbGFiZWwnDQphZnRlciB0aGUgJ2NtcCcuDQoNCkRvbid0
IHlvdSBhbHNvIGdldCBiZXR0ZXIgY29kZSBmb3IgYW4gJ2FzbSBvdXRwdXQgd2l0aCBnb3RvJyBm
b3JtPw0KV2hpbGUgaXQgcmVxdWlyZXMgdGhlIGNhbGxlciBoYXZlIGEgJ2xhYmVsOiByZXR1cm4g
LUVGQVVMVDsnIHNvbWV3aGVyZQ0KdGhhdCBpcyBxdWl0ZSBjb21tb24gaW4ga2VybmVsIGNvZGUu
DQoNCj4gU28gdGhpcyBzaG91bGQgYmUgX2Zhc3Rlcl8gdGhhbiB0aGUgb2xkIF9fZ2V0X3VzZXIo
KSwgYmVjYXVzZSB3aGlsZQ0KPiB0aGUgYWRkcmVzcyBtYXNraW5nIGlzIG5vdCBuZWVkZWQsIGl0
J3MgY2hlYXBlciB0aGFuIHRoZSBmdW5jdGlvbiBjYWxsDQo+IHVzZWQgdG8gYmUgYW5kIHRoZSBl
cnJvciBoYW5kbGluZyBpcyBiZXR0ZXIuDQoNClBlcmhhcHMgZ2V0X3VzZXIoKSBzaG91bGQgYmUg
dGhlIGZ1bmN0aW9uIGNhbGwgYW5kIF9fZ2V0X3VzZXIoKSBpbmxpbmVkLg0KQm90aCBpbmNsdWRp
bmcgYWRkcmVzcyB2YWxpZGF0aW9uIGJ1dCBkaWZmZXJlbnQgY2FsbGluZyBjb252ZW50aW9ucz8N
CihBZnRlciBmaXhpbmcgdGhlIGNvZGUgdGhhdCBkb2Vzbid0IHdhbnQgYWRkcmVzcyBtYXNraW5n
LikNCg0KLi4uDQo+IE5vdywgd2UgY291bGQgcG9zc2libHkgc2F5ICJqdXN0IHJlbW92ZSB0aGUg
ZmVuY2UgaW4gX19nZXRfdXNlcigpDQo+IGVudGlyZWx5IiwgYnV0IHRoYXQgd291bGQgaW52b2x2
ZSBtb3ZpbmcgaXQgdG8gYWNjZXNzX29rKCkuDQoNCkhvdyB2YWxpZCB3b3VsZCBpdCBiZSB0byBh
c3N1bWUgYW4gZXhwbGljaXQgYWNjZXNzX29rKCkgd2FzIGZhcg0KZW5vdWdoIGF3YXkgZnJvbSB0
aGUgZ2V0X3VzZXIoKSB0aGF0IHlvdSBjb3VsZG4ndCBzcGVjdWxhdGUgYWxsIHRoZQ0Kd2F5IHRv
IHNvbWV0aGluZyB0aGF0IHVzZWQgdGhlIHJlYWQgdmFsdWUgdG8gcGVyZm9ybSBhbm90aGVyDQpr
ZXJuZWwgYWNjZXNzPw0KDQo+IEFuZCB0aGVuIGl0IHdvdWxkbid0IGFjdHVhbGx5IHNwZWVkIGFu
eXRoaW5nIHVwIChleGNlcHQgdGhlIGhvcnJpZA0KPiBhcmNoaXRlY3R1cmUtc3BlY2lmaWMga2Vy
bmVsIHVzZXMgdGhhdCB0aGVuIGRvbid0IGNhbGwgYWNjZXNzX29rKCkgYXQNCj4gYWxsIC0gYW5k
IHdlIGRvbid0IGNhcmUgYWJvdXQgKnRob3NlKikuDQoNCkZpbmQgYW5kIGtpbGwgOi0pDQoNCglE
YXZpZA0KDQo+IA0KPiAgICAgICAgICAgICAgICBMaW51cw0KDQotDQpSZWdpc3RlcmVkIEFkZHJl
c3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsx
IDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


