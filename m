Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6C117F3EE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 10:44:57 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48c9DN6w8VzDqRY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 20:44:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48c9Bg0jhqzDqQb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 20:43:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=XhMmWWIi; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48c9Bf5KYhz8tQW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 20:43:22 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48c9Bf51jxz9sNg; Tue, 10 Mar 2020 20:43:22 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=40.107.236.50;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=infinera.com
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2050.outbound.protection.outlook.com [40.107.236.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48c9BT6KbHz9s3x
 for <linuxppc-dev@ozlabs.org>; Tue, 10 Mar 2020 20:43:11 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcNI6zAcIje5v+unhGQh2lL8j/CAKz9ffBAJzjDBqnoEvn3FBaHlLE+ZATI9kHMPMmtwc4EJUZccKYXByRLI0DFoqYEQ9Sk2xni3lt4W3K9XsylWTQzPaqtMhgvbs4XOoHZW0gi4qqiW4tv+oojf1S+Plja51gAE0W+zc5xcT+q3INN21UvzrmGt8FAf/LvlOxBEw9WqakeIVzuz+DaEw3cpJMSMVqviN3csM565/1c3Zh05z3mqGIEkYCgNRySRUQU6Xpo5Z+wdxcfKCt2mR6K8F57YSdsZy8FnoTMsh8mSQ1oZbTJKBzAYgmlfSm/2xJcZhAEGpqdPIIfGVjLvOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKKibb/uFQKn6cWtlu6rXqsYvgK7BFqRACAcYL9atIw=;
 b=UDUQO3EGHiS0rwzE4LozBcnERUOClOvemOfCT+h9yuBVCFHcuAmQmgB7wVBTX9EjtoZTkFO5ZIVl3LYR6vMbUlW/9TFOsbFGVz3vwm7VsipjFv+th1SnugpSxgWY3qWlz2M7D6oAWEK/DXaDTwGYvMaESeUhxyyOOrmvhM0nWHzU3iQibSXqxbjnMRcGNw5l/Mnlbv6suSo5MfhVkUye9WJWXmYDeWvxkYQ5XOWFd+JOe0EFRtlqdSHCYRGOSJYI/N4zRA11igPpuD1pLgsHKgRUjm1PkUN7ye/Uquq+sWmvi8+AZfjL6PCoGYYOM+AzyK8Mv8mqA5rm4qud9lSi8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKKibb/uFQKn6cWtlu6rXqsYvgK7BFqRACAcYL9atIw=;
 b=XhMmWWIidprnYV0nsMxASUFnhQbZ29rxYP2Uf+Es7ACZHwcGWqzcXPKiKOzTv/uqL9A43f1zm2QqcrlwaxsXvLpizgLGVSTLsg0vVS4rfUgodF/iBro752AOmtXyRggrmOonIFDCy5VCYPa4PoU8Sg6/RRW+DY/qEpaDZAeUrTc=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB4084.namprd10.prod.outlook.com (2603:10b6:408:b0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.17; Tue, 10 Mar
 2020 09:43:07 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::1940:6f91:a80e:b47%5]) with mapi id 15.20.2793.013; Tue, 10 Mar 2020
 09:43:07 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: CDC ethernet gadget: complete system freeze
Thread-Topic: CDC ethernet gadget: complete system freeze
Thread-Index: AQHV9sBN2nbfIelzrUOxTHcGd7CUkg==
Date: Tue, 10 Mar 2020 09:43:07 +0000
Message-ID: <17c670a4386bc1cfa3db207c6961d95f3378ad64.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.35.92 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Joakim.Tjernlund@infinera.com; 
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 89ecb10b-cfca-4fb8-0494-08d7c4d7705d
x-ms-traffictypediagnostic: BN8PR10MB4084:
x-microsoft-antispam-prvs: <BN8PR10MB40845653CD753761D49D1DE0F4FF0@BN8PR10MB4084.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 033857D0BD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39850400004)(346002)(136003)(376002)(366004)(189003)(199004)(5660300002)(316002)(4744005)(478600001)(6512007)(66476007)(71200400001)(64756008)(86362001)(91956017)(76116006)(66556008)(66946007)(110136005)(66446008)(6506007)(2616005)(6486002)(2906002)(186003)(26005)(8936002)(36756003)(81156014)(81166006)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR10MB4084;
 H:BN8PR10MB3540.namprd10.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: infinera.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FxTqwhHrX7OVkgcMwWA6owEni7sW2948mV3zlagkJCr0DliAo9VU3yuqiE0clz9sySCl/6zgH3DnbueJhXr1e3YE90nQtoHG+rSu1KatCQIpTT0MgyhM9tgOxt0c/tRlCyKirnfkuZT6Ls5mGY8dvRar1GgJ8MkZsndf4Z/mrm8P+0UJVo1j9NpwjzlzjfSEI6lpqmANLVgpkqxNqd1GxMmIUfoDfgqDDmc0b+MX7tZAA+mcsA2Cgqm3slV0HZaKvz26s7v52EvtlwnPyKNc0OKOXV3sRkh2a/KfH8d3o5YfqkZOfRwikDWsCzv89tI9fHKYSq/tyHIXzC0wip/iD4Er/Ffh5dRH9z6YwVSLUGsPWejMLawDAzaf6q3atynfNdhEZaIY6vkoOsMhVP7LuyFaz5oZ+WBVMgE4oA/2f3AAlavbq5bV/pZD2NnxZ1Zy
x-ms-exchange-antispam-messagedata: JB/6HeNmml1Q+6TLiYm8c2GW3ZODeJYNz8I22qeOfgHrIVr7pUR/aK7RnYcAd4eM/RmfSg6Yq4sHkVTRmDFcCYBhh8XAKtC1EYDYLyYynHwHd0jjL+pWIIuhhlRIy1CYgJET7RkJQRyvIhpBbs5bpg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <AC15D0D80651A24E83DC6E0B13CC7543@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89ecb10b-cfca-4fb8-0494-08d7c4d7705d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2020 09:43:07.7302 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w/YywIIeb3lJ363mnE+zAx3mM56W/iFn70aJZT8tfbUEq1Faq88GNFQjcXCxcXrycxWzzhm8VJlqGXJN+yptAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB4084
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

V2UgaGF2ZSBhbiBlbWJlZGRlZCBUMTA0MiBOWFAgQ0RDIGV0aGVybmV0IGdhZGdldCB3aGljaCBz
ZWVtcyB0byBjb21wbGV0ZWx5IGZyZWV6ZSB3aGVuIGFuDQp1c2IwIEkvRiBpcyBlc3RhYmxpc2hl
ZCBhbmQgb25lIGRvIDEgb2YgdHdvIHRoaW5nczoNCiAxKSByZWJvb3QgdGhlIGNvbm5lY3RlZCBM
aW51eCBsYXB0b3AgLT4gQ0RDIGdhZGdldCBhcHBlYXJzIHRvIGVudGVyIGNvbXBsZXRlIHN5c3Rl
bSBmcmVlemUuDQogMikgb24gbGFwdG9wLCBpZmNvbmZpZyB1c2IwIGRvd247IHJtbW9kIGNkY19l
dGhlciAtPiBDREMgZ2FnZXQgZnJlZXplcw0KDQpJIGNhbm5vdCBmaW5ucyBhbmQgT09QUyBvciBv
dGhlciB0cmFjZSBpbiBjb25zb2xlIG9yIHN5c2xvZy4gSSBjb3VsZCByZWFsbHkgdXNlIHNvbSBp
ZGVhcyBoZXJlLg0KTGludXgga2VybmVsIDQuMTkuMTA4ICg0LjE5Ljc2IGhhcyB0aGUgc2FtZSBp
c3N1ZSkNCg0KIEpvY2tlDQoNCg==
