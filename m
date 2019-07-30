Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C007B4D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 23:12:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yq4h6npjzDqWj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 07:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=alliedtelesis.co.nz
 (client-ip=202.36.163.20; helo=gate2.alliedtelesis.co.nz;
 envelope-from=chris.packham@alliedtelesis.co.nz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=alliedtelesis.co.nz
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz
 header.b="qPiiN0Qp"; dkim-atps=neutral
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz
 [202.36.163.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yq2m6FN8zDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 07:10:24 +1000 (AEST)
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4C708891D5;
 Wed, 31 Jul 2019 09:10:16 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
 s=mail181024; t=1564521016;
 bh=0Z+XLHEs3tpnU67EfTU8KrstZnQvSsRUwQwRt1ZFcpc=;
 h=From:To:CC:Subject:Date:References:In-Reply-To;
 b=qPiiN0Qp1mjg9BYADu41zkSiOz4X5c5m5q2Hbmeevb+jb0IK91cbgQIXT4vsRYebw
 FC+TiAKLOCWUvRyla/Yar2NkdOiuCvIMoXuAPiwxy2eIaxrS/na4eKA5vqQeudzWjA
 T+lr7CHZ0YadtguEPKHB2vPDifRRRuwW+gVdSs5kqL+RhRyGb9+6dVLdKQvCtpnnwy
 6JIk0gj+Nn2Fb5UfY3QiLPR/NJUnD5MbQEh0yLC5xfyhHM5T9twa7b5cKcyCmEcSvs
 pVA1YR1+4KGiVhvl5fbwzFm+HKWl92ojyMkDz0VLXvkdt53NM+stvNj+RGwzekjX3R
 73cCr7LstpkZA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by
 mmarshal3.atlnz.lc with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d40b2370000>; Wed, 31 Jul 2019 09:10:15 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1156.6; Wed, 31 Jul 2019 09:10:15 +1200
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1156.000; Wed, 31 Jul 2019 09:10:15 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Support CMDLINE_EXTEND
Thread-Topic: [PATCH] powerpc: Support CMDLINE_EXTEND
Thread-Index: AQHVQeFH9dM2UcWg8kibPPBr3exODabh/KaAgADsyoA=
Date: Tue, 30 Jul 2019 21:10:15 +0000
Message-ID: <1564521015.6123.11.camel@alliedtelesis.co.nz>
References: <20190724053303.24317-1-chris.packham@alliedtelesis.co.nz>
 <59674457-eda5-fe3b-65e0-29c20102fe4d@c-s.fr>
In-Reply-To: <59674457-eda5-fe3b-65e0-29c20102fe4d@c-s.fr>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [2001:df5:b000:22:3a2c:4aff:fe70:2b02]
Content-Type: text/plain; charset="utf-8"
Content-ID: <55D24E6294C00F46945DD7FD181941E6@atlnz.lc>
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

SGkgQ2hyaXN0b3BoZSwNCg0KT24gVHVlLCAyMDE5LTA3LTMwIGF0IDA5OjAyICswMjAwLCBDaHJp
c3RvcGhlIExlcm95IHdyb3RlOg0KPiANCj4gTGUgMjQvMDcvMjAxOSDDoCAwNzozMywgQ2hyaXMg
UGFja2hhbSBhIMOpY3JpdMKgOg0KPiA+IA0KPiA+IERldmljZSB0cmVlIGF3YXJlIHBsYXRmb3Jt
cyBjYW4gbWFrZSB1c2Ugb2YgQ01ETElORV9FWFRFTkQgdG8NCj4gPiBleHRlbmQgdGhlDQo+ID4g
a2VybmVsIGNvbW1hbmQgbGluZSBwcm92aWRlZCBieSB0aGUgYm9vdGxvYWRlci4gVGhpcyBpcw0K
PiA+IHBhcnRpY3VsYXJseQ0KPiA+IHVzZWZ1bCB0byBzZXQgcGFyYW1ldGVycyBmb3IgYnVpbHQt
aW4gbW9kdWxlcyB0aGF0IHdvdWxkIG90aGVyd2lzZQ0KPiA+IGJlDQo+ID4gZG9uZSBhdCBtb2R1
bGUgaW5zZXJ0aW9uLiBBZGQgc3VwcG9ydCBmb3IgdGhpcyBpbiB0aGUgcG93ZXJwYw0KPiA+IGFy
Y2hpdGVjdHVyZS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJp
cy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+ID4gLS0tDQo+ID4gwqAgYXJjaC9wb3dl
cnBjL0tjb25maWcgfCAxMiArKysrKysrKysrKysNCj4gSSB0aGluayB5b3UgYWxzbyBoYXZlIHRv
IGltcGxlbWVudCBzb21lIHN0dWZmIGluDQo+IGVhcmx5X2NtZGxpbmVfcGFyc2UoKcKgDQo+IGlu
IGFyY2gvcG93ZXJwYy9rZXJuZWwvcHJvbV9pbml0LmMNCg0KSSBteSBjYXNlIEkgZGlkbid0IG5l
ZWQgdG8gc2luY2UgdGhlIGdlbmVyaWMgY29kZSBpbsKgZHJpdmVycy9vZi9mZHQuYw0KZGlkIHdo
YXQgSSBuZWVkLiBGb3IgZWFybHkgb3B0aW9ucyBvciBwbGF0Zm9ybXMgdGhhdCBkb24ndCB1c2Ug
YSBkZXZpY2UNCnRyZWUgdGhlbiBJIGNhbiBzZWUgd2h5IEknZCBuZWVkIHRoZSB1cGRhdGUgdG8g
dXBkYXRlIHRvIHByb21faW5pdC4NCg0KPiANCj4gTWF5YmUgbG9vayBhdCBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3BhdGNoLzEwNzQxMjYvDQo+IA0KDQpEbyB5b3UgbWluZCBpZiBJIHRh
a2UgdGhpcyBhbmQgZm9sZCBpdCBpbnRvIGEgdjIgb2YgbXkgcGF0Y2g/IEFueQ0KcGFydGljdWxh
ciByZWFzb24gaXQgZGlkbid0IGdldCBwaWNrZWQgdXAgaW4gQXByaWw/DQoNCj4gQ2hyaXN0b3Bo
ZQ0KPiANCj4gPiANCj4gPiDCoCAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQ0KPiA+
IA0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2NvbmZpZyBiL2FyY2gvcG93ZXJwYy9L
Y29uZmlnDQo+ID4gaW5kZXggZDhkY2Q4ODIwMzY5Li5jZDliMzk3NGFhMzYgMTAwNjQ0DQo+ID4g
LS0tIGEvYXJjaC9wb3dlcnBjL0tjb25maWcNCj4gPiArKysgYi9hcmNoL3Bvd2VycGMvS2NvbmZp
Zw0KPiA+IEBAIC04NTEsNiArODUxLDExIEBAIGNvbmZpZyBDTURMSU5FDQo+ID4gwqDCoAnCoMKg
c29tZSBjb21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0aW1lIGJ5IGVudGVyaW5nDQo+ID4g
dGhlbSBoZXJlLsKgwqBJbg0KPiA+IMKgwqAJwqDCoG1vc3QgY2FzZXMgeW91IHdpbGwgbmVlZCB0
byBzcGVjaWZ5IHRoZSByb290IGRldmljZQ0KPiA+IGhlcmUuDQo+ID4gwqDCoA0KPiA+ICtjaG9p
Y2UNCj4gPiArCXByb21wdCAiS2VybmVsIGNvbW1hbmQgbGluZSB0eXBlIiBpZiBDTURMSU5FICE9
ICIiDQo+ID4gKwlkZWZhdWx0IENNRExJTkVfRk9SQ0UNCj4gPiArCWRlcGVuZHMgb24gQ01ETElO
RV9CT09MDQo+ID4gKw0KPiA+IMKgIGNvbmZpZyBDTURMSU5FX0ZPUkNFDQo+ID4gwqDCoAlib29s
ICJBbHdheXMgdXNlIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZyINCj4gPiDCoMKg
CWRlcGVuZHMgb24gQ01ETElORV9CT09MDQo+ID4gQEAgLTg2MCw2ICs4NjUsMTMgQEAgY29uZmln
IENNRExJTkVfRk9SQ0UNCj4gPiDCoMKgCcKgwqBUaGlzIGlzIHVzZWZ1bCBpZiB5b3UgY2Fubm90
IG9yIGRvbid0IHdhbnQgdG8gY2hhbmdlDQo+ID4gdGhlDQo+ID4gwqDCoAnCoMKgY29tbWFuZC1s
aW5lIG9wdGlvbnMgeW91ciBib290IGxvYWRlciBwYXNzZXMgdG8gdGhlDQo+ID4ga2VybmVsLg0K
PiA+IMKgwqANCj4gPiArY29uZmlnIENNRExJTkVfRVhURU5EDQo+ID4gKwlib29sICJFeHRlbmQg
Ym9vdGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIg0KPiA+ICsJaGVscA0KPiA+ICsJwqDCoFRoZSBj
b21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBib290IGxvYWRlcg0KPiA+IHdp
bGwgYmUNCj4gPiArCcKgwqBhcHBlbmRlZCB0byB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBz
dHJpbmcuDQo+ID4gK2VuZGNob2ljZQ0KPiA+ICsNCj4gPiDCoCBjb25maWcgRVhUUkFfVEFSR0VU
Uw0KPiA+IMKgwqAJc3RyaW5nICJBZGRpdGlvbmFsIGRlZmF1bHQgaW1hZ2UgdHlwZXMiDQo+ID4g
wqDCoAloZWxwDQo+ID4g
