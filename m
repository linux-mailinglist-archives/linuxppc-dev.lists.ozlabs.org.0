Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A0F1AB6E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 06:38:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492mgh4mgxzDrKq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 14:38:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=pcXD9Q6+; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492mdW6MHZzDr6d
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 14:36:31 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E508580237;
 Thu, 16 Apr 2020 16:36:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1587011789;
 bh=iR/xLGd3DJPB2nXscwgT+ip6d4BcE/91XKQDr+QCjyQ=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=pcXD9Q6+gUnTrYIyro8LjCWQORQ9nC6vmw48uRveTqnVcRwc5hJVdPEVdWjBVlYby
 B3D1KNfrhYK9vDoToCjEMTr7452y5oubBw5Jr7lg/gBQgsE8A0artdXbEnnR94dbRy
 WDIn6NOeZ31U6pMvJaKgrea9g0fGNW0PwAV55to42PcBbzCQi3K1U0Cz6yHfe3S4DW
 zd6kkSRPzaxZBjmPsfOUMxk4NLa8mPjNiCikIRb9AEK2Rg4mctfVvPJ8OugyaKs5Lk
 6mOxN5OKNvzMLp4LX1uHcHVZzDyD7/LYB7040pA+Hm5Dq3s/d5nt3id77D4le9zCsR
 g5HDbilk4XN3Q==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e97e0ce0000>; Thu, 16 Apr 2020 16:36:30 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 16 Apr 2020 16:36:29 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 16 Apr 2020 16:36:29 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "oss@buserror.net"
 <oss@buserror.net>, "tglx@linutronix.de" <tglx@linutronix.de>
Subject: Re: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Thread-Topic: [PATCH v2] powerpc/setup_64: Set cache-line-size based on
 cache-block-size
Thread-Index: AQHWAlQjUst7lNY0iUusXBl8ThU16Kh6g10A
Date: Thu, 16 Apr 2020 04:36:29 +0000
Message-ID: <343c0e8b01ab74481e0b8dfbe588b1c84127a487.camel@alliedtelesis.co.nz>
References: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
 <20200325031854.7625-1-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20200325031854.7625-1-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <722C3DDA3A28BB468DAEE7EF8AD6C49F@atlnz.lc>
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpPbiBXZWQsIDIwMjAtMDMtMjUgYXQgMTY6MTggKzEzMDAsIENocmlzIFBhY2to
YW0gd3JvdGU6DQo+IElmIHtpLGR9LWNhY2hlLWJsb2NrLXNpemUgaXMgc2V0IGFuZCB7aSxkfS1j
YWNoZS1saW5lLXNpemUgaXMgbm90LA0KPiB1c2UNCj4gdGhlIGJsb2NrLXNpemUgdmFsdWUgZm9y
IGJvdGguIFBlciB0aGUgZGV2aWNldHJlZSBzcGVjIGNhY2hlLWxpbmUtDQo+IHNpemUNCj4gaXMg
b25seSBuZWVkZWQgaWYgaXQgZGlmZmVycyBmcm9tIHRoZSBibG9jayBzaXplLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNv
Lm56Pg0KPiAtLS0NCj4gSXQgbG9va3MgYXMgdGhvdWdoIHRoZSBic2l6ZXAgPSBsc2l6ZXAgaXMg
bm90IHJlcXVpcmVkIHBlciB0aGUgc3BlYw0KPiBidXQgaXQncw0KPiBwcm9iYWJseSBzYWZlciB0
byByZXRhaW4gaXQuDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIFNjb3R0IHBvaW50ZWQgb3V0
IHRoYXQgdS1ib290IHNob3VsZCBiZSBmaWxsaW5nIGluIHRoZSBjYWNoZQ0KPiBwcm9wZXJ0aWVz
DQo+ICAgKHdoaWNoIGl0IGRvZXMpLiBCdXQgaXQgZG9lcyBub3Qgc3BlY2lmeSBhIGNhY2hlLWxp
bmUtc2l6ZSBiZWNhdXNlDQo+IGl0DQo+ICAgcHJvdmlkZXMgYSBjYWNoZS1ibG9jay1zaXplIGFu
ZCB0aGUgc3BlYyBzYXlzIHlvdSBkb24ndCBoYXZlIHRvIGlmDQo+IHRoZXkgYXJlDQo+ICAgdGhl
IHNhbWUuIFNvIHRoZSBlcnJvciBpcyBpbiB0aGUgcGFyc2luZyBub3QgaW4gdGhlIGRldmljZXRy
ZWUNCj4gaXRzZWxmLg0KPiANCg0KUGluZz8gVGhpcyB0aHJlYWQgd2VudCBraW5kIG9mIHF1aWV0
Lg0KDQo+ICBhcmNoL3Bvd2VycGMva2VybmVsL3NldHVwXzY0LmMgfCAyICsrDQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L2tlcm5lbC9zZXR1cF82NC5jDQo+IGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1cF82NC5jDQo+
IGluZGV4IGUwNWU2ZGQ2N2FlNi4uZGQ4YTIzOGI1NGI4IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bv
d2VycGMva2VybmVsL3NldHVwXzY0LmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9zZXR1
cF82NC5jDQo+IEBAIC01MTYsNiArNTE2LDggQEAgc3RhdGljIGJvb2wgX19pbml0IHBhcnNlX2Nh
Y2hlX2luZm8oc3RydWN0DQo+IGRldmljZV9ub2RlICpucCwNCj4gIAlsc2l6ZXAgPSBvZl9nZXRf
cHJvcGVydHkobnAsIHByb3BuYW1lc1szXSwgTlVMTCk7DQo+ICAJaWYgKGJzaXplcCA9PSBOVUxM
KQ0KPiAgCQlic2l6ZXAgPSBsc2l6ZXA7DQo+ICsJaWYgKGxzaXplcCA9PSBOVUxMKQ0KPiArCQls
c2l6ZXAgPSBic2l6ZXA7DQo+ICAJaWYgKGxzaXplcCAhPSBOVUxMKQ0KPiAgCQlsc2l6ZSA9IGJl
MzJfdG9fY3B1KCpsc2l6ZXApOw0KPiAgCWlmIChic2l6ZXAgIT0gTlVMTCkNCg==
