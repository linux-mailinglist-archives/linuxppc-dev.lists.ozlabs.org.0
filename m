Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4B257B52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 16:31:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgCMH29R8zDqNN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 00:31:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.51; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=PTNcK0Pi; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70051.outbound.protection.outlook.com [40.107.7.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgCDL2CB2zDqSv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 00:25:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaN6zYmdZZRxTChj4I1QOEJfVioeJ5/Lvg3dqmi2YKsNE1yGxgU5QNuyofrI4Ad8Bs+NhfUqcv0k4Qyiamt9naK7ABakTK3rivbJjWe5r1w8J9QGHlXgaUjY8zImPoX4b1DS7zR9EhG/TwUTJgmJu9fPUkpXb0IINo9i9ZcbiNEwMTKv6LmROQ0pQayiWLeTwR5YGlGe5tgStRlE/6HfKMrqFtGbYjB2EF2ofuge6NTRk4C2MLXaDYer4e/keWEyG8FFLS+o8BL4VQjhlmAABThxPA7Sp1TOCEGWn/lsTaut8hUnhfZ0N5AhejGGVcVSd69okqugqMWi9f1XHCLvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6wUMOoZXBIEy8ahBRvPTTCkp9O2/7SbburdnAA479Q=;
 b=eVQppt9N/pSXK+LiSCN4EVkggppTIcvVtH7f7puLHDnlcgaQtAi/plzjSQk/+e1XoZM1LStXRoUX3kuVKDsWSpZEBQVP/8PrOx2Q+HoQj/3jMsU1LNvA3+2XlAuzyywmC8S13MucnrZL6LwOVIMpM6uHTUo5X3rVqUc0YS17eCqtrrfhHUGLzWjeIito1LkBZenqVZ2fpfgYa/NdmhW61kw2jUifCDGcb8t0Adi7HCGrVQ2F++BukelBHS3+1fSBvPTY7IjKWOxe+ybPqLT/TOriWqex82+JLHEmCraYRfCitPCsYsFAtlEElM/iltLpCzehPuB8Vqb4CMgHuQJuQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6wUMOoZXBIEy8ahBRvPTTCkp9O2/7SbburdnAA479Q=;
 b=PTNcK0PiRM0NKc7WETrur6QZ22LlkbPWXFyNh7ksxSyLYS36vxVuolIg6+c+YaC3bwprduJyB9b4cvSNxAumRN2nvdu6cOzogz7JjEdsfryizVwgLsZReGx7lwi3pfgrp0Az4FdGGw9xrgcVMuelEs3VPmua21KJWoRsKo9HBcI=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19; Mon, 31 Aug
 2020 14:25:33 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::8db9:c62f:dac5:ee3d%3]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 14:25:33 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Linus Torvalds <torvalds@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>
Subject: RE: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
Thread-Topic: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
Thread-Index: AQHWfgJlOwJZwZly0kaCfg9uzLLOwqlPWACAgAA1JICAAAs1AIACrzfg
Date: Mon, 31 Aug 2020 14:25:33 +0000
Message-ID: <VE1PR04MB668786146B9DAC844AABBA8E8F510@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20200829105116.GA246533@roeck-us.net>
 <20200829124538.7475-1-luc.vanoostenryck@gmail.com>
 <CAHk-=whH0ApHy0evN0q6AwQ+-a5RK56oMkYkkCJtTMnaq4FrNQ@mail.gmail.com>
 <59cc6c99-9894-08b3-1075-2156e39bfc8e@roeck-us.net>
 <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
In-Reply-To: <CAHk-=wjDEiWF_DsCVFPFqNa+JCS5SkOygbqeq8_=ZNOrFt7-rg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [136.49.234.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b55bcb06-3acb-44a6-dfb0-08d84db9b8a2
x-ms-traffictypediagnostic: VE1PR04MB7389:
x-microsoft-antispam-prvs: <VE1PR04MB7389943E174BAEBA6CC156C68F510@VE1PR04MB7389.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZOn8IiqGZEGaYokoW+E50duTJ6lHoMHfHw9hA7Cr2rL7nztMvVGRdSctWNOqus/Zx2/Knc5zOvFZTU3qisLKS2N6F2NW5yxv1o52hctpitWlwquDZGSdQ/c4XjWhR25T2286mrcT/nKaKf3yFZCLY/aEvkrrkUXrwdUzwI4Hpved8e4lnHsSexRRsFexqyZCgXlhjKxsLieAwMOLuRuCPaKHaCrPvfcpOZ3KcM/wsQEubT06rqxEXN/jBNhpsm0JySNST+rDqL7rKCd+eb8AV3KXcUsJ6sf7TK8NlsvHP2ZzC8bl/qF6rog0DIvO48u2nN3d8NU+OHYlJEzOUeTgLQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(66446008)(55016002)(186003)(7696005)(76116006)(9686003)(4326008)(54906003)(478600001)(86362001)(53546011)(110136005)(6506007)(7416002)(26005)(316002)(2906002)(71200400001)(5660300002)(66476007)(66556008)(64756008)(66946007)(8676002)(52536014)(8936002)(83380400001)(33656002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: B0TwTBjHxaRa7lDooJuz0pyIid5xaCS4vTVh2qUa5xkrzVh9X3YhoX7jhIJg1mKMT4hJe+3sVJg0tFD2LCg6sWpaLRfhuuwXY28r4Rbq4Gu6HwTyBnRZOrJhjIv/1wLS/fyHjwurXGr7ttxvyxX+f+AddJ9363eV+ghl9JUYO57fYRr080nNEzX13jKuFFbn70Q3PeslJelewea8TOFpPLog3AzYJzPF/18eCEcXNAk4P44fZixWkaQF8qCiTtwVDYL+NovG2164eXFmAnuskiO83PXW/fkZvqPk5ruFlbH1fZJB0zn5cSYT3ICIiF7T/XT4fXzycM0s0koQe7RcIsNFji9w6w3RPt53aehIazztchI8qkxGBHv9Szw0tVpq7vBhEqGSzPzHdP26DJ8YauKWe4mWinHIHmFjz6cyAoNWal4tMMzN635M7xBqeUmXtXroBO72Ir7+gShbAaNytQA7JBBqYu43/ZluoSrAg9VABoc3qvbSQS9kO/X/kN/YvXwh03y9wSQX2staXp+By+xzWJiGJ5M3cSGr6zJou0V0TqlQEZeq4pQElUU5fCmwtpskeCFfBHxWgnTtMjYs+Idv1N34biy9d5O+NUb4nvUaBJun8PBHaoJknfPd9lZIq/AY+nm2VBruPNSddJdCvQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55bcb06-3acb-44a6-dfb0-08d84db9b8a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2020 14:25:33.2866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zBzoHi0vbhzSqSJCwM3UQenqDKtEYbD2hTHXMwbRDFOJPUpkGq2nIFPhRnZAfSK4rm2W2RKGFtin7sRQC4R7SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Zhang Wei <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>,
 dma <dmaengine@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGludXMgVG9ydmFsZHMg
PHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPg0KPiBTZW50OiBTYXR1cmRheSwgQXVndXN0
IDI5LCAyMDIwIDQ6MjAgUE0NCj4gVG86IEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5l
dD4NCj4gQ2M6IEx1YyBWYW4gT29zdGVucnljayA8bHVjLnZhbm9vc3RlbnJ5Y2tAZ21haWwuY29t
PjsgSGVyYmVydCBYdQ0KPiA8aGVyYmVydEBnb25kb3IuYXBhbmEub3JnLmF1PjsgQW5kcmV3IE1v
cnRvbiA8YWtwbUBsaW51eC0NCj4gZm91bmRhdGlvbi5vcmc+OyBKb2VyZyBSb2VkZWwgPGpvZXJn
LnJvZWRlbEBhbWQuY29tPjsgTGVvIExpDQo+IDxsZW95YW5nLmxpQG54cC5jb20+OyBaaGFuZyBX
ZWkgPHp3QHpoLWtlcm5lbC5vcmc+OyBEYW4gV2lsbGlhbXMNCj4gPGRhbi5qLndpbGxpYW1zQGlu
dGVsLmNvbT47IFZpbm9kIEtvdWwgPHZrb3VsQGtlcm5lbC5vcmc+OyBsaW51eHBwYy1kZXYNCj4g
PGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnPjsgZG1hIDxkbWFlbmdpbmVAdmdlci5rZXJu
ZWwub3JnPjsgTGludXgNCj4gS2VybmVsIE1haWxpbmcgTGlzdCA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZnNsZG1hOiBmc2xfaW9yZWFkNjQq
KCkgZG8gbm90IG5lZWQgbG93ZXJfMzJfYml0cygpDQo+IA0KPiBPbiBTYXQsIEF1ZyAyOSwgMjAy
MCBhdCAxOjQwIFBNIEd1ZW50ZXIgUm9lY2sgPGxpbnV4QHJvZWNrLXVzLm5ldD4gd3JvdGU6DQo+
ID4NCj4gPiBFeGNlcHQgZm9yDQo+ID4NCj4gPiBDSEVDSzogc3BhY2VzIHByZWZlcnJlZCBhcm91
bmQgdGhhdCAnKycgKGN0eDpWeFYpDQo+ID4gIzI5OiBGSUxFOiBkcml2ZXJzL2RtYS9mc2xkbWEu
aDoyMjM6DQo+ID4gKyAgICAgICB1MzIgdmFsX2xvID0gaW5fYmUzMigodTMyIF9faW9tZW0gKilh
ZGRyKzEpOw0KPiANCj4gQWRkZWQgc3BhY2VzLg0KPiANCj4gPiBJIGRvbid0IHNlZSBhbnl0aGlu
ZyB3cm9uZyB3aXRoIGl0IGVpdGhlciwgc28NCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBHdWVudGVy
IFJvZWNrIDxsaW51eEByb2Vjay11cy5uZXQ+DQo+ID4NCj4gPiBTaW5jZSBJIGRpZG4ndCBzZWUg
dGhlIHJlYWwgcHJvYmxlbSB3aXRoIHRoZSBvcmlnaW5hbCBjb2RlLCBJJ2QgdGFrZQ0KPiA+IHRo
YXQgd2l0aCBhIGdyYWluIG9mIHNhbHQsIHRob3VnaC4NCj4gDQo+IFdlbGwsIGhvbmVzdGx5LCB0
aGUgb2xkIGNvZGUgd2FzIHNvIGNvbmZ1c2VkIHRoYXQganVzdCBtYWtpbmcgaXQgYnVpbGQgaXMN
Cj4gY2xlYXJseSBhbHJlYWR5IGFuIGltcHJvdmVtZW50IGV2ZW4gaWYgZXZlcnl0aGluZyBlbHNl
IHdlcmUgdG8gYmUgd3JvbmcuDQo+IA0KPiBTbyBJIGNvbW1pdHRlZCBteSAiZml4Ii4gSWYgaXQg
dHVybnMgb3V0IHRoZXJlJ3MgbW9yZSB3cm9uZyBpbiB0aGVyZSBhbmQNCj4gc29tZWJvZHkgdGVz
dHMgaXQsIHdlIGNhbiBmaXggaXQgYWdhaW4uIEJ1dCBub3cgaXQgaG9wZWZ1bGx5IGNvbXBpbGVz
LCBhdCBsZWFzdC4NCj4gDQo+IE15IGJldCBpcyB0aGF0IGlmIHRoYXQgZHJpdmVyIGV2ZXIgd29y
a2VkIG9uIHBwYzMyLCBpdCB3aWxsIGNvbnRpbnVlIHRvIHdvcmsNCj4gd2hhdGV2ZXIgd2UgZG8g
dG8gdGhhdCBmdW5jdGlvbi4NCj4gDQo+IEkgX3RoaW5rXyB0aGUgb2xkIGNvZGUgaGFwcGVuZWQg
dG8gLSBjb21wbGV0ZWx5IGJ5IG1pc3Rha2UgLSBnZXQgdGhlIHZhbHVlDQo+IHJpZ2h0IGZvciB0
aGUgY2FzZSBvZiAibGl0dGxlIGVuZGlhbiBhY2Nlc3MsIHdpdGggZG1hX2FkZHJfdCBiZWluZyAz
Mi1iaXQiLg0KPiBCZWNhdXNlIHRoZW4gaXQgd291bGQgc3RpbGwgcmVhZCB0aGUgdXBwZXIgYml0
cyB3cm9uZywgYnV0IHRoZSBjYXN0IHRvDQo+IGRtYV9hZGRyX3Qgd291bGQgdGhlbiB0aHJvdyB0
aG9zZSBiaXRzIGF3YXkuIEFuZCB0aGUgbG93ZXIgYml0cyB3b3VsZCBiZQ0KPiByaWdodC4NCj4g
DQo+IEJ1dCBmb3IgYmlnLWVuZGlhbiBhY2Nlc3NlcyBvciBmb3IgQVJDSF9ETUFfQUREUl9UXzY0
QklUIGl0IHJlYWxseSBsb29rcw0KPiBsaWtlIGl0IGFsd2F5cyByZXR1cm5lZCBhIGNvbXBsZXRl
bHkgaW5jb3JyZWN0IHZhbHVlLg0KPiANCj4gQW5kIGFnYWluIC0gdGhlIGRyaXZlciBtYXkgaGF2
ZSB3b3JrZWQgZXZlbiB3aXRoIHRoYXQgY29tcGxldGVseSBpbmNvcnJlY3QNCj4gdmFsdWUsIHNp
bmNlIHRoZSB1c2Ugb2YgaXQgc2VlbXMgdG8gYmUgdmVyeSBpbmNpZGVudGFsLg0KPiANCj4gSW4g
ZWl0aGVyIGNhc2UgKCJpdCBkaWRuJ3Qgd29yayBiZWZvcmUiIG9yICJpdCB3b3JrZWQgYmVjYXVz
ZSB0aGUgdmFsdWUNCj4gZG9lc24ndCByZWFsbHkgbWF0dGVyIiksIEkgZG9uJ3QgdGhpbmsgSSBj
b3VsZCBwb3NzaWJseSBoYXZlIG1hZGUgdGhpbmdzIHdvcnNlLg0KPiANCj4gRmFtb3VzIGxhc3Qg
d29yZHMuDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLiAgDQoNCkFja2VkLWJ5OiBMaSBZYW5nIDxs
ZW95YW5nLmxpQG54cC5jb20+DQoNCldlIGFyZSBoYXZpbmcgcGVyaW9kaWNhbCBhdXRvIHJlZ3Jl
c3Npb24gdGVzdHMgY292ZXJpbmcgcHBjMzIgcGxhdGZvcm1zLiAgQnV0IGxvb2tzIGxpa2UgaXQg
bWlzc2VkIHRoaXMgaXNzdWUuICBJIHdpbGwgYXNrIHRoZSB0ZXN0IHRlYW0gdG8gaW52ZXN0aWdh
dGUgb24gd2h5IHRoZSB0ZXN0IGNhc2VzIGFyZSBub3Qgc3VmZmljaWVudC4NCg0KUmVnYXJkcywN
Ckxlbw0K
