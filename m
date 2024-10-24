Return-Path: <linuxppc-dev+bounces-2544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A9C9AE07C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 11:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZ0mc6rxTz2yDY;
	Thu, 24 Oct 2024 20:22:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.58.86.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729761728;
	cv=none; b=Bw6sqRm84+INIr6a3N/lsfXi4O6KVgJN/VpSsr1Aw0LgSXMD0FCRaBovn1UjJN1jvurFXjOWNzpA60LK2Zh3wyXkXVcXpcvJV43Z+RFEl9mbOpvSyanGMfBFwHYud84nP576OZlgFjQrnBcXYHoI8Ogdd1JvW0qj4g/f9vebYMgCTn1eqFrNqITojFeT4XoH+oIziwVbL6KwKh3BgLymJZ2G58lCyy4Mpz8fNfEGCzMt5vuk3ImFeGtBgRMYve1FTECwBukGWqARsWkLrNe9TJISZQRg7D/U4JU+gytr0z31ktPsBnC3+qTwrRKhuYj2M9RWhI4PSYvkfIegEpFl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729761728; c=relaxed/relaxed;
	bh=ot4w3c9hBKlBKby8ZYf/0ibdMapkWvbdHhmI2aM9mvU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 MIME-Version:Content-Type; b=Mlbq/lhD76zAFdU4n44Anlo2xSP6I8y/oVhz2RL/JE8sfLD981vyF5rDuE5gBL5yFqNjkRiVw5jcWe9jhVVrYooV5ywT95htFIgUr8L4IVfWuONE9aO4aRsKe1n2c8MoYvwLtIMwsHSuCbiY03RMlYCer60cMAR0pQVQqRB8JDuT6FIgb5wlpsc6+9v/FwDGib/gWNh/Bjb083grWP34AsiGSiUSTZB/L8aLwmfGSEVUfW7jtttXHTK8BscSFovCiBGeCDgqKU23kaSWTuz1skFASZBBkEA4A0p1XpxN5RiEJbjBB55mu4sB8qMYfsAEWAg7YgZfco/EIhrvIgTG9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM; spf=pass (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org) smtp.mailfrom=aculab.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=lists.ozlabs.org)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZ0mb17zHz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 20:22:05 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-149-T2Y4QON1NB2bSsVP32ehsQ-1; Thu, 24 Oct 2024 10:21:57 +0100
X-MC-Unique: T2Y4QON1NB2bSsVP32ehsQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 24 Oct
 2024 10:21:56 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 24 Oct 2024 10:21:56 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Linus Torvalds' <torvalds@linux-foundation.org>, Borislav Petkov
	<bp@alien8.de>
CC: Josh Poimboeuf <jpoimboe@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, "Kirill A. Shutemov" <kirill@shutemov.name>,
	"x86@kernel.org" <x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Waiman Long <longman@redhat.com>, "Dave
 Hansen" <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
	"Michael Ellerman" <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, Mark Rutland <mark.rutland@arm.com>
Subject: RE: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Topic: [PATCH] x86/uaccess: Avoid barrier_nospec() in copy_from_user()
Thread-Index: AQHbJYiO0jpEiXw2TU+KrR/vXcxF6bKVniVg
Date: Thu, 24 Oct 2024 09:21:56 +0000
Message-ID: <c40199a2a319440d89bfcc5c06ec4b3a@AcuMS.aculab.com>
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
In-Reply-To: <CAHk-=wjpE4hgOs0q7-jZ+=RsCD=YX9R=V3SCprzg0GOUQfCHNw@mail.gmail.com>
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

RnJvbTogTGludXMgVG9ydmFsZHMNCj4gU2VudDogMjMgT2N0b2JlciAyMDI0IDIxOjA4DQo+IA0K
PiBPbiBXZWQsIDIzIE9jdCAyMDI0IGF0IDEyOjE3LCBMaW51cyBUb3J2YWxkcw0KPiA8dG9ydmFs
ZHNAbGludXgtZm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gTk9URSEgVGhpcyBpcyBv
YnZpb3VzbHkgdW50ZXN0ZWQgYW5kIEkgZGlkbid0IGNoZWNrIHRoYXQgaXQgZG9lcyB0aGUNCj4g
PiBjbXAvc2JiL29yIHRoZSByaWdodCB3YXkgYXJvdW5kLg0KPiANCj4gV2VsbCwgaXQgYm9vdHMu
IFRoZSBjb2RlIGdlbmVyYXRpb24gKGZyb20gc3RybmNweV9mcm9tX3VzZXIoKSkgc2VlbXMgb2s6
DQo+IA0KPiAgICAgICBtb3ZhYnMgJDB4MTIzNDU2Nzg5YWJjZGVmLCVyY3gNCj4gICAgICAgY21w
ICAgICVyc2ksJXJjeA0KPiAgICAgICBzYmIgICAgJWVjeCwlZWN4DQo+ICAgICAgIG9yICAgICAl
cnNpLCVyY3gNCj4gDQo+IHdoZXJlIG9idmlvdXNseSB0aGF0IGNvbnN0YW50IGlzIHRoZSBib2d1
cyBwcmUtaW5pdGlhbGl6ZWQgdmFsdWUsIG5vdA0KPiB0aGUgYWN0dWFsIHJ1bnRpbWUgdmFsdWUu
DQoNCldvdWxkIGl0IGJlIGJldHRlciB0byBtYWtlIHRoZSAnYm9ndXMnIGNvbnN0YW50IG9uZSB0
aGF0IG1ha2VzDQphbGwgYWNjZXNzZXMgZmFpbD8NClNvIHlvdSBzb29uIGZpbmQgb3V0IGl0IGFu
eSBjb2RlIGRvZXNuJ3QgZ2V0IHBhdGNoZWQuDQoNCkkgYWxzbyB3b25kZXIgaG93IGJpZyB0aGUg
dGFibGUgb2YgYWRkcmVzc2VzIHRvIHBhdGNoIGlzLg0KSWYgdGhhdCBnZXRzIGludG8gaW5saW5l
ZCBmdW5jdGlvbnMgaXQgY291bGQgYmUgYmlnLg0KDQpPVE9IIGhhdmluZyBhIHJlYWwgZnVuY3Rp
b24gdGhhdCBkb2VzIGFjY2Vzc19vaygpLCBjbGFjIGFuZCBhZGRyZXNzDQptYXNraW5nIG1heSBu
b3QgcHJvYmxlbS4NCg0KRXNwZWNpYWxseSBpZiB0aGVyZSBpcyBhbHdheXMgYSAoUEFHRSBzaXpl
ZCkgZ2FwIGJldHdlZW4gdGhlIGhpZ2hlc3QNCnVzZXIgYWRkcmVzcyBhbmQgdGhlIGxvd2VzdCBr
ZXJuZWwgYWRkcmVzcyBzbyB0aGUgJ3NpemUnIGFyZ3VtZW50DQp0byBhY2Nlc3Nfb2soKSBjYW4g
YmUgaWdub3JlZCBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHRoZSBhY2Nlc3Nlcw0KYXJlIChyZWFz
b25hYmx5KSBsaW5lYXIuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNp
ZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsN
ClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=


