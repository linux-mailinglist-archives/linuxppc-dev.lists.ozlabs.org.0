Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A06FE0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:41:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnNh0tJNzDqQP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:41:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-he1-obe.outbound.protection.outlook.com
 (client-ip=40.107.1.136; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="mXRhcfO0"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10136.outbound.protection.outlook.com [40.107.1.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tjH91VnTzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:36:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NrWMpB5CprkChy4USClY/Q0ahMSQUV6S9IFc1CWutc=;
 b=mXRhcfO0Me+xfehMRvcKCYtu0VbQQOyzpbw5EM4dCG8PkU3JSKlRhnXPjZLwymLs41BeSJTFeR0f1mRIiJNHQigFLLwFKVWXjY6GjDcjuMVVfEvjKeHkawgU9U9yJcz7nycUzuQyMI/YfCBt6HD646D7nl8aKxV2HU4t/VSLBVo=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2637.EURPRD10.PROD.OUTLOOK.COM (20.178.126.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 13:36:28 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 13:36:28 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH RESEND 0/5] soc/fsl/qe: cleanups and new DT binding
Thread-Topic: [PATCH RESEND 0/5] soc/fsl/qe: cleanups and new DT binding
Thread-Index: AQHU/1m2JNrDiUIkoE2pl4x3Q9euZA==
Date: Tue, 30 Apr 2019 13:36:28 +0000
Message-ID: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: 33965843-a4d9-4d80-5d82-08d6cd70d91a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2637; 
x-ms-traffictypediagnostic: VI1PR10MB2637:
x-microsoft-antispam-prvs: <VI1PR10MB2637055F8E82BA0758C278CB8A3A0@VI1PR10MB2637.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(346002)(39850400004)(136003)(376002)(199004)(189003)(5660300002)(81156014)(81166006)(36756003)(6116002)(8676002)(50226002)(2906002)(8976002)(102836004)(25786009)(186003)(26005)(6506007)(386003)(256004)(8936002)(316002)(6486002)(42882007)(476003)(97736004)(44832011)(4326008)(73956011)(486006)(7736002)(74482002)(64756008)(66446008)(305945005)(66066001)(66556008)(66946007)(66476007)(3846002)(2616005)(14454004)(68736007)(72206003)(110136005)(53936002)(99286004)(6512007)(52116002)(6436002)(71200400001)(71190400001)(54906003)(107886003)(1076003)(71446004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2637;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NII+RoozhoNAjDgQ9lnTOGzt4ZnXOWJ/+yC0IJ0XzAcG/q5zMt25cZ5IElGqryU5/58SnuhXWhvlGK1QPB263Guza7DgFRk8PCWTLaFYgbJL/ajT1S8TpFByth+068x8T97vMDL3NbAEmj6E8y6gI4EpG/EwGghdZeh9C1WNnNu0u1siOhVMUvvzCHE1m9mU72NdIcb2OusRSuMoil23Ch+F1kFe41rhdd54DMq5ep8122si/ziDGy92PSBZR6FhVArMrpv18mjhrMV2JLqsOi8Fzi6K01ag3jbrKdVxDf85RVel8qFf/wiZB5ZeL9NvGh4UR5UhQq9R+0pCMY1E84PenYGPuSMUPHJlfr55tiVyzEf5TyvZixnWcEW8W0rX8MgvJqMynsK9EneoeR+ZyBj8rBTwYS/GN6CyJygHdcU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 33965843-a4d9-4d80-5d82-08d6cd70d91a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:36:28.5441 (UTC)
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

VGhpcyBzbWFsbCBzZXJpZXMgY29uc2lzdHMgb2Ygc29tZSBzbWFsbCBjbGVhbnVwcyBhbmQgc2lt
cGxpZmljYXRpb25zDQpvZiB0aGUgUVVJQ0MgZW5naW5lIGRyaXZlciwgYW5kIGludHJvZHVjZXMg
YSBuZXcgRFQgYmluZGluZyB0aGF0IG1ha2VzDQppdCBtdWNoIGVhc2llciB0byBzdXBwb3J0IG90
aGVyIHZhcmlhbnRzIG9mIHRoZSBRVUlDQyBlbmdpbmUgSVAgYmxvY2sNCnRoYXQgYXBwZWFycyBp
biB0aGUgd2lsZDogVGhlcmUncyBubyByZWFzb24gdG8gZXhwZWN0IGluIGdlbmVyYWwgdGhhdA0K
dGhlIG51bWJlciBvZiB2YWxpZCBTTlVNcyB1bmlxdWVseSBkZXRlcm1pbmVzIHRoZSBzZXQgb2Yg
c3VjaCwgc28gaXQncw0KYmV0dGVyIHRvIHNpbXBseSBsZXQgdGhlIGRldmljZSB0cmVlIHNwZWNp
ZnkgdGhlIHZhbHVlcyAoYW5kLA0KaW1wbGljaXRseSB2aWEgdGhlIGFycmF5IGxlbmd0aCwgYWxz
byB0aGUgY291bnQpLg0KDQpJIHNlbnQgdGhlc2UgdHdvIG1vbnRocyBhZ28sIGJ1dCBtb3N0bHkg
YXMgUE9DIGluc2lkZSBhbm90aGVyDQp0aHJlYWQuIFJlc2VuZGluZyBhcyBwcm9wZXIgcGF0Y2gg
c2VyaWVzLg0KDQpSYXNtdXMgVmlsbGVtb2VzICg1KToNCiAgc29jL2ZzbC9xZTogcWUuYzogZHJv
cCB1c2VsZXNzIHN0YXRpYyBxdWFsaWZpZXINCiAgc29jL2ZzbC9xZTogcWUuYzogcmVkdWNlIHN0
YXRpYyBtZW1vcnkgZm9vdHByaW50IGJ5IDEuN0sNCiAgc29jL2ZzbC9xZTogcWUuYzogaW50cm9k
dWNlIHFlX2dldF9kZXZpY2Vfbm9kZSBoZWxwZXINCiAgc29jL2ZzbC9xZTogcWUuYzogc3VwcG9y
dCBmc2wscWUtc251bXMgcHJvcGVydHkNCiAgc29jL2ZzbC9xZTogcWUuYzogZm9sZCBxZV9nZXRf
bnVtX29mX3NudW1zIGludG8gcWVfc251bXNfaW5pdA0KDQogLi4uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0IHwgICA4ICstDQogZHJpdmVycy9uZXQvZXRoZXJuZXQv
ZnJlZXNjYWxlL3VjY19nZXRoLmMgICAgIHwgICAyICstDQogZHJpdmVycy9zb2MvZnNsL3FlL3Fl
LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTYyICsrKysrKystLS0tLS0tLS0tLQ0KIGluY2x1
ZGUvc29jL2ZzbC9xZS9xZS5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgMiArLQ0KIDQgZmls
ZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0aW9ucygtKQ0KDQotLSANCjIu
MjAuMQ0KDQo=
