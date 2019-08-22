Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D4C98C30
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 09:07:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DbFl37CmzDrLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 17:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=infinera.com
 (client-ip=40.107.72.84; helo=nam05-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.b="a8Xva8p+";
 dkim-atps=neutral
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720084.outbound.protection.outlook.com [40.107.72.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DbCt5JvTzDrGv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 17:06:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNwmIe+DF7xmwRJgABKBxFIbSrsXj4krvA7UaWdp5BL1d8ZFew8QZb2X4dlFbSb90+SaPHrXw3qEmI7KhJV1HKfo41ELnilyPpW9U/4aw6C0q4vrC21gpTejrdZRcMQPFCoieYYRcsI1wL3ltlgmw7NltzRDd4IGn0glAPECg80C+/BH27xzER2Dn9rJmK8CCV6Tb9SZj1pwqyU4v3iZZxFdZXngGtFZD3RVGaZyH2daPHK/+uwf/XYYw5+HROUA6QQ5YxbBbr+pEu/usnn2nQZcXhY0j5xY83v/ftiAdI2S8ZtGC+6P/FsQlHIp3G542rFKTOPf473/8E9vwhj02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcL61Utyr96sHtWso9Lz0DdS5KzmkQ9GPeGFM4MzqdE=;
 b=H9o8NDfJ8snkR5oAWyLSGqbi0L5qzfQNp14LCdlwuCaXWMc++LyWie3SISX3QtS6v6IF9w12Ua76VLHMdF1gpAxMutb4F2XqXjGDAfGlrFwMLxQpFQeKLuklGZmLoXNQit3tQLcoT91nACqGVMvzsW0m5GOE3G8RVozJWO/qopQ6/30xMO53eqwJNbwCsLmro0lGEJcPgpa120lWX4Hlf9t5NcgidpagElvZlbEawWBdxpp6a+b4dFIY7l6ytz6z9bMpLwKmifQcRHoIX5biM+M5TBgO3JRVTzNbV21JMNDZJYv74eNl0BEgHK0BQ4Reu9BTgl1pJTaB4CpLu1i13g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcL61Utyr96sHtWso9Lz0DdS5KzmkQ9GPeGFM4MzqdE=;
 b=a8Xva8p+sw08A+cRV7mdCOVGQsp4Jv7rVDs6SD3gDCIu1lryQy3+PBHU+yTCGFk8L4HF02KtLmm89tAWZEj5nZyAhwqzjus39T9ovBHY5Pcr/uOtDm1Eg6QBiyMjUGEInq+J1dj3WXbCDU0mGFUdDNCImkqx4fwdYN+T6JQR3kg=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3377.namprd10.prod.outlook.com (20.179.139.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Thu, 22 Aug 2019 07:05:57 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::ed3c:99c5:c9c:92cc]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::ed3c:99c5:c9c:92cc%7]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 07:05:57 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "paulus@samba.org"
 <paulus@samba.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "benh@kernel.crashing.org" <benh@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/8xx: drop unused self-modifying code alternative
 to FixupDAR.
Thread-Topic: [PATCH] powerpc/8xx: drop unused self-modifying code alternative
 to FixupDAR.
Thread-Index: AQHVWFxgkw0qBO7mokiN+e108Pb66qcGv1yA
Date: Thu, 22 Aug 2019 07:05:57 +0000
Message-ID: <c358a18b99a59ff600f83dd0c83ad80072f3d10b.camel@infinera.com>
References: <b095e12c82fcba1ac4c09fc3b85d969f36614746.1566417610.git.christophe.leroy@c-s.fr>
In-Reply-To: <b095e12c82fcba1ac4c09fc3b85d969f36614746.1566417610.git.christophe.leroy@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 164be2da-a6d7-4d53-574c-08d726cf2e3b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BN8PR10MB3377; 
x-ms-traffictypediagnostic: BN8PR10MB3377:
x-microsoft-antispam-prvs: <BN8PR10MB33779613ECB2F70A3907B2C1F4A50@BN8PR10MB3377.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39840400004)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(186003)(76116006)(6246003)(66556008)(446003)(53936002)(2616005)(25786009)(229853002)(486006)(3846002)(6116002)(4326008)(76176011)(2906002)(6506007)(64756008)(6486002)(66476007)(478600001)(102836004)(26005)(91956017)(7736002)(66446008)(14444005)(256004)(11346002)(476003)(86362001)(2501003)(118296001)(2201001)(71200400001)(71190400001)(66946007)(316002)(14454004)(5660300002)(81166006)(110136005)(8936002)(6436002)(36756003)(81156014)(6512007)(8676002)(66066001)(305945005)(54906003)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3377;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sYfseLweNCoQpCekAEPzxM9vol2t+RqV9qsMkSiflw0UXF0peVjgCYEMMboD8w4Y5Imwo9/cyjqdKXtpLwrRpXDpgk7W/33CG2twieFM/4ecgu1lJ5Hy7U9CJuIpr1jWAE3ueMh2uiD5gjyLVaR1KXqTCpguGnJSn0ZEypNiou1VZVek5Gdkl+4BQbPBVo2ghAU4KRx4WaQMY/GQBCnpRfiFbSeBKDmrU24ESFZuugCs5m3Yuxf+7rvKQg2BXx94DBTgG4XjYmOEw+4oRnlC/ivYK30cg2rg31K+vOto9b7QpGtOM5+QkZjDR6cTJPgF+vO34JwlNmv3cKrK0MQrmi9oSHRlyDFoxSb98N/6Xbk8e9MPXzJ7PDM4RZm/2DLWCyAdJUe4R8EUplmd+KPudo3hcLCQjgj5FkiuSNS4YSc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <26A0C5C0D80B9047A769A2F1F9C9578E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164be2da-a6d7-4d53-574c-08d726cf2e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 07:05:57.0252 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tAvODIzw3DbA2Vznr4bbpEQPNOoHJJk54aARDmViYsDwuCEVp0geu/7dNSjDvufQehunVsHN5Us2+Jv30l1IVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3377
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

T24gV2VkLCAyMDE5LTA4LTIxIGF0IDIwOjAwICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiANCj4gVGhlIGNvZGUgd2hpY2ggZml4dXBzIHRoZSBEQVIgb24gVExCIGVycm9ycyBmb3Ig
ZGJjWCBpbnN0cnVjdGlvbnMNCj4gaGFzIGEgc2VsZi1tb2RpZnlpbmcgY29kZSBhbHRlcm5hdGl2
ZSB0aGF0IGhhcyBuZXZlciBiZWVuIHVzZWQuDQo+IA0KPiBEcm9wIGl0Lg0KDQpBcmdoLCBteSBt
YXN0ZXIgcGllY2UgZnJvbSB3YXkgYmFjayA6KQ0KQnV0IGl0IGlzIHRpbWUgZm9yIGl0IHRvIGdv
Lg0KDQpSZXZpZXdlZC1ieTogSm9ha2ltIFRqZXJubHVuZCA8am9ha2ltLnRqZXJubHVuZEBpbmZp
bmVyYS5jb20+DQoNCiBKb2NrZQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQo+IC0tLQ0KPiAgYXJjaC9wb3dlcnBjL2tlcm5l
bC9oZWFkXzh4eC5TIHwgMjQgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hh
bmdlZCwgMjQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2tl
cm5lbC9oZWFkXzh4eC5TIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzh4eC5TDQo+IGluZGV4
IGI4Y2E1YjQzZTU4Ny4uMTlmNTgzZTE4NDAyIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMv
a2VybmVsL2hlYWRfOHh4LlMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9oZWFkXzh4eC5T
DQo+IEBAIC01NzUsOCArNTc1LDYgQEAgSW5zdHJ1Y3Rpb25CcmVha3BvaW50Og0KPiAgICogYnkg
ZGVjb2RpbmcgdGhlIHJlZ2lzdGVycyB1c2VkIGJ5IHRoZSBkY2J4IGluc3RydWN0aW9uIGFuZCBh
ZGRpbmcgdGhlbS4NCj4gICAqIERBUiBpcyBzZXQgdG8gdGhlIGNhbGN1bGF0ZWQgYWRkcmVzcy4N
Cj4gICAqLw0KPiAtIC8qIGRlZmluZSBpZiB5b3UgZG9uJ3Qgd2FudCB0byB1c2Ugc2VsZiBtb2Rp
ZnlpbmcgY29kZSAqLw0KPiAtI2RlZmluZSBOT19TRUxGX01PRElGWUlOR19DT0RFDQo+ICBGaXh1
cERBUjovKiBFbnRyeSBwb2ludCBmb3IgZGNieCB3b3JrYXJvdW5kLiAqLw0KPiAgICAgICAgIG10
c3ByICAgU1BSTl9NX1RXLCByMTANCj4gICAgICAgICAvKiBmZXRjaCBpbnN0cnVjdGlvbiBmcm9t
IG1lbW9yeS4gKi8NCj4gQEAgLTY0MCwyNyArNjM4LDYgQEAgRml4dXBEQVI6LyogRW50cnkgcG9p
bnQgZm9yIGRjYnggd29ya2Fyb3VuZC4gKi8NCj4gICAgICAgICBybHdpbm0gIHIxMCwgcjEwLDAs
Nyw1ICAvKiBDbGVhciBzdG9yZSBiaXQgZm9yIGJ1Z2d5IGRjYnN0IGluc24gKi8NCj4gICAgICAg
ICBtdHNwciAgIFNQUk5fRFNJU1IsIHIxMA0KPiAgMTQyOiAgIC8qIGNvbnRpbnVlLCBpdCB3YXMg
YSBkY2J4LCBkY2JpIGluc3RydWN0aW9uLiAqLw0KPiAtI2lmbmRlZiBOT19TRUxGX01PRElGWUlO
R19DT0RFDQo+IC0gICAgICAgYW5kaXMuICByMTAscjExLDB4MWYgICAgLyogdGVzdCBpZiByZWcg
UkEgaXMgcjAgKi8NCj4gLSAgICAgICBsaSAgICAgIHIxMCxtb2RpZmllZF9pbnN0ckBsDQo+IC0g
ICAgICAgZGNidHN0ICByMCxyMTAgICAgICAgICAgLyogdG91Y2ggZm9yIHN0b3JlICovDQo+IC0g
ICAgICAgcmx3aW5tICByMTEscjExLDAsMCwyMCAgLyogWmVybyBsb3dlciAxMCBiaXRzICovDQo+
IC0gICAgICAgb3JpcyAgICByMTEscjExLDY0MCAgICAgLyogVHJhbnNmb3JtIGluc3RyLiB0byBh
ICJhZGQgcjEwLFJBLFJCIiAqLw0KPiAtICAgICAgIG9yaSAgICAgcjExLHIxMSw1MzINCj4gLSAg
ICAgICBzdHcgICAgIHIxMSwwKHIxMCkgICAgICAvKiBzdG9yZSBhZGQvYW5kIGluc3RydWN0aW9u
ICovDQo+IC0gICAgICAgZGNiZiAgICAwLHIxMCAgICAgICAgICAgLyogZmx1c2ggbmV3IGluc3Ry
LiB0byBtZW1vcnkuICovDQo+IC0gICAgICAgaWNiaSAgICAwLHIxMCAgICAgICAgICAgLyogaW52
YWxpZGF0ZSBpbnN0ci4gY2FjaGUgbGluZSAqLw0KPiAtICAgICAgIG1mc3ByICAgcjExLCBTUFJO
X1NQUkdfU0NSQVRDSDEgLyogcmVzdG9yZSByMTEgKi8NCj4gLSAgICAgICBtZnNwciAgIHIxMCwg
U1BSTl9TUFJHX1NDUkFUQ0gwIC8qIHJlc3RvcmUgcjEwICovDQo+IC0gICAgICAgaXN5bmMgICAg
ICAgICAgICAgICAgICAgLyogV2FpdCB1bnRpbCBuZXcgaW5zdHIgaXMgbG9hZGVkIGZyb20gbWVt
b3J5ICovDQo+IC1tb2RpZmllZF9pbnN0cjoNCj4gLSAgICAgICAuc3BhY2UgIDQgICAgICAgICAg
ICAgICAvKiB0aGlzIGlzIHdoZXJlIHRoZSBhZGQgaW5zdHIuIGlzIHN0b3JlZCAqLw0KPiAtICAg
ICAgIGJuZSsgICAgMTQzZg0KPiAtICAgICAgIHN1YmYgICAgcjEwLHIwLHIxMCAgICAgIC8qIHIx
MD1yMTAtcjAsIG9ubHkgaWYgcmVnIFJBIGlzIHIwICovDQo+IC0xNDM6ICAgbXRkYXIgICByMTAg
ICAgICAgICAgICAgLyogc3RvcmUgZmF1bHRpbmcgRUEgaW4gREFSICovDQo+IC0gICAgICAgbWZz
cHIgICByMTAsU1BSTl9NX1RXDQo+IC0gICAgICAgYiAgICAgICBEQVJGaXhlZCAgICAgICAgLyog
R28gYmFjayB0byBub3JtYWwgVExCIGhhbmRsaW5nICovDQo+IC0jZWxzZQ0KPiAgICAgICAgIG1m
Y3RyICAgcjEwDQo+ICAgICAgICAgbXRkYXIgICByMTAgICAgICAgICAgICAgICAgICAgICAvKiBz
YXZlIGN0ciByZWcgaW4gREFSICovDQo+ICAgICAgICAgcmx3aW5tICByMTAsIHIxMSwgMjQsIDI0
LCAyOCAgICAvKiBvZmZzZXQgaW50byBqdW1wIHRhYmxlIGZvciByZWcgUkIgKi8NCj4gQEAgLTcy
NCw3ICs3MDEsNiBAQCBtb2RpZmllZF9pbnN0cjoNCj4gICAgICAgICBhZGQgICAgIHIxMCwgcjEw
LCByMTEgICAvKiBhZGQgaXQgKi8NCj4gICAgICAgICBtZmN0ciAgIHIxMSAgICAgICAgICAgICAv
KiByZXN0b3JlIHIxMSAqLw0KPiAgICAgICAgIGIgICAgICAgMTUxYg0KPiAtI2VuZGlmDQo+IA0K
PiAgLyoNCj4gICAqIFRoaXMgaXMgd2hlcmUgdGhlIG1haW4ga2VybmVsIGNvZGUgc3RhcnRzLg0K
PiAtLQ0KPiAyLjEzLjMNCj4gDQoNCg==
