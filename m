Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F75E249125
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:46:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWQxz4Pd9zDqtG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:46:31 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=bv2GeofM; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWQw22Fw5zDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 08:44:50 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 94B2F8011F;
 Wed, 19 Aug 2020 10:44:47 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1597790687;
 bh=fwtJdtP2aFXeaf/0JABhrsBoQUmpTdQAy32Xi1uxMqk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=bv2GeofM2o6DbEqxMDDYkREArL/4LyeARqAbyxTwF1T7QKFbx0qfwtPNMTlO5RapD
 lfJVZS2lNsYEyHj6UooazNQLsU44oPCi6hsjiTuKSf7czU0M7w53bXBKwDWL0RL1or
 E5AhEJSYphxyOtHfVpCrTKCCRBHcWNmWDK3+64IlQLQnmKhPpK2RmD1/RpVO4zd9t6
 0titQpnluQLnrencCGotr4X3Tn+6FlbPPvmHYBMWMCwwT8DYFMoh4LnVG92kDp2Bhg
 QldPqEQgbdR+ecVXO2KSuffJG2Xz1DwOVwK6HxJyWpO3tD1G+tNaS9JZjst/IUHHLe
 AIvYGFF+fEVHQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f3c59da0000>; Wed, 19 Aug 2020 10:44:47 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 Aug 2020 10:44:42 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 19 Aug 2020 10:44:42 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "paulus@samba.org"
 <paulus@samba.org>, "tiago.brusamarello@datacom.ind.br"
 <tiago.brusamarello@datacom.ind.br>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAA==
Date: Tue, 18 Aug 2020 22:44:42 +0000
Message-ID: <1bbb3726-b0a4-6eb9-9076-706b06dfb90f@alliedtelesis.co.nz>
References: <3f48e5fb-33c9-8046-0f80-236eed163c16@alliedtelesis.co.nz>
 <c43a23bd-33ec-4ef2-2ca5-730342248db3@gmail.com>
 <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
In-Reply-To: <3c72eec1-41ba-7389-eceb-3de80065555a@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AE6BE69BE3A794D9A82C26FFAAC08A7@atlnz.lc>
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

SGkgQWdhaW4sDQoNCk9uIDE3LzA4LzIwIDk6MDkgYW0sIENocmlzIFBhY2toYW0gd3JvdGU6DQoN
Cj4NCj4gT24gMTQvMDgvMjAgNjoxOSBwbSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOg0KPj4gT24g
MTQuMDguMjAyMCAwNDo0OCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+PiBIaSwNCj4+Pg0KPj4+
IEknbSBzZWVpbmcgYSBwcm9ibGVtIHdpdGggYWNjZXNzaW5nIHNwaS1ub3IgYWZ0ZXIgdXBncmFk
aW5nIGEgVDIwODENCj4+PiBiYXNlZCBzeXN0ZW0gdG8gbGludXggdjUuNy4xNQ0KPj4+DQo+Pj4g
Rm9yIHRoaXMgYm9hcmQgdS1ib290IGFuZCB0aGUgdS1ib290IGVudmlyb25tZW50IGxpdmUgb24g
c3BpLW5vci4NCj4+Pg0KPj4+IFdoZW4gSSB1c2UgZndfc2V0ZW52IGZyb20gdXNlcnNwYWNlIEkg
Z2V0IHRoZSBmb2xsb3dpbmcga2VybmVsIGxvZ3MNCj4+Pg0KPj4+ICMgZndfc2V0ZW52IGZvbz0x
DQo+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04g
aXNuJ3Qgc2V0IQ0KPj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2Zl
ciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+IGZzbF9lc3BpIGZm
ZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9E
T04gaXNuJ3Qgc2V0IQ0KPj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUg
YnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFu
c2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+IGZzbF9lc3Bp
IGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24n
dCBzZXQhDQo+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJ
RV9ET04gaXNuJ3Qgc2V0IQ0KPj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRv
bmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBU
cmFuc2ZlciBkb25lIGJ1dCByeC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPj4+IGZzbF9lc3Bp
IGZmZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCByeC90eCBmaWZvJ3MgYXJlbid0
IGVtcHR5IQ0KPj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQgPSAxLCBTUElF
X1RYQ05UID0gMzINCj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1
dCByeC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+PiAuLi4NCj4+Pg0KPj4gVGhpcyBl
cnJvciByZXBvcnRpbmcgZG9lc24ndCBleGlzdCB5ZXQgaW4gNC40LiBTbyB5b3UgbWF5IGhhdmUg
YW4gaXNzdWUNCj4+IHVuZGVyIDQuNCB0b28sIGl0J3MganVzdCBub3QgcmVwb3J0ZWQuDQo+PiBE
aWQgeW91IHZlcmlmeSB0aGF0IHVuZGVyIDQuNCBmd19zZXRlbnYgYWN0dWFsbHkgaGFzIGFuIGVm
ZmVjdD8NCj4gSnVzdCBkb3VibGUgY2hlY2tlZCBhbmQgeWVzIHVuZGVyIDQuNCB0aGUgc2V0dGlu
ZyBkb2VzIGdldCBzYXZlZC4NCj4+PiBJZiBJIHJ1biBmd19wcmludGVudiAoYmVmb3JlIGdldHRp
bmcgaXQgaW50byBhIGJhZCBzdGF0ZSkgaXQgaXMgYWJsZSB0bw0KPj4+IGRpc3BsYXkgdGhlIGNv
bnRlbnQgb2YgdGhlIGJvYXJkcyB1LWJvb3QgZW52aXJvbm1lbnQuDQo+Pj4NCj4+IFRoaXMgbWln
aHQgaW5kaWNhdGUgYW4gaXNzdWUgd2l0aCBzcGkgYmVpbmcgbG9ja2VkLiBJJ3ZlIHNlZW4gcmVs
YXRlZA0KPj4gcXVlc3Rpb25zLCBqdXN0IHVzZSB0aGUgc2VhcmNoIGVuZ2luZSBvZiB5b3VyIGNo
b2ljZSBhbmQgY2hlY2sgZm9yDQo+PiBmd19zZXRlbnYgYW5kIGxvY2tlZC4NCj4gSSdtIHJ1bm5p
bmcgYSB2ZXJzaW9uIG9mIGZ3X3NldGVudiB3aGljaCBpbmNsdWRlcyANCj4gaHR0cHM6Ly9naXRs
YWIuZGVueC5kZS91LWJvb3QvdS1ib290Ly0vY29tbWl0L2RiODIwMTU5IHNvIGl0IHNob3VsZG4n
dCANCj4gYmUgbG9ja2luZyB0aGluZ3MgdW5uZWNlc3NhcmlseS4NCj4+PiBJZiBiZWVuIHVuc3Vj
Y2Vzc2Z1bCBpbiBwcm9kdWNpbmcgYSBzZXR1cCBmb3IgYmlzZWN0aW5nIHRoZSBpc3N1ZS4gSSBk
bw0KPj4+IGtub3cgdGhlIGlzc3VlIGRvZXNuJ3Qgb2NjdXIgb24gdGhlIG9sZCA0LjQueCBiYXNl
ZCBrZXJuZWwgYnV0IHRoYXQncw0KPj4+IHByb2JhYmx5IG5vdCBtdWNoIGhlbHAuDQo+Pj4NCj4+
PiBBbnkgcG9pbnRlcnMgb24gd2hhdCB0aGUgaXNzdWUgKGFuZC9vciBzb2x1dGlvbikgbWlnaHQg
YmUuDQoNCkkgZmluYWxseSBtYW5hZ2VkIHRvIGdldCBvdXIgYm9hcmQgcnVubmluZyB3aXRoIGEg
dmFuaWxsYSBrZXJuZWwuIFdpdGggDQpjb3JlbmV0NjRfc21wX2RlZmNvbmZpZyBJIG9jY2FzaW9u
YWxseSBzZWUNCg0KIMKgIGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCg0Kb3RoZXIgdGhhbiB0aGUgbWVzc2FnZSB0aGluZ3Mgc2Vl
bSB0byBiZSB3b3JraW5nLg0KDQpXaXRoIGEgY3VzdG9tIGRlZmNvbmZpZyBJIHNlZQ0KDQogwqAg
ZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qg
c2V0IQ0KIMKgIGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4
IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQogwqAgZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9S
WENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KIMKgIC4uLg0KDQphbmQgYWNjZXNzIHRvIHRoZSBz
cGktbm9yIGRvZXMgbm90IHdvcmsgdW50aWwgdGhlIGJvYXJkIGlzIHJlc2V0Lg0KDQpJJ2xsIHRy
eSBhbmQgcGljayBhcGFydCB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiB0aGUgdHdvIGRlZmNvbmZp
Z3MuDQo=
