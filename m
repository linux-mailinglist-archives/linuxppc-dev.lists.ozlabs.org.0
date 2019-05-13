Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A701BAEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:22:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mLl6wMLzDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.51; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="PtAFhWex"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m484h2lzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:10:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJeq37LUHWXLkwtN+2gkJCItOFfnXzl1uREKPVyu434=;
 b=PtAFhWexSICMGV2VPgqKwdhsdrp1TUoEhZtKFsZcdM3i4QGimB6zm8RiYGiOTS0JMPBe8g34Vu+aT9Vj0+eBTDJTlVkC3ZK8o/0r8J7J/re1eZIBbjVV+lqjZp60yCsVrVepj9Pr4wGEmvfTiSTffk1pNGLaotcMZcCeHRFy5+w=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:52 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:52 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 7/8] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Topic: [PATCH v1 7/8] soc/fsl/qbman: Fixup qman_shutdown_fq()
Thread-Index: AQHVCaZL54VDi9ymWU+sgIqNMaCjHw==
Date: Mon, 13 May 2019 16:09:51 +0000
Message-ID: <1557763756-24118-8-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: f60b009f-cb3b-4622-7de2-08d6d7bd6e36
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB27090EE6FD87AB7D42CA974E860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:169;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(14444005)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8WtyodEBAMOFRXp2LW9sKYNPI+1mzkYmNtuO+oCtgZMyESFNWuJDxartXPTLTf1VaRdxYRHoolDHqZhutGVGxMTz47X35SkcpkCo6D4taFzyqljVDrpt9UbDeIespQxzWZLf966puTGblGqj3njohxa204ziVFvO3N3qT129lRZPhAdlKvBlkZpQMN+n1Ax8S6x5+A8fbQ8TmeuZWcERwQvh4WTBN9k8aBpQyvdsXW98Nu1SPl3bK5k2WIqaZWzzvmFJvWu0zKpD341VUV0yxLJRuUGN5MWDz36rIhDz7VPFjorUMGNYYZ2yqpU39O9jOju/WRBSvMjbOMX7gix8eA3fshOHt+LVCJ1B6wbEY2qNHKafj/lr6M0kHQUT0AC9qOfERvpDx4njH1GUyeCSeYG9Bm/BU8s50nlalesNdQE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f60b009f-cb3b-4622-7de2-08d6d7bd6e36
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:52.0161 (UTC)
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

V2hlbiBzaHV0dGluZyBkb3duIGEgRlEgb24gYSBkZWRpY2F0ZWQgY2hhbm5lbCBvbmx5IHRoZQ0K
U1cgcG9ydGFsIGFzc29jaWF0ZWQgd2l0aCB0aGF0IGNoYW5uZWwgY2FuIGRlcXVldWUgZnJvbSBp
dC4NCk1ha2Ugc3VyZSB0aGUgY29ycmVjdCBwb3J0YWwgaXMgdXNlLg0KDQpTaWduZWQtb2ZmLWJ5
OiBSb3kgUGxlZGdlIDxyb3kucGxlZGdlQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL3NvYy9mc2wv
cWJtYW4vcW1hbi5jIHwgNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1hbi5jIGIvZHJpdmVycy9z
b2MvZnNsL3FibWFuL3FtYW4uYw0KaW5kZXggNGE5OWNlNS4uYmY2OGQ4NiAxMDA2NDQNCi0tLSBh
L2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1h
bi9xbWFuLmMNCkBAIC0xMDE4LDYgKzEwMTgsMjAgQEAgc3RhdGljIGlubGluZSB2b2lkIHB1dF9h
ZmZpbmVfcG9ydGFsKHZvaWQpDQogCXB1dF9jcHVfdmFyKHFtYW5fYWZmaW5lX3BvcnRhbCk7DQog
fQ0KIA0KKw0KK3N0YXRpYyBpbmxpbmUgc3RydWN0IHFtYW5fcG9ydGFsICpnZXRfcG9ydGFsX2Zv
cl9jaGFubmVsKHUxNiBjaGFubmVsKQ0KK3sNCisJaW50IGk7DQorDQorCWZvciAoaSA9IDA7IGkg
PCBudW1fcG9zc2libGVfY3B1cygpOyBpKyspIHsNCisJCWlmIChhZmZpbmVfcG9ydGFsc1tpXSAm
Jg0KKwkJICAgIGFmZmluZV9wb3J0YWxzW2ldLT5jb25maWctPmNoYW5uZWwgPT0gY2hhbm5lbCkN
CisJCQlyZXR1cm4gYWZmaW5lX3BvcnRhbHNbaV07DQorCX0NCisNCisJcmV0dXJuIE5VTEw7DQor
fQ0KKw0KIHN0YXRpYyBzdHJ1Y3Qgd29ya3F1ZXVlX3N0cnVjdCAqcW1fcG9ydGFsX3dxOw0KIA0K
IGludCBxbWFuX2RxcnJfc2V0X2l0aHJlc2goc3RydWN0IHFtYW5fcG9ydGFsICpwb3J0YWwsIHU4
IGl0aHJlc2gpDQpAQCAtMjYwMSw3ICsyNjE1LDcgQEAgc3RhdGljIGludCBfcW1fZHFycl9jb25z
dW1lX2FuZF9tYXRjaChzdHJ1Y3QgcW1fcG9ydGFsICpwLCB1MzIgZnFpZCwgaW50IHMsDQogDQog
aW50IHFtYW5fc2h1dGRvd25fZnEodTMyIGZxaWQpDQogew0KLQlzdHJ1Y3QgcW1hbl9wb3J0YWwg
KnA7DQorCXN0cnVjdCBxbWFuX3BvcnRhbCAqcCwgKmNoYW5uZWxfcG9ydGFsOw0KIAlzdHJ1Y3Qg
ZGV2aWNlICpkZXY7DQogCXVuaW9uIHFtX21jX2NvbW1hbmQgKm1jYzsNCiAJdW5pb24gcW1fbWNf
cmVzdWx0ICptY3I7DQpAQCAtMjY0MSwxNyArMjY1NSwyOCBAQCBpbnQgcW1hbl9zaHV0ZG93bl9m
cSh1MzIgZnFpZCkNCiAJY2hhbm5lbCA9IHFtX2ZxZF9nZXRfY2hhbigmbWNyLT5xdWVyeWZxLmZx
ZCk7DQogCXdxID0gcW1fZnFkX2dldF93cSgmbWNyLT5xdWVyeWZxLmZxZCk7DQogDQorCWlmIChj
aGFubmVsIDwgcW1fY2hhbm5lbF9wb29sMSkgew0KKwkJY2hhbm5lbF9wb3J0YWwgPSBnZXRfcG9y
dGFsX2Zvcl9jaGFubmVsKGNoYW5uZWwpOw0KKwkJaWYgKGNoYW5uZWxfcG9ydGFsID09IE5VTEwp
IHsNCisJCQlkZXZfZXJyKGRldiwgIkNhbid0IGZpbmQgcG9ydGFsIGZvciBkZWRpY2F0ZWQgY2hh
bm5lbCAweCV4XG4iLA0KKwkJCQljaGFubmVsKTsNCisJCQlyZXQgPSAtRUlPOw0KKwkJCWdvdG8g
b3V0Ow0KKwkJfQ0KKwl9IGVsc2UNCisJCWNoYW5uZWxfcG9ydGFsID0gcDsNCisNCiAJc3dpdGNo
IChzdGF0ZSkgew0KIAljYXNlIFFNX01DUl9OUF9TVEFURV9URU5fU0NIRUQ6DQogCWNhc2UgUU1f
TUNSX05QX1NUQVRFX1RSVV9TQ0hFRDoNCiAJY2FzZSBRTV9NQ1JfTlBfU1RBVEVfQUNUSVZFOg0K
IAljYXNlIFFNX01DUl9OUF9TVEFURV9QQVJLRUQ6DQogCQlvcmxfZW1wdHkgPSAwOw0KLQkJbWNj
ID0gcW1fbWNfc3RhcnQoJnAtPnApOw0KKwkJbWNjID0gcW1fbWNfc3RhcnQoJmNoYW5uZWxfcG9y
dGFsLT5wKTsNCiAJCXFtX2ZxaWRfc2V0KCZtY2MtPmZxLCBmcWlkKTsNCi0JCXFtX21jX2NvbW1p
dCgmcC0+cCwgUU1fTUNDX1ZFUkJfQUxURVJfUkVUSVJFKTsNCi0JCWlmICghcW1fbWNfcmVzdWx0
X3RpbWVvdXQoJnAtPnAsICZtY3IpKSB7DQotCQkJZGV2X2VycihkZXYsICJRVUVSWUZRX05QIHRp
bWVvdXRcbiIpOw0KKwkJcW1fbWNfY29tbWl0KCZjaGFubmVsX3BvcnRhbC0+cCwgUU1fTUNDX1ZF
UkJfQUxURVJfUkVUSVJFKTsNCisJCWlmICghcW1fbWNfcmVzdWx0X3RpbWVvdXQoJmNoYW5uZWxf
cG9ydGFsLT5wLCAmbWNyKSkgew0KKwkJCWRldl9lcnIoZGV2LCAiQUxURVJfUkVUSVJFIHRpbWVv
dXRcbiIpOw0KIAkJCXJldCA9IC1FVElNRURPVVQ7DQogCQkJZ290byBvdXQ7DQogCQl9DQpAQCAt
MjY1OSw2ICsyNjg0LDkgQEAgaW50IHFtYW5fc2h1dGRvd25fZnEodTMyIGZxaWQpDQogCQkJICAg
IFFNX01DUl9WRVJCX0FMVEVSX1JFVElSRSk7DQogCQlyZXMgPSBtY3ItPnJlc3VsdDsgLyogTWFr
ZSBhIGNvcHkgYXMgd2UgcmV1c2UgTUNSIGJlbG93ICovDQogDQorCQlpZiAocmVzID09IFFNX01D
Ul9SRVNVTFRfT0spDQorCQkJZHJhaW5fbXJfZnFybmkoJmNoYW5uZWxfcG9ydGFsLT5wKTsNCisN
CiAJCWlmIChyZXMgPT0gUU1fTUNSX1JFU1VMVF9QRU5ESU5HKSB7DQogCQkJLyoNCiAJCQkgKiBO
ZWVkIHRvIHdhaXQgZm9yIHRoZSBGUVJOIGluIHRoZSBtZXNzYWdlIHJpbmcsIHdoaWNoDQpAQCAt
MjY4OCwyMSArMjcxNiwyNSBAQCBpbnQgcW1hbl9zaHV0ZG93bl9mcSh1MzIgZnFpZCkNCiAJCQl9
DQogCQkJLyogU2V0IHRoZSBzZHFjciB0byBkcmFpbiB0aGlzIGNoYW5uZWwgKi8NCiAJCQlpZiAo
Y2hhbm5lbCA8IHFtX2NoYW5uZWxfcG9vbDEpDQotCQkJCXFtX2RxcnJfc2RxY3Jfc2V0KCZwLT5w
LA0KKwkJCQlxbV9kcXJyX3NkcWNyX3NldCgmY2hhbm5lbF9wb3J0YWwtPnAsDQogCQkJCQkJICBR
TV9TRFFDUl9UWVBFX0FDVElWRSB8DQogCQkJCQkJICBRTV9TRFFDUl9DSEFOTkVMU19ERURJQ0FU
RUQpOw0KIAkJCWVsc2UNCi0JCQkJcW1fZHFycl9zZHFjcl9zZXQoJnAtPnAsDQorCQkJCXFtX2Rx
cnJfc2RxY3Jfc2V0KCZjaGFubmVsX3BvcnRhbC0+cCwNCiAJCQkJCQkgIFFNX1NEUUNSX1RZUEVf
QUNUSVZFIHwNCiAJCQkJCQkgIFFNX1NEUUNSX0NIQU5ORUxTX1BPT0xfQ09OVg0KIAkJCQkJCSAg
KGNoYW5uZWwpKTsNCiAJCQlkbyB7DQogCQkJCS8qIEtlZXAgZHJhaW5pbmcgRFFSUiB3aGlsZSBj
aGVja2luZyB0aGUgTVIqLw0KLQkJCQlxbV9kcXJyX2RyYWluX25vbWF0Y2goJnAtPnApOw0KKwkJ
CQlxbV9kcXJyX2RyYWluX25vbWF0Y2goJmNoYW5uZWxfcG9ydGFsLT5wKTsNCiAJCQkJLyogUHJv
Y2VzcyBtZXNzYWdlIHJpbmcgdG9vICovDQotCQkJCWZvdW5kX2Zxcm4gPSBxbV9tcl9kcmFpbigm
cC0+cCwgRlFSTik7DQorCQkJCWZvdW5kX2Zxcm4gPSBxbV9tcl9kcmFpbigmY2hhbm5lbF9wb3J0
YWwtPnAsDQorCQkJCQkJCSBGUVJOKTsNCiAJCQkJY3B1X3JlbGF4KCk7DQogCQkJfSB3aGlsZSAo
IWZvdW5kX2Zxcm4pOw0KKwkJCS8qIFJlc3RvcmUgU0RRQ1IgKi8NCisJCQlxbV9kcXJyX3NkcWNy
X3NldCgmY2hhbm5lbF9wb3J0YWwtPnAsDQorCQkJCQkgIGNoYW5uZWxfcG9ydGFsLT5zZHFjcik7
DQogDQogCQl9DQogCQlpZiAocmVzICE9IFFNX01DUl9SRVNVTFRfT0sgJiYNCkBAIC0yNzMzLDkg
KzI3NjUsOCBAQCBpbnQgcW1hbl9zaHV0ZG93bl9mcSh1MzIgZnFpZCkNCiAJCQkJICogV2FpdCBm
b3IgYSBkZXF1ZXVlIGFuZCBwcm9jZXNzIHRoZSBkZXF1ZXVlcywNCiAJCQkJICogbWFraW5nIHN1
cmUgdG8gZW1wdHkgdGhlIHJpbmcgY29tcGxldGVseQ0KIAkJCQkgKi8NCi0JCQl9IHdoaWxlIChx
bV9kcXJyX2RyYWluX3dhaXQoJnAtPnAsIGZxaWQsIEZRX0VNUFRZKSk7DQorCQkJfSB3aGlsZSAo
IXFtX2RxcnJfZHJhaW5fd2FpdCgmcC0+cCwgZnFpZCwgRlFfRU1QVFkpKTsNCiAJCX0NCi0JCXFt
X2RxcnJfc2RxY3Jfc2V0KCZwLT5wLCAwKTsNCiANCiAJCXdoaWxlICghb3JsX2VtcHR5KSB7DQog
CQkJLyogV2FpdCBmb3IgdGhlIE9STCB0byBoYXZlIGJlZW4gY29tcGxldGVseSBkcmFpbmVkICov
DQotLSANCjIuNy40DQoNCg==
