Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6509033187D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 21:28:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvVJr2q4gz3cly
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 07:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=X0v/Cm6+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=X0v/Cm6+; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvVJQ1Mb0z30Jp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 07:27:33 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5B3F3806B5;
 Tue,  9 Mar 2021 09:27:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615235251;
 bh=Onrpr6MuDOllsC8Vd8il2kEwkyXgQ0Z8dtUPbT50kjI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=X0v/Cm6+HMVBJflFpnyK7E2951V4dmSemJemlO6wYL6f2242lw8iZ47QHwaXEnBX/
 lSleaA3N9XFNuPmPSMBZwybMMgAOX2PNrglKGBQ5ffiaK/UkNNlRmwIpCzUoAAHrqS
 LY5Vc0uAOGmts2dyz+r7ZecePgpYvFMj5xaezi8JWp6lbRfaMtfSLhYUnNlHVqCCGB
 z8sv70kK9uR/g7vUyLErEOgHMioyz432Y9BdFVb4oE6I2GUtJkTi2QymioKyaY5Bvp
 NBFYnleQ8STqq2dDRsrD09PcC5VfBO+h4YvJkJTTHtpX8vLocdtfVL9GyJV8hTNmK8
 1S96pjrEO08SQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B604688b30000>; Tue, 09 Mar 2021 09:27:31 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 09:27:31 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 9 Mar 2021 09:27:30 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEDagA=
Date: Mon, 8 Mar 2021 20:27:30 +0000
Message-ID: <d6074923-ee7e-4499-0e54-383a607d3c41@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
In-Reply-To: <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <1094CD31F910C44BA6BC32182082EAC5@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=VwQbUJbxAAAA:8 a=aQgbSj5FuRS31VXIRagA:9
 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=BPzZvq435JnGatEyYwdK:22
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiA4LzAzLzIxIDU6NTkgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDMvNy8yMSA4
OjM3IFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBbIC4uLiBdDQo+Pj4gVGhhdCdzIGZyb20g
LUVOWElPIHdoaWNoIGlzIHVzZWQgaW4gb25seSBvbmUgcGxhY2UgaW4gaTJjLW1wYy5jLiBJJ2xs
DQo+Pj4gZW5hYmxlIHNvbWUgZGVidWcgYW5kIHNlZSB3aGF0IHdlIGdldC4NCj4+IEZvciB0aGUg
ZXJyYW50IHJlYWRpbmdzIHRoZXJlIHdhcyBub3RoaW5nIGFibm9ybWFsIHJlcG9ydGVkIGJ5IHRo
ZSBkcml2ZXIuDQo+Pg0KPj4gRm9yIHRoZSAiTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcyIgSSBz
YXcgIm1wYy1pMmMgZmZlMTE5MDAwLmkyYzogTm8NCj4+IFJYQUsiIHdoaWNoIG1hdGNoZXMgdXAg
d2l0aCB0aGUgLUVOWElPIHJldHVybi4NCj4+DQo+IElkIHN1Z2dlc3QgdG8gY2hlY2sgdGhlIHRp
bWUgdW50aWwgbm90IGJ1c3kgYW5kIHN0b3AgaW4gbXBjX3hmZXIoKS4NCj4gVGhvc2UgaG90IGxv
b3BzIGFyZSB1bnVzdWFsLCBhbmQgbWF5IHdlbGwgbWVzcyB1cCB0aGUgY29kZSBlc3BlY2lhbGx5
DQo+IGlmIHByZWVtcHQgaXMgZW5hYmxlZC4gQWxzbywgYXJlIHlvdSB1c2luZyBpbnRlcnJ1cHRz
IG9yIHBvbGxpbmcgaW4NCj4geW91ciBzeXN0ZW0gPw0KSSdtIHVzaW5nIGludGVycnVwdHMgYnV0
IEkgc2VlIHRoZSBzYW1lIGlzc3VlIGlmIEkgY29tbWVudCBvdXQgdGhlIA0KaW50ZXJydXB0cyBp
biB0aGUgZHRzaSBmaWxlIChpLmUuIGZvcmNlIGl0IHRvIHVzZSBwb2xsaW5nKS4NCj4gVGhlIGlu
dGVycnVwdCBoYW5kbGVyIGxvb2tzIGEgYml0IG9kZCwgd2l0aCAiUmVhZCBhZ2Fpbg0KPiB0byBh
bGxvdyByZWdpc3RlciB0byBzdGFiaWxpc2UiLg0KDQpZZWFoIHRoYXQgc3R1Y2sgb3V0IHRvIG1l
IHRvby4gVGhlIGNvZGUgaW4gcXVlc3Rpb24gcHJlZGF0ZXMgZ2l0LCBJIHdlbnQgDQpzcGVsdW5r
aW5nIGluIGhpc3RvcnkuZ2l0IGFuZCB0aGUgIlJlYWQgYWdhaW4iIHNlZW1zIHRvIGJlIGluIHRo
ZSANCmluaXRpYWwgdmVyc2lvblswXS4gSSBkaWQgdHJ5IHRvIGFsdGVyIHRoZSBpbnRlcnJ1cHQg
aGFuZGxlciBzbyB0aGF0IGl0IA0Kb25seSBkb2VzIG9uZSByZWFkIGJ1dCB0aGF0IGRpZG4ndCBz
ZWVtIHRvIGNoYW5nZSBhbnl0aGluZy4NCg0KPiBEbyB5b3UgaGF2ZSBmc2wsdGltZW91dCBzZXQg
aW4gdGhlIGRldmljZXRyZWUgcHJvcGVydGllcyBhbmQsIGlmIHNvLA0KPiBoYXZlIHlvdSBwbGF5
ZWQgd2l0aCBpdCA/DQpIYXZlbid0IGdvdCBpdCBzZXQgYnV0IEknbGwgaGF2ZSBhIGdvIGF0IHR3
ZWFraW5nIGl0Lg0KPiBPdGhlciB0aGFuIHRoYXQsIHRoZSBvbmx5IG90aGVyIHJlYWwgaWRlYSBJ
IGhhdmUgd291bGQgYmUgdG8gbW9uaXRvcg0KPiB0aGUgaTJjIGJ1cy4NCkkgYW0gaW4gdGhlIGZv
cnR1bmF0ZSBwb3NpdGlvbiBvZiBiZWluZyBhYmxlIHRvIGdvIGludG8gdGhlIG9mZmljZSBhbmQg
DQpldmVuIGhhcHBlbiB0byBoYXZlIHRoZSBleHBlbnNpdmUgc2NvcGUgYXQgdGhlIG1vbWVudC4g
Tm93IEkganVzdCBuZWVkIA0KdG8gZmluZCBhIHRhbWUgSFcgZW5naW5lZXIgc28gSSBkb24ndCBi
dXJuIG15c2VsZiB0cnlpbmcgdG8gYXR0YWNoIHRoZSANCnByb2Jlcy4NCg0KLS0gDQoNClswXSAt
IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2hpc3Rvcnkv
aGlzdG9yeS5naXQvY29tbWl0Lz9pZD0xMWIzMjM1ZGMwNGEzMDZmNmE5YmExNGMxYWI2MjFiMmQ1
NGYyYzU2DQoNCg==
