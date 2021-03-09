Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6771C3331EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 00:35:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DwBR1308Nz3cZN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 10:35:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=yMJLTWRQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=2001:df5:b000:5::4;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=yMJLTWRQ; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [IPv6:2001:df5:b000:5::4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwBQX6FJGz30J3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Mar 2021 10:35:16 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8437A806B5;
 Wed, 10 Mar 2021 12:35:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615332908;
 bh=uI86jW6pWpZnO371tm5bCSjh+sq6Wm42ntNgWqBdKss=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=yMJLTWRQjO1i5IakXgJRV1w+B2b7uGCvOsMYX7q5MW9CA8B099sUEVoMdi2V6Yewh
 HcpysLOY80YGexFt1+L2xiJt44TYB/gTLTKwiVx3Zypapim+RGSoIq6ev5YwA34yUp
 2zPhkTjHqC0h5WVrSNkTlCMvtleg9BXMPGdqnFXdLrOhm/C6yJCNtw+NRRPlus7UW/
 ubfsSfST4TC8FLlySwwPCmaeDYpum4zf62+FlVKeACAeks+4YiaFB+j5Dq+eRbYBI2
 TMqGQRmW0LmRaSL4mjgQb50lgnceLXrkUtZAYasy+xdqTEwn0pjgvMMLc6FcJjF0Pv
 IV5erfRh9ulLQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B6048062c0000>; Wed, 10 Mar 2021 12:35:08 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 10 Mar 2021 12:35:08 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 10 Mar 2021 12:35:08 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAMVCoA=
Date: Tue, 9 Mar 2021 23:35:07 +0000
Message-ID: <b1ba3f34-cbcc-4bbd-ea84-aad21f513682@alliedtelesis.co.nz>
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
Content-ID: <8BCA4FDE94F0A245BE39485AC5CF9D8F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=H79plryXfxChRathHHkA:9
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
OjUyIFBNLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gRnVuZGFtZW50YWxseSBJIHRoaW5rIHRo
aXMgaXMgYSBwcm9ibGVtIHdpdGggdGhlIGZhY3QgdGhhdCB0aGUgTE04MSBpcw0KPj4gYW4gU01C
dXMgZGV2aWNlIGJ1dCB0aGUgVDIwODAgKGFuZCBvdGhlciBGcmVlc2NhbGUgU29DcykgdXNlcyBp
MmMgYW5kIHdlDQo+PiBlbXVsYXRlIFNNQnVzLiBJIHN1c3BlY3QgdGhlIGVycmFudCByZWFkaW5n
cyBhcmUgd2hlbiB3ZSBkb24ndCBnZXQgcm91bmQNCj4+IHRvIGNvbXBsZXRpbmcgdGhlIHJlYWQg
d2l0aGluIHRoZSB0aW1lb3V0IHNwZWNpZmllZCBieSB0aGUgU01CdXMNCj4+IHNwZWNpZmljYXRp
b24uIERlcGVuZGluZyBvbiB3aGVuIHRoYXQgaGFwcGVucyB3ZSBlaXRoZXIgZmFpbCB0aGUNCj4+
IHRyYW5zZmVyIG9yIGludGVycHJldCB0aGUgcmVzdWx0IGFzIGFsbC0xcy4NCj4gVGhhdCBpcyBx
dWl0ZSB1bmxpa2VseS4gTWFueSBzZW5zb3IgY2hpcHMgYXJlIFNNQnVzIGNoaXBzIGNvbm5lY3Rl
ZCB0bw0KPiBpMmMgYnVzc2VzLiBJdCBpcyBtdWNoIG1vcmUgbGlrZWx5IHRoYXQgdGhlcmUgaXMg
YSBidWcgaW4gdGhlIFQyMDgwIGkyYyBkcml2ZXIsDQo+IHRoYXQgdGhlIGNoaXAgZG9lc24ndCBs
aWtlIHRoZSBidWxrIHJlYWQgY29tbWFuZCBpc3N1ZWQgdGhyb3VnaCByZWdtYXAsIHRoYXQNCj4g
dGhlIGNoaXAgaGFzIHByb2JsZW1zIHdpdGggdGhlIGkyYyBidXMgc3BlZWQsIG9yIHRoYXQgdGhl
IGkyYyBidXMgaXMgbm9pc3kuDQpJIGhhdmUgbm90aWNlZCB0aGF0IHdpdGggdGhlIHN3aXRjaCB0
byByZWdtYXAgd2UgZW5kIHVwIHVzaW5nIHBsYWluIGkyYyANCmluc3RlYWQgb2YgU01CVVMuIFRo
ZXJlIGFwcGVhcnMgdG8gYmUgbm8gd2F5IG9mIHNheWluZyB1c2UgU01CVVMgDQpzZW1hbnRpY3Mg
aWYgdGhlIGkyYyBhZGFwdGVyIHJlcG9ydHMgSTJDX0ZVTkNfSTJDLg==
