Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB911BADA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:18:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mGJ0C04zDqKZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:18:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.88; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Y4XF4NI+"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m4708v2zDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:09:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gPLTN8uWV1N6/BKSuIkiIyJyNMpEuBNaAM6GsvAEmpw=;
 b=Y4XF4NI+ssJLhGgqjR+cEYnxnFs0qLs+ebyZm/w2nJhrQakfzqgXIyNxS8DwgLj/fEmeXgrF6RHiYIH15HJK0aMhWSssBVp7AiUrTefc77Aed5jBEmH6zaPBa/sXhY/LrlyzRv1ZPqMNgotnIqwomRv5gTvrsvY5V8kSgmpAS3E=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:48 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:48 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 5/8] soc/fsl/qbman: Fix drain_mr_fqni()
Thread-Topic: [PATCH v1 5/8] soc/fsl/qbman: Fix drain_mr_fqni()
Thread-Index: AQHVCaZJ9R1X5CX28k65nNRleeTkjA==
Date: Mon, 13 May 2019 16:09:48 +0000
Message-ID: <1557763756-24118-6-git-send-email-roy.pledge@nxp.com>
References: <1557763756-24118-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1557763756-24118-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN4PR0501CA0144.namprd05.prod.outlook.com
 (2603:10b6:803:2c::22) To DB6PR0402MB2727.eurprd04.prod.outlook.com
 (2603:10a6:4:98::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5103d024-35de-4408-8db6-08d6d7bd6bf1
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB2709F55574E89B2C314B558E860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:330;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(4744005)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(14444005)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Z/iDctZOKsGAZY9Kv8/LnMCDORJBHBG24sVDgmWvVY92UKrhWN/De+aW2kVEnO28zPMiZwu4AwZcbpL9dZLjQSzXOgSkSvltJVzskAqWzGND/RI5mKgDL0p3WCJDU5NOgMfU7mppavK3x08eODaLpWa9K3MLqH+A9k9M+9J2is3X1Thxd76u+y927dsmQ096OOMq+oJ6zVnAJx7JWe4BOUvYKfAxN8BFVfLTIE/zBnQ1YUHUfFHBuqZxQ09kdKwIMbHumTxDRcy1FB4AgiPzcaKITpB6DAZ1i2dFPrjcvoOCwUtGk9Zubu96sm5L2GDHSWo0d4DpaXZhxfqpOQ23IYe1p2tH91abHFzzOV+LtbQKo1V0YowTc4cSAu1DH1NihDa1Im2k45N8b+cWkKdtiCAqCAnT1BDK3giCMwCyL00=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5103d024-35de-4408-8db6-08d6d7bd6bf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:48.3290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2709
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
Cc: Roy Pledge <roy.pledge@nxp.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGRyYWluX21yX2ZxbmkoKSBmdW5jdGlvbiBtYXkgYmUgY2FsbGVkIGZyb24gdW5pbnRlcnJ1
cHRhYmxlDQpjb250ZXh0IHNvIGNvbnZlcnQgdGhlIG1zbGVlcCgpIHRvIGFuIG1kZWxheSgpLiAg
QWxzbyBlbnN1cmUgdGhhdA0KdGhlIHZhbGlkIGJpdCBpcyB1cGRhdGVkIHdoaWxlIHBvbGxpbmcu
DQoNClNpZ25lZC1vZmYtYnk6IFJveSBQbGVkZ2UgPHJveS5wbGVkZ2VAbnhwLmNvbT4NCi0tLQ0K
IGRyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMgfCA0ICsrKy0NCiAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
Yy9mc2wvcWJtYW4vcW1hbi5jIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW4uYw0KaW5kZXgg
ZjEwZjc3ZC4uMjk4OTUwNCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFu
LmMNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMNCkBAIC0xMTY0LDYgKzExNjQs
NyBAQCBzdGF0aWMgaW50IGRyYWluX21yX2Zxcm5pKHN0cnVjdCBxbV9wb3J0YWwgKnApDQogew0K
IAljb25zdCB1bmlvbiBxbV9tcl9lbnRyeSAqbXNnOw0KIGxvb3A6DQorCXFtX21yX3B2Yl91cGRh
dGUocCk7DQogCW1zZyA9IHFtX21yX2N1cnJlbnQocCk7DQogCWlmICghbXNnKSB7DQogCQkvKg0K
QEAgLTExODAsNyArMTE4MSw4IEBAIHN0YXRpYyBpbnQgZHJhaW5fbXJfZnFybmkoc3RydWN0IHFt
X3BvcnRhbCAqcCkNCiAJCSAqIGVudHJpZXMgd2VsbCBiZWZvcmUgdGhlIHJpbmcgaGFzIGJlZW4g
ZnVsbHkgY29uc3VtZWQsIHNvDQogCQkgKiB3ZSdyZSBiZWluZyAqcmVhbGx5KiBwYXJhbm9pZCBo
ZXJlLg0KIAkJICovDQotCQltc2xlZXAoMSk7DQorCQltZGVsYXkoMSk7DQorCQlxbV9tcl9wdmJf
dXBkYXRlKHApOw0KIAkJbXNnID0gcW1fbXJfY3VycmVudChwKTsNCiAJCWlmICghbXNnKQ0KIAkJ
CXJldHVybiAwOw0KLS0gDQoyLjcuNA0KDQo=
