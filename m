Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1266D1393C3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 15:37:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xGPn36VtzDqMM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 01:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.78; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=kDeLBWRE; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70078.outbound.protection.outlook.com [40.107.7.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xGMV0GClzDqG6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 01:35:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kxzPXGlFA8rILM/uGIz3HUYblmm9BjqvQnMjUeIuPYrKL7aK9WybVeGBdLhGAZUDU5kwZj3ijOCVUAl0rDE+oF9tVw7QrF7VTpvddTC1cEEc8zO78NL/TKh3xD3w4bUsN+MwrSCGEFuZbNib0xAiFTca1IgOiB/rVQ/xvmlcWbJ5c76cw9f2b1pRNO22x5MqFuEqP21bMut23cRV3lmwohLMibEyxJNmMiB2rXwy8aRQWzy2DBaAuGUE8bljfBWG4KcJ8kLjsK4A5F3NwkLsbBHM2nGKXikG3X0O7UbAew+8m/wpIAlnOD3vrBF3gZLqGxfw/3dVWdWSA8wqpgYrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCfAqRZc49/w61gTa8gRyCi2jiF9TgVxvPJARmGYXic=;
 b=ER6gk0T7Bb862Cw3766Ql8lo66yuw1rEbjRlllQibQkrAAnZjtYBcF250aUYh2poBLQ8y6UGot4xwi7RBQULVCHbKafQ7y3ZIeBhdn0Z5SSqZx3q93PJpE0DpK4nFm6+j8vyz1IZdoBbxPCSbrBNxxErydArcO9L43plRRlLqdbwEWQgmasfhjqO5wjmWssg+Km4jk84PxbX4LvFRLK2HoEXzb1pd4GrjbGCeY2x9ZPRB/uLEz/dWhJ13iTGRwR7RBgxwDJHkzjV/WLLnizmueKv4tQTgKsax2HkEGQVMWSe2ynG15Jr/ndP22uaPmjxxxRJKFcNdAisFKpMzBsmPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCfAqRZc49/w61gTa8gRyCi2jiF9TgVxvPJARmGYXic=;
 b=kDeLBWRE7QUiydxF1CibYtQYzTm6HW3eGfWLvyO/qO71kyIM5n1yo9frjF51ircAQdWP9VfhEV5+ph1BRSl2gIp7dIhPW+ZFB9W6WdzuvVpW1egkZnfl979oiKD4s6fDBLn70hIva5JnsOjqxxYqegZZwQRwu24vTCG+UoiCYHw=
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB4454.eurprd04.prod.outlook.com (20.177.37.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Mon, 13 Jan 2020 14:34:51 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::932:9fab:97d3:1a82%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 14:34:51 +0000
Received: from [10.171.82.13] (89.37.124.34) by
 LO2P265CA0044.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 14:34:50 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: Timur Tabi <timur@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Scott Wood
 <swood@redhat.com>, York Sun <york.sun@nxp.com>, "b08248@gmail.com"
 <b08248@gmail.com>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
Thread-Topic: [PATCH] evh_bytechan: fix out of bounds accesses
Thread-Index: AQHVxr/zKCtNFfWOrE6GT6IEXEdd/Kfoi7oAgAAXDACAAAzwAA==
Date: Mon, 13 Jan 2020 14:34:50 +0000
Message-ID: <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <8736cj8rvr.fsf@mpe.ellerman.id.au>
 <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
In-Reply-To: <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::32) To AM6PR04MB5878.eurprd04.prod.outlook.com
 (2603:10a6:20b:a2::25)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 500e82f5-cfc2-45cb-b4f0-08d79835bf5e
x-ms-traffictypediagnostic: AM6PR04MB4454:|AM6PR04MB4454:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB445463DA611A3F89EDD79491EC350@AM6PR04MB4454.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(376002)(346002)(396003)(366004)(199004)(189003)(316002)(956004)(2616005)(31686004)(66946007)(66556008)(26005)(186003)(16526019)(66476007)(54906003)(31696002)(52116002)(110136005)(16576012)(5660300002)(44832011)(66446008)(64756008)(86362001)(53546011)(8936002)(2906002)(36756003)(81166006)(81156014)(8676002)(478600001)(4326008)(966005)(71200400001)(6486002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB4454;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZCjRKktRR4w5Ncw9UqdXCfYWyfAgHJyQT60zlsSp1ro3fH3yWGuZB4EGD9UCesCvxpktjHW3e0nBCPsB0Vmo4eqSPSkAFchsIAYfDnGmGpjGxXPE0+wFn7RMMzxuNxXwRo0BHIgAwVU43Uc0Yvbrins0F5/ulReP37b6VsYSkEOMryTJs7emYK2ptpRm1oFaPuZY8B8LJhCYgdizgoeg0KTA6NqTh5B54iDwx/0F2Z9XWe90IZZGsqCe9pno/kaKd2u9PjyvSII5jOBkYKSUFEimGlg+D3ds1iugSAdSjiyzeiVmaogOXU7+pOICnC+rlzmMorG2XG1K0gBJlbGT+BTOxMNRbrpQqHqPcawl/Q8kNT3iPf49mW0RHEGAIhTVzAhYj5vedQIoHKnLvzss9Ov5+3dK1vVVzRm6mTQ97i9S4TBPfT5sZkdiDa05sWh2sOTmjpo4B+XpLDARNOJK7ujQR7imK3sEKnTk+NvM4DxjC2LGeavoPXVLaUsybKpS046VR1Ik/gkMJ3SEfN9Wow==
Content-Type: text/plain; charset="utf-8"
Content-ID: <13049870CECCEB44AF5887455A45B91D@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 500e82f5-cfc2-45cb-b4f0-08d79835bf5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 14:34:51.0366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9hqP6nRalsZo4BBtUhzXfaq5ALLSjmwxus6NN8LqIQopplg4gOrDvr2ETo14kfnFwW+k/Hby+7TSBzNHeDRNEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4454
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
Cc: Diana Madalina Craciun <diana.craciun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGVsbG8sDQoNCk9uIDEzLjAxLjIwMjAgMTU6NDgsIFRpbXVyIFRhYmkgd3JvdGU6DQo+IE9uIDEv
MTMvMjAgNjoyNiBBTSwgTWljaGFlbCBFbGxlcm1hbiB3cm90ZToNCj4+IEkndmUgbmV2ZXIgaGVh
cmQgb2YgaXQsIGFuZCBJIGhhdmUgbm8gaWRlYSBob3cgdG8gdGVzdCBpdC4NCj4+DQo+PiBJdCdz
IG5vdCB1c2VkIGJ5IHFlbXUsIEkgZ3Vlc3MgdGhlcmUgaXMvd2FzIGEgRnJlZXNjYWxlIGh5cGVy
dmlzb3IgdGhhdA0KPj4gdXNlZCBpdC4NCj4gDQo+IFllcywgdGhlcmUgaXMvd2FzIGEgRnJlZXNj
YWxlIGh5cGVydmlzb3IgdGhhdCBJIGFuZCBhIGZldyBvdGhlcnMgd29ya2VkIA0KPiBvbi7CoCBJ
J3ZlIGFkZGVkIGEgY291cGxlIHBlb3BsZSBvbiBDQyB0aGF0IG1pZ2h0IGJlIGFibGUgdG8gdGVs
bCB0aGUgDQo+IGN1cnJlbnQgZGlzcG9zaXRpb24gb2YgaXQuDQoNCk1vcmUgaW5mbyBvbiB0aGlz
OiBpdCdzIG9wZW5zb3VyY2UgYW5kIGl0J3MgcHVibGlzaGVkIGhlcmUgWzFdLiBXZSBzdGlsbCAN
CmNsYWltIHRvIG1haW50YWluIGl0IGJ1dCB0aGVyZSB3YXNuJ3QgbXVjaCBhY3Rpdml0eSBwYXN0
IHllYXJzLCBhcyBvbmUgDQptaWdodCBub3RpY2UuDQoNCj4+IEJ1dCBtYXliZSBpdCdzIHRpbWUg
dG8gcmVtb3ZlIGl0IGlmIGl0J3Mgbm90IGJlaW5nIG1haW50YWluZWQvdXNlZCBieQ0KPj4gYW55
b25lPw0KPiANCj4gSSB3b3VsZG4ndCBiZSBjb21wbGV0ZWx5IG9wcG9zZWQgdG8gdGhhdCBpZiB0
aGVyZSByZWFsbHkgYXJlIG5vIG1vcmUgDQo+IHVzZXJzLsKgIFRoZXJlIHJlYWxseSB3ZXJlbid0
IGFueSB1c2VycyBldmVuIHdoZW4gSSB3cm90ZSB0aGUgZHJpdmVyLg0KDQpUaGVyZSBhcmUgYSBm
ZXcgdXNlcnMgdGhhdCBJIGtub3cgb2YsIGJ1dCBJIGNhbid0IHRlbGwgaWYgdGhhdCdzIGVub3Vn
aCANCnRvIGp1c3RpZnkga2VlcGluZyB0aGUgZHJpdmVyLg0KDQpbMV0gaHR0cHM6Ly9zb3VyY2Uu
Y29kZWF1cm9yYS5vcmcvZXh0ZXJuYWwvcW9yaXEvcW9yaXEteW9jdG8tc2RrL2h5cGVydmlzb3Iv
DQoNCi0tLQ0KQmVzdCBSZWdhcmRzLCBMYXVyZW50aXUNCg==
