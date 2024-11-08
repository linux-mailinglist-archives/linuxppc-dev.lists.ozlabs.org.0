Return-Path: <linuxppc-dev+bounces-3057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 329769C22B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2024 18:13:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XlQW61Mfnz3bxH;
	Sat,  9 Nov 2024 04:13:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.85.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731085986;
	cv=none; b=MyvwXzeqzC9ztwp1Rc/rKgNGo00myb8ubl22jt1hX7dTvuPeTw2V++1OpuSd2S/yDc3aD5wsO56DLnAOHSFAIPpoxVtRvL0h7qLbJIwBDIS+POmfmXww2RQiy9fEjxr8+lDyr6IXcySyfh350hq4JxiUshaoMztnyUIo2W3ak9lZNxp6zi/Cnuy2lFpZocRmoM6trZDJvy+I0vpFquO2bprh81rm+Jmp9fp3skto9ibYwxIFrXe8Rfqvapevl0H1FALfGxsr5AVO/81CuI2l6mdzu1GlCOsHSBDbwPhxgIMdh2uhtXV7nt6EMoQRWSwI1c33qmwQsfUKxuxG+H/VtA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731085986; c=relaxed/relaxed;
	bh=RO3czDvu1nri5fQkZQg3VXkpBVm+X4ozSSPv7SC0XAA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Az9yPerWkyxdGtPPxUR3ZCpghb40zQoV1H6vDiF9WSVwz5s7yvjMvB5iRGGMrOn9YjqOm/O4kPHBeEubjmYWOSQOdMAOn1a/KnWf94RB5isOjsN89sgWJPk0WRQF826APQ7S8fGTnaHn6zhkxPvNidERFYKfFbp1HVYEYjxLjX6rS2bunDflVfTqu1/iXqyx1YQknK8nk7o7cIv5VHk1w6l7qd/WpMwJbKMde4ahTKOQi68UdCOqb7wpTvDdC1kuq8M+WWYPI/8QsUYEhN8hVwJONHn/shcSTisjHPm9+z9wO6g+GGyZ5JwXQDoqD1e/In9Pr5rx2o3ti/5eGPIhqw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XlQW409Yyz3btt
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2024 04:13:01 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-134-MLpserxzNgiutJrUqBQt6w-1; Fri, 08 Nov 2024 17:12:54 +0000
X-MC-Unique: MLpserxzNgiutJrUqBQt6w-1
X-Mimecast-MFC-AGG-ID: MLpserxzNgiutJrUqBQt6w
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 8 Nov
 2024 17:12:53 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 8 Nov 2024 17:12:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Josh Poimboeuf' <jpoimboe@kernel.org>, "x86@kernel.org" <x86@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Peter
 Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Michael Ellerman
	<mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
	Mark Rutland <mark.rutland@arm.com>, "Kirill A . Shutemov"
	<kirill@shutemov.name>
Subject: RE: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Thread-Topic: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
Thread-Index: AQHbKc6je06svG7vU0mpJNDFnNBsh7Ktq5PQ
Date: Fri, 8 Nov 2024 17:12:53 +0000
Message-ID: <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
In-Reply-To: <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
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
X-Mimecast-MFC-PROC-ID: 5b4Cm_v6wqFD5muXAdbzhNBnVABNAjaxU3gdXF8J5Lg_1731085973
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

RnJvbTogSm9zaCBQb2ltYm9ldWYNCj4gU2VudDogMjkgT2N0b2JlciAyMDI0IDAzOjI4DQo+IA0K
PiBPbiBNb24sIE9jdCAyOCwgMjAyNCBhdCAwNjo1NjoxNVBNIC0wNzAwLCBKb3NoIFBvaW1ib2V1
ZiB3cm90ZToNCj4gPiBUaGUgYmFycmllcl9ub3NwZWMoKSBpbiA2NC1iaXQgX19nZXRfdXNlcigp
IGlzIHNsb3cuICBJbnN0ZWFkIHVzZQ0KPiA+IHBvaW50ZXIgbWFza2luZyB0byBmb3JjZSB0aGUg
dXNlciBwb2ludGVyIHRvIGFsbCAxJ3MgaWYgYSBwcmV2aW91cw0KPiA+IGFjY2Vzc19vaygpIG1p
c3ByZWRpY3RlZCB0cnVlIGZvciBhbiBpbnZhbGlkIGFkZHJlc3MuDQo+IA0KPiBMaW51cyBwb2lu
dGVkIG91dCB0aGF0IF9fZ2V0X3VzZXIoKSBtYXkgYmUgdXNlZCBieSBzb21lIGNvZGUgdG8gYWNj
ZXNzDQo+IGJvdGgga2VybmVsIGFuZCB1c2VyIHNwYWNlIGFuZCBpbiBmYWN0IEkgZm91bmQgb25l
IHN1Y2ggdXNhZ2UgaW4NCj4gdmNfcmVhZF9tZW0oKS4uLi4NCj4gDQo+IFNvIEkgc2VsZi1OQUsg
dGhpcyBwYXRjaCBmb3Igbm93Lg0KPiANCj4gU3RpbGwsIGl0IHdvdWxkIGJlIGdyZWF0IGlmIHBh
dGNoIDEgY291bGQgZ2V0IG1lcmdlZCBhcyB0aGF0IGdpdmVzIGENCj4gc2lnbmlmaWNhbnQgcGVy
Zm9ybWFuY2UgYm9vc3QuDQoNCkknbSBhIGJpdCBsYXRlIHRvIHRoZSBwYXJ0eSBhbmQgc3RpbGwg
YSB3ZWVrIGJlaGluZCA6LSgNCg0KQnV0IEkndmUgd29uZGVyZWQgaWYgYWNjZXNzX29rKCkgb3Vn
aHQgdG8gYmUgaW1wbGVtZW50ZWQgdXNpbmcgYW4NCidhc20gZ290byB3aXRoIG91dHB1dCcgLSBt
dWNoIGxpa2UgZ2V0X3VzZXIoKS4NCg0KVGhlbiB0aGUgdXNlIHdvdWxkIGJlOg0KCW1hc2tlZF9h
ZGRyZXNzID0gYWNjZXNzX29rKG1heWJlX2JhZF9hZGRyZXNzLCBzaXplLCBqdW1wX2xhYmVsKTsN
CndpdGggbGF0ZXIgdXNlciBhY2Nlc3NlcyB1c2luZyB0aGUgbWFza2VkX2FkZHJlc3MuDQoNCk9u
Y2UgeW91J3ZlIGRvbmUgdGhhdCBfX2dldF91c2VyKCkgZG9lc24ndCBuZWVkIHRvIGNvbnRhaW4g
YWRkcmVzcyBtYXNraW5nLg0KDQpHaXZlbiB0aGF0IGNsYWMvc3RhYyBpYXJlIHNvIHNsb3cgc2hv
dWxkIHRoZXJlIGFyZSBiZSBzb21ldGhpbmcgdGhhdA0KY29tYmluZXMgc3RhYyB3aXRoIGFjY2Vz
c19vaygpIGJyYWNrZXRlZCB3aXRoIGEgJ3VzZXJfYWNjZXNzX2VuZCcNCm9yIGFuIGFjdHVhbCBm
YXVsdC4NCg0KSSd2ZSBzdXJlIHRoZXJlIGlzIGNvZGUgKG1heWJlIHJlYWRpbmcgaW92ZWNbXSBv
ciBpbiBzeXNfcG9sbCgpKQ0KdGhhdCB3YW50cyB0byBkbyBtdWx0aXBsZSBnZXQvcHV0X3VzZXIg
aW4gYSBzaG9ydCBsb29wIHJhdGhlciB0aGF0DQpjYWxsaW5nIGNvcHlfdG8vZnJvbV91c2VyKCku
DQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9h
ZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBO
bzogMTM5NzM4NiAoV2FsZXMpDQo=


