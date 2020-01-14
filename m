Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5D413AF51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 17:28:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xwqQ4bLGzDqFF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 03:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.220.76;
 helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=IfdDcPIP; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xwnZ5CSpzDq9R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 03:26:24 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCSBwrcYeKcA9zkIFq8U/cH3np3uqHS2nWR2Y71HiiIpL7eFRV3PRoBFAEn2nkX/raLmaBgVyYfQdrAZSuZ+/h6OUDcfP8dNKs+j1+bHsBGYrT0qwT7Kyahipl32es3cOwzVdrqEPtZqqtBuQmn62W6yWvLdT8NysNJJJddpaYyiIFYFXMu0ZyFde4WqSAkel4E6iUqYF2kdLebR8OhTuWrTdxglIB3CWryYP577STKrk2LTt+HsBpKLcRlY4JdpHnTxim+HZGr6jzBrMns4O9tAPhPRJDoyklYhfzkurcUcHT/yiGeKq+TqV91BRDDv0H8mtHu7qgZ5wGyTzOnrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHy/C5++OemYKYAG8zWr6nCPTuRvwJJfOwocbfcEbHc=;
 b=bT95sRS6/E9Z0t31l7Q8zMCrp0oqRRBFJ1ial5ozVK8Hho679rmfpAoGO6aM6eIVrlb/Ac4aFG2nAvdI3hF4wMs92BQI8hyKSKIBbUF7wMoxbXbbcy+RcBagutFHJ5+4RWR4kXE+c+MDARVPNjNi/YgMn2i/1OpdqI/O72Tov88HIy3HqJV72b3/Uzt/gfN2G7Uh1FGA3I2Viq1L8BlxKI8cu7t3qB3M0d1DjJ8sCIR0jXuedZIWNf1MpgJZv3eZIjHPeuLJtgl0xzVS6qOFjaN+TADgrw505gKr7BQSc2HOT7DPCZlWnMZuoFvwzGB0ru0FC/+0s/2VGU1fw1gI8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QHy/C5++OemYKYAG8zWr6nCPTuRvwJJfOwocbfcEbHc=;
 b=IfdDcPIP6e8L0EogBpxhGyYbYo/DrvKPABgSEzVo3ODnRwHrF+2SQLfbUeefmfX/bZVA4kvLzRFVNIKvv/tlu1PBjU3NtV6VMMDcwDHe/xk8YaCwQfoZXjUQSXhevk4AMaHXw7BBiBM2jXEXaEzipIW9D5ln3fY2f8sdPCfORJo=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.77.152) by
 BN8PR10MB3524.namprd10.prod.outlook.com (20.179.79.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Tue, 14 Jan 2020 16:26:18 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::6922:a072:d75e:74ef]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::6922:a072:d75e:74ef%7]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 16:26:18 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "christophe.leroy@c-s.fr" <christophe.leroy@c-s.fr>, "broonie@kernel.org"
 <broonie@kernel.org>
Subject: Re: [PATCH v3] spi: fsl: simplify error path in of_fsl_spi_probe()
Thread-Topic: [PATCH v3] spi: fsl: simplify error path in of_fsl_spi_probe()
Thread-Index: AQHVyvSaV4B/R2znCEqweeHE7izY96fqWMiA
Date: Tue, 14 Jan 2020 16:26:18 +0000
Message-ID: <b6d01fa02e659db911df63a79d825080f03dfcb8.camel@infinera.com>
References: <2a4a7e11b37cfa0558d68f0d35e90d6da858b059.1579017697.git.christophe.leroy@c-s.fr>
In-Reply-To: <2a4a7e11b37cfa0558d68f0d35e90d6da858b059.1579017697.git.christophe.leroy@c-s.fr>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc679e57-a0a1-4f2b-e643-08d7990e7bc9
x-ms-traffictypediagnostic: BN8PR10MB3524:
x-microsoft-antispam-prvs: <BN8PR10MB352454091E4AC3AC8EC28539F4340@BN8PR10MB3524.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(199004)(189003)(6506007)(4326008)(5660300002)(6486002)(6512007)(36756003)(66476007)(66556008)(478600001)(64756008)(8936002)(81166006)(81156014)(8676002)(2906002)(66446008)(76116006)(91956017)(66946007)(71200400001)(316002)(54906003)(26005)(86362001)(2616005)(186003)(110136005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3524;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cfP5hGgiG2GVd4C0ge3c6tp2HCcYKSmkM1m3QSvBoXpOFO2j+CyfF/kAlePXm759PuzzCC1d4rhiacDw/XsiBDJV/cr7c1VFug4dreXo2e5fMZy2uy4zSYzxe+cGfedkwreWhOErUD4YEEW/stqODPOvvHOoX41SX3crwaVse9Tvj/26jn6GAGiNf1v70SA1oWqYeXkJWXlc/F+tD9UKd0hgY0sGgpBhOBqSf3TjkPbTcruzRkbjgeKBFfCRW4ADt1d2ND5veqemrDJbAqx6+aIHLrXyRfUHrID5XNGeXxOoCA9kFpp2spckILibO7RrtF9HWCnm2wgJLiHMqTtprNkvycvdOjM5f8EbT2iB7lBPltcv/zRIZ4f3b/iP2vFGvdNA2Nzrbw8cgNoe27GIOPHcXcUvgaCJWWtJyXo1ygYiRDdQbVSYByuYMNhZYYCH
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <75EE43E45520CF4BBC8B477E9A2C63F7@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc679e57-a0a1-4f2b-e643-08d7990e7bc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 16:26:18.0556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j8kzUAkVImhXUWvrGTWmaeeL+9YiJJfW3Yjzbpdw4uuEcnvRuHJjt9S1Dgw2vPikP+mt9XHOW1LM/BXBnyBPfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3524
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
 "lkp@intel.com" <lkp@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDIwLTAxLTE0IGF0IDE2OjAyICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgcmVjb2duaXplIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4N
Cj4gDQo+IA0KPiBObyBuZWVkIHRvICdnb3RvIGVycjsnIGZvciBqdXN0IGRvaW5nIGEgcmV0dXJu
Lg0KPiByZXR1cm4gZGlyZWN0bHkgZnJvbSB3aGVyZSB0aGUgZXJyb3IgaGFwcGVucy4NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZy
Pg0KPiAtLS0NCj4gdjM6IHJlYmFzZSBvbiB0b2RheSdzIHNwaS9mb3ItbmV4dCBhbmQgdXNpbmcg
UFRSX0VSUl9PUl9aRVJPKCkgaW4gb25lIHBsYWNlLg0KPiAtLS0NCj4gIGRyaXZlcnMvc3BpL3Nw
aS1mc2wtc3BpLmMgfCAyNyArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3BpL3NwaS1mc2wtc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGktZnNsLXNwaS5j
DQo+IGluZGV4IGZiNDE1OWFkNmJmNi4uM2I4MTc3MmZlYTBkIDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL3NwaS9zcGktZnNsLXNwaS5jDQo+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1mc2wtc3BpLmMN
Cj4gQEAgLTcwNiw4ICs3MDYsOCBAQCBzdGF0aWMgaW50IG9mX2ZzbF9zcGlfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+ICAgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpu
cCA9IG9mZGV2LT5kZXYub2Zfbm9kZTsNCj4gICAgICAgICBzdHJ1Y3Qgc3BpX21hc3RlciAqbWFz
dGVyOw0KPiAgICAgICAgIHN0cnVjdCByZXNvdXJjZSBtZW07DQo+IC0gICAgICAgaW50IGlycSA9
IDAsIHR5cGU7DQo+IC0gICAgICAgaW50IHJldCA9IC1FTk9NRU07DQo+ICsgICAgICAgaW50IGly
cSwgdHlwZTsNCj4gKyAgICAgICBpbnQgcmV0Ow0KPiANCj4gICAgICAgICByZXQgPSBvZl9tcGM4
eHh4X3NwaV9wcm9iZShvZmRldik7DQo+ICAgICAgICAgaWYgKHJldCkNCj4gQEAgLTcyMiwxMCAr
NzIyLDggQEAgc3RhdGljIGludCBvZl9mc2xfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKm9mZGV2KQ0KPiANCj4gICAgICAgICAgICAgICAgIGlmIChzcGlzZWxfYm9vdCkgew0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICBwaW5mby0+aW1tcl9zcGlfY3MgPSBpb3JlbWFwKGdldF9p
bW1yYmFzZSgpICsgSU1NUl9TUElfQ1NfT0ZGU0VULCA0KTsNCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKCFwaW5mby0+aW1tcl9zcGlfY3MpIHsNCj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZXQgPSAtRU5PTUVNOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gZXJyOw0KPiAtICAgICAgICAgICAgICAgICAgICAgICB9DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghcGluZm8tPmltbXJfc3BpX2NzKQ0KPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOw0KPiAgICAgICAgICAgICAgICAgfQ0KPiAg
I2VuZGlmDQo+ICAgICAgICAgICAgICAgICAvKg0KPiBAQCAtNzQ0LDI0ICs3NDIsMTUgQEAgc3Rh
dGljIGludCBvZl9mc2xfc3BpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9mZGV2KQ0K
PiANCj4gICAgICAgICByZXQgPSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKG5wLCAwLCAmbWVtKTsN
Cj4gICAgICAgICBpZiAocmV0KQ0KPiAtICAgICAgICAgICAgICAgZ290byBlcnI7DQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gICAgICAgICBpcnEgPSBwbGF0Zm9ybV9nZXRf
aXJxKG9mZGV2LCAwKTsNCj4gLSAgICAgICBpZiAoaXJxIDwgMCkgew0KPiAtICAgICAgICAgICAg
ICAgcmV0ID0gaXJxOw0KPiAtICAgICAgICAgICAgICAgZ290byBlcnI7DQo+IC0gICAgICAgfQ0K
PiArICAgICAgIGlmIChpcnEgPCAwKQ0KPiArICAgICAgICAgICAgICAgcmV0dXJuIGlycTsNCj4g
DQo+ICAgICAgICAgbWFzdGVyID0gZnNsX3NwaV9wcm9iZShkZXYsICZtZW0sIGlycSk7DQo+IC0g
ICAgICAgaWYgKElTX0VSUihtYXN0ZXIpKSB7DQo+IC0gICAgICAgICAgICAgICByZXQgPSBQVFJf
RVJSKG1hc3Rlcik7DQo+IC0gICAgICAgICAgICAgICBnb3RvIGVycjsNCj4gLSAgICAgICB9DQo+
IC0NCg0KRG9uJ3QgeW91IG5lZWQgdG8gInVuZG8iIGlvcmVtYXAsIGlycSBldGMuIGluIGNhc2Ug
b2YgbGF0ZXIgZXJyb3JzPw0KDQo+IC0gICAgICAgcmV0dXJuIDA7DQo+IA0KPiAtZXJyOg0KPiAt
ICAgICAgIHJldHVybiByZXQ7DQo+ICsgICAgICAgcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhtYXN0
ZXIpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyBpbnQgb2ZfZnNsX3NwaV9yZW1vdmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqb2ZkZXYpDQo+IC0tDQo+IDIuMTMuMw0KPiANCg0K
