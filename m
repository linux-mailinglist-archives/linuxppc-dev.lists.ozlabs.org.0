Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2CF28FE18
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 08:13:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCG7G1JpmzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 17:13:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.46; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=peter.chen@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=NR4MJYrh; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10046.outbound.protection.outlook.com [40.107.1.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCG5K36TbzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 17:12:03 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab8W+IcvgjrQUPM05mRcyr69hddD9xPzt/lns03YD1/BZa2RNk5Y6qbCTJjKUmF8odbsow1fqmzU8QOFY5aueyK00urcEzog3+tGaF4QnS5nR+6J7yx6YrA7bC5uWQITFJb45FugoMA6euxIeBR7SDb/p+4VRogkc+x9UetfJjr/u5JdKzUAY2hu5I2Mw5u5AZfU5kK5hIdRoyKQtj2wZpjkQq7Y7iciv3ozmgp5MXNKC1z/kpMGJ5XSDiK2es+rcuDO0o2kO7nd8qRHkx/+NumhwkKcaD2ylEx888+tpIjdWlgtWQ98Eqcbrl/xNHQd/uWCGCbdpzmwF8xj48gxag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7NOpveRuKRSRfs5OCYAyn17b2OtFs6LCg3nCm0im5w=;
 b=DoyXC+sbZDdDmD/9flldGYpmGtf7nMop5z5i7hJntU4G/6EthiecSC9kopsXqts1yPn1GIOYn0VFX8qvmDMvjYy+1oxpbCbKBIthDtJQw9yy0Xhhs/22J1YrPS1+q540AMaa4Vxzsvt6/msgs8kNqVGqDtJ+56Dq6YyrkaulYeGME0aEvNarL8p1Rgyx+xN5t3UAjASaQ7bOB50TGmK6NoJwjQVjKx5P8HdMnD4H6Q76GA/IEqkiy0LbDTOmxKWz8duBdqlgfqYSU6gxXXs2I8xb9P11c4JuUnBPd3bjVZ+UYiskKiEX/u6rvdsr+REkUvYgwt4YGUGp8jawtvJqdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7NOpveRuKRSRfs5OCYAyn17b2OtFs6LCg3nCm0im5w=;
 b=NR4MJYrhPRLx4+tCfOii+XbWbNWM52C96Crx286NbxAry4MPHSGw1ZyiZUy2MNIg8SVTzlp5cFlcfFfRd0CpabSO+RkaJmxohMEr2XdLJoK04WEukjXy64JaS9uBfLAPzF4XYn9e2tW3KHjXu1QZErx/+fvXmsQgZWAMYBT5XcE=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4353.eurprd04.prod.outlook.com (2603:10a6:208:65::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Fri, 16 Oct
 2020 06:11:57 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::ad01:9b1c:3b4b:3a77%7]) with mapi id 15.20.3455.032; Fri, 16 Oct 2020
 06:11:57 +0000
From: Peter Chen <peter.chen@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>, Leo Li <leoyang.li@nxp.com>, Felipe Balbi
 <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [PATCH] usb: gadget: fsl: fix null pointer checking
Thread-Topic: [PATCH] usb: gadget: fsl: fix null pointer checking
Thread-Index: AQHWo3bEGfqv25FPWEu4/P4q8F/mcamZv3Ow
Date: Fri, 16 Oct 2020 06:11:57 +0000
Message-ID: <AM8PR04MB7300DB9144EA4655B4CD43388B030@AM8PR04MB7300.eurprd04.prod.outlook.com>
References: <20201016043326.40442-1-ran.wang_1@nxp.com>
In-Reply-To: <20201016043326.40442-1-ran.wang_1@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8148b00c-12df-4849-b732-08d8719a62f5
x-ms-traffictypediagnostic: AM0PR04MB4353:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB435331422E7A27E769D8A5F98B030@AM0PR04MB4353.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wlduozm8vxv7RFBBBwdqJ/zyq35tKlnwCf29k3rcyE9gDhJr7Xy5yfYBUUvbVEzqUIBt7bhpM8V8t2itg471+muvoUpt+PIkuBFs8x33AA6+btGNyeV1Krd5Qk2Ot7VGmkJHmwbiJvk8omoLfMZC6ahExPxJNEPe4LNvNQhOfj8Zx839NDq8woFf/nmBBMsD35gOviZ+ZvaHk8N+VYIVt6nheHTSwlhnVYWSA9gQO3ujgCA757BZ3S4Cn1kf3sCrIfDdTA8ntrT1RGQq4HME2OdqMagOAC+NFtis/Xx239t8xlCMa4d39Xaub1JE/5NYWg6Zi/U4w50sBxpX4tfQRw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR04MB7300.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(366004)(376002)(39860400002)(136003)(66476007)(33656002)(186003)(110136005)(76116006)(66556008)(66946007)(64756008)(52536014)(8936002)(478600001)(54906003)(26005)(83380400001)(2906002)(44832011)(5660300002)(71200400001)(7696005)(55016002)(316002)(86362001)(4326008)(4744005)(66446008)(9686003)(8676002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: Eben17kDHlMMO7XnSI8oVpL2Q/btif2+uJ/fBRulains4VmJbzXIar18uUs0vv3mWXzITiLKI6FvYI6pM72aVL4D8Nju2rEmSod+OX75BMzHl7a+OOOztP6KgbQ1l8Vv+lO+Ka9Q+qJz63A3XcasjKfxPJcmbEJguF4zKIB8btdvVnNzUFGahrfprj87UL0OWAeLUd1rRGQk8dkL+t0IWFlIQANXcUxiWkwIKz3fBYKwuAOphpA4kVbvMkCJ+/zrGvHxeTJCzLaQYs9+QpslQml7Mg0aYXL/Vp7spta8En96shak8PlTJLyCfI6nhafaApVIV8dWf6EgTTJ8lagGqmZoszqfW09q1DN8TVtxXgItK81qIPsLJmLJdCMuS+Vo8qFu+pCyqstOUMcJija1vJTPhCb81JYSLbUpJ7DGNRPJ9FUiwLY1B3mrCLmLRIc0tn3h6LKNVHByajMjIbHyUFk8IVsL9vTaMo1pQoqBS76l0M0Hfq0ZWm8nsRYsc5R96XvfLTDsuOnjGpvJtwM1m+/3wLZpykbKB/CdVa3YOPdTGZUAza40vsmP1uTCYd3Uv5uSQMQlWhgvsy9BmuHgpLKtsPhkM0f4etMtCByFRBv9DkSPV3BHMe4Q7EL/Hfpt1lxlzkLXwRqkQklT6kyfHA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8148b00c-12df-4849-b732-08d8719a62f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Oct 2020 06:11:57.1600 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WkxU0mzZLOcRH7gc3HpPCEqu9hiANzn6dYoQjz8BiAPx0M13145A52I+Xk7YlxwmdYCEVqAUdOcoOguEqEiXEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4353
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
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ran Wang <ran.wang_1@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

IA0KPiANCj4gRml4ZXM6IDc1ZWFhNDk4Yzk5ZSAo4oCcdXNiOiBnYWRnZXQ6IENvcnJlY3QgTlVM
TCBwb2ludGVyIGNoZWNraW5nIGluIGZzbA0KPiBnYWRnZXTigJ0pDQo+IFNpZ25lZC1vZmYtYnk6
IFJhbiBXYW5nIDxyYW4ud2FuZ18xQG54cC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy91c2IvZ2Fk
Z2V0L3VkYy9mc2xfdWRjX2NvcmUuYyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvZnNsX3VkY19jb3JlLmMNCj4gYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2ZzbF91
ZGNfY29yZS5jDQo+IGluZGV4IGRlNTI4ZTMuLmFkNmZmOWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvdXNiL2dhZGdldC91ZGMvZnNsX3VkY19jb3JlLmMNCj4gKysrIGIvZHJpdmVycy91c2IvZ2Fk
Z2V0L3VkYy9mc2xfdWRjX2NvcmUuYw0KPiBAQCAtMTA1MSw3ICsxMDUxLDcgQEAgc3RhdGljIGlu
dCBmc2xfZXBfZmlmb19zdGF0dXMoc3RydWN0IHVzYl9lcCAqX2VwKQ0KPiAgCXUzMiBiaXRtYXNr
Ow0KPiAgCXN0cnVjdCBlcF9xdWV1ZV9oZWFkICpxaDsNCj4gDQo+IC0JaWYgKCFfZXAgfHwgX2Vw
LT5kZXNjIHx8ICEoX2VwLT5kZXNjLT5iRW5kcG9pbnRBZGRyZXNzJjB4RikpDQo+ICsJaWYgKCFf
ZXAgfHwgIV9lcC0+ZGVzYyB8fCAhKF9lcC0+ZGVzYy0+YkVuZHBvaW50QWRkcmVzcyYweEYpKQ0K
PiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gDQoNClJldmlld2VkLWJ5OiBQZXRlciBDaGVuIDxwZXRl
ci5jaGVuQG54cC5jb20+DQoNClBldGVyDQoNCg==
