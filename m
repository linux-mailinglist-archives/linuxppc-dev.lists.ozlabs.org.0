Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A690E191F56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:39:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nC4s2B5tzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 13:39:41 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=ilkOae9L; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nC3C05YNzDqfK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:38:14 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 0F6ED80237;
 Wed, 25 Mar 2020 15:38:10 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1585103890;
 bh=ZzysIO/9RPDV/A3vlTmlFXsSYJO80TeqS/R9s7obePE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=ilkOae9LxdGbrVW/WD2EbGvKSoIym4cmTHupObqiTYpRhEY/BkStZftFjVqflVCLs
 7SbyLckNAZuwymM6jGy5UM0ETFXnNgIB52k8S7kMVlx0RV2isSRLKhVGfJoHo38Rca
 ewgDx5ueBXArhY28cv7ENLdIC98Kx0YnCZ8Xz562nZ1UBVM6GECsvVRMQnzrWidTEp
 DB39TCvxQJ3HJyW5tg+wDO+7YD5Y+oHX+sqAJe92Bh2ub1QRwkmapd7GOvdwAeFava
 JfoCUxF+UkpcRF2l9Mmp/1f2/8s/JSJ7AUKXgCZe6k7pxOHh/eQT1hoidjfAqarYMy
 3+cIS24Hy0XfA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e7ac40d0000>; Wed, 25 Mar 2020 15:38:10 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 15:38:04 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 25 Mar 2020 15:38:04 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "oss@buserror.net"
 <oss@buserror.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
Thread-Topic: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
Thread-Index: AQHWAiQ+A9/gcoCawUaa9nFTUYpnM6hXs9EAgAACfICAAAhNAA==
Date: Wed, 25 Mar 2020 02:38:04 +0000
Message-ID: <ae2930cdc30779ec0c6183e73849b47dcf5d57b0.camel@alliedtelesis.co.nz>
References: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
 <877dz9xkhr.fsf@mpe.ellerman.id.au>
 <81c68751cb89bbff13a09467b94530a555d69552.camel@buserror.net>
In-Reply-To: <81c68751cb89bbff13a09467b94530a555d69552.camel@buserror.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AB8EC276708ED4F893AB64140E9BBF0@atlnz.lc>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIwLTAzLTI0IGF0IDIxOjA4IC0wNTAwLCBTY290dCBXb29kIHdyb3RlOg0KPiBP
biBXZWQsIDIwMjAtMDMtMjUgYXQgMTI6NTkgKzExMDAsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6
DQo+ID4gQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56PiB3
cml0ZXM6DQo+ID4gPiBBZGQgdGhlIGQtY2FjaGUvaS1jYWNoZSBwcm9wZXJ0aWVzIGZvciB0aGUg
VDIwOHggU29Dcy4gVGhlIEwxDQo+ID4gPiBjYWNoZSBvbg0KPiA+ID4gdGhlc2UgU29DcyBpcyAz
MktpQiBhbmQgaXMgc3BsaXQgaW50byA2NCBieXRlIGJsb2NrcyAobGluZXMpLg0KPiA+ID4gDQo+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRl
bGVzaXMuY28ubno+DQo+ID4gPiAtLS0NCj4gPiA+ICBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNs
L3QyMDh4c2ktcHJlLmR0c2kgfCAxNiArKysrKysrKysrKysrKysrDQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDE2IGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBMR1RNLg0KPiA+IA0KPiA+IEknbGwg
d2FpdCBhIGZldyBkYXlzIHRvIHNlZSBpZiBTY290dCB3YW50cyB0byBhY2sgaXQuDQo+ID4gDQo+
ID4gY2hlZXJzDQo+ID4gDQo+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2Jv
b3QvZHRzL2ZzbC90MjA4eHNpLXByZS5kdHNpDQo+ID4gPiBiL2FyY2gvcG93ZXJwYy9ib290L2R0
cy9mc2wvdDIwOHhzaS1wcmUuZHRzaQ0KPiA+ID4gaW5kZXggM2Y3NDVkZTQ0Mjg0Li4yYWQyN2Ux
NmFjMTYgMTAwNjQ0DQo+ID4gPiAtLS0gYS9hcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL3QyMDh4
c2ktcHJlLmR0c2kNCj4gPiA+ICsrKyBiL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvdDIwOHhz
aS1wcmUuZHRzaQ0KPiA+ID4gQEAgLTgxLDYgKzgxLDEwIEBAIGNwdXMgew0KPiA+ID4gIAkJY3B1
MDogUG93ZXJQQyxlNjUwMEAwIHsNCj4gPiA+ICAJCQlkZXZpY2VfdHlwZSA9ICJjcHUiOw0KPiA+
ID4gIAkJCXJlZyA9IDwwIDE+Ow0KPiA+ID4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0PjsN
Cj4gPiA+ICsJCQlpLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47DQo+ID4gPiArCQkJZC1jYWNoZS1z
aXplID0gPDMyNzY4PjsNCj4gPiA+ICsJCQlpLWNhY2hlLXNpemUgPSA8MzI3Njg+Ow0KPiA+ID4g
IAkJCWNsb2NrcyA9IDwmY2xvY2tnZW4gMSAwPjsNCj4gPiA+ICAJCQluZXh0LWxldmVsLWNhY2hl
ID0gPCZMMl8xPjsNCj4gPiA+ICAJCQlmc2wscG9ydGlkLW1hcHBpbmcgPSA8MHg4MDAwMDAwMD47
DQo+IA0KPiBVLUJvb3Qgc2hvdWxkIGJlIHNldHRpbmcgZC9pLWNhY2hlLXNpemUgYW5kIGQvaS1j
YWNoZS1ibG9jay1zaXplIC0tDQo+IGFyZSB5b3UNCj4gdXNpbmcgc29tZXRoaW5nIGVsc2U/DQoN
Ck5vcGUgaXQgaXMgdS1ib290IHNwZWNpZmljYWxseQ0KDQpVLUJvb3QgMjAxNy4wMS1yYzMtZGly
dHkNCg0KSSdtIHByZXR0eSBzdXJlIHRoZSAnLWRpcnR5JyBpcyBqdXN0IGEgY2hhbmdlIHRvIHVz
ZSBhIGRpZmZlcmVudCBjcm9zcy0NCmNvbXBpbGVyIGJ1dCBJIGNhbid0IGNvbmZpcm0gYW5kIEkn
bSBhIGxpdHRsZSBoZXNpdGFudCB0byB0cnkgdXBkYXRpbmcNCmFzIEkndmUgb25seSBnb3QgcmVt
b3RlIGFjY2VzcyB0byB0aGUgYm9hcmQgcmlnaHQgbm93Lg0KDQo+IA0KPiBUaGUgbGluZSBzaXpl
IGlzIHRoZSBzYW1lIGFzIHRoZSBibG9jayBzaXplIHNvIHdlIGRvbid0IG5lZWQgYQ0KPiBzZXBh
cmF0ZSBkL2ktDQo+IGNhY2hlLWxpbmUtc2l6ZS4NCj4gDQoNCkknbSBub3Qgc3VyZSB0aGF0J2xs
IHdvcmsgbG9va2luZyBhdCB0aGUgY29kZVsxXS4gSXQgaGFzIGxvZ2ljIHRvIHNldA0KYnNpemVw
IHRvIGxzaXplcCBpZiBubyBibG9jayBzaXplIGlzIHNldCBidXQgbm90IHRoZSBvdGhlciB3YXkg
cm91bmQuDQpMb29raW5nIGF0IHRoZSBzcGVjIGZyb20gZGV2aWNldHJlZS5vcmcgdGhpcyBhY3R1
YWxseSBzZWVtcyB3cm9uZy4NClBlcmhhcHMgdGhhdCBpcyB0aGUgcmVhbCBzb3VyY2Ugb2YgdGhl
IGVycm9yLg0KDQotLQ0KWzFdIC0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvYXJjaC9wb3dlcnBjL2tlcm5lbC9z
ZXR1cF82NC5jI241MTANCg0KDQo=
