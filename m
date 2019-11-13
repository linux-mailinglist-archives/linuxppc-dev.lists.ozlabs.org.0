Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0ACFA797
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 04:52:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CVzd5T24zF6Z6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 14:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.51; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="NDcAmf37"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130051.outbound.protection.outlook.com [40.107.13.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CTZK1S1ZzF358
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:48:22 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDiwubE01vxXJDMelQSnF3xS1PETByvvvVAcyPMjlkN7rEDt9kTyG9qHQ/jsDXvMY0zwYX+kuIvko3WOJrlS5CpHFTZKgwq+xVDDRfT59cfO156BE29iDgolCubhPW4dcv0I1Srn9oOfHS5OtyWScKSGlbXgzr3yOzxaSMmWXUGqffX+2V3GiLrGev7TDGLDVeyqKcMJULXskGgZpu0fxF9DxSg3qdEx26P5NW7D/0ADCfvixuLnL51DUAOVpEMv8VLHLc8qbmCPVw2hf77/VrFa23RJ/jSf9EuLCPG4DbSjvV3hNWSdKwqa7+ACviG/JWpPhd2ATLEJZvSYgYykTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdLQgduYFCrdeFhiuCOzJMega7KFSJ8sIPTVkWIdcAU=;
 b=Z4+ciNHFJSUjRs90IVrA79ChaB3baeE6xSbKbMhHmdVj8WnRqYaBPBe+KU/Xegbxp4nGme+LrqwGS0PFXdzjaUdpAshjJxnqsIreUMfv3xpWauNmLj+ymSu+7pCojruFBXAmx9I50iaZPUjZKJo/hGeh8ohtqEsNwFrIl9H5j7zH+Vk96zEoTjm8E3uslgVDw3Ybg00VOPgMjpMbK0j+tnhAFavAPSk460E8radgGmW47bDqe9+GDwHIkOKytJqwzD9Uef63OcDKykpmJ4KG7tA+nSAN7Y4RVJUHxy9wor/u4o0TX1x2J/pEXGTFdHZgjsPn72ULJMBIKVtk+UfWvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdLQgduYFCrdeFhiuCOzJMega7KFSJ8sIPTVkWIdcAU=;
 b=NDcAmf37jEeuZ/bcE/SLgo/i7FBaq89XAMnAFL6ZloDK/BRyKOAsNiRmJM8vgI9c2cX9SmUt9dDB9/sg4ILOr0Do1D7c0bDCJZd1c6XGTftnDQ7zvQo7LwPAmNBN4plxQDpQ7JlvXbg7dM04RL3U01KcIVemc/Ob5+K5lnGXWnU=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (10.255.118.26) by
 VE1PR04MB6558.eurprd04.prod.outlook.com (20.179.232.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.23; Wed, 13 Nov 2019 02:48:14 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9d62:61ea:616e:9996]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9d62:61ea:616e:9996%6]) with mapi id 15.20.2430.027; Wed, 13 Nov 2019
 02:48:14 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Leo Li <leoyang.li@nxp.com>, 
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: RE: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Thread-Topic: [PATCH v4 47/47] soc: fsl: qe: remove PPC32 dependency from
 CONFIG_QUICC_ENGINE
Thread-Index: AQHVljTGk0ssum87vUySMpkhpG3T4qeIbCyg
Date: Wed, 13 Nov 2019 02:48:14 +0000
Message-ID: <VE1PR04MB67681DD5C25A55B57A0C2F0191760@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-48-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-48-linux@rasmusvillemoes.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2ecea383-e625-4c64-a3fa-08d767e3ee28
x-ms-traffictypediagnostic: VE1PR04MB6558:|VE1PR04MB6558:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB6558421554CC613AA388F6D791760@VE1PR04MB6558.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1923;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(199004)(189003)(13464003)(81156014)(71190400001)(5660300002)(76176011)(6246003)(256004)(11346002)(478600001)(446003)(486006)(14444005)(476003)(9686003)(81166006)(4326008)(305945005)(7736002)(229853002)(8936002)(14454004)(8676002)(71200400001)(74316002)(52536014)(66556008)(6116002)(3846002)(66446008)(316002)(64756008)(186003)(26005)(76116006)(66946007)(25786009)(110136005)(33656002)(66476007)(2906002)(44832011)(7696005)(86362001)(54906003)(99286004)(66066001)(102836004)(6506007)(53546011)(55016002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6558;
 H:VE1PR04MB6768.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HL5/xKFOuP4wpWnMi494ZiMn3E+kdIpvlGuJwZDymaGE9X3rYq4IlIqoNMUIPhUWpNWepzhdoqjG0FvpSHr9uhm7zK7EK8XyysYvWJRM8QxemhaBoG9JEO955uXr1vymA6acwqBSwS/ldd7Az0nqiRS2igEIqFfEXXR4Hp/TuBwoWQFnT/zK3I+V7zsASxXUAA+QU99E6dA8E1+tovVR4SaO62tmqIlNh7TjnpLpSsB02hQCsjoIckt9Ret5+EJabOz3JahbBeNhRFZh6A+/q9w7rXuleqnYvYBmWqDdOLAdEqAowRszmzhO55gi8Nr37XZGnAZoDWC4nr3jDJQ8PpR6+PyUWw/iUTlVGOpIGujaxbhhZIGoBJPM+psp0G7jrFYzOXjHjF9yk2yn9ZI5GZm7JTzxLiK5DelQicEhT3H4qFz1LGI/1jWHLNBHujrD
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ecea383-e625-4c64-a3fa-08d767e3ee28
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 02:48:14.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xf/3McJf2QUH7pKeue9p/MTRRUih3f5NRIuSs/G67qoDIyv/fD4f7WWJRDrkO+Kh0qHOksHtGpzO4qPb4W6xZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6558
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAyMTowMSwgUmFzbXVzIFZpbGxlbW9lcyA8bGludXhAcmFz
bXVzdmlsbGVtb2VzLmRrPiB3cm90ZToNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+DQo+IFNl
bnQ6IDIwMTnE6jEx1MI4yNUgMjE6MDENCj4gVG86IFFpYW5nIFpoYW8gPHFpYW5nLnpoYW9Abnhw
LmNvbT47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsNCj4gQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOyBTY290dCBXb29kIDxvc3NAYnVzZXJyb3IubmV0PjsgUmFzbXVz
DQo+IFZpbGxlbW9lcyA8bGludXhAcmFzbXVzdmlsbGVtb2VzLmRrPg0KPiBTdWJqZWN0OiBbUEFU
Q0ggdjQgNDcvNDddIHNvYzogZnNsOiBxZTogcmVtb3ZlIFBQQzMyIGRlcGVuZGVuY3kgZnJvbQ0K
PiBDT05GSUdfUVVJQ0NfRU5HSU5FDQo+IA0KPiBUaGVyZSBhcmUgYWxzbyBBUk0gYW5kIEFSTTY0
IGJhc2VkIFNPQ3Mgd2l0aCBhIFFVSUNDIEVuZ2luZSwgYW5kIHRoZSBjb3JlDQo+IFFFIGNvZGUg
YXMgd2VsbCBhcyBuZXQvd2FuL2ZzbF91Y2NfaGRsYyBhbmQgdHR5L3NlcmlhbC91Y2NfdWFydCBo
YXMgbm93IGJlZW4NCj4gbW9kaWZpZWQgdG8gbm90IHJlbHkgb24gcHBjaXNtcy4NCj4gDQo+IFNv
IGV4dGVuZCB0aGUgYXJjaGl0ZWN0dXJlcyB0aGF0IGNhbiBzZWxlY3QgUVVJQ0NfRU5HSU5FLCBh
bmQgYWRkIHRoZSByYXRoZXINCj4gbW9kZXN0IHJlcXVpcmVtZW50cyBvZiBPRiAmJiBIQVNfSU9N
RU0uDQo+IA0KPiBUaGUgY29yZSBjb2RlIGFzIHdlbGwgYXMgdGhlIHVjY191YXJ0IGRyaXZlciBo
YXMgYmVlbiB0ZXN0ZWQgb24gYW4gTFMxMDIxQQ0KPiAoYXJtKSwgYW5kIGl0IGhhcyBhbHNvIGJl
ZW4gdGVzdGVkIHRoYXQgdGhlIFFFIGNvZGUgc3RpbGwgd29ya3Mgb24gYW4gbXBjODMwOQ0KPiAo
cHBjKS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211
c3ZpbGxlbW9lcy5kaz4NCj4gLS0tDQo+ICBkcml2ZXJzL3NvYy9mc2wvcWUvS2NvbmZpZyB8IDMg
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL0tjb25maWcgYi9kcml2ZXJzL3Nv
Yy9mc2wvcWUvS2NvbmZpZyBpbmRleA0KPiBjZmE0YjI5Mzk5OTIuLmYxOTc0ZjgxMTU3MiAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL0tjb25maWcNCj4gKysrIGIvZHJpdmVycy9z
b2MvZnNsL3FlL0tjb25maWcNCj4gQEAgLTUsNyArNSw4IEBADQo+IA0KPiAgY29uZmlnIFFVSUND
X0VOR0lORQ0KPiAgCWJvb2wgIlFVSUNDIEVuZ2luZSAoUUUpIGZyYW1ld29yayBzdXBwb3J0Ig0K
PiAtCWRlcGVuZHMgb24gRlNMX1NPQyAmJiBQUEMzMg0KPiArCWRlcGVuZHMgb24gT0YgJiYgSEFT
X0lPTUVNDQo+ICsJZGVwZW5kcyBvbiBQUEMzMiB8fCBBUk0gfHwgQVJNNjQgfHwgQ09NUElMRV9U
RVNUDQo+ICAJc2VsZWN0IEdFTkVSSUNfQUxMT0NBVE9SDQo+ICAJc2VsZWN0IENSQzMyDQo+ICAJ
aGVscA0KPiAtLQ0KVGVzdGVkLWJ5OiBRaWFuZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQpU
ZXN0ZWQgUUUtSERMQyBvbiBBUk02NCENCg0KQmVzdCBSZWdhcmRzDQpRaWFuZyBaaGFvDQo=
