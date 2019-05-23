Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB8283A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 18:31:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458w4K718JzDqZL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 02:31:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aculab.com
 (client-ip=207.82.80.151; helo=eu-smtp-delivery-151.mimecast.com;
 envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458w2T2nlgzDqTj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 02:29:50 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-124-k_tmI2M6OK6o6fWSJ4SZFw-1; Thu, 23 May 2019 17:29:45 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 23 May 2019 17:29:44 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 23 May 2019 17:29:44 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Konstantin Khlebnikov' <khlebnikov@yandex-team.ru>, Christian Brauner
 <christian@brauner.io>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>,
 "fweimer@redhat.com" <fweimer@redhat.com>
Subject: RE: [PATCH v1 1/2] open: add close_range()
Thread-Topic: [PATCH v1 1/2] open: add close_range()
Thread-Index: AQHVEYO6ZYKDwRYmH0ewnJkZ6B6UzqZ45dMA
Date: Thu, 23 May 2019 16:29:44 +0000
Message-ID: <5e57c26cb7044b69acd3846ac474b5d5@AcuMS.aculab.com>
References: <20190522155259.11174-1-christian@brauner.io>
 <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
In-Reply-To: <67e4458a-9cc4-d1aa-608c-73ebe9e2f7a3@yandex-team.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: k_tmI2M6OK6o6fWSJ4SZFw-1
X-Mimecast-Spam-Score: 0
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "ldv@altlinux.org" <ldv@altlinux.org>,
 "dhowells@redhat.com" <dhowells@redhat.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "shuah@kernel.org" <shuah@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "miklos@szeredi.hu" <miklos@szeredi.hu>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "tkjos@android.com" <tkjos@android.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "jannh@google.com" <jannh@google.com>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "oleg@redhat.com" <oleg@redhat.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogIEtvbnN0YW50aW4gS2hsZWJuaWtvdg0KPiBTZW50OiAyMyBNYXkgMjAxOSAxNzoyMg0K
Li4uLg0KPiAgPiBJbiBhZGRpdGlvbiwgdGhlIHN5c2NhbGwgd2lsbCBhbHNvIHdvcmsgZm9yIHRh
c2tzIHRoYXQgZG8gbm90IGhhdmUgcHJvY2ZzDQo+ICA+IG1vdW50ZWQgYW5kIG9uIGtlcm5lbHMg
dGhhdCBkbyBub3QgaGF2ZSBwcm9jZnMgc3VwcG9ydCBjb21waWxlZCBpbi4gSW4gc3VjaA0KPiAg
PiBzaXR1YXRpb25zIHRoZSBvbmx5IHdheSB0byBtYWtlIHN1cmUgdGhhdCBhbGwgZmlsZSBkZXNj
cmlwdG9ycyBhcmUgY2xvc2VkDQo+ICA+IGlzIHRvIGNhbGwgY2xvc2UoKSBvbiBlYWNoIGZpbGUg
ZGVzY3JpcHRvciB1cCB0byBVSU5UX01BWCBvciBSTElNSVRfTk9GSUxFLA0KPiAgPiBPUEVOX01B
WCB0cmlja2VyeSAoY2YuIGNvbW1lbnQgWzhdIG9uIFJ1c3QpLg0KDQpDb2RlIHVzaW5nIFJMSU1J
VF9OT0ZJTEUgaXMgYnJva2VuLg0KSXQgaXMgZWFzeSB0byByZWR1Y2UgdGhlIGhhcmQgbGltaXQg
YmVsb3cgdGhhdCBvZiBhbiBvcGVuIGZkLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRy
ZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1L
MSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

