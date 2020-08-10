Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A792400BE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:03:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BPzlZ0RtRzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:03:38 +1000 (AEST)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=loT/JzDw; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BPzjd6DVszDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:01:57 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9E3C4806CB;
 Mon, 10 Aug 2020 14:01:52 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1597024912;
 bh=wHtyEc1mJaEbg7DpROSx/mzeEnIl9MIU6f1hjwj5a5Y=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=loT/JzDwS8oaEw/kQlrod4HLlscSJGFMaJO25Gz/QrtRtpeeuzcglkjZZb5HCuHYw
 4QwiW3XS7jNRtYLeeQnVwOJqwmnOUiM0mt6Wl0NK38cNe6brhs+RpCkHP4nnTB1AER
 UYxhbZEVLtcYZ2YQ4Ya5C62mX4L+7U6gKnYutdRPh+n3r4CWCeW1XrKSx9HKo3JQvV
 DPCsmT3To4DrsdR/rhstJsbQNqmQR1mi0PjJMD+4kUPuBF+vIKYwPSPfHiuyGmXqZg
 J9adrbLVr5kBvcMyO7jg6Ic0CRllZxr76RiHg+Sg+aAwcSJrMh7EO0NzM7mqLFtfWZ
 hpGEMd0kbs4Rg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5f30aa8c0000>; Mon, 10 Aug 2020 14:01:52 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 10 Aug 2020 14:01:47 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Mon, 10 Aug 2020 14:01:47 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "Michael
 Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/legacy_serial: Use early_ioremap()
Thread-Topic: [PATCH] powerpc/legacy_serial: Use early_ioremap()
Thread-Index: AQHWAVtyPT7uF8EyiECYlBR6HiNzIKhV3nkAgNrKDAA=
Date: Mon, 10 Aug 2020 02:01:46 +0000
Message-ID: <32c16eef-f426-4f7e-14aa-b9fbbbec59b8@alliedtelesis.co.nz>
References: <3df15946ed0c29663dc7928b31ca07576e1444f6.1580904214.git.christophe.leroy@c-s.fr>
 <d94f74c57112e002959143bb5ccdcd9be80ed8d2.camel@alliedtelesis.co.nz>
In-Reply-To: <d94f74c57112e002959143bb5ccdcd9be80ed8d2.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <05418667CC51624A80E03FB688E733B6@atlnz.lc>
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
Cc: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiAyNC8wMy8yMCAxMDo1NCBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4gSGkgQ2hyaXN0
b3BoZSwNCj4NCj4gT24gV2VkLCAyMDIwLTAyLTA1IGF0IDEyOjAzICswMDAwLCBDaHJpc3RvcGhl
IExlcm95IHdyb3RlOg0KPj4gWyAgICAwLjAwMDAwMF0gaW9yZW1hcCgpIGNhbGxlZCBlYXJseSBm
cm9tDQo+PiBmaW5kX2xlZ2FjeV9zZXJpYWxfcG9ydHMrMHgzY2MvMHg0NzQuIFVzZSBlYXJseV9p
b3JlbWFwKCkgaW5zdGVhZA0KPj4NCj4gSSB3YXMganVzdCBhYm91dCB0byBkaWcgaW50byB0aGlz
IGVycm9yIG1lc3NhZ2UgYW5kIGZvdW5kIHlvdSBwYXRjaC4gSQ0KPiBhcHBsaWVkIGl0IHRvIGEg
djUuNSBiYXNlLg0KPg0KPj4gZmluZF9sZWdhY3lfc2VyaWFsX3BvcnRzKCkgaXMgY2FsbGVkIGVh
cmx5IGZyb20gc2V0dXBfYXJjaCgpLCBiZWZvcmUNCj4+IHBhZ2luZ19pbml0KCkuIHZtYWxsb2Mg
aXMgbm90IGF2YWlsYWJsZSB5ZXQsIGlvcmVtYXAgc2hvdWxkbid0IGJlDQo+PiB1c2VkIHRoYXQg
ZWFybHkuDQo+Pg0KPj4gVXNlIGVhcmx5X2lvcmVtYXAoKSBhbmQgc3dpdGNoIHRvIGEgcmVndWxh
ciBpb3JlbWFwKCkgbGF0ZXIuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQo+IE9uIG15IHN5c3RlbSAoRnJlZXNjYWxlIFQy
MDgwIFNPQykgdGhpcyBzZWVtcyB0byBjYXVzZSBhIGNyYXNoL2hhbmcgaW4NCj4gZWFybHkgYm9v
dC4gVW5mb3J0dW5hdGVseSBiZWNhdXNlIHRoaXMgaXMgYWZmZWN0aW5nIHRoZSBib290IGNvbnNv
bGUgSQ0KPiBkb24ndCBnZXQgYW55IGVhcmx5cHJpbnRrIG91dHB1dC4NCg0KSSd2ZSBiZWVuIGRv
aW5nIGEgYml0IG1vcmUgZGlnZ2luZyBpbnRvIHdoeSBDaHJpc3RvcGhlJ3MgcGF0Y2ggZGlkbid0
IA0Kd29yayBmb3IgbWUuIEkgbm90aWNlZCB0aGUgcG93ZXJwYyBzcGVjaWZpYyBlYXJseV9pb3Jl
bWFwX3JhbmdlKCkgDQpyZXR1cm5zIGFkZHJlc3NlcyBhcm91bmQgaW9yZW1hcF9ib3QuIFlldCB0
aGUgZ2VuZXJpYyBlYXJseV9pb3JlbWFwKCkgDQp1c2VzIGFkZHJlc3NlcyBhcm91bmQgRklYQURE
Ul9UT1AuIElmIEkgdHJ5IHRoZSBmb2xsb3dpbmcgaGFjayBJIGNhbiANCm1ha2UgQ2hyaXN0b3Bo
ZSdzIHBhdGNoIHdvcmsNCg0KZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9m
aXhtYXAuaCANCmIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ZpeG1hcC5oDQppbmRleCAyZWYx
NTVhM2M4MjEuLjdiYzJmM2Y3M2M4YiAxMDA2NDQNCi0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRl
L2FzbS9maXhtYXAuaA0KKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2ZpeG1hcC5oDQpA
QCAtMjcsNyArMjcsNyBAQA0KIMKgI2luY2x1ZGUgPGFzbS9rYXNhbi5oPg0KIMKgI2RlZmluZSBG
SVhBRERSX1RPUMKgwqDCoCAoS0FTQU5fU0hBRE9XX1NUQVJUIC0gUEFHRV9TSVpFKQ0KIMKgI2Vs
c2UNCi0jZGVmaW5lIEZJWEFERFJfVE9QwqDCoMKgICgodW5zaWduZWQgbG9uZykoLVBBR0VfU0la
RSkpDQorI2RlZmluZSBGSVhBRERSX1RPUMKgwqDCoCAoSU9SRU1BUF9FTkQgLSBQQUdFX1NJWkUp
DQogwqAjZW5kaWYNCg0KIMKgLyoNCg0KSSdsbCBhZG1pdCB0byBiZWluZyBvdXQgb2YgbXkgZGVw
dGguIEl0IHNlZW1zIHRoYXQgdGhlIGdlbmVyaWMgDQplYXJseV9pb3JlbWFwKCkgaXMgbm90IHF1
aXRlIGNvcnJlY3RseSBwbHVtYmVkIGluIGZvciBwb3dlcnBjLg0KDQo+PiAtLS0NCj4+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9sZWdhY3lfc2VyaWFsLmMgfCAzMyArKysrKysrKysrKysrKysrKysr
KysrKysrDQo+PiAtLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2xl
Z2FjeV9zZXJpYWwuYw0KPj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYw0K
Pj4gaW5kZXggZjA2MWUwNmU5ZjUxLi44YjJjMWE4NTUzYTAgMTAwNjQ0DQo+PiAtLS0gYS9hcmNo
L3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYw0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2tl
cm5lbC9sZWdhY3lfc2VyaWFsLmMNCj4+IEBAIC0xNSw2ICsxNSw3IEBADQo+PiAgICNpbmNsdWRl
IDxhc20vdWRiZy5oPg0KPj4gICAjaW5jbHVkZSA8YXNtL3BjaS1icmlkZ2UuaD4NCj4+ICAgI2lu
Y2x1ZGUgPGFzbS9wcGMtcGNpLmg+DQo+PiArI2luY2x1ZGUgPGFzbS9lYXJseV9pb3JlbWFwLmg+
DQo+PiAgIA0KPj4gICAjdW5kZWYgREVCVUcNCj4+ICAgDQo+PiBAQCAtMzQsNiArMzUsNyBAQCBz
dGF0aWMgc3RydWN0IGxlZ2FjeV9zZXJpYWxfaW5mbyB7DQo+PiAgIAl1bnNpZ25lZCBpbnQJCQlj
bG9jazsNCj4+ICAgCWludAkJCQlpcnFfY2hlY2tfcGFyZW50Ow0KPj4gICAJcGh5c19hZGRyX3QJ
CQl0YWRkcjsNCj4+ICsJdm9pZCBfX2lvbWVtCQkJKmVhcmx5X2FkZHI7DQo+PiAgIH0gbGVnYWN5
X3NlcmlhbF9pbmZvc1tNQVhfTEVHQUNZX1NFUklBTF9QT1JUU107DQo+PiAgIA0KPj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsZWdhY3lfc2VyaWFsX3BhcmVudHNbXSBfX2lu
aXRjb25zdA0KPj4gPSB7DQo+PiBAQCAtMzI1LDE3ICszMjcsMTYgQEAgc3RhdGljIHZvaWQgX19p
bml0DQo+PiBzZXR1cF9sZWdhY3lfc2VyaWFsX2NvbnNvbGUoaW50IGNvbnNvbGUpDQo+PiAgIHsN
Cj4+ICAgCXN0cnVjdCBsZWdhY3lfc2VyaWFsX2luZm8gKmluZm8gPQ0KPj4gJmxlZ2FjeV9zZXJp
YWxfaW5mb3NbY29uc29sZV07DQo+PiAgIAlzdHJ1Y3QgcGxhdF9zZXJpYWw4MjUwX3BvcnQgKnBv
cnQgPQ0KPj4gJmxlZ2FjeV9zZXJpYWxfcG9ydHNbY29uc29sZV07DQo+PiAtCXZvaWQgX19pb21l
bSAqYWRkcjsNCj4+ICAgCXVuc2lnbmVkIGludCBzdHJpZGU7DQo+PiAgIA0KPj4gICAJc3RyaWRl
ID0gMSA8PCBwb3J0LT5yZWdzaGlmdDsNCj4+ICAgDQo+PiAgIAkvKiBDaGVjayBpZiBhIHRyYW5z
bGF0ZWQgTU1JTyBhZGRyZXNzIGhhcyBiZWVuIGZvdW5kICovDQo+PiAgIAlpZiAoaW5mby0+dGFk
ZHIpIHsNCj4+IC0JCWFkZHIgPSBpb3JlbWFwKGluZm8tPnRhZGRyLCAweDEwMDApOw0KPj4gLQkJ
aWYgKGFkZHIgPT0gTlVMTCkNCj4+ICsJCWluZm8tPmVhcmx5X2FkZHIgPSBlYXJseV9pb3JlbWFw
KGluZm8tPnRhZGRyLCAweDEwMDApOw0KPj4gKwkJaWYgKGluZm8tPmVhcmx5X2FkZHIgPT0gTlVM
TCkNCj4+ICAgCQkJcmV0dXJuOw0KPj4gLQkJdWRiZ191YXJ0X2luaXRfbW1pbyhhZGRyLCBzdHJp
ZGUpOw0KPj4gKwkJdWRiZ191YXJ0X2luaXRfbW1pbyhpbmZvLT5lYXJseV9hZGRyLCBzdHJpZGUp
Ow0KPj4gICAJfSBlbHNlIHsNCj4+ICAgCQkvKiBDaGVjayBpZiBpdCdzIFBJTyBhbmQgd2Ugc3Vw
cG9ydCB1bnRyYW5zbGF0ZWQgUElPICovDQo+PiAgIAkJaWYgKHBvcnQtPmlvdHlwZSA9PSBVUElP
X1BPUlQgJiYgaXNhX2lvX3NwZWNpYWwpDQo+PiBAQCAtMzUzLDYgKzM1NCwzMCBAQCBzdGF0aWMg
dm9pZCBfX2luaXQNCj4+IHNldHVwX2xlZ2FjeV9zZXJpYWxfY29uc29sZShpbnQgY29uc29sZSkN
Cj4+ICAgCXVkYmdfdWFydF9zZXR1cChpbmZvLT5zcGVlZCwgaW5mby0+Y2xvY2spOw0KPj4gICB9
DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgX19pbml0IGlvcmVtYXBfbGVnYWN5X3NlcmlhbF9jb25z
b2xlKHZvaWQpDQo+PiArew0KPj4gKwlzdHJ1Y3QgbGVnYWN5X3NlcmlhbF9pbmZvICppbmZvID0N
Cj4+ICZsZWdhY3lfc2VyaWFsX2luZm9zW2xlZ2FjeV9zZXJpYWxfY29uc29sZV07DQo+PiArCXN0
cnVjdCBwbGF0X3NlcmlhbDgyNTBfcG9ydCAqcG9ydCA9DQo+PiAmbGVnYWN5X3NlcmlhbF9wb3J0
c1tsZWdhY3lfc2VyaWFsX2NvbnNvbGVdOw0KPj4gKwl2b2lkIF9faW9tZW0gKnZhZGRyOw0KPj4g
Kw0KPj4gKwlpZiAobGVnYWN5X3NlcmlhbF9jb25zb2xlIDwgMCkNCj4+ICsJCXJldHVybiAwOw0K
Pj4gKw0KPj4gKwlpZiAoIWluZm8tPmVhcmx5X2FkZHIpDQo+PiArCQlyZXR1cm4gMDsNCj4+ICsN
Cj4+ICsJdmFkZHIgPSBpb3JlbWFwKGluZm8tPnRhZGRyLCAweDEwMDApOw0KPj4gKwlpZiAoV0FS
Tl9PTighdmFkZHIpKQ0KPj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+PiArDQo+PiArCXVkYmdfdWFy
dF9pbml0X21taW8odmFkZHIsIDEgPDwgcG9ydC0+cmVnc2hpZnQpOw0KPj4gKwllYXJseV9pb3Vu
bWFwKGluZm8tPmVhcmx5X2FkZHIsIDB4MTAwMCk7DQo+PiArCWluZm8tPmVhcmx5X2FkZHIgPSBO
VUxMOw0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArZWFybHlfaW5pdGNhbGwoaW9y
ZW1hcF9sZWdhY3lfc2VyaWFsX2NvbnNvbGUpOw0KPj4gKw0KPj4gICAvKg0KPj4gICAgKiBUaGlz
IGlzIGNhbGxlZCB2ZXJ5IGVhcmx5LCBhcyBwYXJ0IG9mIHNldHVwX3N5c3RlbSgpIG9yDQo+PiBl
dmVudHVhbGx5DQo+PiAgICAqIHNldHVwX2FyY2goKSwgYmFzaWNhbGx5IGJlZm9yZSBhbnl0aGlu
ZyBlbHNlIGluIHRoaXMgZmlsZS4gVGhpcw0KPj4gZnVuY3Rpb24=
