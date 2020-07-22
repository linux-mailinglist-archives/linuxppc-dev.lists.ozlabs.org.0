Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FDD22A24E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 00:22:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBqhR2xqczDr41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 08:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=QBvO8ncC; 
 dkim-atps=neutral
X-Greylist: delayed 64311 seconds by postgrey-1.36 at bilbo;
 Thu, 23 Jul 2020 08:11:15 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBqRl5hMwzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 08:11:15 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9E7948011F;
 Thu, 23 Jul 2020 10:11:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1595455868;
 bh=uGLP8GFd1sLG0iTQ4kS9Znwic8dX4tEl85GOUOGN9+Q=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=QBvO8ncCMdrm6GJJfnE5nhz6ijI12eMF4aZVclDKnYVsXx4vAhPd5I8trfpG68qpz
 seKMzh9+Jxi+B8TTrW6st31UYImkTn5uLP/sQ/yAPB74/91W9jCRYYBylFlR69KK7r
 vKOuoj+/nhZDpjS5vp8qhz1hL4j5z7DwP82nWh582Uk3DAsRTQRicZ6TMBXKXRaAcB
 OrttJpU6AxU5SuNLjOhjrghxHauvN/YcT4J3HJ3uSFDvkuNYdHe0sPj176zdV9uTyd
 l8Ohc1lugq91257RAbO8W3lgcorGU+4waRr97E6QNGpYg6OeOckHq+9MVkKxLpELpx
 42mVZg4kQuvyg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f18b97c0000>; Thu, 23 Jul 2020 10:11:08 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 23 Jul 2020 10:11:08 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 23 Jul 2020 10:11:08 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com"
 <frowand.list@gmail.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>
Subject: Re: OF: Can't handle multiple dma-ranges with different offsets
Thread-Topic: OF: Can't handle multiple dma-ranges with different offsets
Thread-Index: AQHWX99COSKGYTheAUmvWcrnzVaQa6kTYRWA
Date: Wed, 22 Jul 2020 22:11:07 +0000
Message-ID: <961bc990-c815-1a19-c349-8b03065d5aab@alliedtelesis.co.nz>
References: <5cb3aaa7-e05e-5fbc-db42-60e07acdaf05@alliedtelesis.co.nz>
In-Reply-To: <5cb3aaa7-e05e-5fbc-db42-60e07acdaf05@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FA203FADBCA2084AAC80BAE92F8EA873@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAyMi8wNy8yMCA0OjE5IHBtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBIaSwNCj4NCj4g
SSd2ZSBqdXN0IGZpcmVkIHVwIGxpbnV4IGtlcm5lbCB2NS43IG9uIGEgcDIwNDAgYmFzZWQgc3lz
dGVtIGFuZCBJJ20gDQo+IGdldHRpbmcgdGhlIGZvbGxvd2luZyBuZXcgd2FybmluZw0KPg0KPiBP
RjogQ2FuJ3QgaGFuZGxlIG11bHRpcGxlIGRtYS1yYW5nZXMgd2l0aCBkaWZmZXJlbnQgb2Zmc2V0
cyBvbiANCj4gbm9kZSgvcGNpZUBmZmUyMDIwMDApDQo+IE9GOiBDYW4ndCBoYW5kbGUgbXVsdGlw
bGUgZG1hLXJhbmdlcyB3aXRoIGRpZmZlcmVudCBvZmZzZXRzIG9uIA0KPiBub2RlKC9wY2llQGZm
ZTIwMjAwMCkNCj4NCj4gVGhlIHdhcm5pbmcgaXRzZWxmIHdhcyBhZGRlZCBpbiBjb21taXQgOWQ1
NWJlYmQ5ODE2ICgib2YvYWRkcmVzczogDQo+IFN1cHBvcnQgbXVsdGlwbGUgJ2RtYS1yYW5nZXMn
IGVudHJpZXMiKSBidXQgSSBnYXRoZXIgaXQncyBwb2ludGluZyBvdXQgDQo+IHNvbWV0aGluZyBh
Ym91dCB0aGUgZHRzLiBNeSBib2FyZHMgZHRzIGlzIGJhc2VkIGhlYXZpbHkgb24gDQo+IHAyMDQx
cmRiLmR0cyBhbmQgdGhlIHJlbGV2YW50IHBjaTIgc2VjdGlvbiBpcyBpZGVudGljYWwgKHJlcHJv
ZHVjZWQgDQo+IGJlbG93IGZvciByZWZlcmVuY2UpLg0KPg0KPiDCoMKgwqAgcGNpMjogcGNpZUBm
ZmUyMDIwMDAgew0KPiDCoMKgwqAgwqDCoMKgIHJlZyA9IDwweGYgMHhmZTIwMjAwMCAwIDB4MTAw
MD47DQo+IMKgwqDCoCDCoMKgwqAgcmFuZ2VzID0gPDB4MDIwMDAwMDAgMCAweGUwMDAwMDAwIDB4
YyAweDQwMDAwMDAwIDAgMHgyMDAwMDAwMA0KPiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCAweDAx
MDAwMDAwIDAgMHgwMDAwMDAwMCAweGYgMHhmODAyMDAwMCAwIDB4MDAwMTAwMDA+Ow0KPiDCoMKg
wqAgwqDCoMKgIHBjaWVAMCB7DQo+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIHJhbmdlcyA9IDwweDAy
MDAwMDAwIDAgMHhlMDAwMDAwMA0KPiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAgMHgw
MjAwMDAwMCAwIDB4ZTAwMDAwMDANCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIDAg
MHgyMDAwMDAwMA0KPg0KPiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAgMHgwMTAwMDAw
MCAwIDB4MDAwMDAwMDANCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIDB4MDEwMDAw
MDAgMCAweDAwMDAwMDAwDQo+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCAwIDB4MDAw
MTAwMDA+Ow0KPiDCoMKgwqAgwqDCoMKgIH07DQo+IMKgwqDCoCB9Ow0KPg0KPiBJIGhhdmVuJ3Qg
bm90aWNlZCBhbnkgaWxsIGVmZmVjdCAoYXNpZGUgZnJvbSB0aGUgc2NhcnkgbWVzc2FnZSkuIEkn
bSANCj4gbm90IHN1cmUgaWYgdGhlcmUncyBzb21ldGhpbmcgbWlzc2luZyBpbiB0aGUgZHRzIG9y
IGluIHRoZSBjb2RlIHRoYXQgDQo+IGNoZWNrcyB0aGUgcmFuZ2VzLiBBbnkgZ3VpZGFuY2Ugd291
bGQgYmUgYXBwcmVjaWF0ZWQuDQoNCkkndmUgYWxzbyBqdXN0IGNoZWNrZWQgdGhlIFQyMDgwUkRC
IG9uIHY1LjcuOSB3aGljaCBzaG93cyBhIHNpbWlsYXIgaXNzdWUNCg0KT0Y6IENhbid0IGhhbmRs
ZSBtdWx0aXBsZSBkbWEtcmFuZ2VzIHdpdGggZGlmZmVyZW50IG9mZnNldHMgb24gDQpub2RlKC9w
Y2llQGZmZTI1MDAwMCkNCk9GOiBDYW4ndCBoYW5kbGUgbXVsdGlwbGUgZG1hLXJhbmdlcyB3aXRo
IGRpZmZlcmVudCBvZmZzZXRzIG9uIA0Kbm9kZSgvcGNpZUBmZmUyNTAwMDApDQpwY2llcG9ydCAw
MDAwOjAwOjAwLjA6IEludmFsaWQgc2l6ZSAweGZmZmZmOSBmb3IgZG1hLXJhbmdlDQpwY2llcG9y
dCAwMDAwOjAwOjAwLjA6IEFFUjogZW5hYmxlZCB3aXRoIElSUSAyMQ0KT0Y6IENhbid0IGhhbmRs
ZSBtdWx0aXBsZSBkbWEtcmFuZ2VzIHdpdGggZGlmZmVyZW50IG9mZnNldHMgb24gDQpub2RlKC9w
Y2llQGZmZTI3MDAwMCkNCk9GOiBDYW4ndCBoYW5kbGUgbXVsdGlwbGUgZG1hLXJhbmdlcyB3aXRo
IGRpZmZlcmVudCBvZmZzZXRzIG9uIA0Kbm9kZSgvcGNpZUBmZmUyNzAwMDApDQpwY2llcG9ydCAw
MDAxOjAwOjAwLjA6IEludmFsaWQgc2l6ZSAweGZmZmZmOSBmb3IgZG1hLXJhbmdlDQpwY2llcG9y
dCAwMDAxOjAwOjAwLjA6IEFFUjogZW5hYmxlZCB3aXRoIElSUSAyMw0KDQoNCg==
