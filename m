Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EDB57FC8D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 11:37:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lrw1N307Mz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 19:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrw0v096dz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 19:36:44 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-172-GO85KoGYOjODgFAl2lFN8g-1; Mon, 25 Jul 2022 10:36:37 +0100
X-MC-Unique: GO85KoGYOjODgFAl2lFN8g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.36; Mon, 25 Jul 2022 10:36:34 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.036; Mon, 25 Jul 2022 10:36:34 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jason A. Donenfeld'" <Jason@zx2c4.com>, Borislav Petkov <bp@suse.de>
Subject: RE: [PATCH v3] random: handle archrandom with multiple longs
Thread-Topic: [PATCH v3] random: handle archrandom with multiple longs
Thread-Index: AQHYoAilymPUWo/DTE6/vTfbMGZrFK2O06Jg
Date: Mon, 25 Jul 2022 09:36:34 +0000
Message-ID: <10561a841a7342c882aabb0fbdbfc762@AcuMS.aculab.com>
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com> <Yt5gBZe9F1BE0MVF@zn.tnic>
 <Yt5hwxC1xgvA8Asw@zx2c4.com>
In-Reply-To: <Yt5hwxC1xgvA8Asw@zx2c4.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Heiko Carstens <hca@linux.ibm.com>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li4uDQo+IE1vcmUgZGlyZWN0bHksIHRoZSByZWFzb24gd2UgZG9uJ3Qgd2FudCB0byBlcnJvciBp
cyBiZWNhdXNlIHRoZSB1c2UgY2FzZQ0KPiBoYXMgZmFsbGJhY2tzIG1lYW50IHRvIGhhbmRsZSBl
cnJvcnMuIFRoZSBjYXNjYWRlIGxvb2tzIGxpa2UgdGhpcw0KPiAocXVvdGluZyBmcm9tIHRoZSBv
dGhlciBlbWFpbCk6DQo+IA0KPiAgICAgdW5zaWduZWQgbG9uZyBhcnJheVt3aGF0ZXZlcl07DQo+
ICAgICBmb3IgKGkgPSAwOyBpIDwgQVJSQVlfU0laRShhcnJheSk7KSB7DQo+ICAgICAgICAgbG9u
Z3MgPSBhcmNoX2dldF9yYW5kb21fc2VlZF9sb25ncygmYXJyYXlbaV0sIEFSUkFZX1NJWkUoYXJy
YXkpIC0gaSk7DQo+ICAgICAgICAgaWYgKGxvbmdzKSB7DQo+ICAgICAgICAgICAgIGkgKz0gbG9u
Z3M7DQo+ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBsb25n
cyA9IGFyY2hfZ2V0X3JhbmRvbV9sb25ncygmYXJyYXlbaV0sIEFSUkFZX1NJWkUoYXJyYXkpIC0g
aSk7DQo+ICAgICAgICAgaWYgKGxvbmdzKSB7DQo+ICAgICAgICAgICAgIGkgKz0gbG9uZ3M7DQo+
ICAgICAgICAgICAgIGNvbnRpbnVlOw0KPiAgICAgICAgIH0NCj4gICAgICAgICBhcnJheVtpKytd
ID0gcmFuZG9tX2dldF9lbnRyb3B5KCk7DQo+ICAgICB9DQo+IA0KPiBJdCB0cmllcyB0byBnZXQg
dGhlIGJlc3QgdGhhdCBpdCBjYW4gYXMgbXVjaCBhcyBpdCBjYW4sIGJ1dCBpc24ndCBnb2luZw0K
PiB0byBibG9jayBvciBkbyBhbnl0aGluZyB0b28gbnV0cyBmb3IgdGhhdC4NCg0KRG8geW91IHJl
YWxseSB3YW50IHRvIHJldHJ5IHRoZSBlYXJsaWVyIGNhbGxzIHRoYXQgcmV0dXJuZWQgbm8gZGF0
YT8NCg0KCURhdmlkDQoNCi0NClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBS
b2FkLCBNb3VudCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSw0KUmVnaXN0cmF0aW9u
IE5vOiAxMzk3Mzg2IChXYWxlcykNCg==

