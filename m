Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E47022570A1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 23:02:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bfm4c1sX9zDqCg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 07:02:40 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=e28trhzh; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bfm2Y5fswzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 07:00:53 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1072A84487;
 Mon, 31 Aug 2020 09:00:50 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1598821250;
 bh=EJLjX89WdyvDHn+7R8EgEdBdf2Jw0A+9k5f1ib+1iE0=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=e28trhzhMurFnBLdOrtw7kt43zg6bwHPTRXnMG6fflcQy81CaWCEa628Ykg6LtwUK
 E9O/e9oz5+Icz1NjRQEtUc/GmOTEi1uyJdByO1/NDWnnneyo/+ec4noB0Op1X6ZEqY
 vwVDXqbeMBYwVQKceyObolzgQmbKliwb2x1gzhLDWKcp5Zm2RHN4ONS7uYc/87SOhw
 TsuLcYQW86Le6go6GypcLfY0O20q4LjDW/8qvbpFd+HGytS2Fuqp9O0PBs2IAWKh0F
 8p3Hie/9Zc3T+7Ka4v5Ay3+Q4YDIFKLQQ47HBJlIKWrj2WmOM5nxdZ2NUJkhqe2qiA
 7JoolEoOEs2Jg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4c13820000>; Mon, 31 Aug 2020 09:00:50 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 31 Aug 2020 09:00:49 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 31 Aug 2020 09:00:49 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Nicholas Piggin <npiggin@gmail.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "paulus@samba.org" <paulus@samba.org>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAA6JQCAAPtUgIAAOXyAgABIbACAAAjRgIABm7wAgAD5+gCABBXPAIAAjqOA
Date: Sun, 30 Aug 2020 21:00:49 +0000
Message-ID: <524a0f50-f954-f5a7-eccb-66eece59c7c4@alliedtelesis.co.nz>
References: <42107721-614b-96e8-68d9-4b888206562e@alliedtelesis.co.nz>
 <1020029e-4cb9-62ba-c6d6-e6b9bdf93aac@gmail.com>
 <1598510348.1g7wt0s02s.astroid@bobo.none>
 <0068446e-06f8-6648-2f40-56f324c1ee6e@alliedtelesis.co.nz>
 <1598788275.m90vz24p6x.astroid@bobo.none>
In-Reply-To: <1598788275.m90vz24p6x.astroid@bobo.none>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <074623954D471445A42C0B113966A6EA@atlnz.lc>
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

DQpPbiAzMS8wOC8yMCAxMjozMCBhbSwgTmljaG9sYXMgUGlnZ2luIHdyb3RlOg0KPiBFeGNlcnB0
cyBmcm9tIENocmlzIFBhY2toYW0ncyBtZXNzYWdlIG9mIEF1Z3VzdCAyOCwgMjAyMCA4OjA3IGFt
Og0KDQo8c25pcD4NCg0KPj4+Pj4+IEkndmUgYWxzbyBub3cgc2VlbiB0aGUgUlggRklGTyBub3Qg
ZW1wdHkgZXJyb3Igb24gdGhlIFQyMDgwUkRCDQo+Pj4+Pj4NCj4+Pj4+PiBmc2xfZXNwaSBmZmUx
MTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+Pj4g
ZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qg
c2V0IQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQ
SUVfRE9OIGlzbid0IHNldCENCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2Zl
ciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBzZXQhDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngvdHggZmlmbydzIGFyZW4ndCBlbXB0eSENCj4+Pj4+
PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMy
DQo+Pj4+Pj4NCj4+Pj4+PiBXaXRoIG15IGN1cnJlbnQgd29ya2Fyb3VuZCBvZiBlbXB0eWluZyB0
aGUgUlggRklGTy4gSXQgc2VlbXMNCj4+Pj4+PiBzdXJ2aXZhYmxlLiBJbnRlcmVzdGluZ2x5IGl0
IG9ubHkgZXZlciBzZWVtcyB0byBiZSAxIGV4dHJhIGJ5dGUgaW4gdGhlDQo+Pj4+Pj4gUlggRklG
TyBhbmQgaXQgc2VlbXMgdG8gYmUgYWZ0ZXIgZWl0aGVyIGEgUkVBRF9TUiBvciBhIFJFQURfRlNS
Lg0KPj4+Pj4+DQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogdHggNzANCj4+Pj4+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiByeCAwMw0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IEV4dHJhIFJYIDAwDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIg
ZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5z
cGk6IFRyYW5zZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4g
ZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0K
Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4IDA1DQo+Pj4+Pj4gZnNsX2VzcGkgZmZl
MTEwMDAwLnNwaTogcnggMDANCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBS
WCAwMw0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0IFNQ
SUVfRE9OIGlzbid0IHNldCENCj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2Zl
ciBkb25lIGJ1dCByeC90eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPj4+Pj4+IGZzbF9lc3BpIGZm
ZTExMDAwMC5zcGk6IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+Pj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiB0eCAwNQ0KPj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IHJ4IDAwDQo+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogRXh0cmEgUlggMDMNCj4+Pj4+
Pg0KPj4+Pj4+ICAgRnJvbSBhbGwgdGhlIE1pY3JvbiBTUEktTk9SIGRhdGFzaGVldHMgSSd2ZSBn
b3QgYWNjZXNzIHRvIGl0IGlzDQo+Pj4+Pj4gcG9zc2libGUgdG8gY29udGludWFsbHkgcmVhZCB0
aGUgU1IvRlNSLiBCdXQgSSd2ZSBubyBpZGVhIHdoeSBpdA0KPj4+Pj4+IGhhcHBlbnMgc29tZSB0
aW1lcyBhbmQgbm90IG90aGVycy4NCj4+Pj4+IFNvIEkgdGhpbmsgSSd2ZSBnb3QgYSByZXByb2R1
Y3Rpb24gYW5kIEkgdGhpbmsgSSd2ZSBiaXNlY3RlZCB0aGUgcHJvYmxlbQ0KPj4+Pj4gdG8gY29t
bWl0IDMyODJhM2RhMjViZCAoInBvd2VycGMvNjQ6IEltcGxlbWVudCBzb2Z0IGludGVycnVwdCBy
ZXBsYXkgaW4NCj4+Pj4+IEMiKS4gTXkgZGF5IGlzIGp1c3QgZmluaXNoaW5nIG5vdyBzbyBJIGhh
dmVuJ3QgYXBwbGllZCB0b28gbXVjaCBzY3J1dGlueQ0KPj4+Pj4gdG8gdGhpcyByZXN1bHQuIEdp
dmVuIHRoZSB2YXJpb3VzIHJhYmJpdCBob2xlcyBJJ3ZlIGJlZW4gZG93biBvbiB0aGlzDQo+Pj4+
PiBpc3N1ZSBhbHJlYWR5IEknZCB0YWtlIHRoaXMgaW5mb3JtYXRpb24gd2l0aCBhIGdvb2QgZGVn
cmVlIG9mIHNrZXB0aWNpc20uDQo+Pj4+Pg0KPj4+PiBPSywgc28gYW4gZWFzeSB0ZXN0IHNob3Vs
ZCBiZSB0byByZS10ZXN0IHdpdGggYSA1LjQga2VybmVsLg0KPj4+PiBJdCBkb2Vzbid0IGhhdmUg
eWV0IHRoZSBjaGFuZ2UgeW91J3JlIHJlZmVycmluZyB0bywgYW5kIHRoZSBmc2wtZXNwaSBkcml2
ZXINCj4+Pj4gaXMgYmFzaWNhbGx5IHRoZSBzYW1lIGFzIGluIDUuNyAoanVzdCB0d28gc21hbGwg
Y2hhbmdlcyBpbiA1LjcpLg0KPj4+IFRoZXJlJ3MgNmNjMGMxNmQ4MmY4OCBhbmQgbWF5YmUgYWxz
byBvdGhlciBpbnRlcnJ1cHQgcmVsYXRlZCBwYXRjaGVzDQo+Pj4gYXJvdW5kIHRoaXMgdGltZSB0
aGF0IGNvdWxkIGFmZmVjdCBib29rIEUsIHNvIGl0J3MgZ29vZCBpZiB0aGF0IGV4YWN0DQo+Pj4g
cGF0Y2ggaXMgY29uZmlybWVkLg0KPj4gTXkgY29uZmlybWF0aW9uIGlzIGJhc2ljYWxseSB0aGF0
IEkgY2FuIGluZHVjZSB0aGUgaXNzdWUgaW4gYSA1LjQga2VybmVsDQo+PiBieSBjaGVycnktcGlj
a2luZyAzMjgyYTNkYTI1YmQuIEknbSBhbHNvIGFibGUgdG8gImZpeCIgdGhlIGlzc3VlIGluDQo+
PiA1LjktcmMyIGJ5IHJldmVydGluZyB0aGF0IG9uZSBjb21taXQuDQo+Pg0KPj4gSSBib3RoIGNh
c2VzIGl0J3Mgbm90IGV4YWN0bHkgYSBjbGVhbiBjaGVycnktcGljay9yZXZlcnQgc28gSSBhbHNv
DQo+PiBjb25maXJtZWQgdGhlIGJpc2VjdGlvbiByZXN1bHQgYnkgYnVpbGRpbmcgYXQgMzI4MmEz
ZGEyNWJkICh3aGljaCBzZWVzDQo+PiB0aGUgaXNzdWUpIGFuZCB0aGUgY29tbWl0IGp1c3QgYmVm
b3JlICh3aGljaCBkb2VzIG5vdCkuDQo+IFRoYW5rcyBmb3IgdGVzdGluZywgdGhhdCBjb25maXJt
cyBpdCB3ZWxsLg0KPg0KPiBbc25pcCBwYXRjaF0NCj4NCj4+IEkgc3RpbGwgc2F3IHRoZSBpc3N1
ZSB3aXRoIHRoaXMgY2hhbmdlIGFwcGxpZWQuIFBQQ19JUlFfU09GVF9NQVNLX0RFQlVHDQo+PiBk
aWRuJ3QgcmVwb3J0IGFueXRoaW5nIChlaXRoZXIgd2l0aCBvciB3aXRob3V0IHRoZSBjaGFuZ2Ug
YWJvdmUpLg0KPiBPa2F5LCBpdCB3YXMgYSBiaXQgb2YgYSBzaG90IGluIHRoZSBkYXJrLiBJIHN0
aWxsIGNhbid0IHNlZSB3aGF0DQo+IGVsc2UgaGFzIGNoYW5nZWQuDQo+DQo+IFdoYXQgd291bGQg
Y2F1c2UgdGhpcywgYSBsb3N0IGludGVycnVwdD8gQSBzcHVyaW91cyBpbnRlcnJ1cHQ/IE9yDQo+
IGhpZ2hlciBpbnRlcnJ1cHQgbGF0ZW5jeT8NCj4NCj4gSSBkb24ndCB0aGluayB0aGUgcGF0Y2gg
c2hvdWxkIGNhdXNlIHNpZ25pZmljYW50bHkgd29yc2UgbGF0ZW5jeSwNCj4gKGl0J3Mgc3VwcG9z
ZWQgdG8gYmUgYSBiaXQgYmV0dGVyIGlmIGFueXRoaW5nIGJlY2F1c2UgaXQgZG9lc24ndCBzZXQN
Cj4gdXAgdGhlIGZ1bGwgaW50ZXJydXB0IGZyYW1lKS4gQnV0IGl0J3MgcG9zc2libGUuDQoNCk15
IHdvcmtpbmcgdGhlb3J5IGlzIHRoYXQgdGhlIFNQSV9ET04gaW5kaWNhdGlvbiBpcyBhbGwgYWJv
dXQgdGhlIFRYIA0KZGlyZWN0aW9uIGFuIG5vdyB0aGF0IHRoZSBpbnRlcnJ1cHRzIGFyZSBmYXN0
ZXIgd2UncmUgaGl0dGluZyBhbiBlcnJvciANCmJlY2F1c2UgdGhlcmUgaXMgc3RpbGwgUlggYWN0
aXZpdHkgZ29pbmcgb24uIEhlaW5lciBkaXNhZ3JlZXMgd2l0aCBteSANCmludGVycHJldGF0aW9u
IG9mIHRoZSBTUElfRE9OIGluZGljYXRpb24gYW5kIHRoZSBmYWN0IHRoYXQgaXQgZG9lc24ndCAN
CmhhcHBlbiBldmVyeSB0aW1lIGRvZXMgdGhyb3cgZG91YnQgb24gaXQuDQoNCkkgY2FuJ3QgcmVh
bGx5IGV4cGxhaW4gdGhlIGV4dHJhIFJYIGJ5dGUgaW4gdGhlIGZpZm8uIFdlIGtub3cgaG93IG1h
bnkgDQpieXRlcyB0byBleHBlY3QgYW5kIHdlIHB1bGwgdGhhdCBtYW55IGZyb20gdGhlIGZpZm8g
c28gaXQncyBub3QgYXMgaWYgDQp3ZSdyZSBtaXNzaW5nIGFuIGludGVycnVwdCBjYXVzaW5nIHVz
IHRvIHNraXAgdGhlIGxhc3QgYnl0ZS4gSSd2ZSBiZWVuIA0KbG9va2luZyBmb3Igc29tZSBraW5k
IG9mIG9mZi1ieS1vbmUgY2FsY3VsYXRpb24gYnV0IGFnYWluIGlmIGl0IHdlcmUgDQpzb21ldGhp
bmcgbGlrZSB0aGF0IGl0J2QgaGFwcGVuIGFsbCB0aGUgdGltZS4NCg0K
