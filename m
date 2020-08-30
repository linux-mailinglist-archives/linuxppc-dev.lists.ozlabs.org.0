Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7143A2570CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 00:01:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BfnNM1ctSzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 08:01:23 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=osD1JLbY; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BfnL91BBBzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 07:59:28 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7B62684487;
 Mon, 31 Aug 2020 09:59:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1598824767;
 bh=Nk6O9kewvDJYFgqtQxUeYYkFgPgVFFqrVn5vEQMnuHY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=osD1JLbYqJ3JKCiwkI+VCpNN2WlXmk3G37tZ3C309cnmITXJXfvLthu/TIY0JrDbH
 AjOEZ02l8i2qqPCqcOQLYEICyHQKEX3ELey5H4KNvblTK8k3W+4WbNgpsA+OVzGi8g
 8xeF33LehsXNnu6GGlTi6YX5gojSt9+0gDYbCrz8/tQ9JwqmBpyzbUkP9mJxRnYmhQ
 Z5bJB1HdyRqFMg1GYYqodRo9ll9LhOzq2/m9A8lAVHHwFZJ0ukeeJDGOdtT+4y4vb1
 bw6MmxhT1+5AA0UUX8Tjs1TM1b8LOXUyDnMLWHx3j4sSm6ILXTf7b59FwzkYnxTLeh
 OLAsrPSt5NVUQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4c213b0000>; Mon, 31 Aug 2020 09:59:28 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 09:59:22 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 31 Aug 2020 09:59:22 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Heiner Kallweit <hkallweit1@gmail.com>, Nicholas Piggin
 <npiggin@gmail.com>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "paulus@samba.org" <paulus@samba.org>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAA6JQCAAPtUgIAAOXyAgABIbACAAAjRgIABm7wAgAD5+gCABBXPAIAAjqOAgAALRACAAAUXgA==
Date: Sun, 30 Aug 2020 21:59:21 +0000
Message-ID: <6a9eb498-2982-05de-52f9-da5f6a626e49@alliedtelesis.co.nz>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
 <1598510348.1g7wt0s02s.astroid@bobo.none>
 <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
 <1598788275.m90vz24p6x.astroid@bobo.none>
 <524a0f50-f954-f5a7-eccb-66eece59c7c4@alliedtelesis.co.nz>
 <5ca7ba48-ef9c-2b7c-67ff-88d0a2c9f380@gmail.com>
In-Reply-To: <5ca7ba48-ef9c-2b7c-67ff-88d0a2c9f380@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <90D5405BC083CC4FACD54B684486C16F@atlnz.lc>
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

DQpPbiAzMS8wOC8yMCA5OjQxIGFtLCBIZWluZXIgS2FsbHdlaXQgd3JvdGU6DQo+IE9uIDMwLjA4
LjIwMjAgMjM6MDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBPbiAzMS8wOC8yMCAxMjozMCBh
bSwgTmljaG9sYXMgUGlnZ2luIHdyb3RlOg0KPj4+IEV4Y2VycHRzIGZyb20gQ2hyaXMgUGFja2hh
bSdzIG1lc3NhZ2Ugb2YgQXVndXN0IDI4LCAyMDIwIDg6MDcgYW06DQo+PiA8c25pcD4NCj4+DQo+
Pj4+Pj4+PiBJJ3ZlIGFsc28gbm93IHNlZW4gdGhlIFJYIEZJRk8gbm90IGVtcHR5IGVycm9yIG9u
IHRoZSBUMjA4MFJEQg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+IGZzbF9lc3Bp
IGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+
Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9O
IGlzbid0IHNldCENCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRv
bmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4+
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMy
DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gV2l0aCBteSBjdXJyZW50IHdvcmthcm91bmQgb2YgZW1wdHlp
bmcgdGhlIFJYIEZJRk8uIEl0IHNlZW1zDQo+Pj4+Pj4+PiBzdXJ2aXZhYmxlLiBJbnRlcmVzdGlu
Z2x5IGl0IG9ubHkgZXZlciBzZWVtcyB0byBiZSAxIGV4dHJhIGJ5dGUgaW4gdGhlDQo+Pj4+Pj4+
PiBSWCBGSUZPIGFuZCBpdCBzZWVtcyB0byBiZSBhZnRlciBlaXRoZXIgYSBSRUFEX1NSIG9yIGEg
UkVBRF9GU1IuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogdHgg
NzANCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHJ4IDAzDQo+Pj4+Pj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBSWCAwMA0KPj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEw
MDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+Pj4g
ZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngvdHggZmlmbydzIGFy
ZW4ndCBlbXB0eSENCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQg
PSAxLCBTUElFX1RYQ05UID0gMzINCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4
IDA1DQo+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiByeCAwMA0KPj4+Pj4+Pj4gZnNs
X2VzcGkgZmZlMTEwMDAwLnNwaTogRXh0cmEgUlggMDMNCj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTEx
MDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+
IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBh
cmVuJ3QgZW1wdHkhDQo+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05U
ID0gMSwgU1BJRV9UWENOVCA9IDMyDQo+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiB0
eCAwNQ0KPj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogcnggMDANCj4+Pj4+Pj4+IGZz
bF9lc3BpIGZmZTExMDAwMC5zcGk6IEV4dHJhIFJYIDAzDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gICAg
RnJvbSBhbGwgdGhlIE1pY3JvbiBTUEktTk9SIGRhdGFzaGVldHMgSSd2ZSBnb3QgYWNjZXNzIHRv
IGl0IGlzDQo+Pj4+Pj4+PiBwb3NzaWJsZSB0byBjb250aW51YWxseSByZWFkIHRoZSBTUi9GU1Iu
IEJ1dCBJJ3ZlIG5vIGlkZWEgd2h5IGl0DQo+Pj4+Pj4+PiBoYXBwZW5zIHNvbWUgdGltZXMgYW5k
IG5vdCBvdGhlcnMuDQo+Pj4+Pj4+IFNvIEkgdGhpbmsgSSd2ZSBnb3QgYSByZXByb2R1Y3Rpb24g
YW5kIEkgdGhpbmsgSSd2ZSBiaXNlY3RlZCB0aGUgcHJvYmxlbQ0KPj4+Pj4+PiB0byBjb21taXQg
MzI4MmEzZGEyNWJkICgicG93ZXJwYy82NDogSW1wbGVtZW50IHNvZnQgaW50ZXJydXB0IHJlcGxh
eSBpbg0KPj4+Pj4+PiBDIikuIE15IGRheSBpcyBqdXN0IGZpbmlzaGluZyBub3cgc28gSSBoYXZl
bid0IGFwcGxpZWQgdG9vIG11Y2ggc2NydXRpbnkNCj4+Pj4+Pj4gdG8gdGhpcyByZXN1bHQuIEdp
dmVuIHRoZSB2YXJpb3VzIHJhYmJpdCBob2xlcyBJJ3ZlIGJlZW4gZG93biBvbiB0aGlzDQo+Pj4+
Pj4+IGlzc3VlIGFscmVhZHkgSSdkIHRha2UgdGhpcyBpbmZvcm1hdGlvbiB3aXRoIGEgZ29vZCBk
ZWdyZWUgb2Ygc2tlcHRpY2lzbS4NCj4+Pj4+Pj4NCj4+Pj4+PiBPSywgc28gYW4gZWFzeSB0ZXN0
IHNob3VsZCBiZSB0byByZS10ZXN0IHdpdGggYSA1LjQga2VybmVsLg0KPj4+Pj4+IEl0IGRvZXNu
J3QgaGF2ZSB5ZXQgdGhlIGNoYW5nZSB5b3UncmUgcmVmZXJyaW5nIHRvLCBhbmQgdGhlIGZzbC1l
c3BpIGRyaXZlcg0KPj4+Pj4+IGlzIGJhc2ljYWxseSB0aGUgc2FtZSBhcyBpbiA1LjcgKGp1c3Qg
dHdvIHNtYWxsIGNoYW5nZXMgaW4gNS43KS4NCj4+Pj4+IFRoZXJlJ3MgNmNjMGMxNmQ4MmY4OCBh
bmQgbWF5YmUgYWxzbyBvdGhlciBpbnRlcnJ1cHQgcmVsYXRlZCBwYXRjaGVzDQo+Pj4+PiBhcm91
bmQgdGhpcyB0aW1lIHRoYXQgY291bGQgYWZmZWN0IGJvb2sgRSwgc28gaXQncyBnb29kIGlmIHRo
YXQgZXhhY3QNCj4+Pj4+IHBhdGNoIGlzIGNvbmZpcm1lZC4NCj4+Pj4gTXkgY29uZmlybWF0aW9u
IGlzIGJhc2ljYWxseSB0aGF0IEkgY2FuIGluZHVjZSB0aGUgaXNzdWUgaW4gYSA1LjQga2VybmVs
DQo+Pj4+IGJ5IGNoZXJyeS1waWNraW5nIDMyODJhM2RhMjViZC4gSSdtIGFsc28gYWJsZSB0byAi
Zml4IiB0aGUgaXNzdWUgaW4NCj4+Pj4gNS45LXJjMiBieSByZXZlcnRpbmcgdGhhdCBvbmUgY29t
bWl0Lg0KPj4+Pg0KPj4+PiBJIGJvdGggY2FzZXMgaXQncyBub3QgZXhhY3RseSBhIGNsZWFuIGNo
ZXJyeS1waWNrL3JldmVydCBzbyBJIGFsc28NCj4+Pj4gY29uZmlybWVkIHRoZSBiaXNlY3Rpb24g
cmVzdWx0IGJ5IGJ1aWxkaW5nIGF0IDMyODJhM2RhMjViZCAod2hpY2ggc2Vlcw0KPj4+PiB0aGUg
aXNzdWUpIGFuZCB0aGUgY29tbWl0IGp1c3QgYmVmb3JlICh3aGljaCBkb2VzIG5vdCkuDQo+Pj4g
VGhhbmtzIGZvciB0ZXN0aW5nLCB0aGF0IGNvbmZpcm1zIGl0IHdlbGwuDQo+Pj4NCj4+PiBbc25p
cCBwYXRjaF0NCj4+Pg0KPj4+PiBJIHN0aWxsIHNhdyB0aGUgaXNzdWUgd2l0aCB0aGlzIGNoYW5n
ZSBhcHBsaWVkLiBQUENfSVJRX1NPRlRfTUFTS19ERUJVRw0KPj4+PiBkaWRuJ3QgcmVwb3J0IGFu
eXRoaW5nIChlaXRoZXIgd2l0aCBvciB3aXRob3V0IHRoZSBjaGFuZ2UgYWJvdmUpLg0KPj4+IE9r
YXksIGl0IHdhcyBhIGJpdCBvZiBhIHNob3QgaW4gdGhlIGRhcmsuIEkgc3RpbGwgY2FuJ3Qgc2Vl
IHdoYXQNCj4+PiBlbHNlIGhhcyBjaGFuZ2VkLg0KPj4+DQo+Pj4gV2hhdCB3b3VsZCBjYXVzZSB0
aGlzLCBhIGxvc3QgaW50ZXJydXB0PyBBIHNwdXJpb3VzIGludGVycnVwdD8gT3INCj4+PiBoaWdo
ZXIgaW50ZXJydXB0IGxhdGVuY3k/DQo+Pj4NCj4+PiBJIGRvbid0IHRoaW5rIHRoZSBwYXRjaCBz
aG91bGQgY2F1c2Ugc2lnbmlmaWNhbnRseSB3b3JzZSBsYXRlbmN5LA0KPj4+IChpdCdzIHN1cHBv
c2VkIHRvIGJlIGEgYml0IGJldHRlciBpZiBhbnl0aGluZyBiZWNhdXNlIGl0IGRvZXNuJ3Qgc2V0
DQo+Pj4gdXAgdGhlIGZ1bGwgaW50ZXJydXB0IGZyYW1lKS4gQnV0IGl0J3MgcG9zc2libGUuDQo+
PiBNeSB3b3JraW5nIHRoZW9yeSBpcyB0aGF0IHRoZSBTUElfRE9OIGluZGljYXRpb24gaXMgYWxs
IGFib3V0IHRoZSBUWA0KPj4gZGlyZWN0aW9uIGFuIG5vdyB0aGF0IHRoZSBpbnRlcnJ1cHRzIGFy
ZSBmYXN0ZXIgd2UncmUgaGl0dGluZyBhbiBlcnJvcg0KPj4gYmVjYXVzZSB0aGVyZSBpcyBzdGls
bCBSWCBhY3Rpdml0eSBnb2luZyBvbi4gSGVpbmVyIGRpc2FncmVlcyB3aXRoIG15DQo+PiBpbnRl
cnByZXRhdGlvbiBvZiB0aGUgU1BJX0RPTiBpbmRpY2F0aW9uIGFuZCB0aGUgZmFjdCB0aGF0IGl0
IGRvZXNuJ3QNCj4+IGhhcHBlbiBldmVyeSB0aW1lIGRvZXMgdGhyb3cgZG91YnQgb24gaXQuDQo+
Pg0KPiBJdCdzIHJpZ2h0IHRoYXQgdGhlIGVTUEkgc3BlYyBjYW4gYmUgaW50ZXJwcmV0ZWQgdGhh
dCBTUElfRE9OIHJlZmVycyB0bw0KPiBUWCBvbmx5LiBIb3dldmVyIHRoaXMgd291bGRuJ3QgcmVh
bGx5IG1ha2Ugc2Vuc2UsIGJlY2F1c2UgYWxzbyBmb3IgUlgNCj4gd2UgcHJvZ3JhbSB0aGUgZnJh
bWUgbGVuZ3RoLCBhbmQgdGhlcmVmb3JlIHdhbnQgdG8gYmUgbm90aWZpZWQgb25jZSB0aGUNCj4g
ZnVsbCBmcmFtZSB3YXMgcmVjZWl2ZWQuIEFsc28gcHJhY3RpY2FsIGV4cGVyaWVuY2Ugc2hvd3Mg
dGhhdCBTUElfRE9ODQo+IGlzIHNldCBhbHNvIGFmdGVyIFJYLW9ubHkgdHJhbnNmZXJzLg0KPiBU
eXBpY2FsIFNQSSBOT1IgdXNlIGNhc2UgaXMgdGhhdCB5b3Ugd3JpdGUgcmVhZCBjb21tYW5kICsg
c3RhcnQgYWRkcmVzcywNCj4gZm9sbG93ZWQgYnkgYSBsb25nZXIgcmVhZC4gSWYgdGhlIFRYLW9u
bHkgaW50ZXJwcmV0YXRpb24gd291bGQgYmUgcmlnaHQsDQo+IHdlJ2QgYWx3YXlzIGVuZCB1cCB3
aXRoIFNQSV9ET04gbm90IGJlaW5nIHNldC4NCj4NCj4+IEkgY2FuJ3QgcmVhbGx5IGV4cGxhaW4g
dGhlIGV4dHJhIFJYIGJ5dGUgaW4gdGhlIGZpZm8uIFdlIGtub3cgaG93IG1hbnkNCj4+IGJ5dGVz
IHRvIGV4cGVjdCBhbmQgd2UgcHVsbCB0aGF0IG1hbnkgZnJvbSB0aGUgZmlmbyBzbyBpdCdzIG5v
dCBhcyBpZg0KPj4gd2UncmUgbWlzc2luZyBhbiBpbnRlcnJ1cHQgY2F1c2luZyB1cyB0byBza2lw
IHRoZSBsYXN0IGJ5dGUuIEkndmUgYmVlbg0KPj4gbG9va2luZyBmb3Igc29tZSBraW5kIG9mIG9m
Zi1ieS1vbmUgY2FsY3VsYXRpb24gYnV0IGFnYWluIGlmIGl0IHdlcmUNCj4+IHNvbWV0aGluZyBs
aWtlIHRoYXQgaXQnZCBoYXBwZW4gYWxsIHRoZSB0aW1lLg0KPj4NCj4gTWF5YmUgaXQgaGVscHMg
dG8ga25vdyB3aGF0IHZhbHVlIHRoaXMgZXh0cmEgYnl0ZSBpbiB0aGUgRklGTyBoYXMuIElzIGl0
Og0KPiAtIGEgZHVwbGljYXRlIG9mIHRoZSBsYXN0IHJlYWQgYnl0ZQ0KPiAtIG9yIHRoZSBuZXh0
IGJ5dGUgKGF0IDxlbmQgYWRkcmVzcz4gKyAxKQ0KPiAtIG9yIGEgZml4ZWQgdmFsdWUsIGUuZy4g
YWx3YXlzIDB4MDAgb3IgMHhmZg0KDQpUaGUgdmFsdWVzIHdlcmUgdXAgdGhyZWFkIGEgYml0IGJ1
dCBJJ2xsIHJlcGVhdCB0aGVtIGhlcmUNCg0KZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogdHggNzAN
CmZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHJ4IDAzDQpmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBF
eHRyYSBSWCAwMA0KZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJ
RV9ET04gaXNuJ3Qgc2V0IQ0KZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBi
dXQgcngvdHggZmlmbydzIGFyZW4ndCBlbXB0eSENCmZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQ
SUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCmZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4
IDA1DQpmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiByeCAwMA0KZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogRXh0cmEgUlggMDMNCmZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCmZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRv
bmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQpmc2xfZXNwaSBmZmUxMTAwMDAuc3Bp
OiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMyDQpmc2xfZXNwaSBmZmUxMTAwMDAuc3Bp
OiB0eCAwNQ0KZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogcnggMDANCmZzbF9lc3BpIGZmZTExMDAw
MC5zcGk6IEV4dHJhIFJYIDAzDQoNCg0KVGhlIHJ4IDAwIEV4dHJhIFJYIDAzIGlzIGEgYml0IGNv
bmNlcm5pbmcuIEkndmUgb25seSBldmVyIHNlZW4gdGhlbSB3aXRoDQplaXRoZXIgYSBSRUFEX1NS
IG9yIGEgUkVBRF9GU1IuIE5ldmVyIGEgZGF0YSByZWFkLg0K
