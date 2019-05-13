Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF76D1B4B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:16:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452dYy5SlmzDqHK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="eKYL0sMA"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dWp6tL0zDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kcHpFzImfoNHIcaIfYWaLi2EfOhtgckMgFGWSQYoh4=;
 b=eKYL0sMAFYqiYQvh7KLk6lccVmsE277AG0CTOLMIkLsPGabM6m5rH3h6TWKzeX5qq3qeBV7EgyOLRDZNfhhS3qCzyW5zY5aQUW2RPAVWwvCLT6LKmoePuCML/ky7drjSib/mXdSxuaNPMNyCTLMLB+AZFCasi2ZckurdUa78vMI=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM (52.134.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 11:14:53 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:14:53 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Topic: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Index: AQHVCX0WBepWBUryR0K8DhsVu6ZcHg==
Date: Mon, 13 May 2019 11:14:53 +0000
Message-ID: <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::32) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db736e27-86cd-4627-fdc9-08d6d79438e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1950; 
x-ms-traffictypediagnostic: VI1PR10MB1950:
x-microsoft-antispam-prvs: <VI1PR10MB1950E6433CE689170FAD58DA8A0F0@VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:923;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(366004)(376002)(136003)(396003)(189003)(199004)(6512007)(66066001)(53936002)(107886003)(52116002)(68736007)(256004)(14444005)(71200400001)(71190400001)(76176011)(6436002)(478600001)(6486002)(1076003)(36756003)(5660300002)(72206003)(74482002)(446003)(81156014)(8676002)(14454004)(99286004)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(54906003)(11346002)(2616005)(42882007)(476003)(81166006)(44832011)(50226002)(486006)(8936002)(110136005)(8976002)(6116002)(7416002)(316002)(3846002)(2906002)(305945005)(7736002)(186003)(25786009)(102836004)(6506007)(386003)(4326008)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1950;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jQu9YgVtAYsCkN/Qj4KuvkVoAe31ZHNAN6ekniNKrtEHDR8HJlpMPJz/YgwkCu1ecqNYNyQQnKxGU0cKVK00+zUnQZtU9uxS1JbAuAC8GRCmWeAFjUPt41j4C8Gp9ZNlgUh99vPixRT6017TxAJG9rN9nX1/P0Bbkx15/sS6ekYTEYIZHUzBASCfY2Wo3ACQ53xHhj7ux0tS8tp3v1Cn0KUmWZeG4pggVUekRv0eVlnKBywdSUJXucGpGyFIOQwWQOnVaLf5AwUw6mXXW+vMrX4B4f+o0hC2SVIOs8dx/FzeczETVoqt/8QLNw/vlj+Iiy1RUI3/BrjrZKiIoWUM+mdey7/V89R69/iQlh2juWqE2OCDzn+xydavZzu27XouUNY+OLuHKSFo/4ELsXDk48Xk5LlasnbS+ARPVPU2wMA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: db736e27-86cd-4627-fdc9-08d6d79438e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:14:53.2363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1950
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
byB0aGUgY291bnQpLg0KDQpXaGljaCB0cmVlIHNob3VsZCB0aGlzIGdvIHRocm91Z2g/DQoNCnYz
Og0KLSBNb3ZlIGV4YW1wbGUgZnJvbSBjb21taXQgbG9nIGludG8gYmluZGluZyBkb2N1bWVudCAo
YWRhcHRpbmcgdG8NCiAgTVBDODM2MCB3aGljaCB0aGUgZXhpc3RpbmcgZXhhbXBsZSBwZXJ0YWlu
cyB0bykuDQotIEFkZCBtb3JlIHJldmlldyB0YWdzLg0KLSBGaXggbWlub3Igc3R5bGUgaXNzdWUu
DQoNCnYyOg0KLSBBZGRyZXNzIGNvbW1lbnRzIGZyb20gQ2hyaXN0b3BoZSBMZXJveQ0KLSBBZGQg
aGlzIFJldmlld2VkLWJ5IHRvIDEvNiBhbmQgMy82DQotIFNwbGl0IERUIGJpbmRpbmcgdXBkYXRl
IHRvIHNlcGFyYXRlIHBhdGNoIGFzIHBlcg0KICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3Mvc3VibWl0dGluZy1wYXRjaGVzLnR4dA0KDQpSYXNtdXMgVmlsbGVtb2VzICg2KToNCiAg
c29jL2ZzbC9xZTogcWUuYzogZHJvcCB1c2VsZXNzIHN0YXRpYyBxdWFsaWZpZXINCiAgc29jL2Zz
bC9xZTogcWUuYzogcmVkdWNlIHN0YXRpYyBtZW1vcnkgZm9vdHByaW50IGJ5IDEuN0sNCiAgc29j
L2ZzbC9xZTogcWUuYzogaW50cm9kdWNlIHFlX2dldF9kZXZpY2Vfbm9kZSBoZWxwZXINCiAgZHQt
YmluZGluZ3M6IHNvYy9mc2w6IHFlOiBkb2N1bWVudCBuZXcgZnNsLHFlLXNudW1zIGJpbmRpbmcN
CiAgc29jL2ZzbC9xZTogcWUuYzogc3VwcG9ydCBmc2wscWUtc251bXMgcHJvcGVydHkNCiAgc29j
L2ZzbC9xZTogcWUuYzogZm9sZCBxZV9nZXRfbnVtX29mX3NudW1zIGludG8gcWVfc251bXNfaW5p
dA0KDQogLi4uL2RldmljZXRyZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0IHwgIDEz
ICstDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTYz
ICsrKysrKystLS0tLS0tLS0tLQ0KIDIgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwg
OTkgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi4yMC4xDQoNCg==
