Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C763D24599E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Aug 2020 23:11:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BV8x16zm2zDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 07:11:17 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=uU1tMVL6; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BV8tw6HRVzDqF5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 07:09:28 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 33B35806B6;
 Mon, 17 Aug 2020 09:09:23 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1597612163;
 bh=mFh2MNlRiVsvA4vpdlLMxIHHKZs332vJXnDrU4WRgPc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=uU1tMVL6vPeJYj6afY9bVlD3f2R4n+4Yqx3qDuItye/YUjJQGETnIFcl1K15VPDtC
 pKPfYysQ8aRp5uXUBn1uFMynpiNHbIqJX32DTy9iCyqzxnXCcopqHsW9xAhqTrequ+
 iCK9G/IAvK08NZHGw7VfxXntDSAzCQyW+E7pgNetdW3n72+vYTkY6nEnj/8Tfxj0sk
 tYlX3ucjHInpTEYszujFbGqqUOng7TxgKzK2lK6nIJPNRVqW0O5rh7UiXOzILiP+71
 T5TlrX9SZtD2VBr/b0hQ6KGuAKVLjEvRFshfrMICWYBh967vqdDEm3teRajJoYb7Pf
 Ae6A28TwX4Xew==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f39a0810000>; Mon, 17 Aug 2020 09:09:21 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 17 Aug 2020 09:09:22 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 17 Aug 2020 09:09:22 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "tiago.brusamarello@datacom.ind.br"
 <tiago.brusamarello@datacom.ind.br>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwA=
Date: Sun, 16 Aug 2020 21:09:22 +0000
Message-ID: <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
 <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
In-Reply-To: <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C94EA88EC8E86544A72DF85805F89839@atlnz.lc>
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

DQpPbiAxNC8wOC8yMCA2OjE5IHBtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+IE9uIDE0LjA4
LjIwMjAgMDQ6NDgsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBIaSwNCj4+DQo+PiBJJ20gc2Vl
aW5nIGEgcHJvYmxlbSB3aXRoIGFjY2Vzc2luZyBzcGktbm9yIGFmdGVyIHVwZ3JhZGluZyBhIFQy
MDgxDQo+PiBiYXNlZCBzeXN0ZW0gdG8gbGludXggdjUuNy4xNQ0KPj4NCj4+IEZvciB0aGlzIGJv
YXJkIHUtYm9vdCBhbmQgdGhlIHUtYm9vdCBlbnZpcm9ubWVudCBsaXZlIG9uIHNwaS1ub3IuDQo+
Pg0KPj4gV2hlbiBJIHVzZSBmd19zZXRlbnYgZnJvbSB1c2Vyc3BhY2UgSSBnZXQgdGhlIGZvbGxv
d2luZyBrZXJuZWwgbG9ncw0KPj4NCj4+ICMgZndfc2V0ZW52IGZvbz0xDQo+PiBmc2xfZXNwaSBm
ZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RP
TiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1
dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2Zl
ciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3Bp
OiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUx
MTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQh
DQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBp
c24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBT
UElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBk
b25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBU
cmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNwaSBmZmUxMTAw
MDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+PiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCByeC90eCBmaWZvJ3Mg
YXJlbid0IGVtcHR5IQ0KPj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENOVCA9IDEs
IFNQSUVfVFhDTlQgPSAzMg0KPj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9u
ZSBidXQgcngvdHggZmlmbydzIGFyZW4ndCBlbXB0eSENCj4+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+IGZzbF9lc3BpIGZmZTExMDAw
MC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMyDQo+
PiAuLi4NCj4+DQo+IFRoaXMgZXJyb3IgcmVwb3J0aW5nIGRvZXNuJ3QgZXhpc3QgeWV0IGluIDQu
NC4gU28geW91IG1heSBoYXZlIGFuIGlzc3VlDQo+IHVuZGVyIDQuNCB0b28sIGl0J3MganVzdCBu
b3QgcmVwb3J0ZWQuDQo+IERpZCB5b3UgdmVyaWZ5IHRoYXQgdW5kZXIgNC40IGZ3X3NldGVudiBh
Y3R1YWxseSBoYXMgYW4gZWZmZWN0Pw0KSnVzdCBkb3VibGUgY2hlY2tlZCBhbmQgeWVzIHVuZGVy
IDQuNCB0aGUgc2V0dGluZyBkb2VzIGdldCBzYXZlZC4NCj4+IElmIEkgcnVuIGZ3X3ByaW50ZW52
IChiZWZvcmUgZ2V0dGluZyBpdCBpbnRvIGEgYmFkIHN0YXRlKSBpdCBpcyBhYmxlIHRvDQo+PiBk
aXNwbGF5IHRoZSBjb250ZW50IG9mIHRoZSBib2FyZHMgdS1ib290IGVudmlyb25tZW50Lg0KPj4N
Cj4gVGhpcyBtaWdodCBpbmRpY2F0ZSBhbiBpc3N1ZSB3aXRoIHNwaSBiZWluZyBsb2NrZWQuIEkn
dmUgc2VlbiByZWxhdGVkDQo+IHF1ZXN0aW9ucywganVzdCB1c2UgdGhlIHNlYXJjaCBlbmdpbmUg
b2YgeW91ciBjaG9pY2UgYW5kIGNoZWNrIGZvcg0KPiBmd19zZXRlbnYgYW5kIGxvY2tlZC4NCkkn
bSBydW5uaW5nIGEgdmVyc2lvbiBvZiBmd19zZXRlbnYgd2hpY2ggaW5jbHVkZXMgDQpodHRwczov
L2dpdGxhYi5kZW54LmRlL3UtYm9vdC91LWJvb3QvLS9jb21taXQvZGI4MjAxNTkgc28gaXQgc2hv
dWxkbid0IA0KYmUgbG9ja2luZyB0aGluZ3MgdW5uZWNlc3NhcmlseS4NCj4+IElmIGJlZW4gdW5z
dWNjZXNzZnVsIGluIHByb2R1Y2luZyBhIHNldHVwIGZvciBiaXNlY3RpbmcgdGhlIGlzc3VlLiBJ
IGRvDQo+PiBrbm93IHRoZSBpc3N1ZSBkb2Vzbid0IG9jY3VyIG9uIHRoZSBvbGQgNC40LnggYmFz
ZWQga2VybmVsIGJ1dCB0aGF0J3MNCj4+IHByb2JhYmx5IG5vdCBtdWNoIGhlbHAuDQo+Pg0KPj4g
QW55IHBvaW50ZXJzIG9uIHdoYXQgdGhlIGlzc3VlIChhbmQvb3Igc29sdXRpb24pIG1pZ2h0IGJl
Lg0KPj4NCj4+IFRoYW5rcywNCj4+IENocmlzDQo+Pg0KPiBIZWluZXI=
