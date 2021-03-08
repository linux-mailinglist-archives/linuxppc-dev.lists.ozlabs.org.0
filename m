Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7DD3305E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 03:27:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dv2LL1mXJz3cTG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Mar 2021 13:27:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=GZN8oS/5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=GZN8oS/5; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dv2Kr5bc3z30KP
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Mar 2021 13:27:12 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7F44B806B5;
 Mon,  8 Mar 2021 15:27:09 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615170429;
 bh=8TTBWL5utY8uZBsZ4tFU35d2pW7P5yfQ2UnFv+biqjw=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=GZN8oS/5i1bbZaQIE7DkfSyPoTe76Uhi5rzI8ucUba1VdcOb1yFHTCFu2NXZ0EEBz
 pvIdpDOJJ+P/eq6i1+gIuLt7+d++N3MRCi7XfUe0Zjg3cp7L1tHbpdeTVybKYiIDdB
 o28UaEtmq8cCYySTKjKgnFDnMge/sJFd7PC5fFGOcNuQLXmkIt5AG3QFfa7rFBHorh
 J3aNLiMreqEvh1Lph5C9cC+b7GQCcOjBPL60T1egqRiu7u0aJAuymnZmmSkvVBQG9a
 Gx7OG3uLb8zlS0pr0VpVG7+4WeQYmPPTbPmZ9rtNvlEbfc2c7GXGldY8awlVSIL1/k
 r2En9West3/PQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B60458b7d0000>; Mon, 08 Mar 2021 15:27:09 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Mon, 8 Mar 2021 15:27:09 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Mon, 8 Mar 2021 15:27:09 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcAA=
Date: Mon, 8 Mar 2021 02:27:08 +0000
Message-ID: <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
In-Reply-To: <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAFDE576A0F6124782240ADE8CFC3BF3@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=NoFIIjjUkg5N47f6R0kA:9
 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQpPbiA4LzAzLzIxIDE6MzEgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IE9uIDMvNy8yMSAy
OjUyIFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gSSd2ZSBnb3QgYSBz
eXN0ZW0gdXNpbmcgYSBQb3dlclBDIFQyMDgwIFNvQyBhbmQgYW1vbmcgb3RoZXIgdGhpbmdzIGhh
cw0KPj4gYW4gTE04MSBod21vbiBjaGlwLg0KPj4NCj4+IFVuZGVyIGEgaGlnaCBDUFUgbG9hZCB3
ZSBzZWUgZXJyYW50IHJlYWRpbmdzIGZyb20gdGhlIExNODEgYXMgd2VsbCBhcw0KPj4gYWN0dWFs
IGZhaWx1cmVzLiBJdCdzIHRoZSBlcnJhbnQgcmVhZGluZ3MgdGhhdCBjYXVzZSB0aGUgbW9zdCBj
b25jZXJuDQo+PiBzaW5jZSB3ZSBjYW4gZWFzaWx5IGlnbm9yZSB0aGUgcmVhZCBlcnJvcnMgaW4g
b3VyIG1vbml0b3JpbmcgYXBwbGljYXRpb24NCj4+IChhbHRob3VnaCBpdCB3b3VsZCBiZSBiZXR0
ZXIgaWYgdGhleSB3ZXJlbid0IHRoZXJlIGF0IGFsbCkuDQo+Pg0KPj4gSSdtIGFibGUgdG8gcmVw
cm9kdWNlIHRoaXMgd2l0aCBhIHRlc3QgYXBwbGljYXRpb25bMF0gdGhhdCBhcnRpZmljaWFsbHkN
Cj4+IGNyZWF0ZXMgYSBoaWdoIENQVSBsb2FkIHRoZW4gYnkgcmVwZWF0ZWRseSBjaGVja2luZyBm
b3IgdGhlIGFsbC0xcw0KPj4gdmFsdWVzIGZyb20gdGhlIExNODEgZGF0YXNoZWV0WzFdKHBhZ2Ug
MTcpLiBUaGUgYWxsLTFzIHJlYWRpbmdzIHN0aWNrDQo+PiBvdXQgYXMgdGhleSBhcmUgb2J2aW91
c2x5IGhpZ2hlciB0aGFuIHRoZSB2b2x0YWdlIHJhaWxzIHRoYXQgYXJlDQo+PiBjb25uZWN0ZWQg
YW5kIGRpc2FncmVlIHdpdGggbWVhc3VyZW1lbnRzIHRha2VuIHdpdGggYSBtdWx0aW1ldGVyLg0K
Pj4NCj4+IEhlcmUncyB0aGUgb3V0cHV0IGZyb20gbXkgZGV2aWNlDQo+Pg0KPj4gW3Jvb3RAbGlu
dXhib3ggfl0jIGNwdWxvYWQgOTAmDQo+PiBbcm9vdEBsaW51eGJveCB+XSMgKHdoaWxlIHRydWU7
IGRvIGNhdCAvc3lzL2NsYXNzL2h3bW9uL2h3bW9uMC9pbipfaW5wdXQNCj4+IHwgZ3JlcCAnMzMy
MFx8NDM4M1x8NjY0MVx8MTU5MzBcfDM1ODYnOyBzbGVlcCAxOyBkb25lKSYNCj4+IDM1ODYNCj4+
IDM1ODYNCj4+IGNhdDogcmVhZCBlcnJvcjogTm8gc3VjaCBkZXZpY2Ugb3IgYWRkcmVzcw0KPj4g
Y2F0OiByZWFkIGVycm9yOiBObyBzdWNoIGRldmljZSBvciBhZGRyZXNzDQo+PiAzMzIwDQo+PiAz
MzIwDQo+PiAzNTg2DQo+PiAzNTg2DQo+PiA2NjQxDQo+PiA2NjQxDQo+PiA0MzgzDQo+PiA0Mzgz
DQo+Pg0KPj4gRnVuZGFtZW50YWxseSBJIHRoaW5rIHRoaXMgaXMgYSBwcm9ibGVtIHdpdGggdGhl
IGZhY3QgdGhhdCB0aGUgTE04MSBpcw0KPj4gYW4gU01CdXMgZGV2aWNlIGJ1dCB0aGUgVDIwODAg
KGFuZCBvdGhlciBGcmVlc2NhbGUgU29DcykgdXNlcyBpMmMgYW5kIHdlDQo+PiBlbXVsYXRlIFNN
QnVzLiBJIHN1c3BlY3QgdGhlIGVycmFudCByZWFkaW5ncyBhcmUgd2hlbiB3ZSBkb24ndCBnZXQg
cm91bmQNCj4+IHRvIGNvbXBsZXRpbmcgdGhlIHJlYWQgd2l0aGluIHRoZSB0aW1lb3V0IHNwZWNp
ZmllZCBieSB0aGUgU01CdXMNCj4+IHNwZWNpZmljYXRpb24uIERlcGVuZGluZyBvbiB3aGVuIHRo
YXQgaGFwcGVucyB3ZSBlaXRoZXIgZmFpbCB0aGUNCj4+IHRyYW5zZmVyIG9yIGludGVycHJldCB0
aGUgcmVzdWx0IGFzIGFsbC0xcy4NCj4+DQo+IFRoYXQgaXMgcXVpdGUgdW5saWtlbHkuIE1hbnkg
c2Vuc29yIGNoaXBzIGFyZSBTTUJ1cyBjaGlwcyBjb25uZWN0ZWQgdG8NCj4gaTJjIGJ1c3Nlcy4g
SXQgaXMgbXVjaCBtb3JlIGxpa2VseSB0aGF0IHRoZXJlIGlzIGEgYnVnIGluIHRoZSBUMjA4MCBp
MmMgZHJpdmVyLA0KPiB0aGF0IHRoZSBjaGlwIGRvZXNuJ3QgbGlrZSB0aGUgYnVsayByZWFkIGNv
bW1hbmQgaXNzdWVkIHRocm91Z2ggcmVnbWFwLCB0aGF0DQo+IHRoZSBjaGlwIGhhcyBwcm9ibGVt
cyB3aXRoIHRoZSBpMmMgYnVzIHNwZWVkLCBvciB0aGF0IHRoZSBpMmMgYnVzIGlzIG5vaXN5Lg0K
UGVyaGFwcyBzb21ldGhpbmcgZ2V0cyB1cHNldCB3aGVuIGludGVycnVwdCBwcm9jZXNzaW5nIGlz
IGRlbGF5ZWQgDQpiZWNhdXNlIG9mIENQVSBsb2FkLiBJIGRvbid0IHNlZSB0aGUgcHJvYmxlbSB3
aGVuIHRoZXJlIGlzbid0IGEgQ1BVIGxvYWQgDQpzbyBJIHRoaW5rIHRoYXQgZWxpbWluYXRlcyBi
b2FyZCBpc3N1ZXMuDQo+IEluIHRoaXMgY29udGV4dCwgdGhlICJObyBzdWNoIGRldmljZSBvciBh
ZGRyZXNzIiByZXNwb25zZXMgYXJlIHZlcnkgc3VzcGljaW91cy4NCj4gVGhvc2UgYXJlIHJlcG9y
dGVkIGJ5IHRoZSBpMmMgZHJpdmVyLCBub3QgYnkgdGhlIGh3bW9uIGRyaXZlciwgYW5kIHN1Z2dl
c3QNCj4gdGhhdCB0aGUgY2hpcCBkaWQgbm90IHJlc3BvbmQgdG8gYSByZWFkIHJlcXVlc3QuIE1h
eWJlIGl0IGhlbHBzIHRvIGVuYWJsZQ0KPiBkZWJ1Z2dpbmcgdG8gdGhlIGkyYyBkcml2ZXIgdG8g
c2VlIGlmIGl0IHJlcG9ydHMgYW55dGhpbmcgdXNlZnVsLiBFdmVuDQo+IGJldHRlciBtaWdodCBi
ZSB0byBjb25uZWN0IGFuIGkyYyBidXMgYW5hbHl6ZXIgdG8gdGhlIGkyYyBidXMgYW5kIGNoZWNr
DQo+IHdoYXQgaXMgZ29pbmcgb24uDQpUaGF0J3MgZnJvbSAtRU5YSU8gd2hpY2ggaXMgdXNlZCBp
biBvbmx5IG9uZSBwbGFjZSBpbiBpMmMtbXBjLmMuIEknbGwgDQplbmFibGUgc29tZSBkZWJ1ZyBh
bmQgc2VlIHdoYXQgd2UgZ2V0Lg0KPg0KPiBHdWVudGVy
