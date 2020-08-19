Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F7249551
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 08:54:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWdnM1djvzDqLD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 16:54:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::62b;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=I0OuuFCq; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWdkh0j6RzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 16:52:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxJS0bzAh3oo0Q6bneQ5z4j+a/aDjnBPt+Ci0d4//r1c5L8PMK+PVeXsQA2oiBGTPXp387IXyUnz1MNKgsEn+uo9XEipjuJczMiMgvCyLGQkfCeXzl6VfCNhE4ljeYTvZHLYS3ThhjWfqsGQNLO53mtM8aZw34G3e+CL5UOJNYd9Rq7dFfvQQPW9iYxEfndIjpCIzY6wVowM34kMqLBhowaKM5hq4MOEFJyPezfR13zZIJn73i02gVvo+UTxG7kammKuTIgilYN6h2aGSCwpFZA81F3Wj2THnEodIjqQZQUhwWwSBEqSZprr4Z4Fw/0DTQtq2ntdT870H3D09KAPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyBtU4FyIBuIVx+F28RQppwIQ9LpFDQWrjXJMq7UCkw=;
 b=cpiGXIo2Ct6kaUA95aFZfbL4ymkb5ngvTBC/a0f4M3NoVCpqrmkbO3MM0+ZYauZDdYUloROw11PIqa98LPLCCQoRhPPyZFxupXJuYKOM54C9vab8RgbzxqpRP9YkT76LqcyEWFExQD2DaxoxdnzNxCYLciWwGsewdUT7NXEqcPbfki8qjAb4cfs3o68uW4ScxR2iiX0DqfUDQMiw3TgoCgf7EJGdbD4QSLGUciOxLgntK5uoBCr/ZCDZpWF+IXc5Sv3NXcGzrE0PlzNLZ1KPJeDN5b2Uut+5iBsSRg2Not1Er+fszNjlUD3WviU4KDYrydV3wmak00WZPjMA8l3ipA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oyBtU4FyIBuIVx+F28RQppwIQ9LpFDQWrjXJMq7UCkw=;
 b=I0OuuFCqN1ougZ66+ITspUrYOqInj5bQV+LsdrsGEBUVAQTbZixpOttvrmPo0O5PJwPh/pHVVjEf7MgJh27phqrI+DAY8wZXEj31IhTnnVGaliSiXMQ/mw84S5YNFH8lsgGTv00wpSTh2oMObRKZgMx6G0CVOwz2oToPv/cUUWU=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB6069.eurprd04.prod.outlook.com (2603:10a6:20b:72::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Wed, 19 Aug
 2020 06:52:07 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::c813:e261:c623:42b5]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::c813:e261:c623:42b5%7]) with mapi id 15.20.3283.028; Wed, 19 Aug 2020
 06:52:07 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v3] soc: fsl: enable acpi support
Thread-Topic: [PATCH v3] soc: fsl: enable acpi support
Thread-Index: AQHWdd5RExXHHk7IjkOjHWv1sLLy9qk+/aUAgAAAZbA=
Date: Wed, 19 Aug 2020 06:52:06 +0000
Message-ID: <AM6PR04MB54133B1D3E12C1AC4456D91EF15D0@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200819040031.40204-1-ran.wang_1@nxp.com>
 <02fa05ad-6d39-e16d-ad02-7472d28b6627@csgroup.eu>
In-Reply-To: <02fa05ad-6d39-e16d-ad02-7472d28b6627@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fbbc2e68-9aca-4cdd-a84e-08d8440c635c
x-ms-traffictypediagnostic: AM6PR04MB6069:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB606956710701671E1D6EDFD3F15D0@AM6PR04MB6069.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o4p7vsu0E0j62C6lZgfWQsoGqpxI2g5CDVGeMbgxuSkc5gTsRrrfeqX1hMmmmZYNpDGK5HkYGQlpUHnxTpOGKzHaJU6HRRo6eh2vPVDK6fZ95HI3pIhvOxbMlR74eRIgP10EZ07a1HiL21125bUzTVgUeZFxUMaHN60R7sATAiwGpk0/eFcuz8K9F6uN/j6dbXhswIoC5clnswp7Xkwdn4eqi1XKj8bi6umcYgzkrY+E73iJ3m6LXVh2+Y3T+VNNhlR4xVtYkLNvcs7H5yAGIq4VH81bhGQ/QJd153FWTzqtg5GGrCnT+8WKYYcPf+/r
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(5660300002)(186003)(316002)(86362001)(26005)(55016002)(33656002)(53546011)(6506007)(52536014)(9686003)(66946007)(478600001)(2906002)(66476007)(66556008)(8936002)(66446008)(8676002)(76116006)(64756008)(83380400001)(66574015)(6636002)(110136005)(4326008)(54906003)(7696005)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: eiVpGGNe/WjmWzRhfe10KGLviHTnEfESlut/fHhffNecikiN9fBqLfTXis9cZ1UHvhulfvsXYk+2dWZq+to0uhrgeLXnfsqqD/owYHAqFI7raczwmDSdtnv/R0v/MVDZnrHl0PmAqDWk7aaw5Dc8PknHPHMMV7dus9C319ldQHiUUb2LGz/1Pdow2amHXPGXlWXViH1adfy/zY7+iM2A1N/D9qpYZFhzoVnqCqcQj8uySxfg8TBBIVvvuZEEK3h3q44qQfeclC/RExouL96dETYmKoJDlzmSpdkOawS7lJHLi4cRuHWa8GOzZ7C/S2XpK55YjCIJYNn2V5JoLt0Dl3QCbYSj4r3ffDVp2PHIljz79qwfC/HcFbi+C1EbOJv3iUHT8etlLvh9dKM1KNZt/DflRUkxBa2Ytz3vP+EmSBJ43uDCJdkkAmnVgAjvw1oyQgmA8rPNUqFTjRlpCnh1q6hWLv8WiPeiIpS3d5E4RHlIozMaqfl1aQFa7zWrFAi9fnXtzEdsOrrpT4Fy5kvOI2T6HAjCXw6pAT6p7ktYBzYENpr0tMttd9jlFVnN2S5dOsZwXyfWk9gvk3zKK55kmFF+u/Aj7xz3iRI398t8RfLhADbO6U8+/ckHqYI6JyS8PFGhr0vVohwx3nYZx9UFig==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbc2e68-9aca-4cdd-a84e-08d8440c635c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2020 06:52:06.9018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1lXs3/myTkDFKqmj0VS8sV5ImxbQqCRH9iPq9U83+uxecFu0EUPNpyBtVcOkNw1SKQHDfxJGNO/qR8CHL1wE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6069
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
 Peng Ma <peng.ma@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgQ2hyaXN0b3BoZQ0KDQpPbiBXZWRuZXNkYXksIEF1Z3VzdCAxOSwgMjAyMCAyOjQ4IFBNLCBD
aHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPiANCj4gDQo+IA0KPiBMZSAxOS8wOC8yMDIwIMOgIDA2
OjAwLCBSYW4gV2FuZyBhIMOpY3JpdMKgOg0KPiA+IEZyb206IFBlbmcgTWEgPHBlbmcubWFAbnhw
LmNvbT4NCj4gPg0KPiA+IFRoaXMgcGF0Y2ggZW5hYmxlcyBBQ1BJIHN1cHBvcnQgaW4gUkNQTSBk
cml2ZXIuDQo+IA0KPiBDYW4geW91IGNoYW5nZSB0aGUgc3ViamVjdCB0byAic29jOiBmc2w6IGVu
YWJsZSBhY3BpIHN1cHBvcnQgaW4gUkNQTSBkcml2ZXIiID8NCg0KU3VyZS4NCg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGVuZyBNYSA8cGVuZy5tYUBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IFJhbiBXYW5nIDxyYW4ud2FuZ18xQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlIGlu
IHYzOg0KPiA+ICAgLSBBZGQgI2lmZGVmIENPTkZJR19BQ1BJIGZvciBhY3BpX2RldmljZV9pZA0K
PiA+ICAgLSBSZW5hbWUgcmNwbV9hY3BpX2lteF9pZHMgdG8gcmNwbV9hY3BpX2lkcw0KPiA+DQo+
ID4gQ2hhbmdlIGluIHYyOg0KPiA+ICAgLSBVcGRhdGUgYWNwaV9kZXZpY2VfaWQgdG8gZml4IGNv
bmZsaWN0IHdpdGggb3RoZXIgZHJpdmVyDQo+ID4NCj4gPiAgIGRyaXZlcnMvc29jL2ZzbC9yY3Bt
LmMgfCAxMyArKysrKysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2Zz
bC9yY3BtLmMgYi9kcml2ZXJzL3NvYy9mc2wvcmNwbS5jIGluZGV4DQo+ID4gYTA5M2RiZS4uNTVk
MWQ3MyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9mc2wvcmNwbS5jDQo+ID4gKysrIGIv
ZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+IEBAIC0yLDcgKzIsNyBAQA0KPiA+ICAgLy8NCj4g
PiAgIC8vIHJjcG0uYyAtIEZyZWVzY2FsZSBRb3JJUSBSQ1BNIGRyaXZlcg0KPiA+ICAgLy8NCj4g
PiAtLy8gQ29weXJpZ2h0IDIwMTkgTlhQDQo+ID4gKy8vIENvcHlyaWdodCAyMDE5LTIwMjAgTlhQ
DQo+ID4gICAvLw0KPiA+ICAgLy8gQXV0aG9yOiBSYW4gV2FuZyA8cmFuLndhbmdfMUBueHAuY29t
Pg0KPiA+DQo+ID4gQEAgLTEzLDYgKzEzLDcgQEANCj4gPiAgICNpbmNsdWRlIDxsaW51eC9zbGFi
Lmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0KPiA+ICAgI2luY2x1ZGUgPGxp
bnV4L2tlcm5lbC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvYWNwaS5oPg0KPiA+DQo+ID4gICAj
ZGVmaW5lIFJDUE1fV0FLRVVQX0NFTExfTUFYX1NJWkUJNw0KPiA+DQo+ID4gQEAgLTEyNSw2ICsx
MjYsNyBAQCBzdGF0aWMgaW50IHJjcG1fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiA+
ICpwZGV2KQ0KPiA+DQo+ID4gICAJcmV0ID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKCZwZGV2
LT5kZXYsDQo+ID4gICAJCQkiI2ZzbCxyY3BtLXdha2V1cC1jZWxscyIsICZyY3BtLT53YWtldXBf
Y2VsbHMpOw0KPiA+ICsNCj4gDQo+IFRoaXMgYmxhbmsgbGluZSBhZGRpdGlvbiBpcyB1bnJlbGF0
ZWQgdG8gdGhlIHBhdGNoIGFuZCBzaG91bGRuJ3QgYmUgdGhlcmUuDQoNCkdvdCBpdCwgd2lsbCBy
ZW1vdmUgdGhpcyBpbiB2NCwgdGhhbmtzLg0KDQpSZWdhcmRzLA0KUmFuDQoNCj4gQ2hyaXN0b3Bo
ZQ0KPiANCj4gPiAgIAlpZiAocmV0KQ0KPiA+ICAgCQlyZXR1cm4gcmV0Ow0KPiA+DQo+ID4gQEAg
LTEzOSwxMCArMTQxLDE5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHJjcG1f
b2ZfbWF0Y2hbXQ0KPiA9IHsNCj4gPiAgIH07DQo+ID4gICBNT0RVTEVfREVWSUNFX1RBQkxFKG9m
LCByY3BtX29mX21hdGNoKTsNCj4gPg0KPiA+ICsjaWZkZWYgQ09ORklHX0FDUEkNCj4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBhY3BpX2RldmljZV9pZCByY3BtX2FjcGlfaWRzW10gPSB7DQo+ID4g
Kwl7Ik5YUDAwMTUiLH0sDQo+ID4gKwl7IH0NCj4gPiArfTsNCj4gPiArTU9EVUxFX0RFVklDRV9U
QUJMRShhY3BpLCByY3BtX2FjcGlfaWRzKTsgI2VuZGlmDQo+ID4gKw0KPiA+ICAgc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcmNwbV9kcml2ZXIgPSB7DQo+ID4gICAJLmRyaXZlciA9IHsN
Cj4gPiAgIAkJLm5hbWUgPSAicmNwbSIsDQo+ID4gICAJCS5vZl9tYXRjaF90YWJsZSA9IHJjcG1f
b2ZfbWF0Y2gsDQo+ID4gKwkJLmFjcGlfbWF0Y2hfdGFibGUgPSBBQ1BJX1BUUihyY3BtX2FjcGlf
aWRzKSwNCj4gPiAgIAkJLnBtCT0gJnJjcG1fcG1fb3BzLA0KPiA+ICAgCX0sDQo+ID4gICAJLnBy
b2JlID0gcmNwbV9wcm9iZSwNCj4gPg0K
