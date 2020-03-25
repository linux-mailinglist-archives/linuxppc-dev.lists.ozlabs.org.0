Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 53095191F77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:51:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nCLw18nHzDqth
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 13:51:52 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=cS1XZJQu; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nCK73dnMzDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:50:19 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CD64080237;
 Wed, 25 Mar 2020 15:50:16 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1585104616;
 bh=tt9AynKZUcSZQVIgxm8HX6HmqX+y292YOuPT3UUI6xs=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=cS1XZJQuhQ3k0DPVUUm9ngB/6SQUqxZ5vn13F37/J+op70MmipbPxmoTM0RRMb4NJ
 u7KSMPhuXZzy3n+B//o1iREjb/VWt7UwdcJc2KUzUOXoMVwZOVbcVXRN3S0hPNx1G5
 5So4IePUbk54P1CRPW/WLjS90W4OCR4YTX7nb8p9SrSYEgROo5RPykj1mcgyUhWt/R
 SRZrkIdlN66rVT1+47xWcx7X/1l+ap4cCvbjOnaZvOF5wo15AW+5+oz2vEZyuQyVce
 C7EFc3seLflkxGxZCK63H2LR5VwjCtqyizdZUN4XC9n/glursoRDc91d0OZXg65DJJ
 djiXeq9yRfexQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e7ac6e90000>; Wed, 25 Mar 2020 15:50:17 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 25 Mar 2020 15:50:16 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Wed, 25 Mar 2020 15:50:16 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "mark.rutland@arm.com" <mark.rutland@arm.com>, "oss@buserror.net"
 <oss@buserror.net>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "paulus@samba.org" <paulus@samba.org>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
Thread-Topic: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
Thread-Index: AQHWAiQ+A9/gcoCawUaa9nFTUYpnM6hXs9EAgAACfICAAAhNAIAAA2iA
Date: Wed, 25 Mar 2020 02:50:16 +0000
Message-ID: <dd342c71e03e654a8786302d82f9662004418c6e.camel@alliedtelesis.co.nz>
References: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
 <877dz9xkhr.fsf@mpe.ellerman.id.au>
 <81c68751cb89bbff13a09467b94530a555d69552.camel@buserror.net>
 <ae2930cdc30779ec0c6183e73849b47dcf5d57b0.camel@alliedtelesis.co.nz>
In-Reply-To: <ae2930cdc30779ec0c6183e73849b47dcf5d57b0.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <653105C07A0A4244B27198495E9FFC78@atlnz.lc>
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

T24gV2VkLCAyMDIwLTAzLTI1IGF0IDE1OjM4ICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0K
PiBPbiBUdWUsIDIwMjAtMDMtMjQgYXQgMjE6MDggLTA1MDAsIFNjb3R0IFdvb2Qgd3JvdGU6DQo+
ID4gT24gV2VkLCAyMDIwLTAzLTI1IGF0IDEyOjU5ICsxMTAwLCBNaWNoYWVsIEVsbGVybWFuIHdy
b3RlOg0KPiA+ID4gQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNv
Lm56PiB3cml0ZXM6DQo+ID4gPiA+IEFkZCB0aGUgZC1jYWNoZS9pLWNhY2hlIHByb3BlcnRpZXMg
Zm9yIHRoZSBUMjA4eCBTb0NzLiBUaGUgTDENCj4gPiA+ID4gY2FjaGUgb24NCj4gPiA+ID4gdGhl
c2UgU29DcyBpcyAzMktpQiBhbmQgaXMgc3BsaXQgaW50byA2NCBieXRlIGJsb2NrcyAobGluZXMp
Lg0KPiA+ID4gPiANCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMu
cGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56DQo+ID4gPiA+ID4NCj4gPiA+ID4gLS0tDQo+ID4g
PiA+ICBhcmNoL3Bvd2VycGMvYm9vdC9kdHMvZnNsL3QyMDh4c2ktcHJlLmR0c2kgfCAxNg0KPiA+
ID4gPiArKysrKysrKysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0
aW9ucygrKQ0KPiA+ID4gDQo+ID4gPiBMR1RNLg0KPiA+ID4gDQo+ID4gPiBJJ2xsIHdhaXQgYSBm
ZXcgZGF5cyB0byBzZWUgaWYgU2NvdHQgd2FudHMgdG8gYWNrIGl0Lg0KPiA+ID4gDQo+ID4gPiBj
aGVlcnMNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
Ym9vdC9kdHMvZnNsL3QyMDh4c2ktcHJlLmR0c2kNCj4gPiA+ID4gYi9hcmNoL3Bvd2VycGMvYm9v
dC9kdHMvZnNsL3QyMDh4c2ktcHJlLmR0c2kNCj4gPiA+ID4gaW5kZXggM2Y3NDVkZTQ0Mjg0Li4y
YWQyN2UxNmFjMTYgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2FyY2gvcG93ZXJwYy9ib290L2R0cy9m
c2wvdDIwOHhzaS1wcmUuZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL3Bvd2VycGMvYm9vdC9kdHMv
ZnNsL3QyMDh4c2ktcHJlLmR0c2kNCj4gPiA+ID4gQEAgLTgxLDYgKzgxLDEwIEBAIGNwdXMgew0K
PiA+ID4gPiAgCQljcHUwOiBQb3dlclBDLGU2NTAwQDAgew0KPiA+ID4gPiAgCQkJZGV2aWNlX3R5
cGUgPSAiY3B1IjsNCj4gPiA+ID4gIAkJCXJlZyA9IDwwIDE+Ow0KPiA+ID4gPiArCQkJZC1jYWNo
ZS1saW5lLXNpemUgPSA8NjQ+Ow0KPiA+ID4gPiArCQkJaS1jYWNoZS1saW5lLXNpemUgPSA8NjQ+
Ow0KPiA+ID4gPiArCQkJZC1jYWNoZS1zaXplID0gPDMyNzY4PjsNCj4gPiA+ID4gKwkJCWktY2Fj
aGUtc2l6ZSA9IDwzMjc2OD47DQo+ID4gPiA+ICAJCQljbG9ja3MgPSA8JmNsb2NrZ2VuIDEgMD47
DQo+ID4gPiA+ICAJCQluZXh0LWxldmVsLWNhY2hlID0gPCZMMl8xPjsNCj4gPiA+ID4gIAkJCWZz
bCxwb3J0aWQtbWFwcGluZyA9IDwweDgwMDAwMDAwPjsNCj4gPiANCj4gPiBVLUJvb3Qgc2hvdWxk
IGJlIHNldHRpbmcgZC9pLWNhY2hlLXNpemUgYW5kIGQvaS1jYWNoZS1ibG9jay1zaXplIC0tDQo+
ID4gYXJlIHlvdQ0KPiA+IHVzaW5nIHNvbWV0aGluZyBlbHNlPw0KPiANCj4gTm9wZSBpdCBpcyB1
LWJvb3Qgc3BlY2lmaWNhbGx5DQo+IA0KPiBVLUJvb3QgMjAxNy4wMS1yYzMtZGlydHkNCj4gDQo+
IEknbSBwcmV0dHkgc3VyZSB0aGUgJy1kaXJ0eScgaXMganVzdCBhIGNoYW5nZSB0byB1c2UgYSBk
aWZmZXJlbnQNCj4gY3Jvc3MtDQo+IGNvbXBpbGVyIGJ1dCBJIGNhbid0IGNvbmZpcm0gYW5kIEkn
bSBhIGxpdHRsZSBoZXNpdGFudCB0byB0cnkNCj4gdXBkYXRpbmcNCj4gYXMgSSd2ZSBvbmx5IGdv
dCByZW1vdGUgYWNjZXNzIHRvIHRoZSBib2FyZCByaWdodCBub3cuDQo+IA0KPiA+IA0KPiA+IFRo
ZSBsaW5lIHNpemUgaXMgdGhlIHNhbWUgYXMgdGhlIGJsb2NrIHNpemUgc28gd2UgZG9uJ3QgbmVl
ZCBhDQo+ID4gc2VwYXJhdGUgZC9pLQ0KPiA+IGNhY2hlLWxpbmUtc2l6ZS4NCj4gPiANCj4gDQo+
IEknbSBub3Qgc3VyZSB0aGF0J2xsIHdvcmsgbG9va2luZyBhdCB0aGUgY29kZVsxXS4gSXQgaGFz
IGxvZ2ljIHRvIHNldA0KPiBic2l6ZXAgdG8gbHNpemVwIGlmIG5vIGJsb2NrIHNpemUgaXMgc2V0
IGJ1dCBub3QgdGhlIG90aGVyIHdheSByb3VuZC4NCj4gTG9va2luZyBhdCB0aGUgc3BlYyBmcm9t
IGRldmljZXRyZWUub3JnIHRoaXMgYWN0dWFsbHkgc2VlbXMgd3JvbmcuDQo+IFBlcmhhcHMgdGhh
dCBpcyB0aGUgcmVhbCBzb3VyY2Ugb2YgdGhlIGVycm9yLg0KDQpTdXJlIGVub3VnaCB3aXRob3V0
IG15IGNoYW5nZQ0KDQojIGxzIC9zeXMvZmlybXdhcmUvZGV2aWNldHJlZS9iYXNlL2NwdXMvUG93
ZXJQQyxlNjUwMEAwLw0KYnVzLWZyZXF1ZW5jeSAgICAgICBkLWNhY2hlLXNpemUgICAgICAgIG5h
bWUNCmNhY2hlLXN0YXNoLWlkICAgICAgZGV2aWNlX3R5cGUgICAgICAgICBuZXh0LWxldmVsLWNh
Y2hlDQpjbG9jay1mcmVxdWVuY3kgICAgIGVuYWJsZS1tZXRob2QgICAgICAgcGhhbmRsZQ0KY2xv
Y2tzICAgICAgICAgICAgICBmc2wscG9ydGlkLW1hcHBpbmcgIHJlZw0KY3B1LXJlbGVhc2UtYWRk
ciAgICBpLWNhY2hlLWJsb2NrLXNpemUgIHN0YXR1cw0KZC1jYWNoZS1ibG9jay1zaXplICBpLWNh
Y2hlLXNldHMgICAgICAgIHRpbWViYXNlLWZyZXF1ZW5jeQ0KZC1jYWNoZS1zZXRzICAgICAgICBp
LWNhY2hlLXNpemUNCg0KU28gaXQncyB0aGUgbGFjayBvZiBoYW5kbGluZyB0aGUgb3B0aW9uYWwg
bGluZS1zaXplLiBEaWZmZXJlbnQgcGF0Y2gNCmluY29tbWluZy4NCg0KPiANCj4gLS0NCj4gWzFd
IC0gDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Rv
cnZhbGRzL2xpbnV4LmdpdC90cmVlL2FyY2gvcG93ZXJwYy9rZXJuZWwvc2V0dXBfNjQuYyNuNTEw
DQo+IA0KPiANCg==
