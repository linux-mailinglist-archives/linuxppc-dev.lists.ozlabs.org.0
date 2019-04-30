Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E9FFE18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:46:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnV00QJyzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:46:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-he1-obe.outbound.protection.outlook.com
 (client-ip=40.107.1.136; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="pjLWBtue"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10136.outbound.protection.outlook.com [40.107.1.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tjHD0vYNzDqHq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:36:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3reqgDViKoUe61oNm1kPh3X/94DMIzVWeXGbeYFces0=;
 b=pjLWBtue5t5t+g8WWix984Rgbo9aicuaNVu2RCW+FlcZGsGjyZYK9d2zvmwxJBavIAUF4uLOay/NCDH8808o6GVOonPif8dvZzlphArzbRvAM3elIHMvlNzCAvaguQJsiZdbmVj1xcJm+2qu4eNx6xap2vvc2TjzvS3Bc+nC7vA=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2637.EURPRD10.PROD.OUTLOOK.COM (20.178.126.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 13:36:29 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 13:36:29 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 1/5] soc/fsl/qe: qe.c: drop useless static qualifier
Thread-Topic: [PATCH 1/5] soc/fsl/qe: qe.c: drop useless static qualifier
Thread-Index: AQHU/1m30LYp9RcqLU2JYpKyfmSmOQ==
Date: Tue, 30 Apr 2019 13:36:29 +0000
Message-ID: <20190430133615.25721-2-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P18901CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::15) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [5.186.118.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 39349b14-3eb1-44f0-312a-08d6cd70d9df
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2637; 
x-ms-traffictypediagnostic: VI1PR10MB2637:
x-microsoft-antispam-prvs: <VI1PR10MB2637BD28CF7142CE2AAF57168A3A0@VI1PR10MB2637.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39850400004)(136003)(376002)(199004)(189003)(5660300002)(81156014)(81166006)(36756003)(6116002)(8676002)(50226002)(2906002)(8976002)(76176011)(102836004)(25786009)(186003)(26005)(6506007)(386003)(256004)(8936002)(11346002)(316002)(6486002)(42882007)(476003)(97736004)(446003)(44832011)(4326008)(73956011)(486006)(7736002)(74482002)(14444005)(64756008)(66446008)(305945005)(66066001)(66556008)(66946007)(66476007)(3846002)(2616005)(14454004)(68736007)(72206003)(110136005)(53936002)(99286004)(6512007)(52116002)(6436002)(71200400001)(71190400001)(54906003)(107886003)(1076003)(4744005)(71446004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2637;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: RyA6gI5jC/DJtQNXf2PE3EqNVbudTZ3tBRu4FfF9A+B9iuBB54vbMdaDRAfZP676U56g4Y/13Fr/wVxL4Zwz2cU2hxQFSimHqFOWDevHr1Ma1ah4FsxlgXtNo/j5JUr/5PhHKUCXnOKrlvArXEuhAbNOROD47/qDbB3gQFkO38LN8UuW3h6+1Q/aw1SGt1ljxykd5xUORWy/QNoFRS7pzE86H+G4OYFGylAim3+FoGEoORUlEBwvLA0l4VY1cHeBCSso6Xv8h79gW8Ac4AaBglaw/1kjc+ynyyPgQQ0mebDClG+lwRzgPPhDSg6vInbwCtByNxuHv9BmUby+tlO52vdrT6/DDV9isGuRdpgDrewu3/9dJ6UN1y+5IhDoOru3y8ZgAEuY0TSyFzwU4aaIIKZv2AYPFnft4yFdeCMAr7w=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 39349b14-3eb1-44f0-312a-08d6cd70d9df
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:36:29.7900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2637
X-Mailman-Approved-At: Wed, 01 May 2019 02:38:35 +1000
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGxvY2FsIHZhcmlhYmxlIHNudW1faW5pdCBoYXMgbm8gcmVhc29uIHRvIGhhdmUgc3RhdGlj
IHN0b3JhZ2UgZHVyYXRpb24uDQoNClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJh
c211cy52aWxsZW1vZXNAcHJldmFzLmRrPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMg
fCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9x
ZS9xZS5jDQppbmRleCA2MTJkOWM1NTFiZTUuLjg1NTM3M2RlYjc0NiAxMDA2NDQNCi0tLSBhL2Ry
aXZlcnMvc29jL2ZzbC9xZS9xZS5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KQEAg
LTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZvaWQpDQogCQkweDI4
LCAweDI5LCAweDM4LCAweDM5LCAweDQ4LCAweDQ5LCAweDU4LCAweDU5LA0KIAkJMHg2OCwgMHg2
OSwgMHg3OCwgMHg3OSwgMHg4MCwgMHg4MSwNCiAJfTsNCi0Jc3RhdGljIGNvbnN0IHU4ICpzbnVt
X2luaXQ7DQorCWNvbnN0IHU4ICpzbnVtX2luaXQ7DQogDQogCXFlX251bV9vZl9zbnVtID0gcWVf
Z2V0X251bV9vZl9zbnVtcygpOw0KIA0KLS0gDQoyLjIwLjENCg0K
