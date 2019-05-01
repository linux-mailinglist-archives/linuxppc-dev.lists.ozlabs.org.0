Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA710660
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 11:31:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vCnD6M7FzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:30:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.131; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="ICMnzefB"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20131.outbound.protection.outlook.com [40.107.2.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vClG03htzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 19:29:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEHOss+tChlyXXqJGO0y71EE80c9sJqiMhQ3L42wg/E=;
 b=ICMnzefBkqPEe1WQ1oDKxGJLNa49EFVdRve5P9kLhJJKgKtOoIRP/BjgLY+dxtkmne0OS5mvcI0hxUUJeOLLqtzxOnKEwHjbGEXoAgdPTE6N/3qB77b7+x3nVaNQuWWrxkq88APcOPLNZAyeJ4f+tnUf+Kywm8W/+1XmPjXbeH0=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM (20.177.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 09:29:02 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:29:02 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Topic: [PATCH v2 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Index: AQHVAABPKUiIhooNmUW5rKx1Bivkwg==
Date: Wed, 1 May 2019 09:29:01 +0000
Message-ID: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: f816a075-9126-4083-d6bc-08d6ce1771db
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2143; 
x-ms-traffictypediagnostic: VI1PR10MB2143:
x-microsoft-antispam-prvs: <VI1PR10MB214388D2EA8446B203679CF18A3B0@VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(376002)(136003)(39850400004)(346002)(396003)(366004)(189003)(199004)(14454004)(81166006)(110136005)(54906003)(26005)(68736007)(8676002)(6512007)(4326008)(8976002)(486006)(74482002)(71200400001)(2906002)(7416002)(6486002)(72206003)(186003)(316002)(478600001)(2501003)(36756003)(6436002)(71190400001)(25786009)(1076003)(6506007)(2616005)(305945005)(3846002)(44832011)(256004)(11346002)(6116002)(5660300002)(8936002)(14444005)(446003)(476003)(50226002)(76176011)(42882007)(7736002)(99286004)(66446008)(64756008)(53936002)(52116002)(107886003)(386003)(66066001)(66946007)(66476007)(102836004)(66556008)(81156014)(73956011)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2143;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YQmxWf/qj7b+Ws9BfLs0RRpmC1F41s5yP5TXw9h2GKXqYXM/DIbb3RHgmoXyx3dC/luIAGLQQg6hgV/NorahWeKQxI8Dzs2zy9/u7mWlvu9d6dUEhNHzVEUj31lRHDc1UPaBTA/P+K7N6DJ+SBMXPlDY2VMecEIHaKe9dYBfYcN+kA88rF58z7L+snjE9gv8stfgFsocGu/IJl9Cr9eWHWjEl5pvGF9g+bUZum82Ru//ITSOCcA21b7RkszLUBVAuZZSsci1EFw+bwL2zRMyXqARHVmkHR7QNpZRjNbI2DaSLFKnUi/rXFUfSjo6ApaXfMgdtiTjGKBbvsBJgYJFP9kML3RSiuxvzXugsYp+HDywKDR2cGcTjMmdQsHIIKONNRbn3krvUp4TYP6Ct1NKqJAFQgruyEHPaRTm6r0H80I=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: f816a075-9126-4083-d6bc-08d6ce1771db
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:29:01.9393 (UTC)
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

VGhpcyBzbWFsbCBzZXJpZXMgY29uc2lzdHMgb2Ygc29tZSBzbWFsbCBjbGVhbnVwcyBhbmQgc2lt
cGxpZmljYXRpb25zDQpvZiB0aGUgUVVJQ0MgZW5naW5lIGRyaXZlciwgYW5kIGludHJvZHVjZXMg
YSBuZXcgRFQgYmluZGluZyB0aGF0IG1ha2VzDQppdCBtdWNoIGVhc2llciB0byBzdXBwb3J0IG90
aGVyIHZhcmlhbnRzIG9mIHRoZSBRVUlDQyBlbmdpbmUgSVAgYmxvY2sNCnRoYXQgYXBwZWFycyBp
biB0aGUgd2lsZDogVGhlcmUncyBubyByZWFzb24gdG8gZXhwZWN0IGluIGdlbmVyYWwgdGhhdA0K
dGhlIG51bWJlciBvZiB2YWxpZCBTTlVNcyB1bmlxdWVseSBkZXRlcm1pbmVzIHRoZSBzZXQgb2Yg
c3VjaCwgc28gaXQncw0KYmV0dGVyIHRvIHNpbXBseSBsZXQgdGhlIGRldmljZSB0cmVlIHNwZWNp
ZnkgdGhlIHZhbHVlcyAoYW5kLA0KaW1wbGljaXRseSB2aWEgdGhlIGFycmF5IGxlbmd0aCwgYWxz
byB0aGUgY291bnQpLg0KDQp2MjoNCi0gQWRkcmVzcyBjb21tZW50cyBmcm9tIENocmlzdG9waGUg
TGVyb3kNCi0gQWRkIGhpcyBSZXZpZXdlZC1ieSB0byAxLzYgYW5kIDMvNg0KLSBTcGxpdCBEVCBi
aW5kaW5nIHVwZGF0ZSB0byBzZXBhcmF0ZSBwYXRjaCBhcyBwZXINCiAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy50eHQNCg0KDQpSYXNtdXMgVmls
bGVtb2VzICg2KToNCiAgc29jL2ZzbC9xZTogcWUuYzogZHJvcCB1c2VsZXNzIHN0YXRpYyBxdWFs
aWZpZXINCiAgc29jL2ZzbC9xZTogcWUuYzogcmVkdWNlIHN0YXRpYyBtZW1vcnkgZm9vdHByaW50
IGJ5IDEuN0sNCiAgc29jL2ZzbC9xZTogcWUuYzogaW50cm9kdWNlIHFlX2dldF9kZXZpY2Vfbm9k
ZSBoZWxwZXINCiAgZHQtYmluZGluZ3M6IHNvYy9mc2w6IHFlOiBkb2N1bWVudCBuZXcgZnNsLHFl
LXNudW1zIGJpbmRpbmcNCiAgc29jL2ZzbC9xZTogcWUuYzogc3VwcG9ydCBmc2wscWUtc251bXMg
cHJvcGVydHkNCiAgc29jL2ZzbC9xZTogcWUuYzogZm9sZCBxZV9nZXRfbnVtX29mX3NudW1zIGlu
dG8gcWVfc251bXNfaW5pdA0KDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1f
cWUvcWUudHh0IHwgICA4ICstDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgMTY0ICsrKysrKystLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNzIg
aW5zZXJ0aW9ucygrKSwgMTAwIGRlbGV0aW9ucygtKQ0KDQotLSANCjIuMjAuMQ0KDQo=
