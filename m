Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD14F6D9236
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 11:02:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psb9d3KC9z3fWy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 19:02:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Psb944Xxcz3cjN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 19:01:59 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-80-upD2WwgLO3ejICcwmG1kqw-1; Thu, 06 Apr 2023 10:01:53 +0100
X-MC-Unique: upD2WwgLO3ejICcwmG1kqw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 6 Apr
 2023 10:01:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 6 Apr 2023 10:01:23 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Uros Bizjak' <ubizjak@gmail.com>
Subject: RE: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Thread-Topic: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Thread-Index: AQHZZ9zo4aQfYkHe8kGrF8tSkNZCGa8d8QYA///04ICAABW6oA==
Date: Thu, 6 Apr 2023 09:01:23 +0000
Message-ID: <e464af64ef68488285b1ef3445cbed41@AcuMS.aculab.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
 <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
 <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
In-Reply-To: <CAFULd4YPM18B6Nv=-rNd=D0TmCbn64oLvgbDJ3CWc9DsdJG8gg@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, "x86@kernel.org" <x86@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard
 Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Namhyung
 Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Jiri Olsa <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogVXJvcyBCaXpqYWsNCj4gU2VudDogMDYgQXByaWwgMjAyMyAwOTozOQ0KPiANCj4gT24g
VGh1LCBBcHIgNiwgMjAyMyBhdCAxMDoyNuKAr0FNIERhdmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0
QGFjdWxhYi5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJvbTogRGF2ZSBIYW5zZW4NCj4gPiA+IFNl
bnQ6IDA1IEFwcmlsIDIwMjMgMTc6MzcNCj4gPiA+DQo+ID4gPiBPbiA0LzUvMjMgMDc6MTcsIFVy
b3MgQml6amFrIHdyb3RlOg0KPiA+ID4gPiBBZGQgZ2VuZXJpYyBhbmQgdGFyZ2V0IHNwZWNpZmlj
IHN1cHBvcnQgZm9yIGxvY2Fseyw2NH1fdHJ5X2NtcHhjaGcNCj4gPiA+ID4gYW5kIHdpcmUgdXAg
c3VwcG9ydCBmb3IgYWxsIHRhcmdldHMgdGhhdCB1c2UgbG9jYWxfdCBpbmZyYXN0cnVjdHVyZS4N
Cj4gPiA+DQo+ID4gPiBJIGZlZWwgbGlrZSBJJ20gbWlzc2luZyBzb21lIGNvbnRleHQuDQo+ID4g
Pg0KPiA+ID4gV2hhdCBhcmUgdGhlIGFjdHVhbCBlbmQgdXNlciB2aXNpYmxlIGVmZmVjdHMgb2Yg
dGhpcyBzZXJpZXM/ICBJcyB0aGVyZSBhDQo+ID4gPiBtZWFzdXJhYmxlIGRlY3JlYXNlIGluIHBl
cmYgb3ZlcmhlYWQ/ICBXaHkgZ28gdG8gYWxsIHRoaXMgdHJvdWJsZSBmb3INCj4gPiA+IHBlcmY/
ICBXaG8gZWxzZSB3aWxsIHVzZSBsb2NhbF90cnlfY21weGNoZygpPw0KPiA+DQo+ID4gSSdtIGFz
c3VtaW5nIHRoZSBsb2NhbF94eHggb3BlcmF0aW9ucyBvbmx5IGhhdmUgdG8gYmUgc2F2ZSB3cnQg
aW50ZXJydXB0cz8NCj4gPiBPbiB4ODYgaXQgaXMgcG9zc2libGUgdGhhdCBhbiBhbHRlcm5hdGUg
aW5zdHJ1Y3Rpb24gc2VxdWVuY2UNCj4gPiB0aGF0IGRvZXNuJ3QgdXNlIGEgbG9ja2VkIGluc3Ry
dWN0aW9uIG1heSBhY3R1YWxseSBiZSBmYXN0ZXIhDQo+IA0KPiBQbGVhc2Ugbm90ZSB0aGF0ICJs
b2NhbCIgZnVuY3Rpb25zIGRvIG5vdCB1c2UgbG9jayBwcmVmaXguIE9ubHkgYXRvbWljDQo+IHBy
b3BlcnRpZXMgb2YgY21weGNoZyBpbnN0cnVjdGlvbiBhcmUgZXhwbG9pdGVkIHNpbmNlIGl0IG9u
bHkgbmVlZHMgdG8NCj4gYmUgc2FmZSB3cnQgaW50ZXJydXB0cy4NCg0KR2FoLCBJIHdhcyBhc3N1
bWluZyB0aGF0IExPQ0sgd2FzIGltcGxpZWQgLSBsaWtlIGl0IGlzIGZvciB4Y2hnDQphbmQgYWxs
IHRoZSBiaXQgaW5zdHJ1Y3Rpb25zLg0KDQpJbiBhbnkgY2FzZSBJIHN1c3BlY3QgaXQgbWFrZXMg
bGl0dGxlIGRpZmZlcmVuY2UgdW5sZXNzIHRoZQ0KbG9ja2VkIHZhcmlhbnQgYWZmZWN0cyB0aGUg
aW5zdHJ1Y3Rpb24gcGlwZWxpbmUuDQpJbiBmYWN0LCB5b3UgbWF5IHdhbnQgdG8gc3RvcCB0aGUg
Y2FjaGVsaW5lIGJlaW5nIGludmFsaWRhdGVkDQpiZXR3ZWVuIHRoZSByZWFkIGFuZCB3cml0ZSBp
biBvcmRlciB0byBhdm9pZCBhbiBleHRyYSBjYWNoZQ0KbGluZSBib3VuY2UuDQoNCglEYXZpZA0K
DQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFy
bSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAo
V2FsZXMpDQo=

