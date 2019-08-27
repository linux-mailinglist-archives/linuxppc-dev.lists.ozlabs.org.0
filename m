Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 373E39DEFB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 09:46:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hgt63YjBzDqSv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 17:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.42; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=daniel.baluta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="aDa4j5FX"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hgqy1grlzDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 17:44:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpKALyCItok5SPg1doT9QiiTql2sDTp/U/cp7Lg/rwP/P35Vx2yk+NR9M6xvgcyL5xsjAs+MZmj9VHdXKF2BCQeqYb+0mN4RFpBLm3nDHN17wMcSlpe3PBPI+6h4h/VwHKZ4MdwWb4Y+od967Kwq7fHkPIah8VwqCfdzMo/coRrL++jtwLQgiLW0BejcQEwEsmeTPLwPriKWAWRon90vVavkDtDPTMV/8LQw4sroKVjY8y7bD3a1xV9k8Lv1XGM+evCIOQE93PUECR3/kDMUs05iVvuboag3l2eb47Whj+twByHNuWHLVogut9iECua1Z/tRkDnh7W7MunhFYRiDiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdFFSZtM2sPw2p5vCdHcvsqNJlIfy03d+5Kq4ViMgxo=;
 b=F8w0HLJYgyuwgoZkYDDHCSHPqRScnPa+9VPi3nVPitUBpkwHtSh0et2mnpD2BrpLxZZpLODUJATLSwaheKShwCz4u/r9v2AkqManamptIVNktrAfHQRb7CXaff4+lyGTztC+4HKYga9LqITJrn0QYiqyM+v52NluwUC0mXcE74UYblT5M7/QnCLP5gS+U2frWwVzRyVWG+Pz9TbcIp6KZD+segDNfh0g/hwuOcNXOUXTQTUev5lBljIxAI+xJMRsCp2Q7MaVrs7O+59UvXnulQx7+CJW19R8D+9EoNywAiEHgFBUUSeXOBaevFxXJX60dPfGzc3gbp1VN6ZXo0cigA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wdFFSZtM2sPw2p5vCdHcvsqNJlIfy03d+5Kq4ViMgxo=;
 b=aDa4j5FX25yj44ERyT0wtbq1JknRbOhuHI8zwnRmGSgYN+eCheh/sI/OZjNldQKJ0eUSpP6yHImZvtlHpNJFcGhXrMzPPZBx0jxTaZw+AJBd7Np5CKLTiGmhW2j0rDHZ/pIEWQN9+9TgQrQIphgseaD9yyR6htWk6+hlSfQC1bc=
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com (52.133.13.160) by
 VI1PR04MB4349.eurprd04.prod.outlook.com (52.134.122.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Tue, 27 Aug 2019 07:44:20 +0000
Received: from VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c]) by VI1PR04MB4094.eurprd04.prod.outlook.com
 ([fe80::c85e:7409:9270:3c3c%7]) with mapi id 15.20.2199.021; Tue, 27 Aug 2019
 07:44:20 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "Xiubo.Lee@gmail.com"
 <Xiubo.Lee@gmail.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "tiwai@suse.com" <tiwai@suse.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Viorel Suman
 <viorel.suman@nxp.com>, "perex@perex.cz" <perex@perex.cz>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [PATCH] ASoC: imx-audmix: register the card on a proper dev
Thread-Topic: [PATCH] ASoC: imx-audmix: register the card on a proper dev
Thread-Index: AQHVXItnJrx+gT0oHE+CkZPy//zxeKcOnWCA
Date: Tue, 27 Aug 2019 07:44:20 +0000
Message-ID: <65ef17869dbc0a785e2abe9c27df24fdfb273c16.camel@nxp.com>
References: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1566921315-23402-1-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=daniel.baluta@nxp.com; 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0613489f-769b-4d1d-1420-08d72ac25f2b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4349; 
x-ms-traffictypediagnostic: VI1PR04MB4349:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB43497917CE243D66CC79EDF9F9A00@VI1PR04MB4349.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0142F22657
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(66476007)(5660300002)(66946007)(64756008)(6506007)(66556008)(76176011)(4326008)(54906003)(7416002)(66446008)(81156014)(76116006)(71190400001)(8676002)(99286004)(6512007)(91956017)(50226002)(14454004)(81166006)(71200400001)(102836004)(6486002)(186003)(26005)(25786009)(6436002)(8936002)(229853002)(486006)(446003)(110136005)(44832011)(305945005)(36756003)(7736002)(6246003)(2906002)(478600001)(2201001)(66066001)(3846002)(53936002)(86362001)(2501003)(316002)(256004)(476003)(2616005)(11346002)(118296001)(6116002)(99106002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4349;
 H:VI1PR04MB4094.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Nh5OoJxoi0Bymo8qndR0NU02ynGHtrTSLCH6TXplOXgA9zQkLYznUgKM5KxxneTJQJklsil5QaIZcAI36tI//DbpcKjfwpr4uokgwG2dIRIBADnN3oWywJjCT6O1mBSZrrNmY7NnaG3fi96Q/EERY6wR+VmQ2vwbywJRqn+3QUT75mpWJHGFhQjGSZO9/CnCUkzdhr5LPYsCo8LvWe38rz8O3ZPPVEJ8SdxLOtELZ7AD+GlnUAoX/33QPQLpKQgo2xa0kLSe0LXTpA13u6ry0nZgLE2/C0WR9WqeiY0QF1WQlk+Xp9F6yG1Rvdu549vGnh8HFXdbNBrRMQ2AZAROP3eupfLMRCzZifhluq0affDkCeBL/IGFjMFbPVCQJzKGd0t9ROWjbOJJGW38Prl6kNuD9aeLYEHO+O/2xc/hBIM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <72DF92E13A17A0468403E9BD125780DB@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0613489f-769b-4d1d-1420-08d72ac25f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2019 07:44:20.2636 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7sAT+ls6inUpirlNbjRxOvH6xxJl6hu1abdQbR+3v6scGUchbh5R0+DQ6rZIJHgi+4rnRC+W1tobSlET64ui6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4349
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gVHVlLCAyMDE5LTA4LTI3IGF0IDExOjU1IC0wNDAwLCBTaGVuZ2ppdSBXYW5nIHdyb3RlOg0K
PiBUaGlzIHBsYXRmb3JtIGRldmljZSBpcyByZWdpc3RlcmVkIGZyb20gImZzbF9hdWRtaXgiLCB3
aGljaCBpcw0KPiBpdHMgcGFyZW50IGRldmljZS4gSWYgdXNlIHBkZXYtPmRldi5wYXJlbnQgZm9y
IHRoZSBwcml2LT5jYXJkLmRldiwNCj4gdGhlIHZhbHVlIHNldCBieSBkZXZfc2V0X2RydmRhdGEg
aW4gcGFyZW50IGRldmljZSB3aWxsIGJlIGNvdmVyZWQNCj4gYnkgdGhlIHZhbHVlIGluIGNoaWxk
IGRldmljZS4NCj4gDQo+IEZpeGVzOiBiODZlZjUzNjc3NjEgKCJBU29DOiBmc2w6IEFkZCBBdWRp
byBNaXhlciBtYWNoaW5lIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IFZpb3JlbCBTdW1hbiA8
dmlvcmVsLnN1bWFuQG54cC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IFNoZW5naml1IFdhbmcgPHNo
ZW5naml1LndhbmdAbnhwLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IERhbmllbCBCYWx1dGEgPGRhbmll
bC5iYWx1dGFAbnhwLmNvbT4NCg0KVGhhbmtzIFNoZW5naml1IGZvciB0aGUgZml4IQ0KDQo+IC0t
LQ0KPiAgc291bmQvc29jL2ZzbC9pbXgtYXVkbWl4LmMgfCA0ICsrLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
c291bmQvc29jL2ZzbC9pbXgtYXVkbWl4LmMgYi9zb3VuZC9zb2MvZnNsL2lteC1hdWRtaXguYw0K
PiBpbmRleCA5ZTFjYjE4ODU5Y2UuLjcxNTkwY2E2Mzk0YiAxMDA2NDQNCj4gLS0tIGEvc291bmQv
c29jL2ZzbC9pbXgtYXVkbWl4LmMNCj4gKysrIGIvc291bmQvc29jL2ZzbC9pbXgtYXVkbWl4LmMN
Cj4gQEAgLTMyNSwxNCArMzI1LDE0IEBAIHN0YXRpYyBpbnQgaW14X2F1ZG1peF9wcm9iZShzdHJ1
Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgCXByaXYtPmNhcmQubnVtX2NvbmZpZ3Mg
PSBwcml2LT5udW1fZGFpX2NvbmY7DQo+ICAJcHJpdi0+Y2FyZC5kYXBtX3JvdXRlcyA9IHByaXYt
PmRhcG1fcm91dGVzOw0KPiAgCXByaXYtPmNhcmQubnVtX2RhcG1fcm91dGVzID0gcHJpdi0+bnVt
X2RhcG1fcm91dGVzOw0KPiAtCXByaXYtPmNhcmQuZGV2ID0gcGRldi0+ZGV2LnBhcmVudDsNCj4g
Kwlwcml2LT5jYXJkLmRldiA9ICZwZGV2LT5kZXY7DQo+ICAJcHJpdi0+Y2FyZC5vd25lciA9IFRI
SVNfTU9EVUxFOw0KPiAgCXByaXYtPmNhcmQubmFtZSA9ICJpbXgtYXVkbWl4IjsNCj4gIA0KPiAg
CXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsICZwcml2LT5jYXJkKTsNCj4gIAlzbmRfc29jX2Nh
cmRfc2V0X2RydmRhdGEoJnByaXYtPmNhcmQsIHByaXYpOw0KPiAgDQo+IC0JcmV0ID0gZGV2bV9z
bmRfc29jX3JlZ2lzdGVyX2NhcmQocGRldi0+ZGV2LnBhcmVudCwgJnByaXYtDQo+ID5jYXJkKTsN
Cj4gKwlyZXQgPSBkZXZtX3NuZF9zb2NfcmVnaXN0ZXJfY2FyZCgmcGRldi0+ZGV2LCAmcHJpdi0+
Y2FyZCk7DQo+ICAJaWYgKHJldCkgew0KPiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJzbmRfc29j
X3JlZ2lzdGVyX2NhcmQgZmFpbGVkXG4iKTsNCj4gIAkJcmV0dXJuIHJldDsNCg==
