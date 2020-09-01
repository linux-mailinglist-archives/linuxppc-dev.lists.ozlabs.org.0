Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B725A1F3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 01:33:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bh3Kw26JXzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 09:33:40 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=yyZHO9mr; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bh3Hj5KXkzDqXD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 09:31:45 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CC008806B5;
 Wed,  2 Sep 2020 11:31:44 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1599003104;
 bh=49+HuLkyWuSeSY4/skkmoILG0tKclmzqhawDJyR6ZhY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=yyZHO9mrQQmwWrQipMW5RwqsvQvtsX3L8n1N8KRGIY65AgauOzbLlL1cJqb5BbgkM
 DIfjLiEwTpkSVtAJ+UE4CjUuDSDYaI5QVFN99siWtCgmV+dlmC6xbc7HxcBzolAwYg
 ZDaTNdto/jRnjdo04nWLeQ18Ew3LYT+ZjZilViLmdYNajYpMMjwqRT2rlNnhl4di8v
 zuKwjrDrAt3oHEK3/IHReNhtWLktw+PTaqMsEtjyDwh1OuewXrzr/WoG6RcL3U4HE3
 MmZ+ae2n9FrJ/IZC5gxFk6Bkwfsqcyoq0c00bARJwhM6gDx/3g4iOtrCb/jGSE5F/g
 9qGU9KH6N3/0A==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f4ed9db0000>; Wed, 02 Sep 2020 11:31:44 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 2 Sep 2020 11:31:39 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 2 Sep 2020 11:31:39 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Nicholas Piggin <npiggin@gmail.com>, "benh@kernel.crashing.org"
 <benh@kernel.crashing.org>, "broonie@kernel.org" <broonie@kernel.org>,
 "Heiner Kallweit" <hkallweit1@gmail.com>, "mpe@ellerman.id.au"
 <mpe@ellerman.id.au>, "paulus@samba.org" <paulus@samba.org>
Subject: Re: fsl_espi errors on v5.7.15
Thread-Topic: fsl_espi errors on v5.7.15
Thread-Index: AQHWceVnik7XsBYbp0S+yHVGh1hdQak2WMaAgAQdSwCAAz9MAIAAfdcAgAD5u4CAB+sMAIAAYfwAgAA6JQCAAPtUgIAAOXyAgABIbACAAAjRgIABm7wAgAD5+gCABBXPAIAAjqOAgAALRACAAAUXgIAA9CsAgADXoQCAAFDQAIABITyAgAAAmgA=
Date: Tue, 1 Sep 2020 23:31:38 +0000
Message-ID: <fff5c456-5c4b-fa30-577e-75d13ae91c40@alliedtelesis.co.nz>
References: <1598940515.6e06nwgi0c.astroid@bobo.none>
 <bfaaa982-33b9-c427-48a4-ddf9dd35e7b9@alliedtelesis.co.nz>
In-Reply-To: <bfaaa982-33b9-c427-48a4-ddf9dd35e7b9@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA119E2643C36A4383FC1DED0CCE9809@atlnz.lc>
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

DQpPbiAyLzA5LzIwIDExOjI5IGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiAxLzA5
LzIwIDY6MTQgcG0sIE5pY2hvbGFzIFBpZ2dpbiB3cm90ZToNCj4+IEV4Y2VycHRzIGZyb20gQ2hy
aXMgUGFja2hhbSdzIG1lc3NhZ2Ugb2YgU2VwdGVtYmVyIDEsIDIwMjAgMTE6MjUgYW06DQo+Pj4g
T24gMS8wOS8yMCAxMjozMyBhbSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOg0KPj4+PiBPbiAzMC4w
OC4yMDIwIDIzOjU5LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+Pj4gT24gMzEvMDgvMjAgOTo0
MSBhbSwgSGVpbmVyIEthbGx3ZWl0IHdyb3RlOg0KPj4+Pj4+IE9uIDMwLjA4LjIwMjAgMjM6MDAs
IENocmlzIFBhY2toYW0gd3JvdGU6DQo+Pj4+Pj4+IE9uIDMxLzA4LzIwIDEyOjMwIGFtLCBOaWNo
b2xhcyBQaWdnaW4gd3JvdGU6DQo+Pj4+Pj4+PiBFeGNlcnB0cyBmcm9tIENocmlzIFBhY2toYW0n
cyBtZXNzYWdlIG9mIEF1Z3VzdCAyOCwgMjAyMCA4OjA3IGFtOg0KPj4+Pj4+PiA8c25pcD4NCj4+
Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gSSd2ZSBhbHNvIG5vdyBzZWVuIHRoZSBSWCBGSUZPIG5vdCBl
bXB0eSBlcnJvciBvbiB0aGUgDQo+Pj4+Pj4+Pj4+Pj4+IFQyMDgwUkRCDQo+Pj4+Pj4+Pj4+Pj4+
DQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogVHJhbnNmZXIgZG9uZSBidXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+Pj4+Pj4+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUg
YnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAw
LnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngvdHggZmlmbydzIA0KPj4+Pj4+Pj4+Pj4+PiBhcmVu
J3QgZW1wdHkhDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFNQSUVfUlhD
TlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gV2l0
aCBteSBjdXJyZW50IHdvcmthcm91bmQgb2YgZW1wdHlpbmcgdGhlIFJYIEZJRk8uIEl0IHNlZW1z
DQo+Pj4+Pj4+Pj4+Pj4+IHN1cnZpdmFibGUuIEludGVyZXN0aW5nbHkgaXQgb25seSBldmVyIHNl
ZW1zIHRvIGJlIDEgZXh0cmEgDQo+Pj4+Pj4+Pj4+Pj4+IGJ5dGUgaW4gdGhlDQo+Pj4+Pj4+Pj4+
Pj4+IFJYIEZJRk8gYW5kIGl0IHNlZW1zIHRvIGJlIGFmdGVyIGVpdGhlciBhIFJFQURfU1Igb3Ig
YSANCj4+Pj4+Pj4+Pj4+Pj4gUkVBRF9GU1IuDQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+
IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4IDcwDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZm
ZTExMDAwMC5zcGk6IHJ4IDAzDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IEV4dHJhIFJYIDAwDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5z
ZmVyIGRvbmUgYnV0IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkg
ZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBidXQgcngvdHggZmlmbydzIA0KPj4+Pj4+Pj4+
Pj4+PiBhcmVuJ3QgZW1wdHkhDQo+Pj4+Pj4+Pj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6
IFNQSUVfUlhDTlQgPSAxLCBTUElFX1RYQ05UID0gMzINCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkg
ZmZlMTEwMDAwLnNwaTogdHggMDUNCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogcnggMDANCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogRXh0cmEgUlgg
MDMNCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogVHJhbnNmZXIgZG9uZSBi
dXQgU1BJRV9ET04gaXNuJ3Qgc2V0IQ0KPj4+Pj4+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAu
c3BpOiBUcmFuc2ZlciBkb25lIGJ1dCByeC90eCBmaWZvJ3MgDQo+Pj4+Pj4+Pj4+Pj4+IGFyZW4n
dCBlbXB0eSENCj4+Pj4+Pj4+Pj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJRV9SWENO
VCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+Pj4+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAu
c3BpOiB0eCAwNQ0KPj4+Pj4+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiByeCAwMA0K
Pj4+Pj4+Pj4+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBSWCAwMw0KPj4+Pj4+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+PiDCoMKgwqDCoCBGcm9tIGFsbCB0aGUgTWljcm9uIFNQSS1O
T1IgZGF0YXNoZWV0cyBJJ3ZlIGdvdCANCj4+Pj4+Pj4+Pj4+Pj4gYWNjZXNzIHRvIGl0IGlzDQo+
Pj4+Pj4+Pj4+Pj4+IHBvc3NpYmxlIHRvIGNvbnRpbnVhbGx5IHJlYWQgdGhlIFNSL0ZTUi4gQnV0
IEkndmUgbm8gaWRlYSANCj4+Pj4+Pj4+Pj4+Pj4gd2h5IGl0DQo+Pj4+Pj4+Pj4+Pj4+IGhhcHBl
bnMgc29tZSB0aW1lcyBhbmQgbm90IG90aGVycy4NCj4+Pj4+Pj4+Pj4+PiBTbyBJIHRoaW5rIEkn
dmUgZ290IGEgcmVwcm9kdWN0aW9uIGFuZCBJIHRoaW5rIEkndmUgDQo+Pj4+Pj4+Pj4+Pj4gYmlz
ZWN0ZWQgdGhlIHByb2JsZW0NCj4+Pj4+Pj4+Pj4+PiB0byBjb21taXQgMzI4MmEzZGEyNWJkICgi
cG93ZXJwYy82NDogSW1wbGVtZW50IHNvZnQgDQo+Pj4+Pj4+Pj4+Pj4gaW50ZXJydXB0IHJlcGxh
eSBpbg0KPj4+Pj4+Pj4+Pj4+IEMiKS4gTXkgZGF5IGlzIGp1c3QgZmluaXNoaW5nIG5vdyBzbyBJ
IGhhdmVuJ3QgYXBwbGllZCB0b28gDQo+Pj4+Pj4+Pj4+Pj4gbXVjaCBzY3J1dGlueQ0KPj4+Pj4+
Pj4+Pj4+IHRvIHRoaXMgcmVzdWx0LiBHaXZlbiB0aGUgdmFyaW91cyByYWJiaXQgaG9sZXMgSSd2
ZSBiZWVuIA0KPj4+Pj4+Pj4+Pj4+IGRvd24gb24gdGhpcw0KPj4+Pj4+Pj4+Pj4+IGlzc3VlIGFs
cmVhZHkgSSdkIHRha2UgdGhpcyBpbmZvcm1hdGlvbiB3aXRoIGEgZ29vZCBkZWdyZWUgDQo+Pj4+
Pj4+Pj4+Pj4gb2Ygc2tlcHRpY2lzbS4NCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4gT0ssIHNv
IGFuIGVhc3kgdGVzdCBzaG91bGQgYmUgdG8gcmUtdGVzdCB3aXRoIGEgNS40IGtlcm5lbC4NCj4+
Pj4+Pj4+Pj4+IEl0IGRvZXNuJ3QgaGF2ZSB5ZXQgdGhlIGNoYW5nZSB5b3UncmUgcmVmZXJyaW5n
IHRvLCBhbmQgdGhlIA0KPj4+Pj4+Pj4+Pj4gZnNsLWVzcGkgZHJpdmVyDQo+Pj4+Pj4+Pj4+PiBp
cyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgaW4gNS43IChqdXN0IHR3byBzbWFsbCBjaGFuZ2VzIGlu
IA0KPj4+Pj4+Pj4+Pj4gNS43KS4NCj4+Pj4+Pj4+Pj4gVGhlcmUncyA2Y2MwYzE2ZDgyZjg4IGFu
ZCBtYXliZSBhbHNvIG90aGVyIGludGVycnVwdCByZWxhdGVkIA0KPj4+Pj4+Pj4+PiBwYXRjaGVz
DQo+Pj4+Pj4+Pj4+IGFyb3VuZCB0aGlzIHRpbWUgdGhhdCBjb3VsZCBhZmZlY3QgYm9vayBFLCBz
byBpdCdzIGdvb2QgaWYgDQo+Pj4+Pj4+Pj4+IHRoYXQgZXhhY3QNCj4+Pj4+Pj4+Pj4gcGF0Y2gg
aXMgY29uZmlybWVkLg0KPj4+Pj4+Pj4+IE15IGNvbmZpcm1hdGlvbiBpcyBiYXNpY2FsbHkgdGhh
dCBJIGNhbiBpbmR1Y2UgdGhlIGlzc3VlIGluIGEgDQo+Pj4+Pj4+Pj4gNS40IGtlcm5lbA0KPj4+
Pj4+Pj4+IGJ5IGNoZXJyeS1waWNraW5nIDMyODJhM2RhMjViZC4gSSdtIGFsc28gYWJsZSB0byAi
Zml4IiB0aGUgDQo+Pj4+Pj4+Pj4gaXNzdWUgaW4NCj4+Pj4+Pj4+PiA1LjktcmMyIGJ5IHJldmVy
dGluZyB0aGF0IG9uZSBjb21taXQuDQo+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+PiBJIGJvdGggY2FzZXMg
aXQncyBub3QgZXhhY3RseSBhIGNsZWFuIGNoZXJyeS1waWNrL3JldmVydCBzbyBJIA0KPj4+Pj4+
Pj4+IGFsc28NCj4+Pj4+Pj4+PiBjb25maXJtZWQgdGhlIGJpc2VjdGlvbiByZXN1bHQgYnkgYnVp
bGRpbmcgYXQgMzI4MmEzZGEyNWJkIA0KPj4+Pj4+Pj4+ICh3aGljaCBzZWVzDQo+Pj4+Pj4+Pj4g
dGhlIGlzc3VlKSBhbmQgdGhlIGNvbW1pdCBqdXN0IGJlZm9yZSAod2hpY2ggZG9lcyBub3QpLg0K
Pj4+Pj4+Pj4gVGhhbmtzIGZvciB0ZXN0aW5nLCB0aGF0IGNvbmZpcm1zIGl0IHdlbGwuDQo+Pj4+
Pj4+Pg0KPj4+Pj4+Pj4gW3NuaXAgcGF0Y2hdDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+IEkgc3RpbGwg
c2F3IHRoZSBpc3N1ZSB3aXRoIHRoaXMgY2hhbmdlIGFwcGxpZWQuIA0KPj4+Pj4+Pj4+IFBQQ19J
UlFfU09GVF9NQVNLX0RFQlVHDQo+Pj4+Pj4+Pj4gZGlkbid0IHJlcG9ydCBhbnl0aGluZyAoZWl0
aGVyIHdpdGggb3Igd2l0aG91dCB0aGUgY2hhbmdlIGFib3ZlKS4NCj4+Pj4+Pj4+IE9rYXksIGl0
IHdhcyBhIGJpdCBvZiBhIHNob3QgaW4gdGhlIGRhcmsuIEkgc3RpbGwgY2FuJ3Qgc2VlIHdoYXQN
Cj4+Pj4+Pj4+IGVsc2UgaGFzIGNoYW5nZWQuDQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gV2hhdCB3b3Vs
ZCBjYXVzZSB0aGlzLCBhIGxvc3QgaW50ZXJydXB0PyBBIHNwdXJpb3VzIGludGVycnVwdD8gT3IN
Cj4+Pj4+Pj4+IGhpZ2hlciBpbnRlcnJ1cHQgbGF0ZW5jeT8NCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBJ
IGRvbid0IHRoaW5rIHRoZSBwYXRjaCBzaG91bGQgY2F1c2Ugc2lnbmlmaWNhbnRseSB3b3JzZSBs
YXRlbmN5LA0KPj4+Pj4+Pj4gKGl0J3Mgc3VwcG9zZWQgdG8gYmUgYSBiaXQgYmV0dGVyIGlmIGFu
eXRoaW5nIGJlY2F1c2UgaXQgDQo+Pj4+Pj4+PiBkb2Vzbid0IHNldA0KPj4+Pj4+Pj4gdXAgdGhl
IGZ1bGwgaW50ZXJydXB0IGZyYW1lKS4gQnV0IGl0J3MgcG9zc2libGUuDQo+Pj4+Pj4+IE15IHdv
cmtpbmcgdGhlb3J5IGlzIHRoYXQgdGhlIFNQSV9ET04gaW5kaWNhdGlvbiBpcyBhbGwgYWJvdXQg
DQo+Pj4+Pj4+IHRoZSBUWA0KPj4+Pj4+PiBkaXJlY3Rpb24gYW4gbm93IHRoYXQgdGhlIGludGVy
cnVwdHMgYXJlIGZhc3RlciB3ZSdyZSBoaXR0aW5nIGFuIA0KPj4+Pj4+PiBlcnJvcg0KPj4+Pj4+
PiBiZWNhdXNlIHRoZXJlIGlzIHN0aWxsIFJYIGFjdGl2aXR5IGdvaW5nIG9uLiBIZWluZXIgZGlz
YWdyZWVzIA0KPj4+Pj4+PiB3aXRoIG15DQo+Pj4+Pj4+IGludGVycHJldGF0aW9uIG9mIHRoZSBT
UElfRE9OIGluZGljYXRpb24gYW5kIHRoZSBmYWN0IHRoYXQgaXQgDQo+Pj4+Pj4+IGRvZXNuJ3QN
Cj4+Pj4+Pj4gaGFwcGVuIGV2ZXJ5IHRpbWUgZG9lcyB0aHJvdyBkb3VidCBvbiBpdC4NCj4+Pj4+
Pj4NCj4+Pj4+PiBJdCdzIHJpZ2h0IHRoYXQgdGhlIGVTUEkgc3BlYyBjYW4gYmUgaW50ZXJwcmV0
ZWQgdGhhdCBTUElfRE9OIA0KPj4+Pj4+IHJlZmVycyB0bw0KPj4+Pj4+IFRYIG9ubHkuIEhvd2V2
ZXIgdGhpcyB3b3VsZG4ndCByZWFsbHkgbWFrZSBzZW5zZSwgYmVjYXVzZSBhbHNvIA0KPj4+Pj4+
IGZvciBSWA0KPj4+Pj4+IHdlIHByb2dyYW0gdGhlIGZyYW1lIGxlbmd0aCwgYW5kIHRoZXJlZm9y
ZSB3YW50IHRvIGJlIG5vdGlmaWVkIA0KPj4+Pj4+IG9uY2UgdGhlDQo+Pj4+Pj4gZnVsbCBmcmFt
ZSB3YXMgcmVjZWl2ZWQuIEFsc28gcHJhY3RpY2FsIGV4cGVyaWVuY2Ugc2hvd3MgdGhhdCANCj4+
Pj4+PiBTUElfRE9ODQo+Pj4+Pj4gaXMgc2V0IGFsc28gYWZ0ZXIgUlgtb25seSB0cmFuc2ZlcnMu
DQo+Pj4+Pj4gVHlwaWNhbCBTUEkgTk9SIHVzZSBjYXNlIGlzIHRoYXQgeW91IHdyaXRlIHJlYWQg
Y29tbWFuZCArIHN0YXJ0IA0KPj4+Pj4+IGFkZHJlc3MsDQo+Pj4+Pj4gZm9sbG93ZWQgYnkgYSBs
b25nZXIgcmVhZC4gSWYgdGhlIFRYLW9ubHkgaW50ZXJwcmV0YXRpb24gd291bGQgYmUgDQo+Pj4+
Pj4gcmlnaHQsDQo+Pj4+Pj4gd2UnZCBhbHdheXMgZW5kIHVwIHdpdGggU1BJX0RPTiBub3QgYmVp
bmcgc2V0Lg0KPj4+Pj4+DQo+Pj4+Pj4+IEkgY2FuJ3QgcmVhbGx5IGV4cGxhaW4gdGhlIGV4dHJh
IFJYIGJ5dGUgaW4gdGhlIGZpZm8uIFdlIGtub3cgDQo+Pj4+Pj4+IGhvdyBtYW55DQo+Pj4+Pj4+
IGJ5dGVzIHRvIGV4cGVjdCBhbmQgd2UgcHVsbCB0aGF0IG1hbnkgZnJvbSB0aGUgZmlmbyBzbyBp
dCdzIG5vdCANCj4+Pj4+Pj4gYXMgaWYNCj4+Pj4+Pj4gd2UncmUgbWlzc2luZyBhbiBpbnRlcnJ1
cHQgY2F1c2luZyB1cyB0byBza2lwIHRoZSBsYXN0IGJ5dGUuIA0KPj4+Pj4+PiBJJ3ZlIGJlZW4N
Cj4+Pj4+Pj4gbG9va2luZyBmb3Igc29tZSBraW5kIG9mIG9mZi1ieS1vbmUgY2FsY3VsYXRpb24g
YnV0IGFnYWluIGlmIGl0IA0KPj4+Pj4+PiB3ZXJlDQo+Pj4+Pj4+IHNvbWV0aGluZyBsaWtlIHRo
YXQgaXQnZCBoYXBwZW4gYWxsIHRoZSB0aW1lLg0KPj4+Pj4+Pg0KPj4+Pj4+IE1heWJlIGl0IGhl
bHBzIHRvIGtub3cgd2hhdCB2YWx1ZSB0aGlzIGV4dHJhIGJ5dGUgaW4gdGhlIEZJRk8gDQo+Pj4+
Pj4gaGFzLiBJcyBpdDoNCj4+Pj4+PiAtIGEgZHVwbGljYXRlIG9mIHRoZSBsYXN0IHJlYWQgYnl0
ZQ0KPj4+Pj4+IC0gb3IgdGhlIG5leHQgYnl0ZSAoYXQgPGVuZCBhZGRyZXNzPiArIDEpDQo+Pj4+
Pj4gLSBvciBhIGZpeGVkIHZhbHVlLCBlLmcuIGFsd2F5cyAweDAwIG9yIDB4ZmYNCj4+Pj4+IFRo
ZSB2YWx1ZXMgd2VyZSB1cCB0aHJlYWQgYSBiaXQgYnV0IEknbGwgcmVwZWF0IHRoZW0gaGVyZQ0K
Pj4+Pj4NCj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHR4IDcwDQo+Pj4+PiBmc2xfZXNw
aSBmZmUxMTAwMDAuc3BpOiByeCAwMw0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogRXh0
cmEgUlggMDANCj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5zZmVyIGRvbmUgYnV0
IFNQSUVfRE9OIGlzbid0IHNldCENCj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IFRyYW5z
ZmVyIGRvbmUgYnV0IHJ4L3R4IGZpZm8ncyBhcmVuJ3QgZW1wdHkhDQo+Pj4+PiBmc2xfZXNwaSBm
ZmUxMTAwMDAuc3BpOiBTUElFX1JYQ05UID0gMSwgU1BJRV9UWENOVCA9IDMyDQo+Pj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiB0eCAwNQ0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTog
cnggMDANCj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IEV4dHJhIFJYIDAzDQo+Pj4+PiBm
c2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCBTUElFX0RPTiBpc24ndCBz
ZXQhDQo+Pj4+PiBmc2xfZXNwaSBmZmUxMTAwMDAuc3BpOiBUcmFuc2ZlciBkb25lIGJ1dCByeC90
eCBmaWZvJ3MgYXJlbid0IGVtcHR5IQ0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNwaTogU1BJ
RV9SWENOVCA9IDEsIFNQSUVfVFhDTlQgPSAzMg0KPj4+Pj4gZnNsX2VzcGkgZmZlMTEwMDAwLnNw
aTogdHggMDUNCj4+Pj4+IGZzbF9lc3BpIGZmZTExMDAwMC5zcGk6IHJ4IDAwDQo+Pj4+PiBmc2xf
ZXNwaSBmZmUxMTAwMDAuc3BpOiBFeHRyYSBSWCAwMw0KPj4+Pj4NCj4+Pj4+DQo+Pj4+PiBUaGUg
cnggMDAgRXh0cmEgUlggMDMgaXMgYSBiaXQgY29uY2VybmluZy4gSSd2ZSBvbmx5IGV2ZXIgc2Vl
biANCj4+Pj4+IHRoZW0gd2l0aA0KPj4+Pj4gZWl0aGVyIGEgUkVBRF9TUiBvciBhIFJFQURfRlNS
LiBOZXZlciBhIGRhdGEgcmVhZC4NCj4+Pj4+DQo+Pj4+IEp1c3QgcmVtZW1iZXJlZCBzb21ldGhp
bmcgYWJvdXQgU1BJRV9ET046DQo+Pj4+IFRyYW5zZmVycyBhcmUgYWx3YXlzIGZ1bGwgZHVwbGV4
LCB0aGVyZWZvcmUgaW4gY2FzZSBvZiBhIHJlYWQgdGhlIGNoaXANCj4+Pj4gc2VuZHMgZHVtbXkg
emVybydzLiBIYXZpbmcgc2FpZCB0aGF0IGluIGNhc2Ugb2YgYSByZWFkIFNQSUVfRE9OIG1lYW5z
DQo+Pj4+IHRoYXQgdGhlIGxhc3QgZHVtbXkgemVybyB3YXMgc2hpZnRlZCBvdXQuDQo+Pj4+DQo+
Pj4+IFJFQURfU1IgYW5kIFJFQURfRlNSIGFyZSB0aGUgc2hvcnRlc3QgdHJhbnNmZXJzLCAxIGJ5
dGUgb3V0IGFuZCAxIA0KPj4+PiBieXRlIGluLg0KPj4+PiBTbyB0aGUgaXNzdWUgbWF5IGhhdmUg
YSBkZXBlbmRlbmN5IG9uIHRoZSBsZW5ndGggb2YgdGhlIHRyYW5zZmVyLg0KPj4+PiBIb3dldmVy
IEkgc2VlIG5vIGdvb2QgZXhwbGFuYXRpb24gc28gZmFyLiBZb3UgY2FuIHRyeSBhZGRpbmcgYSAN
Cj4+Pj4gZGVsYXkgb2YNCj4+Pj4gYSBmZXcgbWlyb3NlY29uZHMgYmV0d2VlbiB0aGUgZm9sbG93
aW5nIHRvIGNvbW1hbmRzIGluIA0KPj4+PiBmc2xfZXNwaV9idWZzKCkuDQo+Pj4+DQo+Pj4+IMKg
wqDCoMKgZnNsX2VzcGlfd3JpdGVfcmVnKGVzcGksIEVTUElfU1BJTSwgbWFzayk7DQo+Pj4+DQo+
Pj4+IMKgwqDCoMKgLyogUHJldmVudCBmaWxsaW5nIHRoZSBmaWZvIGZyb20gZ2V0dGluZyBpbnRl
cnJ1cHRlZCAqLw0KPj4+PiDCoMKgwqDCoHNwaW5fbG9ja19pcnEoJmVzcGktPmxvY2spOw0KPj4+
Pg0KPj4+PiBNYXliZSBlbmFibGluZyBpbnRlcnJ1cHRzIGFuZCBzZWVpbmcgdGhlIFNQSUVfRE9O
IGludGVycnVwdCBhcmUgdG9vIA0KPj4+PiBjbG9zZS4NCj4+PiBJIHRoaW5rIHRoaXMgbWlnaHQg
YmUgaGVhZGluZyBpbiB0aGUgcmlnaHQgZGlyZWN0aW9uLiBQbGF5aW5nIGFib3V0IA0KPj4+IHdp
dGgNCj4+PiBhIGRlbGF5IGRvZXMgc2VlbSB0byBtYWtlIHRoZSB0d28gc3ltcHRvbXMgbGVzcyBs
aWtlbHkuIEFsdGhvdWdoIEkgaGF2ZQ0KPj4+IHRvIHNldCBpdCBxdWl0ZSBoaWdoIChpLmUuIG1z
bGVlcCgxMDApKSB0byBjb21wbGV0ZWx5IGF2b2lkIGFueQ0KPj4+IHBvc3NpYmlsaXR5IG9mIHNl
ZWluZyBlaXRoZXIgbWVzc2FnZS4NCj4+IFRoZSBwYXRjaCBtaWdodCByZXBsYXkgdGhlIGludGVy
cnVwdCBhIGxpdHRsZSBiaXQgZmFzdGVyLCBidXQgaXQgd291bGQNCj4+IGJlIGEgZmV3IG1pY3Jv
c2Vjb25kcyBhdCBtb3N0IEkgdGhpbmsgKGp1c3QgZnJvbSBpbXByb3ZlZCBjb2RlKS4NCj4+DQo+
PiBXb3VsZCB5b3UgYmUgYWJsZSB0byBmdHJhY2UgdGhlIGludGVycnVwdCBoYW5kbGVyIGZ1bmN0
aW9uIGFuZCBzZWUgaWYgDQo+PiB5b3UNCj4+IGNhbiBzZWUgYSBkaWZmZXJlbmNlIGluIG51bWJl
ciBvciB0aW1pbmcgb2YgaW50ZXJydXB0cz8gSSdtIGF0IGEgYml0IG9mDQo+PiBhIGxvc3MuDQo+
IFRoaXMgaXMgZ2V0dGluZyByZWFsbHkgd2VpcmQuIEkgd2FzIHNldHRpbmcgdXAgdG8gcnVuIHdp
dGggZnRyYWNlIGFuZCANCj4gZm91bmQgSSBjb3VsZG4ndCByZXByb2R1Y2UgaXQgb24gdGhlIHRp
cCBvZiBMaW51cydzIHRyZWUgKGN1cnJlbnRseSANCj4gcG9pbnRpbmcgYXQgZTdhNTIyYzgzYjg2
KS4gQnV0IEkgc3dlYXIgSSBjb3VsZCBsYXN0IHdlZWsuIFN1cmUgZW5vdWdoIA0KPiBpZiBJIGNo
ZWNrb3V0IDUuOS1yYzIgKG9yIDUuNy4xNSkgSSBjYW4gcmVwcm9kdWNlIHRoZSBwcm9ibGVtIGFn
YWluLg0KDQoqU2lnaCogbXkgbWFzdGVyIGJyYW5jaCBzdGlsbCBoYXMgdGhlIGludGVycnVwdCBj
aGFuZ2VzIHJldmVydGVkLg0K
