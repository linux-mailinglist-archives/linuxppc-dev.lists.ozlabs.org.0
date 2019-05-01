Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A0410662
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 11:33:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vCr61kDxzDqVn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.131; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="UmQ6EI3c"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20131.outbound.protection.outlook.com [40.107.2.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vClJ2yftzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 19:29:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LGCe21VBNZQEqboh3NbPhYW9ZL6uUqWxQCSeiux7swc=;
 b=UmQ6EI3cxjexna0zxeXCjn1GshWHIumhplUml+pMj1nNLjTi8ft6PAB+PNktM5uqm1Hqv+9P9b72r0Nn4AhICy2mjAlaEsG8XLB7CB3rcbeO+VJvCRWe9n8s2NoNPa+mSoOpKoJ+V5GO0SoXn8O/0JaJK+O17dGpJURlvmWpeeA=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM (20.177.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 09:29:06 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:29:06 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2 3/6] soc/fsl/qe: qe.c: introduce qe_get_device_node helper
Thread-Topic: [PATCH v2 3/6] soc/fsl/qe: qe.c: introduce qe_get_device_node
 helper
Thread-Index: AQHVAABSO9n6ywgWGk+dEmrZ/tNNCA==
Date: Wed, 1 May 2019 09:29:06 +0000
Message-ID: <20190501092841.9026-4-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: 8b3f79db-2e4b-4133-4e00-08d6ce177520
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2143; 
x-ms-traffictypediagnostic: VI1PR10MB2143:
x-microsoft-antispam-prvs: <VI1PR10MB21430D1FA12DCCE11590FF208A3B0@VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39850400004)(346002)(396003)(366004)(189003)(199004)(14454004)(81166006)(110136005)(54906003)(26005)(68736007)(8676002)(6512007)(4326008)(8976002)(486006)(74482002)(71200400001)(2906002)(7416002)(6486002)(72206003)(186003)(316002)(478600001)(2501003)(36756003)(6436002)(71190400001)(25786009)(1076003)(6506007)(2616005)(305945005)(3846002)(44832011)(256004)(11346002)(6116002)(5660300002)(8936002)(446003)(476003)(50226002)(76176011)(42882007)(7736002)(99286004)(66446008)(64756008)(53936002)(52116002)(107886003)(386003)(66066001)(66946007)(66476007)(102836004)(66556008)(81156014)(73956011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2143;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ddS6KUlmkuerLJu3VBh7ANR62saeoQCJ/h1tDWkl3LKwIUxSWy/3zTFWmig4Awyf2QKmEfQscr51qeTwKl+5P1KwZ/gHlrKBbT/ESHmTi15E2DLWE7GR9b9RJ0uU7m237g93Jw//wiMBIa04rfKXYlf9t4B686rZ5P1pONqsZTnq9lEKKTzGKGG/QQqeHeHmx8aEFxz2zgD7pryYrQIr6Xs+WuHmKW7aTyGdWolv93zegqg8Fd0539aOcWpE74lBdpVvmlo7BbM4msH92OWIIQIJMQM13hdo5nmxH5DlWIg+xkU+ZLvlAInWosAC0xzddtFgUr09jfkRjJ34tO4oacygxIXr31apwX9gGek4KA5M3zWcwsjgTnNuLQ+jfsuAH5xy0FjZssEoIFTI8T5D8cDWcpCbtsAdrG2uYLwaoik=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3f79db-2e4b-4133-4e00-08d6ce177520
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:29:06.7657 (UTC)
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

VGhlICd0cnkgb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImZzbCxxZSIpLCBm
YWxsIGJhY2sgdG8NCm9mX2ZpbmRfbm9kZV9ieV90eXBlKE5VTEwsICJxZSIpJyBwYXR0ZXJuIGlz
IHJlcGVhdGVkIGZpdmUNCnRpbWVzLiBGYWN0b3IgaXQgaW50byBhIGNvbW1vbiBoZWxwZXIuDQoN
ClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj4N
ClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJhc211cy52aWxsZW1vZXNAcHJldmFz
LmRrPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgfCA3MSArKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCA0MiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9x
ZS5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCmluZGV4IDMwM2FhMjljYjI3ZC4uMGZiOGI1
OWY2MWFkIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCisrKyBiL2RyaXZl
cnMvc29jL2ZzbC9xZS9xZS5jDQpAQCAtNTYsNiArNTYsMjAgQEAgc3RhdGljIHVuc2lnbmVkIGlu
dCBxZV9udW1fb2Zfc251bTsNCiANCiBzdGF0aWMgcGh5c19hZGRyX3QgcWViYXNlID0gLTE7DQog
DQorc3RhdGljIHN0cnVjdCBkZXZpY2Vfbm9kZSAqcWVfZ2V0X2RldmljZV9ub2RlKHZvaWQpDQor
ew0KKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKnFlOw0KKw0KKwkvKg0KKwkgKiBOZXdlciBkZXZpY2Ug
dHJlZXMgaGF2ZSBhbiAiZnNsLHFlIiBjb21wYXRpYmxlIHByb3BlcnR5IGZvciB0aGUgUUUNCisJ
ICogbm9kZSwgYnV0IHdlIHN0aWxsIG5lZWQgdG8gc3VwcG9ydCBvbGRlciBkZXZpY2UgdHJlZXMu
DQorCSAqLw0KKwlxZSA9IG9mX2ZpbmRfY29tcGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2ws
cWUiKTsNCisJaWYgKHFlKQ0KKwkJcmV0dXJuIHFlOw0KKwlyZXR1cm4gb2ZfZmluZF9ub2RlX2J5
X3R5cGUoTlVMTCwgInFlIik7DQorfQ0KKw0KIHN0YXRpYyBwaHlzX2FkZHJfdCBnZXRfcWVfYmFz
ZSh2b2lkKQ0KIHsNCiAJc3RydWN0IGRldmljZV9ub2RlICpxZTsNCkBAIC02NSwxMiArNzksOSBA
QCBzdGF0aWMgcGh5c19hZGRyX3QgZ2V0X3FlX2Jhc2Uodm9pZCkNCiAJaWYgKHFlYmFzZSAhPSAt
MSkNCiAJCXJldHVybiBxZWJhc2U7DQogDQotCXFlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUo
TlVMTCwgTlVMTCwgImZzbCxxZSIpOw0KLQlpZiAoIXFlKSB7DQotCQlxZSA9IG9mX2ZpbmRfbm9k
ZV9ieV90eXBlKE5VTEwsICJxZSIpOw0KLQkJaWYgKCFxZSkNCi0JCQlyZXR1cm4gcWViYXNlOw0K
LQl9DQorCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQorCWlmICghcWUpDQorCQlyZXR1cm4g
cWViYXNlOw0KIA0KIAlyZXQgPSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKHFlLCAwLCAmcmVzKTsN
CiAJaWYgKCFyZXQpDQpAQCAtMTY0LDEyICsxNzUsOSBAQCB1bnNpZ25lZCBpbnQgcWVfZ2V0X2Jy
Z19jbGsodm9pZCkNCiAJaWYgKGJyZ19jbGspDQogCQlyZXR1cm4gYnJnX2NsazsNCiANCi0JcWUg
PSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7DQotCWlmICgh
cWUpIHsNCi0JCXFlID0gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFlIik7DQotCQlpZiAo
IXFlKQ0KLQkJCXJldHVybiBicmdfY2xrOw0KLQl9DQorCXFlID0gcWVfZ2V0X2RldmljZV9ub2Rl
KCk7DQorCWlmICghcWUpDQorCQlyZXR1cm4gYnJnX2NsazsNCiANCiAJcHJvcCA9IG9mX2dldF9w
cm9wZXJ0eShxZSwgImJyZy1mcmVxdWVuY3kiLCAmc2l6ZSk7DQogCWlmIChwcm9wICYmIHNpemUg
PT0gc2l6ZW9mKCpwcm9wKSkNCkBAIC01NTcsMTYgKzU2NSw5IEBAIHN0cnVjdCBxZV9maXJtd2Fy
ZV9pbmZvICpxZV9nZXRfZmlybXdhcmVfaW5mbyh2b2lkKQ0KIA0KIAlpbml0aWFsaXplZCA9IDE7
DQogDQotCS8qDQotCSAqIE5ld2VyIGRldmljZSB0cmVlcyBoYXZlIGFuICJmc2wscWUiIGNvbXBh
dGlibGUgcHJvcGVydHkgZm9yIHRoZSBRRQ0KLQkgKiBub2RlLCBidXQgd2Ugc3RpbGwgbmVlZCB0
byBzdXBwb3J0IG9sZGVyIGRldmljZSB0cmVlcy4NCi0JKi8NCi0JcWUgPSBvZl9maW5kX2NvbXBh
dGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7DQotCWlmICghcWUpIHsNCi0JCXFlID0g
b2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFlIik7DQotCQlpZiAoIXFlKQ0KLQkJCXJldHVy
biBOVUxMOw0KLQl9DQorCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQorCWlmICghcWUpDQor
CQlyZXR1cm4gTlVMTDsNCiANCiAJLyogRmluZCB0aGUgJ2Zpcm13YXJlJyBjaGlsZCBub2RlICov
DQogCWZ3ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUocWUsICJmaXJtd2FyZSIpOw0KQEAgLTYxMiwx
NiArNjEzLDkgQEAgdW5zaWduZWQgaW50IHFlX2dldF9udW1fb2ZfcmlzYyh2b2lkKQ0KIAl1bnNp
Z25lZCBpbnQgbnVtX29mX3Jpc2MgPSAwOw0KIAljb25zdCB1MzIgKnByb3A7DQogDQotCXFlID0g
b2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImZzbCxxZSIpOw0KLQlpZiAoIXFl
KSB7DQotCQkvKiBPbGRlciBkZXZpY2VzIHRyZWVzIGRpZCBub3QgaGF2ZSBhbiAiZnNsLHFlIg0K
LQkJICogY29tcGF0aWJsZSBwcm9wZXJ0eSwgc28gd2UgbmVlZCB0byBsb29rIGZvcg0KLQkJICog
dGhlIFFFIG5vZGUgYnkgbmFtZS4NCi0JCSAqLw0KLQkJcWUgPSBvZl9maW5kX25vZGVfYnlfdHlw
ZShOVUxMLCAicWUiKTsNCi0JCWlmICghcWUpDQotCQkJcmV0dXJuIG51bV9vZl9yaXNjOw0KLQl9
DQorCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQorCWlmICghcWUpDQorCQlyZXR1cm4gbnVt
X29mX3Jpc2M7DQogDQogCXByb3AgPSBvZl9nZXRfcHJvcGVydHkocWUsICJmc2wscWUtbnVtLXJp
c2NzIiwgJnNpemUpOw0KIAlpZiAocHJvcCAmJiBzaXplID09IHNpemVvZigqcHJvcCkpDQpAQCAt
NjQxLDE2ICs2MzUsOSBAQCB1bnNpZ25lZCBpbnQgcWVfZ2V0X251bV9vZl9zbnVtcyh2b2lkKQ0K
IAljb25zdCB1MzIgKnByb3A7DQogDQogCW51bV9vZl9zbnVtcyA9IDI4OyAvKiBUaGUgZGVmYXVs
dCBudW1iZXIgb2Ygc251bSBmb3IgdGhyZWFkcyBpcyAyOCAqLw0KLQlxZSA9IG9mX2ZpbmRfY29t
cGF0aWJsZV9ub2RlKE5VTEwsIE5VTEwsICJmc2wscWUiKTsNCi0JaWYgKCFxZSkgew0KLQkJLyog
T2xkZXIgZGV2aWNlcyB0cmVlcyBkaWQgbm90IGhhdmUgYW4gImZzbCxxZSINCi0JCSAqIGNvbXBh
dGlibGUgcHJvcGVydHksIHNvIHdlIG5lZWQgdG8gbG9vayBmb3INCi0JCSAqIHRoZSBRRSBub2Rl
IGJ5IG5hbWUuDQotCQkgKi8NCi0JCXFlID0gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFl
Iik7DQotCQlpZiAoIXFlKQ0KLQkJCXJldHVybiBudW1fb2Zfc251bXM7DQotCX0NCisJcWUgPSBx
ZV9nZXRfZGV2aWNlX25vZGUoKTsNCisJaWYgKCFxZSkNCisJCXJldHVybiBudW1fb2Zfc251bXM7
DQogDQogCXByb3AgPSBvZl9nZXRfcHJvcGVydHkocWUsICJmc2wscWUtbnVtLXNudW1zIiwgJnNp
emUpOw0KIAlpZiAocHJvcCAmJiBzaXplID09IHNpemVvZigqcHJvcCkpIHsNCi0tIA0KMi4yMC4x
DQoNCg==
