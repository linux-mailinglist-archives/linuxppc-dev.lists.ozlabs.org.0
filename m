Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC72233C7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 02:12:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHnm253QwzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:12:34 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=MuQkom8S; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHnk86FsbzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 10:10:56 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5CE718011F;
 Fri, 31 Jul 2020 12:10:48 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1596154248;
 bh=SILlLM1AJBBx6qQtguNlv0JBTFdKxuApzErOnxfphPI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=MuQkom8SRfLg2qpex9zZDuejfMizujcn/KLBg7PONnn6YVCTRz7kbY/NgB63AiHtp
 k6UPy1p9H+bEe1M1NtaZlc26gLBQF26dd9g+BrVxtDcj4YrD4aD9ipB1jIK7NfI6SU
 etyL+e6wk9sAw0RDrJJZIHe+qhwaLjRdVrnSTcw8u3GZYsg7+KDicfAHQD0qykksO4
 Njd3eTY8vq746Kt+m39Y5W6zT+soI+yQZ/zGhqOnEywrb2pRbYxLZIqQpBPwnTbK9Z
 Uo/gHBQbHrLCfW49wtN/ZIE78GcFlgRO4J9o3O6daT71jdU0Cp6cFoEcC5khicra+u
 MDLDg+XBFjm2g==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f2361860000>; Fri, 31 Jul 2020 12:10:46 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 31 Jul 2020 12:10:47 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Fri, 31 Jul 2020 12:10:47 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "frowand.list@gmail.com"
 <frowand.list@gmail.com>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>
Subject: Re: OF: Can't handle multiple dma-ranges with different offsets
Thread-Topic: OF: Can't handle multiple dma-ranges with different offsets
Thread-Index: AQHWX99COSKGYTheAUmvWcrnzVaQa6kTYRWAgAy0FoA=
Date: Fri, 31 Jul 2020 00:10:47 +0000
Message-ID: <0fc927d8-2610-3948-fe15-7a7a38be2ccf@alliedtelesis.co.nz>
References: <5cb3aaa7-e05e-5fbc-db42-60e07acdaf05@alliedtelesis.co.nz>
 <961bc990-c815-1a19-c349-8b03065d5aab@alliedtelesis.co.nz>
In-Reply-To: <961bc990-c815-1a19-c349-8b03065d5aab@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <23755236B4410A4A8453EBD9327E9135@atlnz.lc>
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

DQpPbiAyMy8wNy8yMCAxMDoxMSBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4gT24gMjIv
MDcvMjAgNDoxOSBwbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEkndmUg
anVzdCBmaXJlZCB1cCBsaW51eCBrZXJuZWwgdjUuNyBvbiBhIHAyMDQwIGJhc2VkIHN5c3RlbSBh
bmQgSSdtIA0KPj4gZ2V0dGluZyB0aGUgZm9sbG93aW5nIG5ldyB3YXJuaW5nDQo+Pg0KPj4gT0Y6
IENhbid0IGhhbmRsZSBtdWx0aXBsZSBkbWEtcmFuZ2VzIHdpdGggZGlmZmVyZW50IG9mZnNldHMg
b24gDQo+PiBub2RlKC9wY2llQGZmZTIwMjAwMCkNCj4+IE9GOiBDYW4ndCBoYW5kbGUgbXVsdGlw
bGUgZG1hLXJhbmdlcyB3aXRoIGRpZmZlcmVudCBvZmZzZXRzIG9uIA0KPj4gbm9kZSgvcGNpZUBm
ZmUyMDIwMDApDQo+Pg0KPj4gVGhlIHdhcm5pbmcgaXRzZWxmIHdhcyBhZGRlZCBpbiBjb21taXQg
OWQ1NWJlYmQ5ODE2ICgib2YvYWRkcmVzczogDQo+PiBTdXBwb3J0IG11bHRpcGxlICdkbWEtcmFu
Z2VzJyBlbnRyaWVzIikgYnV0IEkgZ2F0aGVyIGl0J3MgcG9pbnRpbmcgDQo+PiBvdXQgc29tZXRo
aW5nIGFib3V0IHRoZSBkdHMuIE15IGJvYXJkcyBkdHMgaXMgYmFzZWQgaGVhdmlseSBvbiANCj4+
IHAyMDQxcmRiLmR0cyBhbmQgdGhlIHJlbGV2YW50IHBjaTIgc2VjdGlvbiBpcyBpZGVudGljYWwg
KHJlcHJvZHVjZWQgDQo+PiBiZWxvdyBmb3IgcmVmZXJlbmNlKS4NCj4+DQo+PiDCoMKgwqAgcGNp
MjogcGNpZUBmZmUyMDIwMDAgew0KPj4gwqDCoMKgIMKgwqDCoCByZWcgPSA8MHhmIDB4ZmUyMDIw
MDAgMCAweDEwMDA+Ow0KPj4gwqDCoMKgIMKgwqDCoCByYW5nZXMgPSA8MHgwMjAwMDAwMCAwIDB4
ZTAwMDAwMDAgMHhjIDB4NDAwMDAwMDAgMCAweDIwMDAwMDAwDQo+PiDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoCAweDAxMDAwMDAwIDAgMHgwMDAwMDAwMCAweGYgMHhmODAyMDAwMCAwIDB4MDAwMTAw
MDA+Ow0KPj4gwqDCoMKgIMKgwqDCoCBwY2llQDAgew0KPj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAg
cmFuZ2VzID0gPDB4MDIwMDAwMDAgMCAweGUwMDAwMDAwDQo+PiDCoMKgwqAgwqDCoMKgIMKgwqDC
oCDCoMKgwqAgwqAgMHgwMjAwMDAwMCAwIDB4ZTAwMDAwMDANCj4+IMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoCAwIDB4MjAwMDAwMDANCj4+DQo+PiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDC
oMKgwqAgwqAgMHgwMTAwMDAwMCAwIDB4MDAwMDAwMDANCj4+IMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoCAweDAxMDAwMDAwIDAgMHgwMDAwMDAwMA0KPj4gwqDCoMKgIMKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgIDAgMHgwMDAxMDAwMD47DQo+PiDCoMKgwqAgwqDCoMKgIH07DQo+PiDCoMKg
wqAgfTsNCj4+DQo+PiBJIGhhdmVuJ3Qgbm90aWNlZCBhbnkgaWxsIGVmZmVjdCAoYXNpZGUgZnJv
bSB0aGUgc2NhcnkgbWVzc2FnZSkuIEknbSANCj4+IG5vdCBzdXJlIGlmIHRoZXJlJ3Mgc29tZXRo
aW5nIG1pc3NpbmcgaW4gdGhlIGR0cyBvciBpbiB0aGUgY29kZSB0aGF0IA0KPj4gY2hlY2tzIHRo
ZSByYW5nZXMuIEFueSBndWlkYW5jZSB3b3VsZCBiZSBhcHByZWNpYXRlZC4NCj4NCj4gSSd2ZSBh
bHNvIGp1c3QgY2hlY2tlZCB0aGUgVDIwODBSREIgb24gdjUuNy45IHdoaWNoIHNob3dzIGEgc2lt
aWxhciBpc3N1ZQ0KPg0KPiBPRjogQ2FuJ3QgaGFuZGxlIG11bHRpcGxlIGRtYS1yYW5nZXMgd2l0
aCBkaWZmZXJlbnQgb2Zmc2V0cyBvbiANCj4gbm9kZSgvcGNpZUBmZmUyNTAwMDApDQo+IE9GOiBD
YW4ndCBoYW5kbGUgbXVsdGlwbGUgZG1hLXJhbmdlcyB3aXRoIGRpZmZlcmVudCBvZmZzZXRzIG9u
IA0KPiBub2RlKC9wY2llQGZmZTI1MDAwMCkNCj4gcGNpZXBvcnQgMDAwMDowMDowMC4wOiBJbnZh
bGlkIHNpemUgMHhmZmZmZjkgZm9yIGRtYS1yYW5nZQ0KPiBwY2llcG9ydCAwMDAwOjAwOjAwLjA6
IEFFUjogZW5hYmxlZCB3aXRoIElSUSAyMQ0KPiBPRjogQ2FuJ3QgaGFuZGxlIG11bHRpcGxlIGRt
YS1yYW5nZXMgd2l0aCBkaWZmZXJlbnQgb2Zmc2V0cyBvbiANCj4gbm9kZSgvcGNpZUBmZmUyNzAw
MDApDQo+IE9GOiBDYW4ndCBoYW5kbGUgbXVsdGlwbGUgZG1hLXJhbmdlcyB3aXRoIGRpZmZlcmVu
dCBvZmZzZXRzIG9uIA0KPiBub2RlKC9wY2llQGZmZTI3MDAwMCkNCj4gcGNpZXBvcnQgMDAwMTow
MDowMC4wOiBJbnZhbGlkIHNpemUgMHhmZmZmZjkgZm9yIGRtYS1yYW5nZQ0KPiBwY2llcG9ydCAw
MDAxOjAwOjAwLjA6IEFFUjogZW5hYmxlZCB3aXRoIElSUSAyMw0KDQpJJ3ZlIGJlZW4gZG9pbmcg
YSBiaXQgbW9yZSBkaWdnaW5nLiBUaGUgZG1hLXJhbmdlcyBwcm9wZXJ0eSBpcyBub3QgaW4gDQp0
aGUgZHRzL2R0Yi4gSXQncyBhY3R1YWxseSBpbnNlcnRlZCBieSB1LWJvb3QgdmlhIGZ0X2ZzbF9w
Y2lfc2V0dXAoKS4NCg0KSGVyZSdzIHNvbWUgb3V0cHV0IGZyb20gbXkgVDIwODBSREINCg0Kcm9v
dEBsaW51eGJveCB+XSMgeHhkIC1nNCANCi9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL3Bj
aWVAZmZlMjQwMDAwL2RtYS1yYW5nZXMNCjAwMDAwMDA6IDAyMDAwMDAwIDAwMDAwMDAwIGRmMDAw
MDA3IDAwMDAwMDBmwqAgLi4uLi4uLi4uLi4uLi4uLg0KMDAwMDAxMDogZmUwMDAwMDAgMDAwMDAw
MDAgMDBmZmZmZjkgNDIwMDAwMDDCoCAuLi4uLi4uLi4uLi5CLi4uDQowMDAwMDIwOiAwMDAwMDAw
MCAwMDAwMDAwMCAwMDAwMDAwMCAwMDAwMDAwMMKgIC4uLi4uLi4uLi4uLi4uLi4NCjAwMDAwMzA6
IDAwMDAwMDAwIGRmMDAwMDA3IDQzMDAwMDAwIDAwMDAwMDEwwqAgLi4uLi4uLi5DLi4uLi4uLg0K
MDAwMDA0MDogMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDAgMDAwMDAwMDHCoCAuLi4uLi4uLi4u
Li4uLi4uDQowMDAwMDUwOiAwMDAwMDAwMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC4uLi4NCg0KSSdtIHN0aWxsIHdvbmRlcmluZyBob3cg
YmVzdCB0byBkZWFsIHdpdGggdGhpcy4gSG9wZWZ1bGx5IHdpdGhvdXQgDQpuZWVkaW5nIHRvIGRl
cGxveSBhIHUtYm9vdCB1cGRhdGUuDQo=
