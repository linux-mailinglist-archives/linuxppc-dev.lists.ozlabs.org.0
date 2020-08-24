Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFA1250B61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 00:05:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bb5ly7539zDqPf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Aug 2020 08:05:34 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=MaJoeaUQ; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bb5kG6JplzDqNX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Aug 2020 08:04:06 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6388B8011F;
 Tue, 25 Aug 2020 10:04:01 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1598306641;
 bh=O4tL59CfzophAHBP2HRgjnG4EUuPz+WDgh5IAN9vmBU=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=MaJoeaUQ0xPRDUZPHX4NO2DiRvejGj2IAtHiGRUTctQcoT/y1Ko6XDZtFxq2gbhGr
 jnufTiRwdYZjP8AjIQ8Gt+QSYOZE0q75TRUDW32IKouSq+7SRQ8X2SZZ1Je9i1goan
 qqKRg1mBIZNHjSiTgKLEnc2s2s63TlRRg/3ULiOljtMzBhvSxycYfAeR/Uob0r/pnl
 3q1cswmjGWtIqUgstC+l12ZmsZy7kXIDRmTeW6mOBQ+inXvfEVGquk5QIxTRQW+gwI
 K0yPthhTZkYauSL3gYojlmC/WhkVdNc9KuprTp+6c15lXbhVtbacA6Nu7wXFqwgGbf
 XxIN6bQbyi9lQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4439510000>; Tue, 25 Aug 2020 10:04:01 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 25 Aug 2020 10:04:01 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 25 Aug 2020 10:04:01 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "tiago.brusamarello@datacom.ind.br"
 <tiago.brusamarello@datacom.ind.br>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAA==
Date: Mon, 24 Aug 2020 22:04:00 +0000
Message-ID: <c2dadf51-666f-72f6-7687-731f281ed7d6@alliedtelesis.co.nz>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
 <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
 <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
 <1bbb3726-b0a4-6eb9-9076-706b06dfb90f@alliedtelesis.co.nz>
 <61bb9800-9f90-9cd4-3b17-c14a7f83d792@gmail.com>
 <0ff80ebb-e6ae-d8e1-9f0d-8759b2556141@alliedtelesis.co.nz>
In-Reply-To: <0ff80ebb-e6ae-d8e1-9f0d-8759b2556141@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <682DD343E6DEBC47B224BD1B9BDB5105@atlnz.lc>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAyMC8wOC8yMCA5OjA4IGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiAxOS8w
OC8yMCA2OjE1IHBtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+PiBPbiAxOS4wOC4yMDIwIDAw
OjQ0LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+IEhpIEFnYWluLA0KPj4+DQo+Pj4gT24gMTcv
MDgvMjAgOTowOSBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+Pg0KPj4+PiBPbiAxNC8wOC8y
MCA2OjE5IHBtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+Pj4+PiBPbiAxNC4wOC4yMDIwIDA0
OjQ4LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+Pj4+IEhpLA0KPj4+Pj4+DQo+Pj4+Pj4gSSdt
IHNlZWluZyBhIHByb2JsZW0gd2l0aCBhY2Nlc3Npbmcgc3BpLW5vciBhZnRlciB1cGdyYWRpbmcg
YSBUMjA4MQ0KPj4+Pj4+IGJhc2VkIHN5c3RlbSB0byBsaW51eCB2NS43LjE1DQo+Pj4+Pj4NCj4+
Pj4+PiBGb3IgdGhpcyBib2FyZCB1LWJvb3QgYW5kIHRoZSB1LWJvb3QgZW52aXJvbm1lbnQgbGl2
ZSBvbiBzcGktbm9yLg0KPj4+Pj4+DQo+Pj4+Pj4gV2hlbiBJIHVzZSBmd19zZXRlbnYgZnJvbSB1
c2Vyc3BhY2UgSSBnZXQgdGhlIGZvbGxvd2luZyBrZXJuZWwgbG9ncw0KPj4+Pj4+DQo+Pj4+Pj4g
IyBmd19zZXRlbnYgZm9vPTENCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2Zl
ciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+IGZzbF9l
c3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCEN
Cj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RP
TiBpc24ndCBzZXQhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9u
ZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+PiBmc2xfZXNwaSBm
ZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+
Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNu
J3Qgc2V0IQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFu
c2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEw
MDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+IGZz
bF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNl
dCENCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElF
X0RPTiBpc24ndCBzZXQhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIg
ZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4g
ZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0K
Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZp
Zm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9S
WENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4gZnNs
X2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+
Pj4+IC4uLg0KPj4+Pj4+DQo+Pj4+PiBUaGlzIGVycm9yIHJlcG9ydGluZyBkb2Vzbid0IGV4aXN0
IHlldCBpbiA0LjQuIFNvIHlvdSBtYXkgaGF2ZSBhbiANCj4+Pj4+IGlzc3VlDQo+Pj4+PiB1bmRl
ciA0LjQgdG9vLCBpdCdzIGp1c3Qgbm90IHJlcG9ydGVkLg0KPj4+Pj4gRGlkIHlvdSB2ZXJpZnkg
dGhhdCB1bmRlciA0LjQgZndfc2V0ZW52IGFjdHVhbGx5IGhhcyBhbiBlZmZlY3Q/DQo+Pj4+IEp1
c3QgZG91YmxlIGNoZWNrZWQgYW5kIHllcyB1bmRlciA0LjQgdGhlIHNldHRpbmcgZG9lcyBnZXQg
c2F2ZWQuDQo+Pj4+Pj4gSWYgSSBydW4gZndfcHJpbnRlbnYgKGJlZm9yZSBnZXR0aW5nIGl0IGlu
dG8gYSBiYWQgc3RhdGUpIGl0IGlzIA0KPj4+Pj4+IGFibGUgdG8NCj4+Pj4+PiBkaXNwbGF5IHRo
ZSBjb250ZW50IG9mIHRoZSBib2FyZHMgdS1ib290IGVudmlyb25tZW50Lg0KPj4+Pj4+DQo+Pj4+
PiBUaGlzIG1pZ2h0IGluZGljYXRlIGFuIGlzc3VlIHdpdGggc3BpIGJlaW5nIGxvY2tlZC4gSSd2
ZSBzZWVuIHJlbGF0ZWQNCj4+Pj4+IHF1ZXN0aW9ucywganVzdCB1c2UgdGhlIHNlYXJjaCBlbmdp
bmUgb2YgeW91ciBjaG9pY2UgYW5kIGNoZWNrIGZvcg0KPj4+Pj4gZndfc2V0ZW52IGFuZCBsb2Nr
ZWQuDQo+Pj4+IEknbSBydW5uaW5nIGEgdmVyc2lvbiBvZiBmd19zZXRlbnYgd2hpY2ggaW5jbHVk
ZXMNCj4+Pj4gaHR0cHM6Ly9naXRsYWIuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0L2Ri
ODIwMTU5IHNvIGl0IHNob3VsZG4ndA0KPj4+PiBiZSBsb2NraW5nIHRoaW5ncyB1bm5lY2Vzc2Fy
aWx5Lg0KPj4+Pj4+IElmIGJlZW4gdW5zdWNjZXNzZnVsIGluIHByb2R1Y2luZyBhIHNldHVwIGZv
ciBiaXNlY3RpbmcgdGhlIA0KPj4+Pj4+IGlzc3VlLiBJIGRvDQo+Pj4+Pj4ga25vdyB0aGUgaXNz
dWUgZG9lc24ndCBvY2N1ciBvbiB0aGUgb2xkIDQuNC54IGJhc2VkIGtlcm5lbCBidXQgDQo+Pj4+
Pj4gdGhhdCdzDQo+Pj4+Pj4gcHJvYmFibHkgbm90IG11Y2ggaGVscC4NCj4+Pj4+Pg0KPj4+Pj4+
IEFueSBwb2ludGVycyBvbiB3aGF0IHRoZSBpc3N1ZSAoYW5kL29yIHNvbHV0aW9uKSBtaWdodCBi
ZS4NCj4+PiBJIGZpbmFsbHkgbWFuYWdlZCB0byBnZXQgb3VyIGJvYXJkIHJ1bm5pbmcgd2l0aCBh
IHZhbmlsbGEga2VybmVsLiBXaXRoDQo+Pj4gY29yZW5ldDY0X3NtcF9kZWZjb25maWcgSSBvY2Nh
c2lvbmFsbHkgc2VlDQo+Pj4NCj4+PiDCoCDCoCBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFu
c2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4NCj4+PiBvdGhlciB0aGFuIHRo
ZSBtZXNzYWdlIHRoaW5ncyBzZWVtIHRvIGJlIHdvcmtpbmcuDQo+Pj4NCj4+PiBXaXRoIGEgY3Vz
dG9tIGRlZmNvbmZpZyBJIHNlZQ0KPj4+DQo+Pj4gwqAgwqAgZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+IMKgIMKgIGZzbF9l
c3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3Qg
DQo+Pj4gZW1wdHkhDQo+Pj4gwqAgwqAgZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENO
VCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+IMKgIMKgIC4uLg0KPj4+DQo+Pj4gYW5kIGFjY2Vz
cyB0byB0aGUgc3BpLW5vciBkb2VzIG5vdCB3b3JrIHVudGlsIHRoZSBib2FyZCBpcyByZXNldC4N
Cj4+Pg0KPj4+IEknbGwgdHJ5IGFuZCBwaWNrIGFwYXJ0IHRoZSBkaWZmZXJlbmNlcyBiZXR3ZWVu
IHRoZSB0d28gZGVmY29uZmlncy4NCj4NCj4gSSBub3cgdGhpbmsgbXkgZWFybGllciB0ZXN0aW5n
IGlzIGludmFsaWQuIEkgaGF2ZSBzZWVuIHRoZSBwcm9ibGVtIA0KPiB3aXRoIGVpdGhlciBkZWZj
b25maWcgaWYgSSB0cnkgaGFyZCBlbm91Z2guIEkgaGFkIGNvbnZpbmNlZCBteXNlbGYgDQo+IHRo
YXQgdGhlIHByb2JsZW0gd2FzIENPTkZJR19QUkVFTVBUIGJ1dCB0aGF0IHdhcyBiZWZvcmUgSSBm
b3VuZCANCj4gYm9vdC10by1ib290IGRpZmZlcmVuY2VzIHdpdGggdGhlIHNhbWUga2VybmVsLg0K
Pg0KPiBJdCdzIHBvc3NpYmxlIHRoYXQgSSdtIGNoYXNpbmcgbXVsdGlwbGUgaXNzdWVzIHdpdGgg
dGhlIHNhbWUgc3ltcHRvbS4NCj4NCj4gVGhlIGVycm9yIEknbSBtb3N0IGNvbmNlcm5lZCB3aXRo
IGlzIGluIHRoZSBzZXF1ZW5jZQ0KPiAxLiBib290IHdpdGggb2xkIGltYWdlDQo+IDIuIHdyaXRl
IGVudmlyb25tZW50DQo+IDMuIGJvb3Qgd2l0aCBuZXcgaW1hZ2UNCj4gNC4gd3JpdGUgZW52aXJv
bm1lbnQNCj4gNS4gd3JpdGUgZmFpbHMgYW5kIGVudmlyb25tZW50IGlzIGNvcnJ1cHRlZA0KPg0K
PiBBZnRlciBJIHJlY292ZXIgdGhlIHN5c3RlbSB0aGluZ3Mgc29tZXRpbWVzIHNlZW0gZmluZS4g
VW50aWwgSSByZXBlYXQgDQo+IHRoZSBzZXF1ZW5jZSBhYm92ZS4NCj4NCj4+IEFsc28gcmVsZXZh
bnQgbWF5IGJlOg0KPj4gLSBXaGljaCBkdHMgYXJlIHlvdSB1c2luZz8NCj4gQ3VzdG9tIGJ1dCBi
YXNlZCBoZWF2aWx5IG9uIHRoZSB0MjA4MHJkYi4NCj4+IC0gV2hhdCdzIHRoZSBzcGktbm9yIHR5
cGUsIGFuZCBhdCB3aGljaCBmcmVxdWVuY3kgYXJlIHlvdSBvcGVyYXRpbmcgaXQ/DQo+IFRoZSBi
b2FyZCBoYXMgc2V2ZXJhbCBhbHRlcm5hdGUgcGFydHMgZm9yIHRoZSBzcGktbm9yIHNvIHRoZSBk
dHMganVzdCANCj4gc3BlY2lmaWVzIGNvbXBhdGlibGUgPSAiamVkZWMsc3BpLW5vciIgdGhlIGFj
dHVhbCBjaGlwIGRldGVjdGVkIG9uIHRoZSANCj4gYm9hcmQgSSBoYXZlIGlzICJuMjVxMDMyYSAo
NDA5NiBLYnl0ZXMpIi4gVGhlIGR0cyBzZXRzIA0KPiBzcGktbWF4LWZyZXF1ZW5jeSA9IDwxMDAw
MDAwMD4gSSBoYXZlbid0IG1lYXN1cmVkIHRoZSBhY3R1YWwgZnJlcXVlbmN5IA0KPiBvbiB0aGUg
YnVzLg0KPj4gLSBEb2VzIHRoZSBpc3N1ZSBzdGlsbCBoYXBwZW4gaWYgeW91IGxvd2VyIHRoZSBm
cmVxdWVuY3k/DQo+IEkgZGlkIHBsYXkgYXJvdW5kIHdpdGggdGhlIGZyZXF1ZW5jeSBpbml0aWFs
bHkgYnV0IEkgc2hvdWxkIHByb2JhYmx5IA0KPiBnaXZlIHRoYXQgYW5vdGhlciBnbyBub3cgdGhh
dCBJIGhhdmUgYSBiZXR0ZXIgcmVwcm9kdWN0aW9uIG1ldGhvZC4NCg0KUGxheWluZyBhcm91bmQg
d2l0aCB0aGUgZnJlcXVlbmN5IGRpZG4ndCBoZWxwLg0KDQpPbmUgdGhpbmcgdGhhdCBJJ3ZlIGZv
dW5kIGlzIHRoYXQgdGhlIHByb2JsZW0gYXBwZWFycyB0byBiZSB0aGF0IEkgZW5kIA0KdXAgd2l0
aCBleHRyYSBieXRlcyBpbiB0aGUgUlggRklGTy4gSWYgSSBhZGQgY29kZSB0byBkcmFpbiB0aGUg
UlggRklGTyANCnRoZW4gdGhlIHN5c3RlbSBpcyBhYmxlIHRvIGtlZXAgYWNjZXNzaW5nIHRoZSBz
cGktbm9yIChhbGJlaXQgd2l0aCBzb21lIA0Kbm9pc3kgbG9ncykuDQo=
