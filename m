Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA491B21E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 10:55:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452ZQY1XM7zDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:55:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aculab.com
 (client-ip=146.101.78.151; helo=eu-smtp-delivery-151.mimecast.com;
 envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ACULAB.COM
X-Greylist: delayed 75 seconds by postgrey-1.36 at bilbo;
 Mon, 13 May 2019 18:54:05 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [146.101.78.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452ZP95Cq8zDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 18:54:05 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-193-wJHPV_UlNTueMoK28eZKkA-1; Mon, 13 May 2019 09:52:42 +0100
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b::d117) by AcuMS.aculab.com
 (fd9f:af1c:a25b::d117) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon,
 13 May 2019 09:52:41 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Mon, 13 May 2019 09:52:41 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'christophe leroy' <christophe.leroy@c-s.fr>, Steven Rostedt
 <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>
Subject: RE: [PATCH] vsprintf: Do not break early boot with probing addresses
Thread-Topic: [PATCH] vsprintf: Do not break early boot with probing addresses
Thread-Index: AQHVB1bC/iTC8Q7sI0elwkZY5/gFJaZowlxw
Date: Mon, 13 May 2019 08:52:41 +0000
Message-ID: <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
In-Reply-To: <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-MC-Unique: wJHPV_UlNTueMoK28eZKkA-1
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Sergey
 Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Stephen
 Rothwell <sfr@ozlabs.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogY2hyaXN0b3BoZSBsZXJveQ0KPiBTZW50OiAxMCBNYXkgMjAxOSAxODozNQ0KPiBMZSAx
MC8wNS8yMDE5IMOgIDE4OjI0LCBTdGV2ZW4gUm9zdGVkdCBhIMOpY3JpdMKgOg0KPiA+IE9uIEZy
aSwgMTAgTWF5IDIwMTkgMTA6NDI6MTMgKzAyMDANCj4gPiBQZXRyIE1sYWRlayA8cG1sYWRla0Bz
dXNlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPj4gICBzdGF0aWMgY29uc3QgY2hhciAqY2hlY2tfcG9p
bnRlcl9tc2coY29uc3Qgdm9pZCAqcHRyKQ0KPiA+PiAgIHsNCj4gPj4gLQljaGFyIGJ5dGU7DQo+
ID4+IC0NCj4gPj4gICAJaWYgKCFwdHIpDQo+ID4+ICAgCQlyZXR1cm4gIihudWxsKSI7DQo+ID4+
DQo+ID4+IC0JaWYgKHByb2JlX2tlcm5lbF9hZGRyZXNzKHB0ciwgYnl0ZSkpDQo+ID4+ICsJaWYg
KCh1bnNpZ25lZCBsb25nKXB0ciA8IFBBR0VfU0laRSB8fCBJU19FUlJfVkFMVUUocHRyKSkNCj4g
Pj4gICAJCXJldHVybiAiKGVmYXVsdCkiOw0KDQoiZWZhdWx0IiBsb29rcyBhIGJpdCBsaWtlIGEg
c3BlbGxsaW5nIG1pc3Rha2UgZm9yICJkZWZhdWx0Ii4NCg0KPiA+IAk8IFBBR0VfU0laRSA/DQo+
ID4NCj4gPiBkbyB5b3UgbWVhbjogPCBUQVNLX1NJWkUgPw0KPiANCj4gSSBndWVzcyBub3QuDQo+
IA0KPiBVc3VhbGx5LCA8IFBBR0VfU0laRSBtZWFucyBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2Ug
KHZpYSB0aGUgbWVtYmVyIG9mIGENCj4gc3RydWN0KQ0KDQpNYXliZSB0aGUgY2FsbGVyIHNob3Vs
ZCBwYXNzIGluIGEgc2hvcnQgYnVmZmVyIHNvIHRoYXQgeW91IGNhbiByZXR1cm4NCiIoZXJyLSVk
KSIgb3IgIihudWxsKyUjeCkiID8NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBM
YWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBU
LCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

