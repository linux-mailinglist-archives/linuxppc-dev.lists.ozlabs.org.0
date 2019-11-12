Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E84F8A16
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 09:03:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47C0cb4SZgzDr22
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 19:03:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe08::60f;
 helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="QhMCbvXC"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03on060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe08::60f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47C0ZJ4H9KzF5HN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 19:01:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gHeJzBTh/Ly9OObMJJHq894B4brw2zHK8xZ3TbMHLhER6+XmqOMPTiTib0TrsZs0rX5K1l0i16rn6kBxpMwPG0YXpsTACJ9830zQI6cSAg3acZ60To4cGpqOQpSYYvv9tuzXJp18yAhtdhZ7szyj3FMH6FpuUmP/gA6BAPN93GPTPcy6Y/CpOhB0UcBnf7wFXHPSmg91QNTRMyo8pRy3GRU1DE8G/yTjyllA84JpehMdqxtYyfCL2UJ9Jn6pOpNH8gqQKlSpKu+brkZjYYMC36hVSZkcTqq0eeJ/D5nEMvJVesWjC2iHe8sdZBXVLmSaFPStCPdNvgYq0BktE9lwjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyfBGVihnHRqbAekVYyajBvt0kbJJHAIH4iK6D7lew=;
 b=PpbXd/frCdJPcVe8uZotGizDFwq8mel7TWXxR4qJIRx+MbYKlb98eT1Pfs3mdVWmyrg4BEDk9GFuG/hgsrmvn7FmIgKfE0PO6TshBJNuyk8+GrY/jgG7fsSDg+CA3j0r6Ag+zZyo1AmJwF/NsfBh6kg0FDmZlxxATrE3GHukR8CNxFxMl+GdJgFFj7kFM8o25ezd9x9tkwAP6eMY0Lm9XyDmDwVw3ct0nP2ozNYYVLH5c18aFwKTL9JQ1IrjoLR/2TnqfA06kp1tr0x9w6m2730xznqdCukfAktnZbBszTe5cvrruRxAy6qSG5kNcTcVqjSVuvlKXVI5+YBn4/DxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yOyfBGVihnHRqbAekVYyajBvt0kbJJHAIH4iK6D7lew=;
 b=QhMCbvXC/UT8xhTrfrkxR88qXOk6/rirYUaVhMfxpEMU6WcFol5MtTz36T1qPttwfoDOP5kGYsZCTJvaGoN+1JRlmlYgFBMWyemmBVGJUcJU4wymGkKAbtQglSSHIbfL4XDx3A8rMJfH4uhKPdPdWMBRcG2tWX1ihYh1MMcr2J0=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (10.255.118.26) by
 VE1PR04MB6445.eurprd04.prod.outlook.com (20.179.232.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.22; Tue, 12 Nov 2019 08:01:23 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9d62:61ea:616e:9996]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::9d62:61ea:616e:9996%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 08:01:23 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Leo Li <leoyang.li@nxp.com>, 
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: RE: [PATCH v4 34/47] soc: fsl: qe: change return type of
 cpm_muram_alloc() to s32
Thread-Topic: [PATCH v4 34/47] soc: fsl: qe: change return type of
 cpm_muram_alloc() to s32
Thread-Index: AQHVljS9t36aq5kBp0CU3JvhgX4m3aeHMKSw
Date: Tue, 12 Nov 2019 08:01:23 +0000
Message-ID: <VE1PR04MB6768D483426A2B6CC04E069D91770@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <20191108130123.6839-1-linux@rasmusvillemoes.dk>
 <20191108130123.6839-35-linux@rasmusvillemoes.dk>
In-Reply-To: <20191108130123.6839-35-linux@rasmusvillemoes.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7e5dcf51-2943-40f9-f7b0-08d767468301
x-ms-traffictypediagnostic: VE1PR04MB6445:|VE1PR04MB6445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB64450489562B49EFFC8F7BBA91770@VE1PR04MB6445.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(366004)(346002)(396003)(199004)(189003)(13464003)(316002)(6116002)(3846002)(2906002)(14454004)(81166006)(66556008)(66476007)(66446008)(33656002)(66946007)(76116006)(110136005)(99286004)(64756008)(25786009)(81156014)(8936002)(8676002)(478600001)(54906003)(6436002)(102836004)(446003)(7696005)(11346002)(26005)(4326008)(9686003)(4744005)(476003)(256004)(229853002)(186003)(66066001)(6506007)(53546011)(76176011)(71190400001)(71200400001)(305945005)(74316002)(7736002)(52536014)(86362001)(5660300002)(486006)(6246003)(55016002)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6445;
 H:VE1PR04MB6768.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WrrQ7ORjpbhazxeh75KdLHvDdnaN+2sOO7FzeT0jDK22g9ZaPmmRfNpwKv3QNECAeuHSPLbsxvZHugV+Bvqk9yky6cF8jTHN5xugrvHlTXgGxOa9nEfPpvoHFdxzv/IaiT7Zy0u9zs5WkdmujZVYHAXQTs49HsehTwAIRMCahBfqKWlcFI9moteszHFlukvuff1aRPRCWlOQPZx9R2yMvb0GP8hcr2aSe7MUGI5iLt8WofhuCMwdAspLIWZEISwCwtLfLjDuPDvgauNZhDSvILBMfNGaY29P2/vUuCTwXI0biwNNGuBTN2ebW0hP4VUjFbVjBPuZwlGWnfsI+ZvB0QWUpO/k4qHKluha1HQT8cyzBrjQPWG0vj7TQuj00fyzAYYzimP8OvUegNSJRY+g3tNkGse0+L5//smWBG661i4sE+Kj+82HvQ4mYfZa5LtC
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5dcf51-2943-40f9-f7b0-08d767468301
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 08:01:23.8311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8DMh8dQ16LtpBd87jL597Jrw9ODIhwu0J5cd7WRb0wF8r8VtpphxhvcPhQ+mU1CqKsms31RicAhljyZvJoYqig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6445
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gRnJpLCBOb3YgOCwgMjAxOSBhdCAyMTowMSBSYXNtdXMgVmlsbGVtb2VzIDxsaW51eEByYXNt
dXN2aWxsZW1vZXMuZGs+IHdyb3RlOg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+
IEZyb206IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9lcy5kaz4NCj4gU2Vu
dDogMjAxOcTqMTHUwjjI1SAyMTowMQ0KPiBUbzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAu
Y29tPjsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+Ow0KPiBDaHJpc3RvcGhlIExlcm95IDxj
aHJpc3RvcGhlLmxlcm95QGMtcy5mcj4NCj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IFNjb3R0IFdvb2QgPG9zc0BidXNlcnJvci5uZXQ+OyBSYXNtdXMN
Cj4gVmlsbGVtb2VzIDxsaW51eEByYXNtdXN2aWxsZW1vZXMuZGs+DQo+IFN1YmplY3Q6IFtQQVRD
SCB2NCAzNC80N10gc29jOiBmc2w6IHFlOiBjaGFuZ2UgcmV0dXJuIHR5cGUgb2YNCj4gY3BtX211
cmFtX2FsbG9jKCkgdG8gczMyDQo+IA0KPiAtdW5zaWduZWQgbG9uZyBjcG1fbXVyYW1fYWxsb2Nf
Zml4ZWQodW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxvbmcNCj4gc2l6ZSkNCj4gK3Mz
MiBjcG1fbXVyYW1fYWxsb2NfZml4ZWQodW5zaWduZWQgbG9uZyBvZmZzZXQsIHVuc2lnbmVkIGxv
bmcgc2l6ZSkNCj4gIHsNCj4gLQl1bnNpZ25lZCBsb25nIHN0YXJ0Ow0KPiArCWxvbmcgc3RhcnQ7
DQo+ICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gIAlzdHJ1Y3QgZ2VucG9vbF9kYXRhX2ZpeGVk
IG11cmFtX3Bvb2xfZGF0YV9maXhlZDsNCiANCiJzdGFydCIgc2hvdWxkIGJlIHMzMiBoZXJlIHRv
bz8NCg0KDQpCZXN0IFJlZ2FyZHMNClFpYW5nIFpoYW8NCg0K
