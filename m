Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B760A331DE9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 05:37:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dvj9S2vSWz3cQc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 15:37:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.a=rsa-sha256 header.s=mail181024 header.b=irpjd3Ik;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alliedtelesis.co.nz (client-ip=202.36.163.20;
 helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.a=rsa-sha256 header.s=mail181024 header.b=irpjd3Ik; 
 dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dvj8y55dqz30KD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 15:36:50 +1100 (AEDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 04AEA806B5;
 Tue,  9 Mar 2021 17:36:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1615264608;
 bh=94GooBuqwjsN2PgXHFKVfo9ebg+N+xJNt2/7dlShRws=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=irpjd3IkktHH24EsvNqFEVrsY1yZOE4b1qCTwdTYeQ+BTR3SycnJTpytKc1FXyXjT
 Lg/GHcPX7uc8BeN+8yxUuOh1KTJEdpIy0u3JXD6agKl4CsaX0WVZBNIYd93uoRNPkA
 0FBUtUUJ3kLtQcuOVg7R2mwjCWLcctlpwjzXFvb0nSLavHJ9RptXqERBBCC9Hj97uZ
 1jfGrCGsrIpIe87CmMEyRChOxoPrQFRZ+fsX/KgG9vp/EIEXzg5q/lCO3NeTKJcTEm
 HjofLGn/k77WcCDmud82qzGYukn2gLqdhQQnRfZkk61K4stgGMOPZDd195Wu9BJkSO
 2AEJJ9yrEjWag==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by
 svr-chch-seg1.atlnz.lc with Trustwave SEG (v8, 2, 6, 11305)
 id <B6046fb5f0000>; Tue, 09 Mar 2021 17:36:47 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 9 Mar 2021 17:36:47 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Tue, 9 Mar 2021 17:36:47 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Guenter Roeck <linux@roeck-us.net>, "jdelvare@suse.com" <jdelvare@suse.com>
Subject: Re: Errant readings on LM81 with T2080 SoC
Thread-Topic: Errant readings on LM81 with T2080 SoC
Thread-Index: AQHXE6SbssdAOSHgwE+zIRhtn11Sk6p4Y2sAgAAgcACAACSBgIAABe+AgAEgEgCAAGwMgA==
Date: Tue, 9 Mar 2021 04:36:47 +0000
Message-ID: <d36a85c2-4ec5-6c28-9e2a-282de1eaf955@alliedtelesis.co.nz>
References: <8e0a88ba-01e9-9bc1-c78b-20f26ce27d12@alliedtelesis.co.nz>
 <96d660bc-17ab-4e0e-9a94-bce1737a8da1@roeck-us.net>
 <4a1b1494-df96-2d8c-9323-beb2c2ba706b@alliedtelesis.co.nz>
 <a67ea323-634d-d34e-c63e-b1aaa4737b19@alliedtelesis.co.nz>
 <5709f180-04b5-09b2-e1c4-53eb5c9345d8@roeck-us.net>
 <61f68c59-593b-e393-5520-d9acc14fdf97@alliedtelesis.co.nz>
In-Reply-To: <61f68c59-593b-e393-5520-d9acc14fdf97@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <811CB1FD02E3674DAB25356F89E5D27F@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=C7uXNjH+ c=1 sm=1 tr=0
 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10
 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=brUy9DZNWyBmMtso1hQA:9
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

DQpPbiA5LzAzLzIxIDExOjEwIGFtLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPg0KPiBPbiA4LzAz
LzIxIDU6NTkgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+PiBPbiAzLzcvMjEgODozNyBQTSwg
Q2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IFsgLi4uIF0NCj4+Pj4gVGhhdCdzIGZyb20gLUVOWElP
IHdoaWNoIGlzIHVzZWQgaW4gb25seSBvbmUgcGxhY2UgaW4gaTJjLW1wYy5jLiBJJ2xsDQo+Pj4+
IGVuYWJsZSBzb21lIGRlYnVnIGFuZCBzZWUgd2hhdCB3ZSBnZXQuDQo+Pj4gRm9yIHRoZSBlcnJh
bnQgcmVhZGluZ3MgdGhlcmUgd2FzIG5vdGhpbmcgYWJub3JtYWwgcmVwb3J0ZWQgYnkgdGhlIA0K
Pj4+IGRyaXZlci4NCj4+Pg0KPj4+IEZvciB0aGUgIk5vIHN1Y2ggZGV2aWNlIG9yIGFkZHJlc3Mi
IEkgc2F3ICJtcGMtaTJjIGZmZTExOTAwMC5pMmM6IE5vDQo+Pj4gUlhBSyIgd2hpY2ggbWF0Y2hl
cyB1cCB3aXRoIHRoZSAtRU5YSU8gcmV0dXJuLg0KPj4+DQo+PiBJZCBzdWdnZXN0IHRvIGNoZWNr
IHRoZSB0aW1lIHVudGlsIG5vdCBidXN5IGFuZCBzdG9wIGluIG1wY194ZmVyKCkuDQo+PiBUaG9z
ZSBob3QgbG9vcHMgYXJlIHVudXN1YWwsIGFuZCBtYXkgd2VsbCBtZXNzIHVwIHRoZSBjb2RlIGVz
cGVjaWFsbHkNCj4+IGlmIHByZWVtcHQgaXMgZW5hYmxlZC4NCj4gUmV3b3JraW5nIHRob3NlIGxv
b3BzIHNlZW1zIHRvIGhhdmUgaGFkIGEgcG9zaXRpdmUgcmVzdWx0LiBJJ2xsIGRvIGEgDQo+IGJp
dCBtb3JlIHRlc3RpbmcgYW5kIGhvcGVmdWxseSBnZXQgYSBwYXRjaCBvdXQgbGF0ZXIgdG9kYXku
DQpEJ29oIG15ICJmaXgiIHdhcyB0byByZXBsYWNlIHRoZSBjb25kX3Jlc2hlZCgpIHdpdGggbXNs
ZWVwKDEwKSB3aGljaCBkaWQgDQoiZml4IiB0aGUgcHJvYmxlbSBidXQgbWFkZSBldmVyeSBpMmMg
cmVhZCBzbG93LiBJIGRpZG4ndCBub3RpY2Ugd2hlbiANCnRlc3RpbmcganVzdCB0aGUgbG04MSBi
dXQgYXMgc29vbiBhcyBJIGJvb3RlZCB0aGUgc3lzdGVtIHdpdGggbW9yZSBpMmMgDQpkZXZpY2Vz
IEkgc2F3IHN0dXBpZGx5IHNsb3cgYm9vdCB0aW1lcy4NCj4+IMKgIEFsc28sIGFyZSB5b3UgdXNp
bmcgaW50ZXJydXB0cyBvciBwb2xsaW5nIGluDQo+PiB5b3VyIHN5c3RlbSA/IFRoZSBpbnRlcnJ1
cHQgaGFuZGxlciBsb29rcyBhIGJpdCBvZGQsIHdpdGggIlJlYWQgYWdhaW4NCj4+IHRvIGFsbG93
IHJlZ2lzdGVyIHRvIHN0YWJpbGlzZSIuDQo+Pg0KPj4gRG8geW91IGhhdmUgZnNsLHRpbWVvdXQg
c2V0IGluIHRoZSBkZXZpY2V0cmVlIHByb3BlcnRpZXMgYW5kLCBpZiBzbywNCj4+IGhhdmUgeW91
IHBsYXllZCB3aXRoIGl0ID8NCj4+DQo+PiBPdGhlciB0aGFuIHRoYXQsIHRoZSBvbmx5IG90aGVy
IHJlYWwgaWRlYSBJIGhhdmUgd291bGQgYmUgdG8gbW9uaXRvcg0KPj4gdGhlIGkyYyBidXMuDQo+
Pg0KPj4gR3VlbnRlcg==
