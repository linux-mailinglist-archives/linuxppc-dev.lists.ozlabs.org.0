Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D9B4BE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 04:26:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44sBVV4tKNzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 12:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.54; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="IiEZSgbG"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140054.outbound.protection.outlook.com [40.107.14.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44sBSk0nq3zDqby
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 12:24:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hY2IP3v9/OG//k18yVAX+AEh7z7q3dnNvk/Y/KSd6ng=;
 b=IiEZSgbGMReiRDqZWn76KfQH7IStF+CYGCXANPHl9LyRt/wCvfJpNqX3FGXPuAMALo77+UrXnYLAr6js9H2cBQaMOxZkeYWsgwV4FL6rne96n9QMsmcB8qrJcKjqQenhpXr2D8U/4kl6xdNRU1B5Av9IKUJFiJpJMYTILc+Dm8E=
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com (20.179.233.80) by
 VE1PR04MB6527.eurprd04.prod.outlook.com (20.179.233.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.15; Sun, 28 Apr 2019 02:24:28 +0000
Received: from VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311]) by VE1PR04MB6479.eurprd04.prod.outlook.com
 ([fe80::6c03:86ad:729d:e311%7]) with mapi id 15.20.1835.016; Sun, 28 Apr 2019
 02:24:28 +0000
From: "S.j. Wang" <shengjiu.wang@nxp.com>
To: "timur@kernel.org" <timur@kernel.org>, "nicoleotsuka@gmail.com"
 <nicoleotsuka@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "broonie@kernel.org"
 <broonie@kernel.org>, "alsa-devel@alsa-project.org"
 <alsa-devel@alsa-project.org>
Subject: [PATCH V6] ASoC: fsl_esai: Fix missing break in switch statement
Thread-Topic: [PATCH V6] ASoC: fsl_esai: Fix missing break in switch statement
Thread-Index: AQHU/WmAo72q6EQ+R0yZXfiBxDZLDQ==
Date: Sun, 28 Apr 2019 02:24:27 +0000
Message-ID: <1556418264-17810-1-git-send-email-shengjiu.wang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 1.9.1
x-clientproxiedby: HK0PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:203:2f::33) To VE1PR04MB6479.eurprd04.prod.outlook.com
 (2603:10a6:803:11e::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=shengjiu.wang@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67202861-833b-4ebd-ff56-08d6cb80a320
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6527; 
x-ms-traffictypediagnostic: VE1PR04MB6527:
x-microsoft-antispam-prvs: <VE1PR04MB6527FA61DD9B6AA61AF3FBB4E3380@VE1PR04MB6527.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 0021920B5A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(366004)(376002)(39860400002)(189003)(199004)(7736002)(99286004)(71190400001)(86362001)(4744005)(14454004)(68736007)(6486002)(478600001)(110136005)(36756003)(486006)(81166006)(54906003)(8676002)(2201001)(71200400001)(476003)(3846002)(6116002)(2616005)(8936002)(81156014)(5660300002)(25786009)(4326008)(50226002)(102836004)(386003)(64756008)(186003)(14444005)(256004)(66476007)(6506007)(66446008)(73956011)(6512007)(66066001)(66556008)(66946007)(26005)(305945005)(2906002)(2501003)(53936002)(97736004)(52116002)(6436002)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6527;
 H:VE1PR04MB6479.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2BZPTWEJremJUF78sZ5Hu45R1QsZUGG3foiQEZNbq19rRrGWHz1iutH/Km7s4UwB0JHrmKMVB9E6oE/r2U6E2Ld72Wbdox/nUXZeJQqYEyC/Vvmhso7ZSH70tjLFyQe9lgfLKFSUJyRC5UkJjGyNjKs/jdUqCSBasColzg4EYhjpb/s8X97Qu7STnzqIGHzolTxAVrDTGhdST77UXLwKbhQCRodIpZgS+I4U6gwiLRGbMnLQ029poQkvnMdO+/6vXjPuG7P02l9PSamj2R+HZ6wRXrAE/Nz65NjPCW/cbAiLGeeaV5pKaY7g+mVE7C25+RiC9+SPfopI03ygsOJ8EmmlEuk3UYbC2tOlGDXe4zQHaTDBPwjpmeXP2bs3ACdhnzoJoA+W12NnMZVxuzYoTgKq4m9WUhYbtNvXfMvV8F8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67202861-833b-4ebd-ff56-08d6cb80a320
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2019 02:24:27.9189 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6527
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

Y2FzZSBFU0FJX0hDS1RfRVhUQUwgYW5kIGNhc2UgRVNBSV9IQ0tSX0VYVEFMIHNob3VsZCBiZQ0K
aW5kZXBlbmRlbnQgb2YgZWFjaCBvdGhlciwgc28gcmVwbGFjZSBmYWxsLXRocm91Z2ggd2l0aCBi
cmVhay4NCg0KRml4ZXM6IDQzZDI0ZTc2YjY5OCAoIkFTb0M6IGZzbF9lc2FpOiBBZGQgRVNBSSBD
UFUgREFJIGRyaXZlciIpDQpTaWduZWQtb2ZmLWJ5OiBTaGVuZ2ppdSBXYW5nIDxzaGVuZ2ppdS53
YW5nQG54cC5jb20+DQpBY2tlZC1ieTogTmljb2xpbiBDaGVuIDxuaWNvbGVvdHN1a2FAZ21haWwu
Y29tPg0KQ2M6IDxzdGFibGVAdmdlci5rZXJuZWwub3JnPg0KLS0tDQpDaGFuZ2VzIGluIFY2DQot
IHJlc2VuZCBiYXNlIG9uZSBmb3ItNS4yDQoNCkNoYW5nZXMgaW4gdjUNCi0gcmVtb3ZlIG5ldyBs
aW5lIGFmdGVyIEZpeGVzDQoNCkNoYW5nZXMgaW4gdjQNCi0gQWRkIGFja2VkLWJ5DQoNCkNoYW5n
ZXMgaW4gdjMNCi0gVXBkYXRlIHN1YmplY3QgbGluZSBhbmQgY2Mgc3RhYmxlDQoNCkNoYW5nZXMg
aW4gdjINCi0gRml4ICJGaXhlcyIgdGFnDQoNCiBzb3VuZC9zb2MvZnNsL2ZzbF9lc2FpLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9zb3VuZC9zb2MvZnNsL2ZzbF9lc2FpLmMgYi9zb3VuZC9zb2MvZnNsL2ZzbF9l
c2FpLmMNCmluZGV4IGM3NDEwYmJmZDJhZi4uYmFkMGRmZWQ2YjY4IDEwMDY0NA0KLS0tIGEvc291
bmQvc29jL2ZzbC9mc2xfZXNhaS5jDQorKysgYi9zb3VuZC9zb2MvZnNsL2ZzbF9lc2FpLmMNCkBA
IC0yNTEsNyArMjUxLDcgQEAgc3RhdGljIGludCBmc2xfZXNhaV9zZXRfZGFpX3N5c2NsayhzdHJ1
Y3Qgc25kX3NvY19kYWkgKmRhaSwgaW50IGNsa19pZCwNCiAJCWJyZWFrOw0KIAljYXNlIEVTQUlf
SENLVF9FWFRBTDoNCiAJCWVjciB8PSBFU0FJX0VDUl9FVEk7DQotCQkvKiBmYWxsIHRocm91Z2gg
Ki8NCisJCWJyZWFrOw0KIAljYXNlIEVTQUlfSENLUl9FWFRBTDoNCiAJCWVjciB8PSBlc2FpX3By
aXYtPnN5bmNocm9ub3VzID8gRVNBSV9FQ1JfRVRJIDogRVNBSV9FQ1JfRVJJOw0KIAkJYnJlYWs7
DQotLSANCjEuOS4xDQoNCg==
