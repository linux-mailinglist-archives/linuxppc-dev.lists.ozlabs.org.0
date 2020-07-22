Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E3888228F25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 06:27:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBMr41PhBzDqcV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:27:16 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=ZNbOB3B3; 
 dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at bilbo;
 Wed, 22 Jul 2020 14:25:15 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBMnl57JyzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 14:25:15 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2BCE88011F;
 Wed, 22 Jul 2020 16:19:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1595391560;
 bh=Hh7WNPsS5JoNma82bp0sTkdc+G0ymDb0dhl+iwohdbQ=;
 h=From:To:CC:Subject:Date;
 b=ZNbOB3B3tfaoK2Z+WUEewc17Ubd7yZ79hqKAjhMom5cOijH67z8sd2ZCUINsj9hyc
 ++B20P0EGtYvmhPJvG7xAZp9LazveCl5qOO94F+0dItW3aWAm9m1GWLDMgG67MrjK1
 UEu13+K7Ub8U9bFpwxdedce0Pbh0ZAmqz1PVnKP1dE9yMweKu/QMI8Ij3Lj4Cye4I2
 mm+feZzxBDXnw4+qkZ1G/3rAfRzzwGxLNPOnv7ZE4WorKaVsEJLsYIuqVcmodIOvnx
 fyrWdSMsmh4hnR0RkneNtkmxl+kDht82xn/6q0IWdE4jtG+Q7kFBkYS9Kcd6jb37nw
 4dm9d8w7ijH9A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f17be440000>; Wed, 22 Jul 2020 16:19:20 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 22 Jul 2020 16:19:16 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 22 Jul 2020 16:19:16 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com"
 <frowand.list@gmail.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>
Subject: OF: Can't handle multiple dma-ranges with different offsets
Thread-Topic: Can't handle multiple dma-ranges with different offsets
Thread-Index: AQHWX99COSKGYTheAUmvWcrnzVaQaw==
Date: Wed, 22 Jul 2020 04:19:15 +0000
Message-ID: <5cb3aaa7-e05e-5fbc-db42-60e07acdaf05@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <38888D739A91544DBDA7EBEF6B8183B7@atlnz.lc>
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

SGksDQoNCkkndmUganVzdCBmaXJlZCB1cCBsaW51eCBrZXJuZWwgdjUuNyBvbiBhIHAyMDQwIGJh
c2VkIHN5c3RlbSBhbmQgSSdtIA0KZ2V0dGluZyB0aGUgZm9sbG93aW5nIG5ldyB3YXJuaW5nDQoN
Ck9GOiBDYW4ndCBoYW5kbGUgbXVsdGlwbGUgZG1hLXJhbmdlcyB3aXRoIGRpZmZlcmVudCBvZmZz
ZXRzIG9uIA0Kbm9kZSgvcGNpZUBmZmUyMDIwMDApDQpPRjogQ2FuJ3QgaGFuZGxlIG11bHRpcGxl
IGRtYS1yYW5nZXMgd2l0aCBkaWZmZXJlbnQgb2Zmc2V0cyBvbiANCm5vZGUoL3BjaWVAZmZlMjAy
MDAwKQ0KDQpUaGUgd2FybmluZyBpdHNlbGYgd2FzIGFkZGVkIGluIGNvbW1pdCA5ZDU1YmViZDk4
MTYgKCJvZi9hZGRyZXNzOiANClN1cHBvcnQgbXVsdGlwbGUgJ2RtYS1yYW5nZXMnIGVudHJpZXMi
KSBidXQgSSBnYXRoZXIgaXQncyBwb2ludGluZyBvdXQgDQpzb21ldGhpbmcgYWJvdXQgdGhlIGR0
cy4gTXkgYm9hcmRzIGR0cyBpcyBiYXNlZCBoZWF2aWx5IG9uIHAyMDQxcmRiLmR0cyANCmFuZCB0
aGUgcmVsZXZhbnQgcGNpMiBzZWN0aW9uIGlzIGlkZW50aWNhbCAocmVwcm9kdWNlZCBiZWxvdyBm
b3IgcmVmZXJlbmNlKS4NCg0KIMKgwqDCoCBwY2kyOiBwY2llQGZmZTIwMjAwMCB7DQogwqDCoMKg
IMKgwqDCoCByZWcgPSA8MHhmIDB4ZmUyMDIwMDAgMCAweDEwMDA+Ow0KIMKgwqDCoCDCoMKgwqAg
cmFuZ2VzID0gPDB4MDIwMDAwMDAgMCAweGUwMDAwMDAwIDB4YyAweDQwMDAwMDAwIDAgMHgyMDAw
MDAwMA0KIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIDB4MDEwMDAwMDAgMCAweDAwMDAwMDAwIDB4
ZiAweGY4MDIwMDAwIDAgMHgwMDAxMDAwMD47DQogwqDCoMKgIMKgwqDCoCBwY2llQDAgew0KIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIHJhbmdlcyA9IDwweDAyMDAwMDAwIDAgMHhlMDAwMDAwMA0KIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCAweDAyMDAwMDAwIDAgMHhlMDAwMDAwMA0KIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoCAwIDB4MjAwMDAwMDANCg0KIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoCAweDAxMDAwMDAwIDAgMHgwMDAwMDAwMA0KIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoCAweDAxMDAwMDAwIDAgMHgwMDAwMDAwMA0KIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoCAwIDB4MDAwMTAwMDA+Ow0KIMKgwqDCoCDCoMKgwqAgfTsNCiDC
oMKgwqAgfTsNCg0KSSBoYXZlbid0IG5vdGljZWQgYW55IGlsbCBlZmZlY3QgKGFzaWRlIGZyb20g
dGhlIHNjYXJ5IG1lc3NhZ2UpLiBJJ20gbm90IA0Kc3VyZSBpZiB0aGVyZSdzIHNvbWV0aGluZyBt
aXNzaW5nIGluIHRoZSBkdHMgb3IgaW4gdGhlIGNvZGUgdGhhdCBjaGVja3MgDQp0aGUgcmFuZ2Vz
LiBBbnkgZ3VpZGFuY2Ugd291bGQgYmUgYXBwcmVjaWF0ZWQuDQoNClRoYW5rcywNCkNocmlzDQo=
