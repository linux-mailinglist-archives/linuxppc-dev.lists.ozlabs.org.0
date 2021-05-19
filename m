Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6483885CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 05:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlJvP05MGz2ykG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 13:56:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=UhEODi1C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mediatek.com (client-ip=210.61.82.184;
 helo=mailgw02.mediatek.com; envelope-from=miles.chen@mediatek.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=UhEODi1C; dkim-atps=neutral
Received: from mailgw02.mediatek.com (mailgw02.mediatek.com [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlJts59Bbz2yWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 13:55:48 +1000 (AEST)
X-UUID: 198d4eae015548bc964e0d68dc629dfb-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S/KAedclNU8qmnqec3Ml95ZT6h/23axBf0ZQuILgxHU=; 
 b=UhEODi1CAV1trzS9be4WcS2xYe0b4vG6NkkI3YPaMzfmWOvVK5Weyu7BDJRXczZWVbhyHlBQjawXf5NgRha8xvUrGwLJZQtQFZuWKww4S5TyP7l6nMIkoHJCLQmkkjWttLmEIApc++w5NfMnUEs0vViyT6rJDS4BDnBNGHrC8nE=;
X-UUID: 198d4eae015548bc964e0d68dc629dfb-20210519
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 8210983; Wed, 19 May 2021 11:55:41 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 11:55:40 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 11:55:39 +0800
Message-ID: <1621396540.12301.7.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>
Date: Wed, 19 May 2021 11:55:40 +0800
In-Reply-To: <YKSKq68E9Ompn0vE@kernel.org>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
 <YKPmxEu6YFDXRyTg@kernel.org> <1621383126.12301.4.camel@mtkswgap22>
 <YKSKq68E9Ompn0vE@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
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
Cc: Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, kexec@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
 Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gV2VkLCAyMDIxLTA1LTE5IGF0IDA2OjQ4ICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBPbiBXZWQsIE1heSAxOSwgMjAyMSBhdCAwODoxMjowNkFNICswODAwLCBNaWxlcyBDaGVuIHdy
b3RlOg0KPiA+IE9uIFR1ZSwgMjAyMS0wNS0xOCBhdCAxOTowOSArMDMwMCwgTWlrZSBSYXBvcG9y
dCB3cm90ZToNCj4gPiA+IEhlbGxvIE1pbGVzLA0KPiA+ID4gDQo+ID4gPiBPbiBUdWUsIE1heSAx
OCwgMjAyMSBhdCAwNToyNDo0NFBNICswODAwLCBNaWxlcyBDaGVuIHdyb3RlOg0KPiA+ID4gPiBU
aGlzIHBhdGNoZXMgaXMgY3JlYXRlZCB0byBmaXggdGhlIF9fcGEoKSB3YXJuaW5nIG1lc3NhZ2Vz
IHdoZW4NCj4gPiA+ID4gQ09ORklHX0RFQlVHX1ZJUlRVQUw9eSBieSB1bmlmeWluZyB0aGUgYWxs
b2NhdGlvbiBvZiBwZ2xpc3RfZGF0YQ0KPiA+ID4gPiBpbnN0YW5jZXMuDQo+ID4gPiA+IA0KPiA+
ID4gPiBJbiBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIG5vZGVfZGF0YSwgaWYgQ09ORklHX05F
RURfTVVMVElQTEVfTk9ERVM9eSwNCj4gPiA+ID4gcGdsaXN0X2RhdGEgaXMgYWxsb2NhdGVkIGJ5
IGEgbWVtYmxvY2sgQVBJLiBJZiBDT05GSUdfTkVFRF9NVUxUSVBMRV9OT0RFUz1uLA0KPiA+ID4g
PiB3ZSB1c2UgYSBnbG9iYWwgdmFyaWFibGUgbmFtZWQgImNvbnRpZ19wYWdlX2RhdGEiLg0KPiA+
ID4gPiANCj4gPiA+ID4gSWYgQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgbm90IGVuYWJsZWQuIF9f
cGEoKSBjYW4gaGFuZGxlIGJvdGgNCj4gPiA+ID4gYWxsb2NhdGlvbiBhbmQgc3ltYm9sIGNhc2Vz
LiBCdXQgaWYgQ09ORklHX0RFQlVHX1ZJUlRVQUwgaXMgc2V0LA0KPiA+ID4gPiB3ZSB3aWxsIGhh
dmUgdGhlICJ2aXJ0X3RvX3BoeXMgdXNlZCBmb3Igbm9uLWxpbmVhciBhZGRyZXNzIiB3YXJuaW5n
DQo+ID4gPiA+IHdoZW4gYm9vdGluZy4NCj4gPiA+ID4gDQo+ID4gPiA+IFRvIGZpeCB0aGUgd2Fy
bmluZywgYWx3YXlzIGFsbG9jYXRlIHBnbGlzdF9kYXRhIGJ5IG1lbWJsb2NrIEFQSXMgYW5kDQo+
ID4gPiA+IHJlbW92ZSB0aGUgdXNhZ2Ugb2YgY29udGlnX3BhZ2VfZGF0YS4NCj4gPiA+IA0KPiA+
ID4gU29tZWhvdyBJIHdhcyBzdXJlIHRoYXQgd2UgY2FuIGFsbG9jYXRlIHBnbGlzdF9kYXRhIGJl
Zm9yZSBpdCBpcyBhY2Nlc3NlZA0KPiA+ID4gaW4gc3BhcnNlX2luaXQoKSBzb21ld2hlcmUgb3V0
c2lkZSBtbS9zcGFyc2UuYy4gSXQncyByZWFsbHkgbm90IHRoZSBjYXNlDQo+ID4gPiBhbmQgaGF2
aW5nIHR3byBwbGFjZXMgdGhhdCBtYXkgYWxsb2NhdGVkIHRoaXMgc3RydWN0dXJlIGlzIHN1cmVs
eSB3b3J0aA0KPiA+ID4gdGhhbiB5b3VyIHByZXZpb3VzIHN1Z2dlc3Rpb24uDQo+ID4gPiANCj4g
PiA+IFNvcnJ5IGFib3V0IHRoYXQuDQo+ID4gDQo+ID4gRG8geW91IG1lYW4gdGFodCB0byBjYWxs
IGFsbG9jYXRpb24gZnVuY3Rpb24gYXJjaC8qLCBzb21ld2hlcmUgYWZ0ZXINCj4gPiBwYWdpbmdf
aW5pdCgpIChzbyB3ZSBjYW4gYWNjZXNzIHBnbGlzdF9kYXRhKSBhbmQgYmVmb3JlIHNwYXJzZV9p
bml0KCkNCj4gPiBhbmQgZnJlZV9hcmVhX2luaXQoKT8NCj4gDQo+IE5vLCBJIG1lYW50IHRoYXQg
eW91ciBvcmlnaW5hbCBwYXRjaCBpcyBiZXR0ZXIgdGhhbiBhZGRpbmcgYWxsb2NhdGlvbiBvZg0K
PiBOT0RFX0RBVEEoMCkgaW4gdHdvIHBsYWNlcy4NCg0KR290IGl0LiB3aWxsIHlvdSByZS1yZXZp
ZXcgdGhlIG9yaWdpbmFsIHBhdGNoPw0KDQoNCj4gIA0KPiA+IE1pbGVzDQo+ID4gDQo+ID4gPiAg
DQo+ID4gPiA+IFdhcm5pbmcgbWVzc2FnZToNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0gLS0tLS0t
LS0tLS0tWyBjdXQgaGVyZSBdLS0tLS0tLS0tLS0tDQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdIHZp
cnRfdG9fcGh5cyB1c2VkIGZvciBub24tbGluZWFyIGFkZHJlc3M6IChfX19fcHRydmFsX19fXykg
KGNvbnRpZ19wYWdlX2RhdGErMHgwLzB4MWMwMCkNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0gV0FS
TklORzogQ1BVOiAwIFBJRDogMCBhdCBhcmNoL2FybTY0L21tL3BoeXNhZGRyLmM6MTUgX192aXJ0
X3RvX3BoeXMrMHg1OC8weDY4DQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdIE1vZHVsZXMgbGlua2Vk
IGluOg0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElEOiAwIENvbW06IHN3YXBwZXIg
VGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgIDUuMTMuMC1yYzEtMDAwNzQtZzExNDBhYjU5MmUy
ZSAjMw0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSBIYXJkd2FyZSBuYW1lOiBsaW51eCxkdW1teS12
aXJ0IChEVCkNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0gcHN0YXRlOiA2MDAwMDBjNSAoblpDdiBk
YUlGIC1QQU4gLVVBTyAtVENPIEJUWVBFPS0tKQ0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSBwYyA6
IF9fdmlydF90b19waHlzKzB4NTgvMHg2OA0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSBsciA6IF9f
dmlydF90b19waHlzKzB4NTQvMHg2OA0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSBzcCA6IGZmZmY4
MDAwMTE4MzNlNzANCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDI5OiBmZmZmODAwMDExODMzZTcw
IHgyODogMDAwMDAwMDA0MThhMDAxOCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gWyAg
ICAwLjAwMDAwMF0geDI2OiAwMDAwMDAwMDAwMDAwMDBhIHgyNTogZmZmZjgwMDAxMWI3MDAwMCB4
MjQ6IGZmZmY4MDAwMTFiNzAwMDANCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDIzOiBmZmZmZmMw
MDAxYzAwMDAwIHgyMjogZmZmZjgwMDAxMWI3MDAwMCB4MjE6IDAwMDAwMDAwNDdmZmZmYjANCj4g
PiA+ID4gWyAgICAwLjAwMDAwMF0geDIwOiAwMDAwMDAwMDAwMDAwMDA4IHgxOTogZmZmZjgwMDAx
MWIwODJjMCB4MTg6IGZmZmZmZmZmZmZmZmZmZmYNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDE3
OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogZmZmZjgwMDAxMTgzM2JmOSB4MTU6IDAwMDAwMDAwMDAw
MDAwMDQNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDE0OiAwMDAwMDAwMDAwMDAwZmZmIHgxMzog
ZmZmZjgwMDAxMTg2YTU0OCB4MTI6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gWyAgICAwLjAw
MDAwMF0geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAwMDAwMDBmZmZmZmZmZiB4OSA6IDAw
MDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDggOiBmZmZmODAwMDExNWM5
MDAwIHg3IDogNzM3NTIwNzM3OTY4NzA1ZiB4NiA6IGZmZmY4MDAwMTFiNjJlZjgNCj4gPiA+ID4g
WyAgICAwLjAwMDAwMF0geDUgOiAwMDAwMDAwMDAwMDAwMDAwIHg0IDogMDAwMDAwMDAwMDAwMDAw
MSB4MyA6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0geDIgOiAwMDAw
MDAwMDAwMDAwMDAwIHgxIDogZmZmZjgwMDAxMTU5NTg1ZSB4MCA6IDAwMDAwMDAwMDAwMDAwNTgN
Cj4gPiA+ID4gWyAgICAwLjAwMDAwMF0gQ2FsbCB0cmFjZToNCj4gPiA+ID4gWyAgICAwLjAwMDAw
MF0gIF9fdmlydF90b19waHlzKzB4NTgvMHg2OA0KPiA+ID4gPiBbICAgIDAuMDAwMDAwXSAgY2hl
Y2tfdXNlbWFwX3NlY3Rpb25fbnIrMHg1MC8weGZjDQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdICBz
cGFyc2VfaW5pdF9uaWQrMHgxYWMvMHgyOGMNCj4gPiA+ID4gWyAgICAwLjAwMDAwMF0gIHNwYXJz
ZV9pbml0KzB4MWM0LzB4MWUwDQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdICBib290bWVtX2luaXQr
MHg2MC8weDkwDQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdICBzZXR1cF9hcmNoKzB4MTg0LzB4MWYw
DQo+ID4gPiA+IFsgICAgMC4wMDAwMDBdICBzdGFydF9rZXJuZWwrMHg3OC8weDQ4OA0KPiA+ID4g
PiBbICAgIDAuMDAwMDAwXSAtLS1bIGVuZCB0cmFjZSBmNjg3MjhhMGQzMDUzYjYwIF0tLS0NCj4g
PiA+ID4gDQo+ID4gPiA+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3BhdGNoLzE0MjUxMTAvX187ISFDVFJOS0E5d01nMEFS
YncheC13R0ZFQzF3THpYaG8ya0kxQ3JDMmZqWE5hUW01Zi1uMEFEUXlKRGNrQ09LWkhBUF9xMDU1
RENTV1ljUTdaZGN3JCANCj4gPiA+ID4gDQo+ID4gPiA+IENoYW5nZSBzaW5jZSB2MToNCj4gPiA+
ID4gLSB1c2UgbWVtYmxvY2tfYWxsb2MoKSB0byBjcmVhdGUgcGdsaXN0X2RhdGEgd2hlbiBDT05G
SUdfTlVNQT1uDQo+ID4gPiA+IA0KPiA+ID4gPiBNaWxlcyBDaGVuICgyKToNCj4gPiA+ID4gICBt
bTogaW50cm9kdWNlIHByZXBhcmVfbm9kZV9kYXRhDQo+ID4gPiA+ICAgbW06IHJlcGxhY2UgY29u
dGlnX3BhZ2VfZGF0YSB3aXRoIG5vZGVfZGF0YQ0KPiA+ID4gPiANCj4gPiA+ID4gIERvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUva2R1bXAvdm1jb3JlaW5mby5yc3QgfCAxMyAtLS0tLS0tLS0tLS0t
DQo+ID4gPiA+ICBhcmNoL3Bvd2VycGMva2V4ZWMvY29yZS5jICAgICAgICAgICAgICAgICAgICAg
IHwgIDUgLS0tLS0NCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvZ2ZwLmggICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMyAtLS0NCj4gPiA+ID4gIGluY2x1ZGUvbGludXgvbW0uaCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9tbXpv
bmUuaCAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gPiA+ID4gIGtlcm5lbC9j
cmFzaF9jb3JlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ID4gPiA+ICBt
bS9tZW1ibG9jay5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDMgKy0tDQo+
ID4gPiA+ICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
MTYgKysrKysrKysrKysrKysrKw0KPiA+ID4gPiAgbW0vc3BhcnNlLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICsrDQo+ID4gPiA+ICA5IGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDI2IGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4g
PiA+IGJhc2UtY29tbWl0OiA4YWM5MWU2YzYwMzNlYmMxMmM1YzFlNGFhMTcxYjgxYTY2MmJkNzBm
DQo+ID4gPiA+IC0tIA0KPiA+ID4gPiAyLjE4LjANCj4gPiA+ID4gDQo+ID4gPiANCj4gPiANCj4g
DQoNCg==

