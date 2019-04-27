Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 133FFB40D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 19:12:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44ryCS2jWGzDqcc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Apr 2019 03:12:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=infinera.com
 (client-ip=2a01:111:f400:fe49::609;
 helo=nam03-dm3-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.b="TCzeSQ/v";
 dkim-atps=neutral
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam03on0609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe49::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44ryB05Sy7zDqWJ
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Apr 2019 03:11:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQtJl4bY1DuoaHrUkMBL7N6xDJZq7S7FIB5cMjqNewg=;
 b=TCzeSQ/vHhbIDdZwDmat/CNk2Nks6JGOkm4QXPM87FOppZvRCHQjbYBMhIoga/95SmoZZe3o+XIWSWjHb2csURwpMV7Ophuzvy0KG8330XDsPJfORWGB2YXkfHEz0uGGb+ydgnHuCdarrxrH6YORUBT3MNQ9VUxdSlkxVZBpATA=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (20.179.78.205) by
 BN8PR10MB3490.namprd10.prod.outlook.com (20.179.78.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Sat, 27 Apr 2019 17:10:53 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::51e7:a757:afa8:f4cf]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::51e7:a757:afa8:f4cf%7]) with mapi id 15.20.1835.010; Sat, 27 Apr 2019
 17:10:53 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "madalin.bucur@nxp.com"
 <madalin.bucur@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "laurentiu.tudor@nxp.com" <laurentiu.tudor@nxp.com>, "roy.pledge@nxp.com"
 <roy.pledge@nxp.com>, "camelia.groza@nxp.com" <camelia.groza@nxp.com>
Subject: Re: [PATCH v2 9/9] dpaa_eth: fix SG frame cleanup
Thread-Topic: [PATCH v2 9/9] dpaa_eth: fix SG frame cleanup
Thread-Index: AQHU/MpTw42IuR0fykCaI1+07jqDiqZQPr+A
Date: Sat, 27 Apr 2019 17:10:53 +0000
Message-ID: <2c6f5d170edab346e0a87b1dfeb12e2f65801685.camel@infinera.com>
References: <20190427071031.6563-1-laurentiu.tudor@nxp.com>
 <20190427071031.6563-10-laurentiu.tudor@nxp.com>
In-Reply-To: <20190427071031.6563-10-laurentiu.tudor@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a2bf90b-4bf3-4692-cb14-08d6cb334df7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:BN8PR10MB3490; 
x-ms-traffictypediagnostic: BN8PR10MB3490:
x-microsoft-antispam-prvs: <BN8PR10MB34905036363513E5A4F02C68F43F0@BN8PR10MB3490.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0020414413
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(3846002)(6116002)(2201001)(68736007)(256004)(81166006)(6512007)(54906003)(8676002)(2906002)(8936002)(110136005)(81156014)(36756003)(6246003)(66476007)(64756008)(66556008)(66446008)(316002)(86362001)(229853002)(102836004)(66066001)(53936002)(6486002)(2501003)(14444005)(91956017)(66946007)(73956011)(76116006)(6436002)(2616005)(305945005)(486006)(6506007)(97736004)(71190400001)(478600001)(4326008)(7736002)(5660300002)(476003)(76176011)(14454004)(118296001)(72206003)(99286004)(7416002)(186003)(26005)(25786009)(446003)(11346002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB3490;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: h1A6YhzC8ddJWf79OUo4YI/37lwKzz8kkCAzI+Wvbmn5Qx4PsFp4nPg9K3eOvMV+EDsPamR4VQJR1EOLDeiY9zZhWvyGuaFoosGt3gwvF6z+mrcgvbEAv7j2fhNpdEAzxvlACB47/r5G3aLx5Tmd2ojN4flnheSHbj6XMYpfXs0X30YArUPatOeeApeZ/ubrqp1Z2tFm/eXA6VEHTKq0mBvGV/M2fzdrUK3D0FFK3GG/fPoflzEEM3j2KR/C1zlboXh33rBFaBbUtYurndgwBd8/0ALu2EkTZUve+x7T05sYy0WXkBqzoMX0aKm/0jXsuXcyJhucTTKg3CdzN0718JJb0p8zuVJ3mfIi/Q4wg2VON6ws+1QgQ/nUBeIYRChn8NNw2h3pZtKqS8lcTv7Hb7M/6Z4FmqcBqMFuYkwNRnE=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A981E3F453F6540BDBD9A24364D128E@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2bf90b-4bf3-4692-cb14-08d6cb334df7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2019 17:10:53.0418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3490
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
Cc: "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "davem@davemloft.net" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gU2F0LCAyMDE5LTA0LTI3IGF0IDEwOjEwICswMzAwLCBsYXVyZW50aXUudHVkb3JAbnhwLmNv
bSB3cm90ZToNCj4gRnJvbTogTGF1cmVudGl1IFR1ZG9yIDxsYXVyZW50aXUudHVkb3JAbnhwLmNv
bT4NCj4gDQo+IEZpeCBpc3N1ZSB3aXRoIHRoZSBlbnRyeSBpbmRleGluZyBpbiB0aGUgc2cgZnJh
bWUgY2xlYW51cCBjb2RlIGJlaW5nDQo+IG9mZi1ieS0xLiBUaGlzIHByb2JsZW0gc2hvd2VkIHVw
IHdoZW4gZG9pbmcgc29tZSBiYXNpYyBpcGVyZiB0ZXN0cyBhbmQNCj4gbWFuaWZlc3RlZCBpbiB0
cmFmZmljIGNvbWluZyB0byBhIGhhbHQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBMYXVyZW50aXUg
VHVkb3IgPGxhdXJlbnRpdS50dWRvckBueHAuY29tPg0KPiBBY2tlZC1ieTogTWFkYWxpbiBCdWN1
ciA8bWFkYWxpbi5idWN1ckBueHAuY29tPg0KDQpXYXNuJ3QgdGhpcyBhIHN0YWJsZSBjYW5kaWRh
dGUgdG9vPw0KDQo+IC0tLQ0KPiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvZnJlZXNjYWxlL2RwYWEv
ZHBhYV9ldGguYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVz
Y2FsZS9kcGFhL2RwYWFfZXRoLmMgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZHBh
YS9kcGFhX2V0aC5jDQo+IGluZGV4IGRhZWRlNzI3Mjc2OC4uNDA0MjBlZGM5Y2U2IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvZHBhYS9kcGFhX2V0aC5jDQo+
ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS9kcGFhL2RwYWFfZXRoLmMNCj4g
QEAgLTE2NjMsNyArMTY2Myw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2tfYnVmZiAqZHBhYV9jbGVhbnVw
X3R4X2ZkKGNvbnN0IHN0cnVjdCBkcGFhX3ByaXYgKnByaXYsDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHFtX3NnX2VudHJ5X2dldF9sZW4oJnNndFswXSksIGRtYV9kaXIpOw0K
PiANCj4gICAgICAgICAgICAgICAgIC8qIHJlbWFpbmluZyBwYWdlcyB3ZXJlIG1hcHBlZCB3aXRo
IHNrYl9mcmFnX2RtYV9tYXAoKSAqLw0KPiAtICAgICAgICAgICAgICAgZm9yIChpID0gMTsgaSA8
IG5yX2ZyYWdzOyBpKyspIHsNCj4gKyAgICAgICAgICAgICAgIGZvciAoaSA9IDE7IGkgPD0gbnJf
ZnJhZ3M7IGkrKykgew0KPiAgICAgICAgICAgICAgICAgICAgICAgICBXQVJOX09OKHFtX3NnX2Vu
dHJ5X2lzX2V4dCgmc2d0W2ldKSk7DQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBkbWFf
dW5tYXBfcGFnZShkZXYsIHFtX3NnX2FkZHIoJnNndFtpXSksDQo+IC0tDQo+IDIuMTcuMQ0KPiAN
Cg0K
