Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0234637B3AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 03:49:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfyQ40mlGz30B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 11:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=CjXJZl6h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=CjXJZl6h; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfyPW4lbHz2xtq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 11:48:47 +1000 (AEST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 918D2806B6;
 Wed, 12 May 2021 13:48:45 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1620784125;
 bh=uuxA4LSZSg+LwZ17l6DWUvJSeyjTCt7jIfAPEeeCQ+o=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=CjXJZl6hL/zkMshAJNwVGA/NxslWJD4sADJ/xu2tLNf0b6ZuSWBs7iTfOxUpDfwd/
 QDl9N6qIFoRp1E3Bc4n1ZCHWWUYDB18c986yMUFZhpV6M9MqWDacFhqLWVDHcRwnTc
 Ep9KX6KuuX9ohdQv3SHPF0cMMtn8BrxUYwsoqickSEeIjtR4lde20ykhd806c5D4Ds
 lAGOeeHjgeHbBtcmUk4r6GjINhufCLvoCZqAU1YhYamHl9CcrwxvEQoQF4h+uozZej
 p7zSIWIRmnEZdfgK/cmw7IAnPmIg+HSBidgtkydCGaTN3pCxIkkyYMgMKZFTrj+i5v
 GlEnCyIxoEMfg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B609b33fd0000>; Wed, 12 May 2021 13:48:45 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 12 May 2021 13:48:45 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.015; Wed, 12 May 2021 13:48:45 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>, "wsa@kernel.org" <wsa@kernel.org>, 
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Topic: [PATCH v3 0/4] P2040/P2041 i2c recovery erratum
Thread-Index: AQHXRquHhXA6XgnPF0OPgP79h3OVQ6reDlyAgAA9BAA=
Date: Wed, 12 May 2021 01:48:44 +0000
Message-ID: <ec3cdcc8-5869-9e7d-30c0-59ff4ec67a58@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
 <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
In-Reply-To: <b90f48cfdc31af08190e7a8eaa71b7bd488fcbaa.camel@infinera.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <78E91DEAC1AF2A4C95E04488B9A06EE2@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=5FLXtPjwQuUA:10 a=OLL_FvSJAAAA:8 a=VwQbUJbxAAAA:8
 a=EeMhvEcYAAAA:8 a=up2pu8ny1I2-pkm7klYA:9 a=QEXdDO2ut3YA:10 a=bjUCpL7yjoQA:10
 a=mm99ouWv1jwA:10 a=oIrB72frpwYPwTMnlWqB:22 a=AjGcO6oz07-iQ99wixmX:22
 a=X1EAwBm2vS_uL_oFwTEp:22
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAxMi8wNS8yMSAxMDoxMCBhbSwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gT24gV2Vk
LCAyMDIxLTA1LTEyIGF0IDA5OjIwICsxMjAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gVGhl
IFAyMDQwL1AyMDQxIGhhcyBhbiBlcnJhdHVtIHdoZXJlIHRoZSBpMmMgcmVjb3Zlcnkgc2NoZW1l
DQo+PiBkb2N1bWVudGVkIGluIHRoZSByZWZlcmVuY2UgbWFudWFsIChhbmQgY3VycmVudGx5IGlt
cGxlbWVudGVkDQo+PiBpbiB0aGUgaTJjLW1wYy5jIGRyaXZlcikgZG9lcyBub3Qgd29yay4gVGhl
IGVycmF0YSBkb2N1bWVudA0KPj4gcHJvdmlkZXMgYW4gYWx0ZXJuYXRpdmUgdGhhdCBkb2VzIHdv
cmsuIFRoaXMgc2VyaWVzIGltcGxlbWVudHMNCj4+IHRoYXQgYWx0ZXJuYXRpdmUgYW5kIHVzZXMg
YSBwcm9wZXJ0eSBpbiB0aGUgZGV2aWNldHJlZSB0bw0KPj4gZGVjaWRlIHdoZW4gdGhlIGFsdGVy
bmF0aXZlIG1lY2hhbmlzbSBpcyBuZWVkZWQuDQo+Pg0KPj4gQ2hyaXMgUGFja2hhbSAoNCk6DQo+
PiAgwqDCoGR0LWJpbmRpbmdzOiBpMmM6IG1wYzogQWRkIGZzbCxpMmMtZXJyYXR1bS1hMDA0NDQ3
IGZsYWcNCj4+ICDCoMKgcG93ZXJwYy9mc2w6IHNldCBmc2wsaTJjLWVycmF0dW0tYTAwNDQ0NyBm
bGFnIGZvciBQMjA0MSBpMmMNCj4+ICDCoMKgwqDCoGNvbnRyb2xsZXJzDQo+PiAgwqDCoHBvd2Vy
cGMvZnNsOiBzZXQgZnNsLGkyYy1lcnJhdHVtLWEwMDQ0NDcgZmxhZyBmb3IgUDEwMTAgaTJjDQo+
PiAgwqDCoMKgwqBjb250cm9sbGVycw0KPj4gIMKgwqBpMmM6IG1wYzogaW1wbGVtZW50IGVycmF0
dW0gQS0wMDQ0NDcgd29ya2Fyb3VuZA0KPj4NCj4+ICDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kyYy9pMmMtbXBjLnlhbWwgICAgICB8ICA3ICsrDQo+PiAgwqBhcmNoL3Bvd2VycGMvYm9vdC9k
dHMvZnNsL3AxMDEwc2ktcG9zdC5kdHNpICAgfCAgOCArKw0KPj4gIMKgYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL2ZzbC9wMjA0MXNpLXBvc3QuZHRzaSAgIHwgMTYgKysrKw0KPj4gIMKgZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1tcGMuYyAgICAgICAgICAgICAgICAgIHwgODEgKysrKysrKysrKysrKysr
KysrLQ0KPj4gIMKgNCBmaWxlcyBjaGFuZ2VkLCAxMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+DQo+IFRoaXMgbm93IHJlbWluZHMgbWUgYWJvdXQgdGhlIGN1cnJlbnQgSTJDIHJl
c2V0IHByb2NlZHVyZSwgaXQgZGlkbid0IHdvcmsgZm9yIHVzIGFuZCBJIGNhbWUgdXAgd2l0aCB0
aGlzIG9uZToNCj4gICAgaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbGludXgtaTJjL21z
ZzI5NDkwLmh0bWwNCj4gaXQgbmV2ZXIgZ290IGluIGJ1dCB3ZSBhcmUgc3RpbGwgdXNpbmcgaXQu
DQoNCkZvciB0aG9zZSByZWFkaW5nIGFsb25nIHRoZSB2MiBtZW50aW9uZWQgaW4gdGhhdCB0aHJl
YWQgd2FzIHBvc3RlZCBhcyANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWkyYy8yMDE3
MDUxMTEyMjAzMy4yMjQ3MS0xLWpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tLyANCnRoZXJl
IHdhcyBhIGJpdCBvZiBkaXNjdXNzaW9uIGJ1dCBpdCBzZWVtZWQgdG8gZGllIG91dCB3aXRob3V0
IHJlYWNoaW5nIA0KYSBjb25jbHVzaW9uLg0KDQpUaGUgaTJjLW1wYyBkcml2ZXIgaXMgbm93IHVz
aW5nIHRoZSBnZW5lcmljIHJlY292ZXJ5IG1lY2hhbmlzbSBzbyB0aGF0IA0KYWRkcmVzc2VzIG9u
ZSBiaXQgb2YgZmVlZGJhY2sgZnJvbSB0aGUgb3JpZ2luYWwgdGhyZWFkLg0KDQpJIGRvIHdvbmRl
ciBpZiB0aGUgcmVhc29uIHRoZSByZWNvdmVyeSB3YXNuJ3Qgd29ya2luZyBmb3IgeW91ciBjYXNl
IHdhcyANCmJlY2F1c2Ugb2YgdGhlIGVycmF0dW0uIERvIHlvdSBoYXBwZW4gdG8gcmVtZW1iZXIg
d2hpY2ggU29DIHlvdXIgaXNzdWUgDQp3YXMgb24/DQoNCkkndmUgYmVlbiBkb2luZyBteSByZWNl
bnQgd29yayB3aXRoIGEgUDIwNDAgYW5kIHByaW9yIHRvIHRoYXQgSSBkaWQgdGVzdCANCm91dCB0
aGUgcmVjb3Zlcnkgb24gYSBUMjA4MSAod2hpY2ggaXNuJ3QgZG9jdW1lbnRlZCB0byBoYXZlIHRo
aXMgDQplcnJhdHVtKSB3aGVuIEkgd2FzIHJlLXdvcmtpbmcgdGhlIGRyaXZlci4gVGhlICJuZXci
IHJlY292ZXJ5IGFjdHVhbGx5IA0Kc2VlbXMgYmV0dGVyIGJ1dCBJIGRvbid0IGhhdmUgYSByZWxp
YWJseSBmYXVsdHkgaTJjIGRldmljZSBzbyB0aGF0J3MgDQpvbmx5IGJhc2VkIG9uIG1lIHdyaXRp
bmcgc29tZSBjb2RlIHRvIG1hbnVhbGx5IHRyaWdnZXIgdGhlIHJlY292ZXJ5IA0KKHVzaW5nIHRo
ZSBzbmlwcGV0IGJlbG93KSBhbmQgb2JzZXJ2aW5nIGl0IHdpdGggYW4gb3NjaWxsb3Njb3BlLg0K
DQotLS04PC0tLQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYyBiL2Ry
aXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KaW5kZXggYzg1ZDY2MTg3MjNmLi44ZmE0MzYzNDE0
YmMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCisrKyBiL2RyaXZl
cnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KQEAgLTEyMTcsNiArMTIxNywyNSBAQCBuZXdfZGV2aWNl
X3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IA0KZGV2aWNlX2F0dHJpYnV0ZSAqYXR0
ciwNCiDCoH0NCiDCoHN0YXRpYyBERVZJQ0VfQVRUUl9XTyhuZXdfZGV2aWNlKTsNCg0KK3N0YXRp
YyBzc2l6ZV90IHJlY292ZXJfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgDQpkZXZp
Y2VfYXR0cmlidXRlICphdHRyLA0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25z
dCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkNCit7DQorwqDCoMKgwqDCoMKgIHN0cnVjdCBpMmNf
YWRhcHRlciAqYWRhcCA9IHRvX2kyY19hZGFwdGVyKGRldik7DQorwqDCoMKgwqDCoMKgIGludCBy
ZXQ7DQorDQorwqDCoMKgwqDCoMKgIGRldl9pbmZvKGRldiwgIlJlY292ZXJpbmcgYnVzXG4iKTsN
CisNCivCoMKgwqDCoMKgwqAgcmV0ID0gaTJjX3JlY292ZXJfYnVzKGFkYXApOw0KK8KgwqDCoMKg
wqDCoCBpZiAocmV0ID09IC1FT1BOT1RTVVBQKQ0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZGV2X2luZm8oZGV2LCAicmVjb3Zlcnkgbm90IHN1cHBvcnRlZFxuIik7DQorwqDCoMKgwqDC
oMKgIGVsc2UgaWYgKHJldCkNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIo
ZGV2LCAicmVjb3ZlcnkgZmFpbGVkICVkXG4iLCByZXQpOw0KKw0KK8KgwqDCoMKgwqDCoCByZXR1
cm4gY291bnQ7DQorfQ0KKw0KK3N0YXRpYyBERVZJQ0VfQVRUUl9XTyhyZWNvdmVyKTsNCisNCiDC
oC8qDQogwqAgKiBBbmQgb2YgY291cnNlIGxldCB0aGUgdXNlcnMgZGVsZXRlIHRoZSBkZXZpY2Vz
IHRoZXkgaW5zdGFudGlhdGVkLCBpZg0KIMKgICogdGhleSBnb3QgaXQgd3JvbmcuIFRoaXMgaW50
ZXJmYWNlIGNhbiBvbmx5IGJlIHVzZWQgdG8gZGVsZXRlIGRldmljZXMNCkBAIC0xMjc3LDYgKzEy
OTYsNyBAQCBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqaTJjX2FkYXB0ZXJfYXR0cnNbXSA9IHsN
CiDCoMKgwqDCoMKgwqDCoCAmZGV2X2F0dHJfbmFtZS5hdHRyLA0KIMKgwqDCoMKgwqDCoMKgICZk
ZXZfYXR0cl9uZXdfZGV2aWNlLmF0dHIsDQogwqDCoMKgwqDCoMKgwqAgJmRldl9hdHRyX2RlbGV0
ZV9kZXZpY2UuYXR0ciwNCivCoMKgwqDCoMKgwqAgJmRldl9hdHRyX3JlY292ZXIuYXR0ciwNCiDC
oMKgwqDCoMKgwqDCoCBOVUxMDQogwqB9Ow0KIMKgQVRUUklCVVRFX0dST1VQUyhpMmNfYWRhcHRl
cik7DQotLS04PC0tLQ0KDQo=
