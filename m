Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E306ABFC19
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 02:06:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fXBr36hhzDr0k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 10:06:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=2001:df5:b000:5::4; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="Cth/P0MQ"; dkim-atps=neutral
X-Greylist: delayed 616 seconds by postgrey-1.36 at bilbo;
 Fri, 27 Sep 2019 10:04:31 AEST
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fX8v0DDdzDqxH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 10:04:30 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 139B78365B;
 Fri, 27 Sep 2019 11:54:08 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1569542048;
 bh=adqayW/GotDamDLFcn4zqEqVhVtqWXa5Bmps2f+e1iY=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=Cth/P0MQZUmST4NB5xwYaF93gt8YAbUKhufSZam8r2HuNdMfXG3yQn+Km2M1YSJj5
 7h0zPzjnd2ME/wD6ZBuhG4OPn1jGVfVMJ5mNsckumAhGhi+W+Nn7DkzbWMU2FXtDRm
 S4zWotQqT3AwUzOt+taxFn3rFtTVdvl6wAPM/HFTbXZySygwQlenkn1KC8tluFxb8J
 PrklhxisUeFb42hI6j4UrJ6AZR3j+pD2Ku/3mlVChC69WQh9AAXnRkpY2nJq+zj8WA
 Y09Ul3mhol4Ubt2Y1edUqpyMAoPYJ5irqLaa4fuCN+zzcC4KCTijXxc3xQ9kim4bCM
 L6xVE8pRn9Vbw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d8d4fa00000>; Fri, 27 Sep 2019 11:54:08 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1156.6; Fri, 27 Sep 2019 11:54:07 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Fri, 27 Sep 2019 11:54:07 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>, "malat@debian.org"
 <malat@debian.org>
Subject: Re: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Thread-Topic: [PATCH v3] powerpc: Support CMDLINE_EXTEND
Thread-Index: AQHVSLt5SSIu+9gAGkizQ6ZspvV50qbmfk4AgFeyboA=
Date: Thu, 26 Sep 2019 23:54:07 +0000
Message-ID: <337d48b4ecfa116b0ec04ccfb4d936f41757692e.camel@alliedtelesis.co.nz>
References: <20190801225006.21952-1-chris.packham@alliedtelesis.co.nz>
 <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
In-Reply-To: <9262a291-161f-e172-9d13-88a717da9de4@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:34ed:f955:f4f7:adde]
Content-Type: text/plain; charset="utf-8"
Content-ID: <5AFE55F8ECD39C4689C628C31801848E@atlnz.lc>
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQWxsLA0KDQpPbiBGcmksIDIwMTktMDgtMDIgYXQgMDY6NDAgKzAyMDAsIENocmlzdG9waGUg
TGVyb3kgd3JvdGU6DQo+IA0KPiBMZSAwMi8wOC8yMDE5IMOgIDAwOjUwLCBDaHJpcyBQYWNraGFt
IGEgw6ljcml0IDoNCj4gPiBCcmluZyBwb3dlcnBjIGluIGxpbmUgd2l0aCBvdGhlciBhcmNoaXRl
Y3R1cmVzIHRoYXQgc3VwcG9ydCBleHRlbmRpbmcgb3INCj4gPiBvdmVycmlkaW5nIHRoZSBib290
bG9hZGVyIHByb3ZpZGVkIGNvbW1hbmQgbGluZS4NCj4gPiANCj4gPiBUaGUgY3VycmVudCBiZWhh
dmlvdXIgaXMgbW9zdCBsaWtlIENNRExJTkVfRlJPTV9CT09UTE9BREVSIHdoZXJlIHRoZQ0KPiA+
IGJvb3Rsb2FkZXIgY29tbWFuZCBsaW5lIGlzIHByZWZlcnJlZCBidXQgdGhlIGtlcm5lbCBjb25m
aWcgY2FuIHByb3ZpZGUgYQ0KPiA+IGZhbGxiYWNrIHNvIENNRExJTkVfRlJPTV9CT09UTE9BREVS
IGlzIHRoZSBkZWZhdWx0LiBDTURMSU5FX0VYVEVORCBjYW4NCj4gPiBiZSB1c2VkIHRvIGFwcGVu
ZCB0aGUgQ01ETElORSBmcm9tIHRoZSBrZXJuZWwgY29uZmlnIHRvIHRoZSBvbmUgcHJvdmlkZWQN
Cj4gPiBieSB0aGUgYm9vdGxvYWRlci4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQ
YWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IA0KPiBSZXZpZXdl
ZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQoNCkkgc2Vl
IHRoaXMgaGFzbid0IGhpdCBMaW51cydzIHRyZWUgaXMgaXQgd2FpdGluZyBmb3IgbWUgdG8gZG8g
c29tZXRoaW5nDQpvciBqdXN0IGZhbGxlbiBvZmYgdGhlIHJhZGFyPw0KDQo+IA0KPiA+IC0tLQ0K
PiA+IENoYW5nZXMgaW4gdjM6DQo+ID4gLSBkb24ndCB1c2UgQlVHX09OIGluIHByb21fc3RybGNh
dA0KPiA+IC0gcmVhcnJhbmdlIHRoaW5ncyB0byBlbGltaW5hdGUgcHJvbV9zdHJsY3B5DQo+ID4g
DQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIGluY29ycG9yYXRlIGlkZWFzIGZyb20gQ2hyaXN0
b3BlJ3MgcGF0Y2ggaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wYXRjaC8xMDc0MTI2Lw0K
PiA+IC0gc3VwcG9ydCBDTURMSU5FX0ZPUkNFDQo+ID4gDQo+ID4gICBhcmNoL3Bvd2VycGMvS2Nv
bmZpZyAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKystDQo+ID4gICBhcmNoL3Bvd2Vy
cGMva2VybmVsL3Byb21faW5pdC5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tDQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gv
cG93ZXJwYy9LY29uZmlnDQo+ID4gaW5kZXggNzdmNmViZjk3MTEzLi5kNDEzZmUxYjQwNTggMTAw
NjQ0DQo+ID4gLS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gPiArKysgYi9hcmNoL3Bvd2Vy
cGMvS2NvbmZpZw0KPiA+IEBAIC04NTIsMTUgKzg1MiwzMyBAQCBjb25maWcgQ01ETElORQ0KPiA+
ICAgCSAgc29tZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0aW1lIGJ5IGVudGVyaW5n
IHRoZW0gaGVyZS4gIEluDQo+ID4gICAJICBtb3N0IGNhc2VzIHlvdSB3aWxsIG5lZWQgdG8gc3Bl
Y2lmeSB0aGUgcm9vdCBkZXZpY2UgaGVyZS4NCj4gPiAgIA0KPiA+ICtjaG9pY2UNCj4gPiArCXBy
b21wdCAiS2VybmVsIGNvbW1hbmQgbGluZSB0eXBlIiBpZiBDTURMSU5FICE9ICIiDQo+ID4gKwlk
ZWZhdWx0IENNRExJTkVfRlJPTV9CT09UTE9BREVSDQo+ID4gKw0KPiA+ICtjb25maWcgQ01ETElO
RV9GUk9NX0JPT1RMT0FERVINCj4gPiArCWJvb2wgIlVzZSBib290bG9hZGVyIGtlcm5lbCBhcmd1
bWVudHMgaWYgYXZhaWxhYmxlIg0KPiA+ICsJaGVscA0KPiA+ICsJICBVc2VzIHRoZSBjb21tYW5k
LWxpbmUgb3B0aW9ucyBwYXNzZWQgYnkgdGhlIGJvb3QgbG9hZGVyLiBJZg0KPiA+ICsJICB0aGUg
Ym9vdCBsb2FkZXIgZG9lc24ndCBwcm92aWRlIGFueSwgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1h
bmQNCj4gPiArCSAgc3RyaW5nIHByb3ZpZGVkIGluIENNRExJTkUgd2lsbCBiZSB1c2VkLg0KPiA+
ICsNCj4gPiArY29uZmlnIENNRExJTkVfRVhURU5EDQo+ID4gKwlib29sICJFeHRlbmQgYm9vdGxv
YWRlciBrZXJuZWwgYXJndW1lbnRzIg0KPiA+ICsJaGVscA0KPiA+ICsJICBUaGUgY29tbWFuZC1s
aW5lIGFyZ3VtZW50cyBwcm92aWRlZCBieSB0aGUgYm9vdCBsb2FkZXIgd2lsbCBiZQ0KPiA+ICsJ
ICBhcHBlbmRlZCB0byB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcuDQo+ID4gKw0K
PiA+ICAgY29uZmlnIENNRExJTkVfRk9SQ0UNCj4gPiAgIAlib29sICJBbHdheXMgdXNlIHRoZSBk
ZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyINCj4gPiAtCWRlcGVuZHMgb24gQ01ETElORV9C
T09MDQo+ID4gICAJaGVscA0KPiA+ICAgCSAgQWx3YXlzIHVzZSB0aGUgZGVmYXVsdCBrZXJuZWwg
Y29tbWFuZCBzdHJpbmcsIGV2ZW4gaWYgdGhlIGJvb3QNCj4gPiAgIAkgIGxvYWRlciBwYXNzZXMg
b3RoZXIgYXJndW1lbnRzIHRvIHRoZSBrZXJuZWwuDQo+ID4gICAJICBUaGlzIGlzIHVzZWZ1bCBp
ZiB5b3UgY2Fubm90IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlIHRoZQ0KPiA+ICAgCSAgY29tbWFu
ZC1saW5lIG9wdGlvbnMgeW91ciBib290IGxvYWRlciBwYXNzZXMgdG8gdGhlIGtlcm5lbC4NCj4g
PiAgIA0KPiA+ICtlbmRjaG9pY2UNCj4gPiArDQo+ID4gICBjb25maWcgRVhUUkFfVEFSR0VUUw0K
PiA+ICAgCXN0cmluZyAiQWRkaXRpb25hbCBkZWZhdWx0IGltYWdlIHR5cGVzIg0KPiA+ICAgCWhl
bHANCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMNCj4gPiBpbmRleCA1MTQ3MDdlZjY3NzkuLjFj
NzAxMGNjNmVjOSAxMDA2NDQNCj4gPiAtLS0gYS9hcmNoL3Bvd2VycGMva2VybmVsL3Byb21faW5p
dC5jDQo+ID4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9tX2luaXQuYw0KPiA+IEBAIC0y
OTgsMTYgKzI5OCwyNCBAQCBzdGF0aWMgY2hhciBfX2luaXQgKnByb21fc3Ryc3RyKGNvbnN0IGNo
YXIgKnMxLCBjb25zdCBjaGFyICpzMikNCj4gPiAgIAlyZXR1cm4gTlVMTDsNCj4gPiAgIH0NCj4g
PiAgIA0KPiA+IC1zdGF0aWMgc2l6ZV90IF9faW5pdCBwcm9tX3N0cmxjcHkoY2hhciAqZGVzdCwg
Y29uc3QgY2hhciAqc3JjLCBzaXplX3Qgc2l6ZSkNCj4gPiAtew0KPiA+IC0Jc2l6ZV90IHJldCA9
IHByb21fc3RybGVuKHNyYyk7DQo+ID4gK3N0YXRpYyBzaXplX3QgX19pbml0IHByb21fc3RybGNh
dChjaGFyICpkZXN0LCBjb25zdCBjaGFyICpzcmMsIHNpemVfdCBjb3VudCkNCj4gPiArew0KPiA+
ICsJc2l6ZV90IGRzaXplID0gcHJvbV9zdHJsZW4oZGVzdCk7DQo+ID4gKwlzaXplX3QgbGVuID0g
cHJvbV9zdHJsZW4oc3JjKTsNCj4gPiArCXNpemVfdCByZXMgPSBkc2l6ZSArIGxlbjsNCj4gPiAr
DQo+ID4gKwkvKiBUaGlzIHdvdWxkIGJlIGEgYnVnICovDQo+ID4gKwlpZiAoZHNpemUgPj0gY291
bnQpDQo+ID4gKwkJcmV0dXJuIGNvdW50Ow0KPiA+ICsNCj4gPiArCWRlc3QgKz0gZHNpemU7DQo+
ID4gKwljb3VudCAtPSBkc2l6ZTsNCj4gPiArCWlmIChsZW4gPj0gY291bnQpDQo+ID4gKwkJbGVu
ID0gY291bnQtMTsNCj4gPiArCW1lbWNweShkZXN0LCBzcmMsIGxlbik7DQo+ID4gKwlkZXN0W2xl
bl0gPSAwOw0KPiA+ICsJcmV0dXJuIHJlczsNCj4gPiAgIA0KPiA+IC0JaWYgKHNpemUpIHsNCj4g
PiAtCQlzaXplX3QgbGVuID0gKHJldCA+PSBzaXplKSA/IHNpemUgLSAxIDogcmV0Ow0KPiA+IC0J
CW1lbWNweShkZXN0LCBzcmMsIGxlbik7DQo+ID4gLQkJZGVzdFtsZW5dID0gJ1wwJzsNCj4gPiAt
CX0NCj4gPiAtCXJldHVybiByZXQ7DQo+ID4gICB9DQo+ID4gICANCj4gPiAgICNpZmRlZiBDT05G
SUdfUFBDX1BTRVJJRVMNCj4gPiBAQCAtNzU5LDEwICs3NjcsMTQgQEAgc3RhdGljIHZvaWQgX19p
bml0IGVhcmx5X2NtZGxpbmVfcGFyc2Uodm9pZCkNCj4gPiAgIA0KPiA+ICAgCXByb21fY21kX2xp
bmVbMF0gPSAwOw0KPiA+ICAgCXAgPSBwcm9tX2NtZF9saW5lOw0KPiA+IC0JaWYgKChsb25nKXBy
b20uY2hvc2VuID4gMCkNCj4gPiArDQo+ID4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0NNRExJ
TkVfRk9SQ0UpICYmIChsb25nKXByb20uY2hvc2VuID4gMCkNCj4gPiAgIAkJbCA9IHByb21fZ2V0
cHJvcChwcm9tLmNob3NlbiwgImJvb3RhcmdzIiwgcCwgQ09NTUFORF9MSU5FX1NJWkUtMSk7DQo+
ID4gLQlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9CT09MKSAmJiAobCA8PSAwIHx8IHBb
MF0gPT0gJ1wwJykpIC8qIGRibCBjaGVjayAqLw0KPiA+IC0JCXByb21fc3RybGNweShwcm9tX2Nt
ZF9saW5lLCBDT05GSUdfQ01ETElORSwgc2l6ZW9mKHByb21fY21kX2xpbmUpKTsNCj4gPiArDQo+
ID4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQ01ETElORV9FWFRFTkQpIHx8IGwgPD0gMCB8fCBw
WzBdID09ICdcMCcpDQo+ID4gKwkJcHJvbV9zdHJsY2F0KHByb21fY21kX2xpbmUsICIgIiBDT05G
SUdfQ01ETElORSwNCj4gPiArCQkJICAgICBzaXplb2YocHJvbV9jbWRfbGluZSkpOw0KPiA+ICsN
Cj4gPiAgIAlwcm9tX3ByaW50ZigiY29tbWFuZCBsaW5lOiAlc1xuIiwgcHJvbV9jbWRfbGluZSk7
DQo+ID4gICANCj4gPiAgICNpZmRlZiBDT05GSUdfUFBDNjQNCj4gPiANCg==
