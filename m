Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F823883A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 02:12:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlCxQ2vV8z30Cc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 10:12:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=dyIS+GIo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mediatek.com (client-ip=210.61.82.183;
 helo=mailgw01.mediatek.com; envelope-from=miles.chen@mediatek.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256
 header.s=dk header.b=dyIS+GIo; dkim-atps=neutral
Received: from mailgw01.mediatek.com (mailgw01.mediatek.com [210.61.82.183])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FlCwv5nBkz2xvV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 10:12:13 +1000 (AEST)
X-UUID: d60617eb75fc498bb791eb231d98dbca-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qPl/sSk5L5BJ00kmhUPZ9WBNL8LNmX162Mp2lwH5YCY=; 
 b=dyIS+GIoMh8q3GHv80ISIR5RvQSId5tGq8FadANxnAZDeA/t7NE6K/RuBjCynCN6O2v+LlDcfCQw+DEBMKJvwPdiJcvQWBs0Zz43cfadowv5PDyjVpstCPuStMq7qIUQMb+z2Co6wH7xifXZmn3BBMrY1YAJkTvlV2HHyUXwuEU=;
X-UUID: d60617eb75fc498bb791eb231d98dbca-20210519
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <miles.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1253459367; Wed, 19 May 2021 08:12:07 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 08:12:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 08:12:06 +0800
Message-ID: <1621383126.12301.4.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] mm: unify the allocation of pglist_data instances
From: Miles Chen <miles.chen@mediatek.com>
To: Mike Rapoport <rppt@kernel.org>
Date: Wed, 19 May 2021 08:12:06 +0800
In-Reply-To: <YKPmxEu6YFDXRyTg@kernel.org>
References: <20210518092446.16382-1-miles.chen@mediatek.com>
 <YKPmxEu6YFDXRyTg@kernel.org>
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

T24gVHVlLCAyMDIxLTA1LTE4IGF0IDE5OjA5ICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOg0K
PiBIZWxsbyBNaWxlcywNCj4gDQo+IE9uIFR1ZSwgTWF5IDE4LCAyMDIxIGF0IDA1OjI0OjQ0UE0g
KzA4MDAsIE1pbGVzIENoZW4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaGVzIGlzIGNyZWF0ZWQgdG8g
Zml4IHRoZSBfX3BhKCkgd2FybmluZyBtZXNzYWdlcyB3aGVuDQo+ID4gQ09ORklHX0RFQlVHX1ZJ
UlRVQUw9eSBieSB1bmlmeWluZyB0aGUgYWxsb2NhdGlvbiBvZiBwZ2xpc3RfZGF0YQ0KPiA+IGlu
c3RhbmNlcy4NCj4gPiANCj4gPiBJbiBjdXJyZW50IGltcGxlbWVudGF0aW9uIG9mIG5vZGVfZGF0
YSwgaWYgQ09ORklHX05FRURfTVVMVElQTEVfTk9ERVM9eSwNCj4gPiBwZ2xpc3RfZGF0YSBpcyBh
bGxvY2F0ZWQgYnkgYSBtZW1ibG9jayBBUEkuIElmIENPTkZJR19ORUVEX01VTFRJUExFX05PREVT
PW4sDQo+ID4gd2UgdXNlIGEgZ2xvYmFsIHZhcmlhYmxlIG5hbWVkICJjb250aWdfcGFnZV9kYXRh
Ii4NCj4gPiANCj4gPiBJZiBDT05GSUdfREVCVUdfVklSVFVBTCBpcyBub3QgZW5hYmxlZC4gX19w
YSgpIGNhbiBoYW5kbGUgYm90aA0KPiA+IGFsbG9jYXRpb24gYW5kIHN5bWJvbCBjYXNlcy4gQnV0
IGlmIENPTkZJR19ERUJVR19WSVJUVUFMIGlzIHNldCwNCj4gPiB3ZSB3aWxsIGhhdmUgdGhlICJ2
aXJ0X3RvX3BoeXMgdXNlZCBmb3Igbm9uLWxpbmVhciBhZGRyZXNzIiB3YXJuaW5nDQo+ID4gd2hl
biBib290aW5nLg0KPiA+IA0KPiA+IFRvIGZpeCB0aGUgd2FybmluZywgYWx3YXlzIGFsbG9jYXRl
IHBnbGlzdF9kYXRhIGJ5IG1lbWJsb2NrIEFQSXMgYW5kDQo+ID4gcmVtb3ZlIHRoZSB1c2FnZSBv
ZiBjb250aWdfcGFnZV9kYXRhLg0KPiANCj4gU29tZWhvdyBJIHdhcyBzdXJlIHRoYXQgd2UgY2Fu
IGFsbG9jYXRlIHBnbGlzdF9kYXRhIGJlZm9yZSBpdCBpcyBhY2Nlc3NlZA0KPiBpbiBzcGFyc2Vf
aW5pdCgpIHNvbWV3aGVyZSBvdXRzaWRlIG1tL3NwYXJzZS5jLiBJdCdzIHJlYWxseSBub3QgdGhl
IGNhc2UNCj4gYW5kIGhhdmluZyB0d28gcGxhY2VzIHRoYXQgbWF5IGFsbG9jYXRlZCB0aGlzIHN0
cnVjdHVyZSBpcyBzdXJlbHkgd29ydGgNCj4gdGhhbiB5b3VyIHByZXZpb3VzIHN1Z2dlc3Rpb24u
DQo+IA0KPiBTb3JyeSBhYm91dCB0aGF0Lg0KDQpEbyB5b3UgbWVhbiB0YWh0IHRvIGNhbGwgYWxs
b2NhdGlvbiBmdW5jdGlvbiBhcmNoLyosIHNvbWV3aGVyZSBhZnRlcg0KcGFnaW5nX2luaXQoKSAo
c28gd2UgY2FuIGFjY2VzcyBwZ2xpc3RfZGF0YSkgYW5kIGJlZm9yZSBzcGFyc2VfaW5pdCgpDQph
bmQgZnJlZV9hcmVhX2luaXQoKT8NCg0KTWlsZXMNCg0KPiAgDQo+ID4gV2FybmluZyBtZXNzYWdl
Og0KPiA+IFsgICAgMC4wMDAwMDBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0t
LQ0KPiA+IFsgICAgMC4wMDAwMDBdIHZpcnRfdG9fcGh5cyB1c2VkIGZvciBub24tbGluZWFyIGFk
ZHJlc3M6IChfX19fcHRydmFsX19fXykgKGNvbnRpZ19wYWdlX2RhdGErMHgwLzB4MWMwMCkNCj4g
PiBbICAgIDAuMDAwMDAwXSBXQVJOSU5HOiBDUFU6IDAgUElEOiAwIGF0IGFyY2gvYXJtNjQvbW0v
cGh5c2FkZHIuYzoxNSBfX3ZpcnRfdG9fcGh5cysweDU4LzB4NjgNCj4gPiBbICAgIDAuMDAwMDAw
XSBNb2R1bGVzIGxpbmtlZCBpbjoNCj4gPiBbICAgIDAuMDAwMDAwXSBDUFU6IDAgUElEOiAwIENv
bW06IHN3YXBwZXIgVGFpbnRlZDogRyAgICAgICAgVyAgICAgICAgIDUuMTMuMC1yYzEtMDAwNzQt
ZzExNDBhYjU5MmUyZSAjMw0KPiA+IFsgICAgMC4wMDAwMDBdIEhhcmR3YXJlIG5hbWU6IGxpbnV4
LGR1bW15LXZpcnQgKERUKQ0KPiA+IFsgICAgMC4wMDAwMDBdIHBzdGF0ZTogNjAwMDAwYzUgKG5a
Q3YgZGFJRiAtUEFOIC1VQU8gLVRDTyBCVFlQRT0tLSkNCj4gPiBbICAgIDAuMDAwMDAwXSBwYyA6
IF9fdmlydF90b19waHlzKzB4NTgvMHg2OA0KPiA+IFsgICAgMC4wMDAwMDBdIGxyIDogX192aXJ0
X3RvX3BoeXMrMHg1NC8weDY4DQo+ID4gWyAgICAwLjAwMDAwMF0gc3AgOiBmZmZmODAwMDExODMz
ZTcwDQo+ID4gWyAgICAwLjAwMDAwMF0geDI5OiBmZmZmODAwMDExODMzZTcwIHgyODogMDAwMDAw
MDA0MThhMDAxOCB4Mjc6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiBbICAgIDAuMDAwMDAwXSB4MjY6
IDAwMDAwMDAwMDAwMDAwMGEgeDI1OiBmZmZmODAwMDExYjcwMDAwIHgyNDogZmZmZjgwMDAxMWI3
MDAwMA0KPiA+IFsgICAgMC4wMDAwMDBdIHgyMzogZmZmZmZjMDAwMWMwMDAwMCB4MjI6IGZmZmY4
MDAwMTFiNzAwMDAgeDIxOiAwMDAwMDAwMDQ3ZmZmZmIwDQo+ID4gWyAgICAwLjAwMDAwMF0geDIw
OiAwMDAwMDAwMDAwMDAwMDA4IHgxOTogZmZmZjgwMDAxMWIwODJjMCB4MTg6IGZmZmZmZmZmZmZm
ZmZmZmYNCj4gPiBbICAgIDAuMDAwMDAwXSB4MTc6IDAwMDAwMDAwMDAwMDAwMDAgeDE2OiBmZmZm
ODAwMDExODMzYmY5IHgxNTogMDAwMDAwMDAwMDAwMDAwNA0KPiA+IFsgICAgMC4wMDAwMDBdIHgx
NDogMDAwMDAwMDAwMDAwMGZmZiB4MTM6IGZmZmY4MDAwMTE4NmE1NDggeDEyOiAwMDAwMDAwMDAw
MDAwMDAwDQo+ID4gWyAgICAwLjAwMDAwMF0geDExOiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAw
MDAwMDBmZmZmZmZmZiB4OSA6IDAwMDAwMDAwMDAwMDAwMDANCj4gPiBbICAgIDAuMDAwMDAwXSB4
OCA6IGZmZmY4MDAwMTE1YzkwMDAgeDcgOiA3Mzc1MjA3Mzc5Njg3MDVmIHg2IDogZmZmZjgwMDAx
MWI2MmVmOA0KPiA+IFsgICAgMC4wMDAwMDBdIHg1IDogMDAwMDAwMDAwMDAwMDAwMCB4NCA6IDAw
MDAwMDAwMDAwMDAwMDEgeDMgOiAwMDAwMDAwMDAwMDAwMDAwDQo+ID4gWyAgICAwLjAwMDAwMF0g
eDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgxIDogZmZmZjgwMDAxMTU5NTg1ZSB4MCA6IDAwMDAwMDAw
MDAwMDAwNTgNCj4gPiBbICAgIDAuMDAwMDAwXSBDYWxsIHRyYWNlOg0KPiA+IFsgICAgMC4wMDAw
MDBdICBfX3ZpcnRfdG9fcGh5cysweDU4LzB4NjgNCj4gPiBbICAgIDAuMDAwMDAwXSAgY2hlY2tf
dXNlbWFwX3NlY3Rpb25fbnIrMHg1MC8weGZjDQo+ID4gWyAgICAwLjAwMDAwMF0gIHNwYXJzZV9p
bml0X25pZCsweDFhYy8weDI4Yw0KPiA+IFsgICAgMC4wMDAwMDBdICBzcGFyc2VfaW5pdCsweDFj
NC8weDFlMA0KPiA+IFsgICAgMC4wMDAwMDBdICBib290bWVtX2luaXQrMHg2MC8weDkwDQo+ID4g
WyAgICAwLjAwMDAwMF0gIHNldHVwX2FyY2grMHgxODQvMHgxZjANCj4gPiBbICAgIDAuMDAwMDAw
XSAgc3RhcnRfa2VybmVsKzB4NzgvMHg0ODgNCj4gPiBbICAgIDAuMDAwMDAwXSAtLS1bIGVuZCB0
cmFjZSBmNjg3MjhhMGQzMDUzYjYwIF0tLS0NCj4gPiANCj4gPiBbMV0gaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3BhdGNod29yay9wYXRjaC8xNDI1
MTEwL19fOyEhQ1RSTktBOXdNZzBBUmJ3IXgtd0dGRUMxd0x6WGhvMmtJMUNyQzJmalhOYVFtNWYt
bjBBRFF5SkRja0NPS1pIQVBfcTA1NURDU1dZY1E3WmRjdyQgDQo+ID4gDQo+ID4gQ2hhbmdlIHNp
bmNlIHYxOg0KPiA+IC0gdXNlIG1lbWJsb2NrX2FsbG9jKCkgdG8gY3JlYXRlIHBnbGlzdF9kYXRh
IHdoZW4gQ09ORklHX05VTUE9bg0KPiA+IA0KPiA+IE1pbGVzIENoZW4gKDIpOg0KPiA+ICAgbW06
IGludHJvZHVjZSBwcmVwYXJlX25vZGVfZGF0YQ0KPiA+ICAgbW06IHJlcGxhY2UgY29udGlnX3Bh
Z2VfZGF0YSB3aXRoIG5vZGVfZGF0YQ0KPiA+IA0KPiA+ICBEb2N1bWVudGF0aW9uL2FkbWluLWd1
aWRlL2tkdW1wL3ZtY29yZWluZm8ucnN0IHwgMTMgLS0tLS0tLS0tLS0tLQ0KPiA+ICBhcmNoL3Bv
d2VycGMva2V4ZWMvY29yZS5jICAgICAgICAgICAgICAgICAgICAgIHwgIDUgLS0tLS0NCj4gPiAg
aW5jbHVkZS9saW51eC9nZnAuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAzIC0tLQ0K
PiA+ICBpbmNsdWRlL2xpbnV4L21tLmggICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
KysNCj4gPiAgaW5jbHVkZS9saW51eC9tbXpvbmUuaCAgICAgICAgICAgICAgICAgICAgICAgICB8
ICA0ICsrLS0NCj4gPiAga2VybmVsL2NyYXNoX2NvcmUuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxIC0NCj4gPiAgbW0vbWVtYmxvY2suYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAzICstLQ0KPiA+ICBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrKw0KPiA+ICBtbS9zcGFyc2UuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCj4gPiAgOSBmaWxlcyBjaGFu
Z2VkLCAyMyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiANCj4gPiBi
YXNlLWNvbW1pdDogOGFjOTFlNmM2MDMzZWJjMTJjNWMxZTRhYTE3MWI4MWE2NjJiZDcwZg0KPiA+
IC0tIA0KPiA+IDIuMTguMA0KPiA+IA0KPiANCg0K

