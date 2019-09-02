Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C79A4E48
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 06:16:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MGxD27hMzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 14:16:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.85; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="jy6E6K/S"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20085.outbound.protection.outlook.com [40.107.2.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MGPf52wCzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2019 13:52:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3Zh6CW1cB/EsPsNnGIZj0nnCRHf/1G1Q0KaIHvTExPuGQG/E0cKnDpZow+7GL1FN6ni74dh35eKEHGtJA23A0Xg0e+kaVk+IPvD1m4YRKOb7WFMSRIzaifa+HI54dFrjjy3zNMMqlS2JEf6AfZLxvDWmhGigkIRYJhjJnePIPB0ntHg8LZ5g2yYPaL2i4a/JnRmVvM/1b1nw2YVHmShKOV4Wn6u2Bbudd5fiQpTeg75pHif7gpM80o9qZPAODQczukKix7rlAumCF0+jzXqL7xKPBufGmX8/ZrlC4K1leMNXfKJCNKHl43ckJrd3mF3uoBWMCTarUaiZRv1Duyrhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iViaOJ/PuDhTV/SE7IuSMs1P/h0mpfYWWvDRLPrpPGM=;
 b=NbDE4EpnaFwqa8i46C4YkOy8moG83W6EmqIjMyLxJSt6sxj9fH+mBMDXlSlXklOE/0WdVvqccWEoREr5ys8Zhn8DpcmjhWT4JMqrSTSa/eB1O/NqZoEHsBAKs2GRa7X4JloPzklDT0diDKh7M7fZ6Ij0z9fRtMGhtcv48Xbm5ykEV/uXEwdkBow1Xp/NpfLLtsKDLkmb39oC+g44BM5RaBlxe8ZryVmsAkddXMeeZd6zJnYBr5RHXgStkpZ2KR2A4b8WSJGjakFTYiI2QYoGlBhjuZxKW2RHPRzrIStT+KqwtqUY+5mcXlUzVluYlUsQIBM7Sc9k32gnYuIhGnjbYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iViaOJ/PuDhTV/SE7IuSMs1P/h0mpfYWWvDRLPrpPGM=;
 b=jy6E6K/SeadzevkmE4OxyHQ05m2U9MAxu8SKe75NuKfO0uKHDtFUAHrfmghny++pyvKfTUz2VoZkOp2h64aFjGwQgHQzNJriwwp4GocsPl1uTV/0XMic346YPH8lxZnnBBH2MN88iivYYtnKTfjgFiHEDJ8tIByxU8NsOR9nhuY=
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com (20.179.250.159) by
 DB8PR04MB6858.eurprd04.prod.outlook.com (52.133.240.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Mon, 2 Sep 2019 03:52:29 +0000
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::c563:1a9b:3c7e:95bb]) by DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::c563:1a9b:3c7e:95bb%3]) with mapi id 15.20.2220.021; Mon, 2 Sep 2019
 03:52:29 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 "kishon@ti.com" <kishon@ti.com>, "lorenzo.pieralisi@arm.com"
 <lorenzo.pieralisi@arm.com>, "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu
 <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, "jingoohan1@gmail.com"
 <jingoohan1@gmail.com>, "gustavo.pimentel@synopsys.com"
 <gustavo.pimentel@synopsys.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH v3 00/11] *** SUBJECT HERE ***
Thread-Topic: [PATCH v3 00/11] *** SUBJECT HERE ***
Thread-Index: AQHVYT5exBCgPRKHQk6IMqnS6lDTvacXwNDg
Date: Mon, 2 Sep 2019 03:52:28 +0000
Message-ID: <DB8PR04MB6747A1DAD5A83F686C987C6A84BE0@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
In-Reply-To: <20190902031716.43195-1-xiaowei.bao@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhiqiang.hou@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4336d212-aab1-4054-eb49-08d72f58f9dc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB6858; 
x-ms-traffictypediagnostic: DB8PR04MB6858:|DB8PR04MB6858:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6858ABE5251CF91900332EEB84BE0@DB8PR04MB6858.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01480965DA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(13464003)(189003)(199004)(9686003)(99286004)(316002)(53936002)(2906002)(26005)(6116002)(186003)(3846002)(55016002)(14454004)(74316002)(6246003)(6506007)(66066001)(53546011)(102836004)(7696005)(54906003)(478600001)(6436002)(110136005)(76176011)(256004)(33656002)(71200400001)(2201001)(86362001)(2501003)(229853002)(305945005)(7736002)(25786009)(64756008)(7416002)(52536014)(486006)(476003)(5660300002)(66446008)(446003)(11346002)(66556008)(4326008)(8936002)(66476007)(66946007)(76116006)(71190400001)(8676002)(81166006)(81156014)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6858;
 H:DB8PR04MB6747.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: akBovAFl5Sj7wVcHtGFnk41OivYJQAc6Ty5HOxZJwZ3anoOEPhK0N2273CsD9XLFxROOCuCI7vzNpvs8O+rH4xqpUjBHyMSlwQrrI61tcb+bl09dQvkHDetXPPRqcYNSOTDxcFb1G5G4ggbn5k49RAm4aat2XyJRq7OQ7r+HbwRDNO9C1SQg2nKFe/YeaGoboo9AFd+e3ENlsrwNrQPj3sXVSndnEhDmwmvYQOHNXVZLrnaFhFrHtGjUH26Oisx+98wTUDWoR32z1cSJtNKasizVgvYMesl83bawF1b6ND8qfDS/bFbMVjxTXok5nCsePjQFfEW6eYFBYwJ1pGfnqybWhScxVmGSJz5c9CD11xDBkYFyGn0TtbCB9TwbnlsdW5Kp/i5F/DKV2mlYUAV4aIhzCWg7f8vtlv1oHeCXJOo=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4336d212-aab1-4054-eb49-08d72f58f9dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2019 03:52:29.0048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: upsQ7OYhz4X/pfk0mylZdf9Fx5R8yCD1LwzYA59CTvPrfeWskMISwSrIhxbmQ2ssJpSvwqDRy1MCmFf8cMHWgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6858
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, "arnd@arndb.de" <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

WGlhb3dlaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYaWFvd2Vp
IEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gU2VudDogMjAxOcTqOdTCMsjVIDExOjE3DQo+
IFRvOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1b0Br
ZXJuZWwub3JnOw0KPiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207
IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207DQo+IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBu
eHAuY29tPjsgTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsNCj4gUm95IFphbmcgPHJv
eS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gZ3VzdGF2by5waW1lbnRl
bEBzeW5vcHN5cy5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1h
cm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnDQo+IENjOiBhcm5kQGFybmRiLmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgWi5x
LiBIb3UNCj4gPHpoaXFpYW5nLmhvdUBueHAuY29tPjsgWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFv
QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCB2MyAwMC8xMV0gKioqIFNVQkpFQ1QgSEVSRSAq
KioNCj4gDQo+ICoqKiBCTFVSQiBIRVJFICoqKg0KDQpBZGQgc3ViamVjdCBhbmQgYmx1cmIgZm9y
IHRoaXMgc2VyaWVzLg0KDQpUaGFua3MsDQpaaGlxaWFuZw0KDQo+IA0KPiBYaWFvd2VpIEJhbyAo
MTEpOg0KPiAgIFBDSTogZGVzaWdud2FyZS1lcDogQWRkIG11bHRpcGxlIFBGcyBzdXBwb3J0IGZv
ciBEV0MNCj4gICBQQ0k6IGRlc2lnbndhcmUtZXA6IEFkZCB0aGUgZG9vcmJlbGwgbW9kZSBvZiBN
U0ktWCBpbiBFUCBtb2RlDQo+ICAgUENJOiBkZXNpZ253YXJlLWVwOiBNb3ZlIHRoZSBmdW5jdGlv
biBvZiBnZXR0aW5nIE1TSSBjYXBhYmlsaXR5DQo+ICAgICBmb3J3YXJkDQo+ICAgUENJOiBkZXNp
Z253YXJlLWVwOiBNb2RpZnkgTVNJIGFuZCBNU0lYIENBUCB3YXkgb2YgZmluZGluZw0KPiAgIGR0
LWJpbmRpbmdzOiBwY2k6IGxheWVyc2NhcGUtcGNpOiBhZGQgY29tcGF0aWJsZSBzdHJpbmdzIGZv
ciBsczEwODhhDQo+ICAgICBhbmQgbHMyMDg4YQ0KPiAgIFBDSTogbGF5ZXJzY2FwZTogRml4IHNv
bWUgZm9ybWF0IGlzc3VlIG9mIHRoZSBjb2RlDQo+ICAgUENJOiBsYXllcnNjYXBlOiBNb2RpZnkg
dGhlIHdheSBvZiBnZXR0aW5nIGNhcGFiaWxpdHkgd2l0aCBkaWZmZXJlbnQNCj4gICAgIFBFWA0K
PiAgIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSBNU0lYIHRvIHRoZSBkb29yYmVsbCBtb2Rl
DQo+ICAgUENJOiBsYXllcnNjYXBlOiBBZGQgRVAgbW9kZSBzdXBwb3J0IGZvciBsczEwODhhIGFu
ZCBsczIwODhhDQo+ICAgYXJtNjQ6IGR0czogbGF5ZXJzY2FwZTogQWRkIFBDSWUgRVAgbm9kZSBm
b3IgbHMxMDg4YQ0KPiAgIG1pc2M6IHBjaV9lbmRwb2ludF90ZXN0OiBBZGQgTFMxMDg4YSBpbiBw
Y2lfZGV2aWNlX2lkIHRhYmxlDQo+IA0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2xh
eWVyc2NhcGUtcGNpLnR4dCAgICAgfCAgIDQgKy0NCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJl
ZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kgICAgIHwgIDMxICsrKw0KPiAgZHJpdmVycy9taXNjL3Bj
aV9lbmRwb2ludF90ZXN0LmMgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyAgICAgfCAxMDAgKysrKysrLS0N
Cj4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jICAgIHwg
MjU1DQo+ICsrKysrKysrKysrKysrKysrLS0tLQ0KPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLmMgICAgICAgfCAgNTkgKysrLS0NCj4gIGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oICAgICAgIHwgIDQ4ICsrKy0NCj4gIDcgZmls
ZXMgY2hhbmdlZCwgNDA0IGluc2VydGlvbnMoKyksIDk0IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0N
Cj4gMi45LjUNCg0K
