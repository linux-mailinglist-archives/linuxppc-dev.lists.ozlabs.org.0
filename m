Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A02F96D917B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 10:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsZND4hVlz3fRY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 18:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.86.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsZMj15vnz3f7K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 18:26:06 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-83-D1tdxv4cNzaW0ds0adK_fQ-1; Thu, 06 Apr 2023 09:25:59 +0100
X-MC-Unique: D1tdxv4cNzaW0ds0adK_fQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 6 Apr
 2023 09:25:57 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 6 Apr 2023 09:25:57 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Dave Hansen' <dave.hansen@intel.com>, Uros Bizjak <ubizjak@gmail.com>,
	"linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
	"loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"x86@kernel.org" <x86@kernel.org>, "linux-arch@vger.kernel.org"
	<linux-arch@vger.kernel.org>, "linux-perf-users@vger.kernel.org"
	<linux-perf-users@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Thread-Topic: [PATCH v2 0/5] locking: Introduce local{,64}_try_cmpxchg
Thread-Index: AQHZZ9zo4aQfYkHe8kGrF8tSkNZCGa8d8QYA
Date: Thu, 6 Apr 2023 08:25:57 +0000
Message-ID: <5c10520ac747430cb421badcb293c706@AcuMS.aculab.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
In-Reply-To: <7360ffd2-a5aa-1373-8309-93e71ff36cbb@intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Peter
 Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, "H. Peter Anvin" <hpa@zytor.com>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Jun Yi <yijun@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung
 Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Jiri Olsa <jolsa@kernel.org>, Borislav Petkov <bp@alien8.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogRGF2ZSBIYW5zZW4NCj4gU2VudDogMDUgQXByaWwgMjAyMyAxNzozNw0KPiANCj4gT24g
NC81LzIzIDA3OjE3LCBVcm9zIEJpemphayB3cm90ZToNCj4gPiBBZGQgZ2VuZXJpYyBhbmQgdGFy
Z2V0IHNwZWNpZmljIHN1cHBvcnQgZm9yIGxvY2Fseyw2NH1fdHJ5X2NtcHhjaGcNCj4gPiBhbmQg
d2lyZSB1cCBzdXBwb3J0IGZvciBhbGwgdGFyZ2V0cyB0aGF0IHVzZSBsb2NhbF90IGluZnJhc3Ry
dWN0dXJlLg0KPiANCj4gSSBmZWVsIGxpa2UgSSdtIG1pc3Npbmcgc29tZSBjb250ZXh0Lg0KPiAN
Cj4gV2hhdCBhcmUgdGhlIGFjdHVhbCBlbmQgdXNlciB2aXNpYmxlIGVmZmVjdHMgb2YgdGhpcyBz
ZXJpZXM/ICBJcyB0aGVyZSBhDQo+IG1lYXN1cmFibGUgZGVjcmVhc2UgaW4gcGVyZiBvdmVyaGVh
ZD8gIFdoeSBnbyB0byBhbGwgdGhpcyB0cm91YmxlIGZvcg0KPiBwZXJmPyAgV2hvIGVsc2Ugd2ls
bCB1c2UgbG9jYWxfdHJ5X2NtcHhjaGcoKT8NCg0KSSdtIGFzc3VtaW5nIHRoZSBsb2NhbF94eHgg
b3BlcmF0aW9ucyBvbmx5IGhhdmUgdG8gYmUgc2F2ZSB3cnQgaW50ZXJydXB0cz8NCk9uIHg4NiBp
dCBpcyBwb3NzaWJsZSB0aGF0IGFuIGFsdGVybmF0ZSBpbnN0cnVjdGlvbiBzZXF1ZW5jZQ0KdGhh
dCBkb2Vzbid0IHVzZSBhIGxvY2tlZCBpbnN0cnVjdGlvbiBtYXkgYWN0dWFsbHkgYmUgZmFzdGVy
IQ0KDQpBbHRob3VnaCwgbWF5YmUsIGFueSBraW5kIG9mIGxvY2tlZCBjbXB4Y2hnIGp1c3QgbmVl
ZHMgdG8gZW5zdXJlDQp0aGUgY2FjaGUgbGluZSBpc24ndCAnc3RvbGVuJywgc28gYXBhcnQgZnJv
bSBwb3NzaWJsZSBzbGlnaHQNCmRlbGF5cyBvbiBhbm90aGVyIGNwdSB0aGF0IGdldHMgYSBjYWNo
ZSBtaXNzIGZvciB0aGUgbGluZSBpbg0KYWxsIG1ha2VzIGxpdHRsZSBkaWZmZXJlbmNlLg0KVGhl
IGNhY2hlIGxpbmUgbWlzcyBjb3N0cyBhIGxvdCBhbnl3YXksIGxpbmUgYm91bmNpbmcgbW9yZQ0K
YW5kIGlzIGJlc3QgYXZvaWRlZC4NClNvIGlzIHRoZXJlIGFjdHVhbGx5IG11Y2ggb2YgYSBiZW5l
Zml0IGF0IGFsbD8NCg0KQ2xlYXJseSB0aGUgdHJ5X2NtcHhjaGcgaGVscCAtIGJ1dCB0aGF0IGlz
IGEgZGlmZmVyZW50IGlzc3VlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExh
a2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQs
IFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

