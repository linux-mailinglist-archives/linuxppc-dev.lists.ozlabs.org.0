Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 816AB5856B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 17:18:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZNpG2cCYzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 01:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.86; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="qAagAjoT"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20086.outbound.protection.outlook.com [40.107.2.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZNmR0hzdzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 01:17:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBouiMCe0HxcmNbAaeTUbmnGzYQrU3TluQCQL9haies=;
 b=qAagAjoTLeemiK3fyzJ16nluljJAKGcwnFFwA6OMn85/tvNj8x2wp3PYDX8wTsn+NpBlLh9D2WDyjLVH4XAdoSZYHA+UsWPQ2bWk8F/TqhUkD5ZvMFmE6G1r4oSfCHyE1BYVZhszk1BMLOO01xylnqLvMsPg/n3gBbh9gPz661k=
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com (20.179.233.20) by
 VE1PR04MB6752.eurprd04.prod.outlook.com (20.179.235.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.17; Thu, 27 Jun 2019 15:17:00 +0000
Received: from VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a]) by VE1PR04MB6463.eurprd04.prod.outlook.com
 ([fe80::a5ca:7c9c:6b18:eb0a%6]) with mapi id 15.20.2008.017; Thu, 27 Jun 2019
 15:17:00 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: Leo Li <leoyang.li@nxp.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] soc/fsl/qbman: Use index when accessing device tree properties
Thread-Topic: [PATCH] soc/fsl/qbman: Use index when accessing device tree
 properties
Thread-Index: AQHVLPteklEjY5ksH0SDrbr59mNdSA==
Date: Thu, 27 Jun 2019 15:17:00 +0000
Message-ID: <1561648603-11589-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: DM5PR07CA0062.namprd07.prod.outlook.com
 (2603:10b6:4:ad::27) To VE1PR04MB6463.eurprd04.prod.outlook.com
 (2603:10a6:803:11d::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bc22392e-8121-4655-b9e3-08d6fb12806d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6752; 
x-ms-traffictypediagnostic: VE1PR04MB6752:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VE1PR04MB6752A2121F80C8E9891BB75486FD0@VE1PR04MB6752.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 008184426E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(136003)(346002)(396003)(199004)(189003)(26005)(66446008)(66946007)(73956011)(66556008)(64756008)(52116002)(305945005)(71200400001)(71190400001)(66476007)(2906002)(7736002)(68736007)(44832011)(4326008)(186003)(486006)(110136005)(54906003)(8676002)(3450700001)(6506007)(386003)(8936002)(102836004)(2501003)(81156014)(81166006)(256004)(14444005)(316002)(4744005)(6486002)(5660300002)(43066004)(478600001)(50226002)(3846002)(6116002)(14454004)(53936002)(2201001)(36756003)(66066001)(2616005)(25786009)(86362001)(99286004)(476003)(6436002)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6752;
 H:VE1PR04MB6463.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0Db7A368V6OG2KQX9oATZntO4a+X/nGoGeihLCwE8OnGbUYSggfkibQULiAPzgS+jZ3eZRbUAkBJWjEiqM63w2e2gBCvX67PY58FHaJ15kqPQqnk1BggkHu9SS+ldoqo6EVMKpkEDadjVQ6x8pSiKTDMSKc7i6uVjQDYeu8jheylUu4CGYwrLaOIld2309hUIkT+6VFBJmEyxazaGQd/NBNwlIeRb3U6oQFtPYRnL7uU9RisLVxGEMy35+DiFeCBUrUrjZpEKjWchnSuF5m0HKwy91/uLN8phAk8VZxtv0o1Y+XadSJ5WpFPLjXos7mQV1+1hCHoBhDzX2kPv6P7EBoTzeaBtyFV41Q8znQ/ScN8BrWlFJIAfiDPqdHH9Sr2vZGE+7y3sKnmtMT7InbR069GeZXUaVljm4RyTw1tIs8=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc22392e-8121-4655-b9e3-08d6fb12806d
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2019 15:17:00.7768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: roy.pledge@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6752
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
Reply-To: Roy Pledge <roy.pledge@nxp.com>
Cc: Roy Pledge <roy.pledge@nxp.com>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGluZGV4IHZhbHVlIHNob3VsZCBiZSBwYXNzZWQgdG8gdGhlIG9mX3BhcnNlX3BoYW5kbGUo
KQ0KZnVuY3Rpb24gdG8gZW5zdXJlIHRoZSBjb3JyZWN0IHByb3BlcnR5IGlzIHJlYWQuDQoNClNp
Z25lZC1vZmYtYnk6IFJveSBQbGVkZ2UgPHJveS5wbGVkZ2VAbnhwLmNvbT4NCi0tLQ0KIGRyaXZl
cnMvc29jL2ZzbC9xYm1hbi9kcGFhX3N5cy5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNs
L3FibWFuL2RwYWFfc3lzLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vZHBhYV9zeXMuYw0KaW5k
ZXggM2UwYTdmMy4uMGI5MDFhOCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9k
cGFhX3N5cy5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vZHBhYV9zeXMuYw0KQEAgLTQ5
LDcgKzQ5LDcgQEAgaW50IHFibWFuX2luaXRfcHJpdmF0ZV9tZW0oc3RydWN0IGRldmljZSAqZGV2
LCBpbnQgaWR4LCBkbWFfYWRkcl90ICphZGRyLA0KIAkJCWlkeCwgcmV0KTsNCiAJCXJldHVybiAt
RU5PREVWOw0KIAl9DQotCW1lbV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYtPm9mX25vZGUs
ICJtZW1vcnktcmVnaW9uIiwgMCk7DQorCW1lbV9ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShkZXYt
Pm9mX25vZGUsICJtZW1vcnktcmVnaW9uIiwgaWR4KTsNCiAJaWYgKG1lbV9ub2RlKSB7DQogCQly
ZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3U2NChtZW1fbm9kZSwgInNpemUiLCAmc2l6ZTY0KTsNCiAJ
CWlmIChyZXQpIHsNCi0tIA0KMi43LjQNCg0K
