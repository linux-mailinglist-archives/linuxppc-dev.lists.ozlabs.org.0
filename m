Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 521B924A83B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:11:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BX0nW5QmpzDqlg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 07:11:11 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=nCmM6FF3; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BX0l16sXkzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 07:09:01 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 6C3748066C;
 Thu, 20 Aug 2020 09:08:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1597871336;
 bh=DhSFEokBzjedBepUeHhLEEbWaOcWeTm875VFY7F6sKM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=nCmM6FF3Zfj9wN8buvVaaNNOh0X3KT12MSbWcabX9wwAGpGgzOPa/CUfl3PO6EqQH
 +0qGRtQy6rxUVeELa5uMP1PsgKb/+UNts9rjLWHR/xmb5WAtLcMLklPPBgEpmYAxx1
 f/83O2h1jUMlTaVG8COAR+Ge407zF+DMinOCei0GSj0OymUe7g8MMO7Iorme4MIJtM
 hvtmBZrJJ9XKiLb0r+jdovz/twrhVvSJkx2XPI5SlfqiXH1NW56sXm4gwZyfRkNpeb
 Q9nM8ueLFOu2iZKIfvkmFjgT9+94wFe5+DCMAXHQtr1oG7bWht78M3S3EV/V1tph3c
 TNHqEZLxrEFFQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f3d94e90000>; Thu, 20 Aug 2020 09:08:57 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 20 Aug 2020 09:08:56 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Thu, 20 Aug 2020 09:08:56 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "tiago.brusamarello@datacom.ind.br"
 <tiago.brusamarello@datacom.ind.br>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4A=
Date: Wed, 19 Aug 2020 21:08:55 +0000
Message-ID: <0ff80ebb-e6ae-d8e1-9f0d-8759b2556141@alliedtelesis.co.nz>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
 <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
 <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
 <1bbb3726-b0a4-6eb9-9076-706b06dfb90f@alliedtelesis.co.nz>
 <61bb9800-9f90-9cd4-3b17-c14a7f83d792@gmail.com>
In-Reply-To: <61bb9800-9f90-9cd4-3b17-c14a7f83d792@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A4E919F682F74946BCFC549E11F57A83@atlnz.lc>
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

DQpPbiAxOS8wOC8yMCA2OjE1IHBtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+IE9uIDE5LjA4
LjIwMjAgMDA6NDQsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBIaSBBZ2FpbiwNCj4+DQo+PiBP
biAxNy8wOC8yMCA5OjA5IGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4NCj4+PiBPbiAxNC8w
OC8yMCA2OjE5IHBtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+Pj4+IE9uIDE0LjA4LjIwMjAg
MDQ6NDgsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4+PiBIaSwNCj4+Pj4+DQo+Pj4+PiBJJ20g
c2VlaW5nIGEgcHJvYmxlbSB3aXRoIGFjY2Vzc2luZyBzcGktbm9yIGFmdGVyIHVwZ3JhZGluZyBh
IFQyMDgxDQo+Pj4+PiBiYXNlZCBzeXN0ZW0gdG8gbGludXggdjUuNy4xNQ0KPj4+Pj4NCj4+Pj4+
IEZvciB0aGlzIGJvYXJkIHUtYm9vdCBhbmQgdGhlIHUtYm9vdCBlbnZpcm9ubWVudCBsaXZlIG9u
IHNwaS1ub3IuDQo+Pj4+Pg0KPj4+Pj4gV2hlbiBJIHVzZSBmd19zZXRlbnYgZnJvbSB1c2Vyc3Bh
Y2UgSSBnZXQgdGhlIGZvbGxvd2luZyBrZXJuZWwgbG9ncw0KPj4+Pj4NCj4+Pj4+ICMgZndfc2V0
ZW52IGZvbz0xDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1
dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFu
c2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAw
MDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQh
DQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RP
TiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25l
IGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBU
cmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUx
MTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElF
X0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBk
b25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3Bp
OiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBm
ZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24n
dCBzZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBy
eC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTog
U1BJRV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngvdHggZmlmbydzIGFyZW4ndCBlbXB0eSENCj4+Pj4+
IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzIN
Cj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZp
Zm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JY
Q05UID0gMSwgU1BJRV9UWENOVCA9IDMyDQo+Pj4+PiAuLi4NCj4+Pj4+DQo+Pj4+IFRoaXMgZXJy
b3IgcmVwb3J0aW5nIGRvZXNuJ3QgZXhpc3QgeWV0IGluIDQuNC4gU28geW91IG1heSBoYXZlIGFu
IGlzc3VlDQo+Pj4+IHVuZGVyIDQuNCB0b28sIGl0J3MganVzdCBub3QgcmVwb3J0ZWQuDQo+Pj4+
IERpZCB5b3UgdmVyaWZ5IHRoYXQgdW5kZXIgNC40IGZ3X3NldGVudiBhY3R1YWxseSBoYXMgYW4g
ZWZmZWN0Pw0KPj4+IEp1c3QgZG91YmxlIGNoZWNrZWQgYW5kIHllcyB1bmRlciA0LjQgdGhlIHNl
dHRpbmcgZG9lcyBnZXQgc2F2ZWQuDQo+Pj4+PiBJZiBJIHJ1biBmd19wcmludGVudiAoYmVmb3Jl
IGdldHRpbmcgaXQgaW50byBhIGJhZCBzdGF0ZSkgaXQgaXMgYWJsZSB0bw0KPj4+Pj4gZGlzcGxh
eSB0aGUgY29udGVudCBvZiB0aGUgYm9hcmRzIHUtYm9vdCBlbnZpcm9ubWVudC4NCj4+Pj4+DQo+
Pj4+IFRoaXMgbWlnaHQgaW5kaWNhdGUgYW4gaXNzdWUgd2l0aCBzcGkgYmVpbmcgbG9ja2VkLiBJ
J3ZlIHNlZW4gcmVsYXRlZA0KPj4+PiBxdWVzdGlvbnMsIGp1c3QgdXNlIHRoZSBzZWFyY2ggZW5n
aW5lIG9mIHlvdXIgY2hvaWNlIGFuZCBjaGVjayBmb3INCj4+Pj4gZndfc2V0ZW52IGFuZCBsb2Nr
ZWQuDQo+Pj4gSSdtIHJ1bm5pbmcgYSB2ZXJzaW9uIG9mIGZ3X3NldGVudiB3aGljaCBpbmNsdWRl
cw0KPj4+IGh0dHBzOi8vZ2l0bGFiLmRlbnguZGUvdS1ib290L3UtYm9vdC8tL2NvbW1pdC9kYjgy
MDE1OSBzbyBpdCBzaG91bGRuJ3QNCj4+PiBiZSBsb2NraW5nIHRoaW5ncyB1bm5lY2Vzc2FyaWx5
Lg0KPj4+Pj4gSWYgYmVlbiB1bnN1Y2Nlc3NmdWwgaW4gcHJvZHVjaW5nIGEgc2V0dXAgZm9yIGJp
c2VjdGluZyB0aGUgaXNzdWUuIEkgZG8NCj4+Pj4+IGtub3cgdGhlIGlzc3VlIGRvZXNuJ3Qgb2Nj
dXIgb24gdGhlIG9sZCA0LjQueCBiYXNlZCBrZXJuZWwgYnV0IHRoYXQncw0KPj4+Pj4gcHJvYmFi
bHkgbm90IG11Y2ggaGVscC4NCj4+Pj4+DQo+Pj4+PiBBbnkgcG9pbnRlcnMgb24gd2hhdCB0aGUg
aXNzdWUgKGFuZC9vciBzb2x1dGlvbikgbWlnaHQgYmUuDQo+PiBJIGZpbmFsbHkgbWFuYWdlZCB0
byBnZXQgb3VyIGJvYXJkIHJ1bm5pbmcgd2l0aCBhIHZhbmlsbGEga2VybmVsLiBXaXRoDQo+PiBj
b3JlbmV0NjRfc21wX2RlZmNvbmZpZyBJIG9jY2FzaW9uYWxseSBzZWUNCj4+DQo+PiAgIMKgIGZz
bF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNl
dCENCj4+DQo+PiBvdGhlciB0aGFuIHRoZSBtZXNzYWdlIHRoaW5ncyBzZWVtIHRvIGJlIHdvcmtp
bmcuDQo+Pg0KPj4gV2l0aCBhIGN1c3RvbSBkZWZjb25maWcgSSBzZWUNCj4+DQo+PiAgIMKgIGZz
bF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNl
dCENCj4+ICAgwqAgZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngv
dHggZmlmbydzIGFyZW4ndCBlbXB0eSENCj4+ICAgwqAgZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTog
U1BJRV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4gICDCoCAuLi4NCj4+DQo+PiBhbmQg
YWNjZXNzIHRvIHRoZSBzcGktbm9yIGRvZXMgbm90IHdvcmsgdW50aWwgdGhlIGJvYXJkIGlzIHJl
c2V0Lg0KPj4NCj4+IEknbGwgdHJ5IGFuZCBwaWNrIGFwYXJ0IHRoZSBkaWZmZXJlbmNlcyBiZXR3
ZWVuIHRoZSB0d28gZGVmY29uZmlncy4NCg0KSSBub3cgdGhpbmsgbXkgZWFybGllciB0ZXN0aW5n
IGlzIGludmFsaWQuIEkgaGF2ZSBzZWVuIHRoZSBwcm9ibGVtIHdpdGggDQplaXRoZXIgZGVmY29u
ZmlnIGlmIEkgdHJ5IGhhcmQgZW5vdWdoLiBJIGhhZCBjb252aW5jZWQgbXlzZWxmIHRoYXQgdGhl
IA0KcHJvYmxlbSB3YXMgQ09ORklHX1BSRUVNUFQgYnV0IHRoYXQgd2FzIGJlZm9yZSBJIGZvdW5k
IGJvb3QtdG8tYm9vdCANCmRpZmZlcmVuY2VzIHdpdGggdGhlIHNhbWUga2VybmVsLg0KDQpJdCdz
IHBvc3NpYmxlIHRoYXQgSSdtIGNoYXNpbmcgbXVsdGlwbGUgaXNzdWVzIHdpdGggdGhlIHNhbWUg
c3ltcHRvbS4NCg0KVGhlIGVycm9yIEknbSBtb3N0IGNvbmNlcm5lZCB3aXRoIGlzIGluIHRoZSBz
ZXF1ZW5jZQ0KMS4gYm9vdCB3aXRoIG9sZCBpbWFnZQ0KMi4gd3JpdGUgZW52aXJvbm1lbnQNCjMu
IGJvb3Qgd2l0aCBuZXcgaW1hZ2UNCjQuIHdyaXRlIGVudmlyb25tZW50DQo1LiB3cml0ZSBmYWls
cyBhbmQgZW52aXJvbm1lbnQgaXMgY29ycnVwdGVkDQoNCkFmdGVyIEkgcmVjb3ZlciB0aGUgc3lz
dGVtIHRoaW5ncyBzb21ldGltZXMgc2VlbSBmaW5lLiBVbnRpbCBJIHJlcGVhdCANCnRoZSBzZXF1
ZW5jZSBhYm92ZS4NCg0KPiBBbHNvIHJlbGV2YW50IG1heSBiZToNCj4gLSBXaGljaCBkdHMgYXJl
IHlvdSB1c2luZz8NCkN1c3RvbSBidXQgYmFzZWQgaGVhdmlseSBvbiB0aGUgdDIwODByZGIuDQo+
IC0gV2hhdCdzIHRoZSBzcGktbm9yIHR5cGUsIGFuZCBhdCB3aGljaCBmcmVxdWVuY3kgYXJlIHlv
dSBvcGVyYXRpbmcgaXQ/DQpUaGUgYm9hcmQgaGFzIHNldmVyYWwgYWx0ZXJuYXRlIHBhcnRzIGZv
ciB0aGUgc3BpLW5vciBzbyB0aGUgZHRzIGp1c3QgDQpzcGVjaWZpZXMgY29tcGF0aWJsZSA9ICJq
ZWRlYyxzcGktbm9yIiB0aGUgYWN0dWFsIGNoaXAgZGV0ZWN0ZWQgb24gdGhlIA0KYm9hcmQgSSBo
YXZlIGlzICJuMjVxMDMyYSAoNDA5NiBLYnl0ZXMpIi4gVGhlIGR0cyBzZXRzIHNwaS1tYXgtZnJl
cXVlbmN5IA0KPSA8MTAwMDAwMDA+IEkgaGF2ZW4ndCBtZWFzdXJlZCB0aGUgYWN0dWFsIGZyZXF1
ZW5jeSBvbiB0aGUgYnVzLg0KPiAtIERvZXMgdGhlIGlzc3VlIHN0aWxsIGhhcHBlbiBpZiB5b3Ug
bG93ZXIgdGhlIGZyZXF1ZW5jeT8NCkkgZGlkIHBsYXkgYXJvdW5kIHdpdGggdGhlIGZyZXF1ZW5j
eSBpbml0aWFsbHkgYnV0IEkgc2hvdWxkIHByb2JhYmx5IA0KZ2l2ZSB0aGF0IGFub3RoZXIgZ28g
bm93IHRoYXQgSSBoYXZlIGEgYmV0dGVyIHJlcHJvZHVjdGlvbiBtZXRob2Qu
