Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05982295D4A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 13:21:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CH4gZ1GrTzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 22:21:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.77.43;
 helo=nam02-sn1-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=fKLW0ju/; 
 dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CH4d35hXQzDqnG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 22:19:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mxxj7tV1cgsmOYU2ZTso6+ESeW3LQ4wt5MTVV/QxREtEfUazY8+FrCWdh/4J3XCjqSpVkbADjaxIuXXnRQlIgqLeSGhfz8NZ1+IcqDEKm/glcw0kfrPkWaxvjkNfVz9EcKFpTIn0HCKTiXW1N4AZn64wYPAEIE1zTo/Mda06PhRvLlPXlZbp+Js8SUx3ifabVSbzbi7C892YhkUheFnUgUjmmjOvGZXymzeZFKJ87JZ5TH/8QbDovT9YRv6osqA080E3pN3+dhz3FFS4pwgOQwvlrV44DMRp/alfwiy0OYymSCXdPB1ERV5OjEKEEuuHy5WasBAmPGy7W73YYKeVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4F6gs5J8tNWJwYAv5UttF/ELkdT8pfsqECCiiLZ+44=;
 b=METpJ2Mv4PknwmiuMUnFtOUcI3J7uhEziZmn9ZVbnV045Q+IQl9T0/W5frsp8jaSdK8gNK6SR01ybLZU1Gy7Olt3kU/i97ONw6VuMmodkS8pF3iA5N8iCDNeB1VYNRorxsdLDWGf20JZ+Yekm/QCJ3YVQyYR+gPYIaNmf5DI8apihK5fCrTRXWy9fQqFuIdAOh0viXRAFaoX+Vvl2fO/Pwxi36ATphPSxma9DGkVzdv5uMIbLs9qUa5oCR3x3pKM0loRg74IfrcMAHS1CPocl3gsRF/pNR5/LQdO2omvzMwVvk5JsghF6paGelkld8Jb+bm9YZrktq0gudlB8P2GdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K4F6gs5J8tNWJwYAv5UttF/ELkdT8pfsqECCiiLZ+44=;
 b=fKLW0ju/qQpkvOGbuD71bMsGQkqdJ/1PcuMAM8kUUnfxye5SSXWqpnG6XmIIPzYvA4r3osArW9bbVecRYYOReBlbpzowXQg7A2XP+a0FZtk7Kqjx3jUiLAUpYOYZR2O2tE4u3QkxfaPAaG9Lpu4R1EVgdZwcwQ3ywzDzRRhnkiw=
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 (2603:10b6:910:45::21) by CY4PR1001MB2088.namprd10.prod.outlook.com
 (2603:10b6:910:40::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.27; Thu, 22 Oct
 2020 11:19:11 +0000
Received: from CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8]) by CY4PR1001MB2389.namprd10.prod.outlook.com
 ([fe80::bd9d:bfc6:31c2:f5d8%6]) with mapi id 15.20.3477.028; Thu, 22 Oct 2020
 11:19:11 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: Send SIGBUS from machine_check
Thread-Topic: [PATCH] powerpc: Send SIGBUS from machine_check
Thread-Index: AQHWmBUkBeSB6voqzUWPX7X30S3i+KmjmikA
Date: Thu, 22 Oct 2020 11:19:11 +0000
Message-ID: <8137ac22c3cfc8a0b5d820c6f66212f7bf585598.camel@infinera.com>
References: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
In-Reply-To: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8d26a879-8bb5-40fe-d564-08d8767c4d65
x-ms-traffictypediagnostic: CY4PR1001MB2088:
x-microsoft-antispam-prvs: <CY4PR1001MB20885464F0E0F13A7C011F80F41D0@CY4PR1001MB2088.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k4K/SEafNIs5HXpsiRsvBMZVdvCN6MGViy6JAJMH7Ke/Kk+04Dn/CH4skx+T0q2oiaYY5/GGSJ03h1mFxOxdysCiP2pp596asp501c+57MbojJXp2RDM5P+r5+NSFoCFD+64jveT8mdNFDksZkuLeXUwhvQTC/tV2VO72b8zf1Wzk7brzAyWoB/YzJDcXXbU5J56APJ7gsmtdw9uJTYYpwO8y7wv8K+TBLoH4QFLsbpgyALx3aBn3QCvZSKEMh5dLWt5YcZoAWqvVj6d1t9YiXgGbESgx/Q0gneUoqnUC4k5qQS116o/Co2SHDkr65EN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1001MB2389.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(8936002)(36756003)(6506007)(6916009)(71200400001)(186003)(2906002)(76116006)(91956017)(86362001)(8676002)(2616005)(6486002)(66446008)(5660300002)(66946007)(316002)(478600001)(64756008)(66476007)(66556008)(6512007)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2lH1gFoX1HCHH6G6G9gSz2iDOZRxzyv+yS2plEJk/nxSwed+VmpQbl4I25VR6C07FXPUG/hiodqQVufOX/8zeW8y0sgFDeMKRtGeeO7Nvu1qBADSXgEjDO5ZTAhiXzXhIRmjzMRJkW6fPqwmB0skD05g75aa28HfBT0Fp/DU8QSYhp/UbFrRbxiOMTvkcVtl17NoWTnxQYPlyWrGjYs0OxTA4wV+AKOevBgwZ8bqi47l9o+ARe8NYu3Ot4cCsAUXAsYXBF9pU3k9o95NE/A+Sp9W4rmcCbeS8iVa7zjCGmh0+f8WnpOHg16gWwt4ugyL7A2Yl0pRznjB87XWupH52qk8Deqqt1Gus1eEsTLBUDEQw5AoQsH85Ogmhkggw+390+ZxhEMI+ak0ZuJVdifGUYUne6gOLHBKHS2feCItjbThXN0NnlEDZKQae++BqAOPpKzsAQtu4AF0FDWj/AeNLSpYVXO1qLcfObTCN8xp6LPWgozm62mux0PoPOrNISjKXaGhj7tEqNz3JqWjHd5CMWoOjAOoP3NbHwZlJHlojfUpsUkiTdKpPb74Jaw216ofUGg6+jKpo62o6F7H1RjsDbSPpJjCFHyfdUZlyhAE0+RswgCJMJZHjpK0bt3uE+bGCuLi9+TB+yvX+/2zk0P1vQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <0514C549B4CF1A4D8FF1777F2F1BEEAE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1001MB2389.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d26a879-8bb5-40fe-d564-08d8767c4d65
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2020 11:19:11.8087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xG/f3/BDzVMpa/hv7mSYt7UX3t985bBPxvRgFBtyZgh8N5uFMliOTTz0mt/fu08315aVQRH3P02CkSg7/sF2xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2088
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

cGluZw0KDQpBbHNvIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQoNCk9uIFRodSwgMjAyMC0x
MC0wMSBhdCAxOTowNSArMDIwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90ZToNCj4gRW1iZWRkZWQg
UFBDIENQVSBzaG91bGQgc2VuZCBTSUdCVVMgdG8gdXNlciBzcGFjZSB3aGVuIGFwcGxpY2FibGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKb2FraW0gVGplcm5sdW5kIDxqb2FraW0udGplcm5sdW5k
QGluZmluZXJhLmNvbT4NCj4gLS0tDQo+IMKgYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFwcy5jIHwg
MTcgKysrKysrKysrKysrKysrKysNCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygr
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYyBiL2FyY2gv
cG93ZXJwYy9rZXJuZWwvdHJhcHMuYw0KPiBpbmRleCAwMzgxMjQyOTIwZDkuLjEyNzE1ZDI0MTQx
YyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL2tlcm5lbC90cmFwcy5jDQo+ICsrKyBiL2Fy
Y2gvcG93ZXJwYy9rZXJuZWwvdHJhcHMuYw0KPiBAQCAtNjIxLDYgKzYyMSwxMSBAQCBpbnQgbWFj
aGluZV9jaGVja19lNTAwbWMoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpDQo+IMKgCQkgICAgICAgcmVh
c29uICYgTUNTUl9NRUEgPyAiRWZmZWN0aXZlIiA6ICJQaHlzaWNhbCIsIGFkZHIpOw0KPiDCoAl9
DQo+IMKgDQo+IA0KPiArCWlmICgodXNlcl9tb2RlKHJlZ3MpKSkgew0KPiArCQlfZXhjZXB0aW9u
KFNJR0JVUywgcmVncywgcmVhc29uLCByZWdzLT5uaXApOw0KPiArCQlyZWNvdmVyYWJsZSA9IDE7
DQo+ICsJfQ0KPiArDQo+IMKgc2lsZW50X291dDoNCj4gwqAJbXRzcHIoU1BSTl9NQ1NSLCBtY3Ny
KTsNCj4gwqAJcmV0dXJuIG1mc3ByKFNQUk5fTUNTUikgPT0gMCAmJiByZWNvdmVyYWJsZTsNCj4g
QEAgLTY2NSw2ICs2NzAsMTAgQEAgaW50IG1hY2hpbmVfY2hlY2tfZTUwMChzdHJ1Y3QgcHRfcmVn
cyAqcmVncykNCj4gwqAJaWYgKHJlYXNvbiAmIE1DU1JfQlVTX1JQRVJSKQ0KPiDCoAkJcHJpbnRr
KCJCdXMgLSBSZWFkIFBhcml0eSBFcnJvclxuIik7DQo+IMKgDQo+IA0KPiArCWlmICgodXNlcl9t
b2RlKHJlZ3MpKSkgew0KPiArCQlfZXhjZXB0aW9uKFNJR0JVUywgcmVncywgcmVhc29uLCByZWdz
LT5uaXApOw0KPiArCQlyZXR1cm4gMTsNCj4gKwl9DQo+IMKgCXJldHVybiAwOw0KPiDCoH0NCj4g
wqANCj4gDQo+IEBAIC02OTUsNiArNzA0LDEwIEBAIGludCBtYWNoaW5lX2NoZWNrX2UyMDAoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpDQo+IMKgCWlmIChyZWFzb24gJiBNQ1NSX0JVU19XUkVSUikNCj4g
wqAJCXByaW50aygiQnVzIC0gV3JpdGUgQnVzIEVycm9yIG9uIGJ1ZmZlcmVkIHN0b3JlIG9yIGNh
Y2hlIGxpbmUgcHVzaFxuIik7DQo+IMKgDQo+IA0KPiArCWlmICgodXNlcl9tb2RlKHJlZ3MpKSkg
ew0KPiArCQlfZXhjZXB0aW9uKFNJR0JVUywgcmVncywgcmVhc29uLCByZWdzLT5uaXApOw0KPiAr
CQlyZXR1cm4gMTsNCj4gKwl9DQo+IMKgCXJldHVybiAwOw0KPiDCoH0NCj4gwqAjZWxpZiBkZWZp
bmVkKENPTkZJR19QUEMzMikNCj4gQEAgLTczMSw2ICs3NDQsMTAgQEAgaW50IG1hY2hpbmVfY2hl
Y2tfZ2VuZXJpYyhzdHJ1Y3QgcHRfcmVncyAqcmVncykNCj4gwqAJZGVmYXVsdDoNCj4gwqAJCXBy
aW50aygiVW5rbm93biB2YWx1ZXMgaW4gbXNyXG4iKTsNCj4gwqAJfQ0KPiArCWlmICgodXNlcl9t
b2RlKHJlZ3MpKSkgew0KPiArCQlfZXhjZXB0aW9uKFNJR0JVUywgcmVncywgcmVhc29uLCByZWdz
LT5uaXApOw0KPiArCQlyZXR1cm4gMTsNCj4gKwl9DQo+IMKgCXJldHVybiAwOw0KPiDCoH0NCj4g
wqAjZW5kaWYgLyogZXZlcnl0aGluZyBlbHNlICovDQoNCg==
