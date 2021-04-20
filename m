Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFB366172
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 23:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPxM11hJpz30CT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:16:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=sRPFGNr8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=sRPFGNr8; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPxLW4Gjqz2y8N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 07:16:03 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 92252891AF;
 Wed, 21 Apr 2021 09:15:58 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1618953358;
 bh=9omGUyfXcvpuUaCvkBfHVzT27eX8S17+TXf6uVSRmZg=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=sRPFGNr8HiKr2/0dHEtZ/w/emOstKPoP1Wd2bJVEvTYSKmNAfbusbaFakLuT/UxdX
 jVy1KTyehXC5w4r5I2AshLV2tdZAN74yMpyJ9cQEOjPmu0JeHMCBCbfwVw+9Pkobf8
 UJoNsR2l+0fRADTy7IukE+7g0E2n3Dywts5JSQ6kNdMkBDSv9WyUmOgFLeVJQV7OMC
 JZcg/Q8TOPKudGM7l2xRnDLc0Y13XWHK2ezq8iEJJzJYyqJMmasWLxpmpHtjJMkgF5
 bo0DvuNUabu7fjgIH1wxZVEKZPIhRUx6LJjAdYZIa0mhQsk8vwS0eStAPHN2/xqHd2
 e0ZF47UI43Oxg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B607f448e0000>; Wed, 21 Apr 2021 09:15:58 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 21 Apr 2021 09:15:58 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Wed, 21 Apr 2021 09:15:58 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 2/2] powerpc/legacy_serial: Use early_ioremap()
Thread-Topic: [PATCH v2 2/2] powerpc/legacy_serial: Use early_ioremap()
Thread-Index: AQHXNem1uXmzjIM2eke3vtj53qg6QKq9H7eA
Date: Tue, 20 Apr 2021 21:15:57 +0000
Message-ID: <cb216c3f-1d88-b440-a43b-3a3fd9762c03@alliedtelesis.co.nz>
References: <0d51620eacf036d683d1a3c41328f69adb601dc0.1618925560.git.christophe.leroy@csgroup.eu>
 <103ed8ee9e5973c958ec1da2d0b0764f69395d01.1618925560.git.christophe.leroy@csgroup.eu>
In-Reply-To: <103ed8ee9e5973c958ec1da2d0b0764f69395d01.1618925560.git.christophe.leroy@csgroup.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5782ED46DA861E449C07ED8E340E25B5@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=B+jHL9lM c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=1UX6Do5GAAAA:8 a=nTHcy9k6DAHznPSci4YA:9
 a=QEXdDO2ut3YA:10 a=Et2XPkok5AAZYJIKzHr1:22
X-SEG-SpamProfiler-Score: 0
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQ2hyaXN0b3BoZSwNCg0KT24gMjEvMDQvMjEgMTozMiBhbSwgQ2hyaXN0b3BoZSBMZXJveSB3
cm90ZToNCj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+
DQo+DQo+IFsgICAgMC4wMDAwMDBdIGlvcmVtYXAoKSBjYWxsZWQgZWFybHkgZnJvbSBmaW5kX2xl
Z2FjeV9zZXJpYWxfcG9ydHMrMHgzY2MvMHg0NzQuIFVzZSBlYXJseV9pb3JlbWFwKCkgaW5zdGVh
ZA0KPg0KPiBmaW5kX2xlZ2FjeV9zZXJpYWxfcG9ydHMoKSBpcyBjYWxsZWQgZWFybHkgZnJvbSBz
ZXR1cF9hcmNoKCksIGJlZm9yZQ0KPiBwYWdpbmdfaW5pdCgpLiB2bWFsbG9jIGlzIG5vdCBhdmFp
bGFibGUgeWV0LCBpb3JlbWFwIHNob3VsZG4ndCBiZQ0KPiB1c2VkIHRoYXQgZWFybHkuDQo+DQo+
IFVzZSBlYXJseV9pb3JlbWFwKCkgYW5kIHN3aXRjaCB0byBhIHJlZ3VsYXIgaW9yZW1hcCgpIGxh
dGVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxl
cm95QGMtcy5mcj4NCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiAtLS0NCg0KSSBnYXZlIGl0IGEgc3BpbiBvbiBteSBUMjA4
MFJEQi4gVGhlIGVycm9yIG1lc3NhZ2UgaXMgZ29uZSBhbmQgSSBzdGlsbCANCmdldCBjb25zb2xl
IG91dHB1dC4NCg0KVGVzdGVkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGll
ZHRlbGVzaXMuY28ubno+DQoNCj4gICBhcmNoL3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwu
YyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQs
IDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9hcmNo
L3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYyBiL2FyY2gvcG93ZXJwYy9rZXJuZWwvbGVn
YWN5X3NlcmlhbC5jDQo+IGluZGV4IGYwNjFlMDZlOWY1MS4uOGIyYzFhODU1M2EwIDEwMDY0NA0K
PiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYw0KPiArKysgYi9hcmNo
L3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYw0KPiBAQCAtMTUsNiArMTUsNyBAQA0KPiAg
ICNpbmNsdWRlIDxhc20vdWRiZy5oPg0KPiAgICNpbmNsdWRlIDxhc20vcGNpLWJyaWRnZS5oPg0K
PiAgICNpbmNsdWRlIDxhc20vcHBjLXBjaS5oPg0KPiArI2luY2x1ZGUgPGFzbS9lYXJseV9pb3Jl
bWFwLmg+DQo+ICAgDQo+ICAgI3VuZGVmIERFQlVHDQo+ICAgDQo+IEBAIC0zNCw2ICszNSw3IEBA
IHN0YXRpYyBzdHJ1Y3QgbGVnYWN5X3NlcmlhbF9pbmZvIHsNCj4gICAJdW5zaWduZWQgaW50CQkJ
Y2xvY2s7DQo+ICAgCWludAkJCQlpcnFfY2hlY2tfcGFyZW50Ow0KPiAgIAlwaHlzX2FkZHJfdAkJ
CXRhZGRyOw0KPiArCXZvaWQgX19pb21lbQkJCSplYXJseV9hZGRyOw0KPiAgIH0gbGVnYWN5X3Nl
cmlhbF9pbmZvc1tNQVhfTEVHQUNZX1NFUklBTF9QT1JUU107DQo+ICAgDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbGVnYWN5X3NlcmlhbF9wYXJlbnRzW10gX19pbml0Y29u
c3QgPSB7DQo+IEBAIC0zMjUsMTcgKzMyNywxNiBAQCBzdGF0aWMgdm9pZCBfX2luaXQgc2V0dXBf
bGVnYWN5X3NlcmlhbF9jb25zb2xlKGludCBjb25zb2xlKQ0KPiAgIHsNCj4gICAJc3RydWN0IGxl
Z2FjeV9zZXJpYWxfaW5mbyAqaW5mbyA9ICZsZWdhY3lfc2VyaWFsX2luZm9zW2NvbnNvbGVdOw0K
PiAgIAlzdHJ1Y3QgcGxhdF9zZXJpYWw4MjUwX3BvcnQgKnBvcnQgPSAmbGVnYWN5X3NlcmlhbF9w
b3J0c1tjb25zb2xlXTsNCj4gLQl2b2lkIF9faW9tZW0gKmFkZHI7DQo+ICAgCXVuc2lnbmVkIGlu
dCBzdHJpZGU7DQo+ICAgDQo+ICAgCXN0cmlkZSA9IDEgPDwgcG9ydC0+cmVnc2hpZnQ7DQo+ICAg
DQo+ICAgCS8qIENoZWNrIGlmIGEgdHJhbnNsYXRlZCBNTUlPIGFkZHJlc3MgaGFzIGJlZW4gZm91
bmQgKi8NCj4gICAJaWYgKGluZm8tPnRhZGRyKSB7DQo+IC0JCWFkZHIgPSBpb3JlbWFwKGluZm8t
PnRhZGRyLCAweDEwMDApOw0KPiAtCQlpZiAoYWRkciA9PSBOVUxMKQ0KPiArCQlpbmZvLT5lYXJs
eV9hZGRyID0gZWFybHlfaW9yZW1hcChpbmZvLT50YWRkciwgMHgxMDAwKTsNCj4gKwkJaWYgKGlu
Zm8tPmVhcmx5X2FkZHIgPT0gTlVMTCkNCj4gICAJCQlyZXR1cm47DQo+IC0JCXVkYmdfdWFydF9p
bml0X21taW8oYWRkciwgc3RyaWRlKTsNCj4gKwkJdWRiZ191YXJ0X2luaXRfbW1pbyhpbmZvLT5l
YXJseV9hZGRyLCBzdHJpZGUpOw0KPiAgIAl9IGVsc2Ugew0KPiAgIAkJLyogQ2hlY2sgaWYgaXQn
cyBQSU8gYW5kIHdlIHN1cHBvcnQgdW50cmFuc2xhdGVkIFBJTyAqLw0KPiAgIAkJaWYgKHBvcnQt
PmlvdHlwZSA9PSBVUElPX1BPUlQgJiYgaXNhX2lvX3NwZWNpYWwpDQo+IEBAIC0zNTMsNiArMzU0
LDMwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9sZWdhY3lfc2VyaWFsX2NvbnNvbGUoaW50
IGNvbnNvbGUpDQo+ICAgCXVkYmdfdWFydF9zZXR1cChpbmZvLT5zcGVlZCwgaW5mby0+Y2xvY2sp
Ow0KPiAgIH0NCj4gICANCj4gK3N0YXRpYyBpbnQgX19pbml0IGlvcmVtYXBfbGVnYWN5X3Nlcmlh
bF9jb25zb2xlKHZvaWQpDQo+ICt7DQo+ICsJc3RydWN0IGxlZ2FjeV9zZXJpYWxfaW5mbyAqaW5m
byA9ICZsZWdhY3lfc2VyaWFsX2luZm9zW2xlZ2FjeV9zZXJpYWxfY29uc29sZV07DQo+ICsJc3Ry
dWN0IHBsYXRfc2VyaWFsODI1MF9wb3J0ICpwb3J0ID0gJmxlZ2FjeV9zZXJpYWxfcG9ydHNbbGVn
YWN5X3NlcmlhbF9jb25zb2xlXTsNCj4gKwl2b2lkIF9faW9tZW0gKnZhZGRyOw0KPiArDQo+ICsJ
aWYgKGxlZ2FjeV9zZXJpYWxfY29uc29sZSA8IDApDQo+ICsJCXJldHVybiAwOw0KPiArDQo+ICsJ
aWYgKCFpbmZvLT5lYXJseV9hZGRyKQ0KPiArCQlyZXR1cm4gMDsNCj4gKw0KPiArCXZhZGRyID0g
aW9yZW1hcChpbmZvLT50YWRkciwgMHgxMDAwKTsNCj4gKwlpZiAoV0FSTl9PTighdmFkZHIpKQ0K
PiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCXVkYmdfdWFydF9pbml0X21taW8odmFkZHIs
IDEgPDwgcG9ydC0+cmVnc2hpZnQpOw0KPiArCWVhcmx5X2lvdW5tYXAoaW5mby0+ZWFybHlfYWRk
ciwgMHgxMDAwKTsNCj4gKwlpbmZvLT5lYXJseV9hZGRyID0gTlVMTDsNCj4gKw0KPiArCXJldHVy
biAwOw0KPiArfQ0KPiArZWFybHlfaW5pdGNhbGwoaW9yZW1hcF9sZWdhY3lfc2VyaWFsX2NvbnNv
bGUpOw0KPiArDQo+ICAgLyoNCj4gICAgKiBUaGlzIGlzIGNhbGxlZCB2ZXJ5IGVhcmx5LCBhcyBw
YXJ0IG9mIHNldHVwX3N5c3RlbSgpIG9yIGV2ZW50dWFsbHkNCj4gICAgKiBzZXR1cF9hcmNoKCks
IGJhc2ljYWxseSBiZWZvcmUgYW55dGhpbmcgZWxzZSBpbiB0aGlzIGZpbGUuIFRoaXMgZnVuY3Rp
b24=
