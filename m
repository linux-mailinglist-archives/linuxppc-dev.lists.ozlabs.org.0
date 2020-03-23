Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 864301900B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:55:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mSqT2zrzzDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 08:55:33 +1100 (AEDT)
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
 header.a=rsa-sha256 header.s=mail181024 header.b=P5Dr6zoH; 
 dkim-atps=neutral
X-Greylist: delayed 70079 seconds by postgrey-1.36 at bilbo;
 Tue, 24 Mar 2020 08:54:05 AEDT
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mSnn1nY1zDqCW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 08:54:05 +1100 (AEDT)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 260C480237;
 Tue, 24 Mar 2020 10:54:02 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1585000442;
 bh=YF90OqhWLGXA4a5YAnTLbpCAqAANWVvf4rDFB17AIsI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=P5Dr6zoHlp3ncfmE148ZLipXV1kzRF4ueHglhv5mQI7FsmKTG5pzDDl3Ewk/sGUuZ
 JACS30xbd4fCIPC4mgfh+RsGqLiWIJKX1eIXmtg++FRsA4inody9R0AOC/GtyC+v55
 O3qNQJT7EzZHKFkt6gL8CFVM3ziK/0IYuj8/bv4TZZj0ZxLzQG+xX4EPKagjpmwsrI
 LkGScYLYtkH0QcMKcVAtNlIFv1zZTrfdSzf9NfOjBxmbw+lTzV/K3Xq1J7azoFGvit
 5KMqh59bzEJ6yUndjgu3JTtfgyMLcuWMUwQowuTUS51j47iEfduNvhs88F/A0QKTsb
 6hz0P4bwz3thA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e792ffa0004>; Tue, 24 Mar 2020 10:54:02 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 24 Mar 2020 10:54:01 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.006; Tue, 24 Mar 2020 10:54:01 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/legacy_serial: Use early_ioremap()
Thread-Topic: [PATCH] powerpc/legacy_serial: Use early_ioremap()
Thread-Index: AQHWAVtyPT7uF8EyiECYlBR6HiNzIKhV3nkA
Date: Mon, 23 Mar 2020 21:54:01 +0000
Message-ID: <d94f74c57112e002959143bb5ccdcd9be80ed8d2.camel@alliedtelesis.co.nz>
References: <3df15946ed0c29663dc7928b31ca07576e1444f6.1580904214.git.christophe.leroy@c-s.fr>
In-Reply-To: <3df15946ed0c29663dc7928b31ca07576e1444f6.1580904214.git.christophe.leroy@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5DFBFFD517DEC4A8B3F2C51E4C14FB8@atlnz.lc>
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

SGkgQ2hyaXN0b3BoZSwNCg0KT24gV2VkLCAyMDIwLTAyLTA1IGF0IDEyOjAzICswMDAwLCBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPiBbICAgIDAuMDAwMDAwXSBpb3JlbWFwKCkgY2FsbGVkIGVh
cmx5IGZyb20NCj4gZmluZF9sZWdhY3lfc2VyaWFsX3BvcnRzKzB4M2NjLzB4NDc0LiBVc2UgZWFy
bHlfaW9yZW1hcCgpIGluc3RlYWQNCj4gDQoNCkkgd2FzIGp1c3QgYWJvdXQgdG8gZGlnIGludG8g
dGhpcyBlcnJvciBtZXNzYWdlIGFuZCBmb3VuZCB5b3UgcGF0Y2guIEkNCmFwcGxpZWQgaXQgdG8g
YSB2NS41IGJhc2UuDQoNCj4gZmluZF9sZWdhY3lfc2VyaWFsX3BvcnRzKCkgaXMgY2FsbGVkIGVh
cmx5IGZyb20gc2V0dXBfYXJjaCgpLCBiZWZvcmUNCj4gcGFnaW5nX2luaXQoKS4gdm1hbGxvYyBp
cyBub3QgYXZhaWxhYmxlIHlldCwgaW9yZW1hcCBzaG91bGRuJ3QgYmUNCj4gdXNlZCB0aGF0IGVh
cmx5Lg0KPiANCj4gVXNlIGVhcmx5X2lvcmVtYXAoKSBhbmQgc3dpdGNoIHRvIGEgcmVndWxhciBp
b3JlbWFwKCkgbGF0ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGMtcy5mcj4NCg0KT24gbXkgc3lzdGVtIChGcmVlc2NhbGUgVDIwODAg
U09DKSB0aGlzIHNlZW1zIHRvIGNhdXNlIGEgY3Jhc2gvaGFuZyBpbg0KZWFybHkgYm9vdC4gVW5m
b3J0dW5hdGVseSBiZWNhdXNlIHRoaXMgaXMgYWZmZWN0aW5nIHRoZSBib290IGNvbnNvbGUgSQ0K
ZG9uJ3QgZ2V0IGFueSBlYXJseXByaW50ayBvdXRwdXQuDQoNCj4gLS0tDQo+ICBhcmNoL3Bvd2Vy
cGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4gLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tlcm5lbC9sZWdhY3lfc2VyaWFs
LmMNCj4gYi9hcmNoL3Bvd2VycGMva2VybmVsL2xlZ2FjeV9zZXJpYWwuYw0KPiBpbmRleCBmMDYx
ZTA2ZTlmNTEuLjhiMmMxYTg1NTNhMCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5l
bC9sZWdhY3lfc2VyaWFsLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9sZWdhY3lfc2Vy
aWFsLmMNCj4gQEAgLTE1LDYgKzE1LDcgQEANCj4gICNpbmNsdWRlIDxhc20vdWRiZy5oPg0KPiAg
I2luY2x1ZGUgPGFzbS9wY2ktYnJpZGdlLmg+DQo+ICAjaW5jbHVkZSA8YXNtL3BwYy1wY2kuaD4N
Cj4gKyNpbmNsdWRlIDxhc20vZWFybHlfaW9yZW1hcC5oPg0KPiAgDQo+ICAjdW5kZWYgREVCVUcN
Cj4gIA0KPiBAQCAtMzQsNiArMzUsNyBAQCBzdGF0aWMgc3RydWN0IGxlZ2FjeV9zZXJpYWxfaW5m
byB7DQo+ICAJdW5zaWduZWQgaW50CQkJY2xvY2s7DQo+ICAJaW50CQkJCWlycV9jaGVja19wYXJl
bnQ7DQo+ICAJcGh5c19hZGRyX3QJCQl0YWRkcjsNCj4gKwl2b2lkIF9faW9tZW0JCQkqZWFybHlf
YWRkcjsNCj4gIH0gbGVnYWN5X3NlcmlhbF9pbmZvc1tNQVhfTEVHQUNZX1NFUklBTF9QT1JUU107
DQo+ICANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGxlZ2FjeV9zZXJpYWxf
cGFyZW50c1tdIF9faW5pdGNvbnN0DQo+ID0gew0KPiBAQCAtMzI1LDE3ICszMjcsMTYgQEAgc3Rh
dGljIHZvaWQgX19pbml0DQo+IHNldHVwX2xlZ2FjeV9zZXJpYWxfY29uc29sZShpbnQgY29uc29s
ZSkNCj4gIHsNCj4gIAlzdHJ1Y3QgbGVnYWN5X3NlcmlhbF9pbmZvICppbmZvID0NCj4gJmxlZ2Fj
eV9zZXJpYWxfaW5mb3NbY29uc29sZV07DQo+ICAJc3RydWN0IHBsYXRfc2VyaWFsODI1MF9wb3J0
ICpwb3J0ID0NCj4gJmxlZ2FjeV9zZXJpYWxfcG9ydHNbY29uc29sZV07DQo+IC0Jdm9pZCBfX2lv
bWVtICphZGRyOw0KPiAgCXVuc2lnbmVkIGludCBzdHJpZGU7DQo+ICANCj4gIAlzdHJpZGUgPSAx
IDw8IHBvcnQtPnJlZ3NoaWZ0Ow0KPiAgDQo+ICAJLyogQ2hlY2sgaWYgYSB0cmFuc2xhdGVkIE1N
SU8gYWRkcmVzcyBoYXMgYmVlbiBmb3VuZCAqLw0KPiAgCWlmIChpbmZvLT50YWRkcikgew0KPiAt
CQlhZGRyID0gaW9yZW1hcChpbmZvLT50YWRkciwgMHgxMDAwKTsNCj4gLQkJaWYgKGFkZHIgPT0g
TlVMTCkNCj4gKwkJaW5mby0+ZWFybHlfYWRkciA9IGVhcmx5X2lvcmVtYXAoaW5mby0+dGFkZHIs
IDB4MTAwMCk7DQo+ICsJCWlmIChpbmZvLT5lYXJseV9hZGRyID09IE5VTEwpDQo+ICAJCQlyZXR1
cm47DQo+IC0JCXVkYmdfdWFydF9pbml0X21taW8oYWRkciwgc3RyaWRlKTsNCj4gKwkJdWRiZ191
YXJ0X2luaXRfbW1pbyhpbmZvLT5lYXJseV9hZGRyLCBzdHJpZGUpOw0KPiAgCX0gZWxzZSB7DQo+
ICAJCS8qIENoZWNrIGlmIGl0J3MgUElPIGFuZCB3ZSBzdXBwb3J0IHVudHJhbnNsYXRlZCBQSU8g
Ki8NCj4gIAkJaWYgKHBvcnQtPmlvdHlwZSA9PSBVUElPX1BPUlQgJiYgaXNhX2lvX3NwZWNpYWwp
DQo+IEBAIC0zNTMsNiArMzU0LDMwIEBAIHN0YXRpYyB2b2lkIF9faW5pdA0KPiBzZXR1cF9sZWdh
Y3lfc2VyaWFsX2NvbnNvbGUoaW50IGNvbnNvbGUpDQo+ICAJdWRiZ191YXJ0X3NldHVwKGluZm8t
PnNwZWVkLCBpbmZvLT5jbG9jayk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgX19pbml0IGlv
cmVtYXBfbGVnYWN5X3NlcmlhbF9jb25zb2xlKHZvaWQpDQo+ICt7DQo+ICsJc3RydWN0IGxlZ2Fj
eV9zZXJpYWxfaW5mbyAqaW5mbyA9DQo+ICZsZWdhY3lfc2VyaWFsX2luZm9zW2xlZ2FjeV9zZXJp
YWxfY29uc29sZV07DQo+ICsJc3RydWN0IHBsYXRfc2VyaWFsODI1MF9wb3J0ICpwb3J0ID0NCj4g
JmxlZ2FjeV9zZXJpYWxfcG9ydHNbbGVnYWN5X3NlcmlhbF9jb25zb2xlXTsNCj4gKwl2b2lkIF9f
aW9tZW0gKnZhZGRyOw0KPiArDQo+ICsJaWYgKGxlZ2FjeV9zZXJpYWxfY29uc29sZSA8IDApDQo+
ICsJCXJldHVybiAwOw0KPiArDQo+ICsJaWYgKCFpbmZvLT5lYXJseV9hZGRyKQ0KPiArCQlyZXR1
cm4gMDsNCj4gKw0KPiArCXZhZGRyID0gaW9yZW1hcChpbmZvLT50YWRkciwgMHgxMDAwKTsNCj4g
KwlpZiAoV0FSTl9PTighdmFkZHIpKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCXVk
YmdfdWFydF9pbml0X21taW8odmFkZHIsIDEgPDwgcG9ydC0+cmVnc2hpZnQpOw0KPiArCWVhcmx5
X2lvdW5tYXAoaW5mby0+ZWFybHlfYWRkciwgMHgxMDAwKTsNCj4gKwlpbmZvLT5lYXJseV9hZGRy
ID0gTlVMTDsNCj4gKw0KPiArCXJldHVybiAwOw0KPiArfQ0KPiArZWFybHlfaW5pdGNhbGwoaW9y
ZW1hcF9sZWdhY3lfc2VyaWFsX2NvbnNvbGUpOw0KPiArDQo+ICAvKg0KPiAgICogVGhpcyBpcyBj
YWxsZWQgdmVyeSBlYXJseSwgYXMgcGFydCBvZiBzZXR1cF9zeXN0ZW0oKSBvcg0KPiBldmVudHVh
bGx5DQo+ICAgKiBzZXR1cF9hcmNoKCksIGJhc2ljYWxseSBiZWZvcmUgYW55dGhpbmcgZWxzZSBp
biB0aGlzIGZpbGUuIFRoaXMNCj4gZnVuY3Rpb24NCg==
