Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D31325E6E8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 12:15:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bk9R83xCfzDqmf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Sep 2020 20:15:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bk9PQ40R3zDqck
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Sep 2020 20:14:00 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-188-1wY7cX1qPuWY8qP59j56kw-1; Sat, 05 Sep 2020 11:13:52 +0100
X-MC-Unique: 1wY7cX1qPuWY8qP59j56kw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 5 Sep 2020 11:13:52 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sat, 5 Sep 2020 11:13:52 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, 'Alexey Dobriyan'
 <adobriyan@gmail.com>, Ingo Molnar <mingo@kernel.org>
Subject: RE: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Topic: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Index: AQHWguUCiBf1LDvZDEmt0ea9xeMo3alY9jkQgACcEACAAEEf8A==
Date: Sat, 5 Sep 2020 10:13:51 +0000
Message-ID: <b9c82e868b7b4dbb97d2bb11de825887@AcuMS.aculab.com>
References: <20200903142242.925828-1-hch@lst.de>
 <20200904060024.GA2779810@gmail.com>
 <20200904175823.GA500051@localhost.localdomain>
 <63f3c9342a784a0890b3b641a71a8aa1@AcuMS.aculab.com>
 <4500d8d9-7318-4505-6086-2d2dc41f3866@csgroup.eu>
In-Reply-To: <4500d8d9-7318-4505-6086-2d2dc41f3866@csgroup.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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
 Kees Cook <keescook@chromium.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAwNSBTZXB0ZW1iZXIgMjAyMCAwODoxNg0K
PiANCj4gTGUgMDQvMDkvMjAyMCDDoCAyMzowMSwgRGF2aWQgTGFpZ2h0IGEgw6ljcml0wqA6DQo+
ID4gRnJvbTogQWxleGV5IERvYnJpeWFuDQo+ID4+IFNlbnQ6IDA0IFNlcHRlbWJlciAyMDIwIDE4
OjU4DQouLi4NCj4gPiBXaGF0IGlzIHRoaXMgc3RyYW5nZSAlZnMgcmVnaXN0ZXIgeW91IGFyZSB0
YWxraW5nIGFib3V0Lg0KPiA+IEZpZ3VyZSAyLTQgb25seSBoYXMgQ1MsIERTLCBTUyBhbmQgRVMu
DQo+ID4NCj4gDQo+IEludGVsIGFkZGVkIHJlZ2lzdGVycyBGUyBhbmQgR1MgaW4gdGhlIGkzODYN
Cg0KSSBrbm93LCBJJ3ZlIGdvdCBib3RoIHRoZSAnaUFQWCAyODYgUHJvZ3JhbW1lcidzIFJlZmVy
ZW5jZSBNYW51YWwnDQphbmQgdGhlICc4MDM4NiBQcm9ncmFtbWVyJ3MgUmVmZXJlbmNlIE1hbnVh
bCcgb24gbXkgc2hlbGYuDQoNCkkgZG9uJ3QgaGF2ZSB0aGUgODA4OCBib29rIHRob3VnaCAtIHdo
aWNoIEkgdXNlZCBpbiAxOTgyLg0KDQpUaGUgb2xkIGJvb2tzIGFyZSBhIGxvdCBlYXNpZXIgdG8g
cmVhZCBpZiwgZm9yIGluc3RhbmNlLA0KeW91IGFyZSB0cnlpbmcgdG8gd29yayBvdXQgaG93IHRv
IGJhY2sgYW5kIGZvcnRoIHRvIHJlYWwgbW9kZQ0KdG8gZG8gYmlvcyBjYWxscy4NCg0KCURhdmlk
DQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3VudCBG
YXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9uIE5vOiAxMzk3Mzg2
IChXYWxlcykNCg==

