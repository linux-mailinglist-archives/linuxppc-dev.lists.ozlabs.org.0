Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC89810666
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 11:34:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vCsZ1MmpzDqWQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:34:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.131; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="CdOhGx0j"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20131.outbound.protection.outlook.com [40.107.2.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vClK2LnZzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 19:29:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdIU3JucIMee+PIHDK9qSxLKioYm0DOUxEhV9Kua/m8=;
 b=CdOhGx0jz8s4kGEUeQ5R9YPmiwZxtbAkKJIyavqdariEiAm7AgInkuYVJIF2nu3w5gRZ99eX61TZX7NBlxELUEcaNpTTl7r2c1MiSnykatIv5szHPLGVCul3XVtJzoSJw9FFdrvFvfQUZLwHLxkHSELE0NGWfWMT+QWnhpM/D8g=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM (20.177.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 09:29:08 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:29:08 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new fsl,qe-snums
 binding
Thread-Topic: [PATCH v2 4/6] dt-bindings: soc/fsl: qe: document new
 fsl,qe-snums binding
Thread-Index: AQHVAABTBBh/pLqBQEiPEhE0F8Qajw==
Date: Wed, 1 May 2019 09:29:08 +0000
Message-ID: <20190501092841.9026-5-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::29) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 833879d1-a410-4def-0894-08d6ce1775fc
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2143; 
x-ms-traffictypediagnostic: VI1PR10MB2143:
x-microsoft-antispam-prvs: <VI1PR10MB2143F3DD2F0944B26C7A6C858A3B0@VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39850400004)(346002)(396003)(366004)(189003)(199004)(40224003)(14454004)(81166006)(110136005)(54906003)(26005)(68736007)(8676002)(6512007)(4326008)(8976002)(486006)(74482002)(71200400001)(2906002)(7416002)(6486002)(72206003)(186003)(316002)(478600001)(2501003)(36756003)(6436002)(71190400001)(25786009)(1076003)(6506007)(2616005)(305945005)(3846002)(44832011)(256004)(11346002)(6116002)(5660300002)(8936002)(14444005)(446003)(476003)(50226002)(76176011)(42882007)(7736002)(99286004)(66446008)(64756008)(53936002)(52116002)(107886003)(386003)(66066001)(66946007)(66476007)(102836004)(66556008)(81156014)(73956011)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2143;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AqsXV23houvs7fy1N7Du7jixIcSJhmAJ02uWpTo//NCyDX3o7OXGO9fyncZpKmzfwtw8o/c7JvJWN1u7722tYYPK3NxLkAppCGC1a0/Jk2STlEIG0mR+gVv+UYkgKkWjEzyTlpMVku1zb7V6pZDNlMNKzsX42P/goG1ZHenDsxPMLxbvtNd+/9/C/Bc6khu+/oPPvvYzoA7ieLneJkO3cnWSRL+G9onqoC8HAObaDEbNwjcJudALv2qJJopQLIYzPGTiZJeD1rrD9cpoqchwLBvO71ujN6e1FthvWx1puKE2WQShn/Hxcajll5Y0oERCir+O/gIpgzVEJMJns1xIYituoysROsPH8AnlowhnhVNwFjYaPVdTt6b2PWpbnPcSYax8oMyGrMmZ8QdSGScEO3UzmiOweREbw92rzcYFNtU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 833879d1-a410-4def-0894-08d6ce1775fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:29:08.2197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2143
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmVhZGluZyB0YWJsZSA0LTMwLCBhbmQgaXRzIGZvb3Rub3Rlcywgb2YgdGhlIFFVSUNDIEVuZ2lu
ZSBCbG9jaw0KUmVmZXJlbmNlIE1hbnVhbCBzaG93cyB0aGF0IHRoZSBzZXQgb2Ygc251bSBfdmFs
dWVzXyBpcyBub3QNCm5lY2Vzc2FyaWx5IGp1c3QgYSBmdW5jdGlvbiBvZiB0aGUgX251bWJlcl8g
b2Ygc251bXMsIGFzIGdpdmVuIGluIHRoZQ0KZnNsLHFlLW51bS1zbnVtcyBwcm9wZXJ0eS4NCg0K
QXMgYW4gYWx0ZXJuYXRpdmUsIHRvIG1ha2UgaXQgZWFzaWVyIHRvIGFkZCBzdXBwb3J0IGZvciBv
dGhlciB2YXJpYW50cw0Kb2YgdGhlIFFVSUNDIGVuZ2luZSBJUCwgdGhpcyBpbnRyb2R1Y2VzIGEg
bmV3IGJpbmRpbmcgZnNsLHFlLXNudW1zLA0Kd2hpY2ggYXV0b21hdGljYWxseSBlbmNvZGVzIGJv
dGggdGhlIG51bWJlciBvZiBzbnVtcyBhbmQgdGhlIGFjdHVhbA0KdmFsdWVzIHRvIHVzZS4NCg0K
Rm9yIGV4YW1wbGUsIGZvciB0aGUgTVBDODMwOSwgb25lIHdvdWxkIHNwZWNpZnkgdGhlIHByb3Bl
cnR5IGFzDQoNCiAgICAgICAgICAgICAgIGZzbCxxZS1zbnVtcyA9IC9iaXRzLyA4IDwNCiAgICAg
ICAgICAgICAgICAgICAgICAgMHg4OCAweDg5IDB4OTggMHg5OSAweGE4IDB4YTkgMHhiOCAweGI5
DQogICAgICAgICAgICAgICAgICAgICAgIDB4YzggMHhjOSAweGQ4IDB4ZDkgMHhlOCAweGU5PjsN
Cg0KU2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2
YXMuZGs+DQotLS0NCiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9j
cG1fcWUvcWUudHh0IHwgOCArKysrKysrLQ0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0DQppbmRleCBkN2FmYWZmNWZhZmYuLjA1
ZjVmNDg1NTYyYSAxMDA2NDQNCi0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvZnNsL2NwbV9xZS9xZS50eHQNCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHQNCkBAIC0xOCw3ICsxOCw4IEBAIFJlcXVpcmVk
IHByb3BlcnRpZXM6DQogLSByZWcgOiBvZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUgZGV2aWNlIHJl
Z2lzdGVycy4NCiAtIGJ1cy1mcmVxdWVuY3kgOiB0aGUgY2xvY2sgZnJlcXVlbmN5IGZvciBRVUlD
QyBFbmdpbmUuDQogLSBmc2wscWUtbnVtLXJpc2NzOiBkZWZpbmUgaG93IG1hbnkgUklTQyBlbmdp
bmVzIHRoZSBRRSBoYXMuDQotLSBmc2wscWUtbnVtLXNudW1zOiBkZWZpbmUgaG93IG1hbnkgc2Vy
aWFsIG51bWJlcihTTlVNKSB0aGUgUUUgY2FuIHVzZSBmb3IgdGhlDQorLSBmc2wscWUtc251bXM6
IFRoaXMgcHJvcGVydHkgaGFzIHRvIGJlIHNwZWNpZmllZCBhcyAnL2JpdHMvIDgnIHZhbHVlLA0K
KyAgZGVmaW5pbmcgdGhlIGFycmF5IG9mIHNlcmlhbCBudW1iZXIgKFNOVU0pIHZhbHVlcyBmb3Ig
dGhlIHZpcnR1YWwNCiAgIHRocmVhZHMuDQogDQogT3B0aW9uYWwgcHJvcGVydGllczoNCkBAIC0z
NCw2ICszNSwxMSBAQCBSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzDQogLSBicmctZnJlcXVlbmN5IDog
dGhlIGludGVybmFsIGNsb2NrIHNvdXJjZSBmcmVxdWVuY3kgZm9yIGJhdWQtcmF0ZQ0KICAgZ2Vu
ZXJhdG9ycyBpbiBIei4NCiANCitEZXByZWNhdGVkIHByb3BlcnRpZXMNCistIGZzbCxxZS1udW0t
c251bXM6IGRlZmluZSBob3cgbWFueSBzZXJpYWwgbnVtYmVyKFNOVU0pIHRoZSBRRSBjYW4gdXNl
DQorICBmb3IgdGhlIHRocmVhZHMuIFVzZSBmc2wscWUtc251bXMgaW5zdGVhZCB0byBub3Qgb25s
eSBzcGVjaWZ5IHRoZQ0KKyAgbnVtYmVyIG9mIHNudW1zLCBidXQgYWxzbyB0aGVpciB2YWx1ZXMu
DQorDQogRXhhbXBsZToNCiAgICAgIHFlQGUwMTAwMDAwIHsNCiAJI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQotLSANCjIuMjAuMQ0KDQo=
