Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC582B1287
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 00:14:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXHVV3rzNzDr5n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Nov 2020 10:14:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.4.43; helo=eur03-db5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=sl/Aji6H; 
 dkim-atps=neutral
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr40043.outbound.protection.outlook.com [40.107.4.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXHSl1GskzDr3M
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Nov 2020 10:12:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbl8Q3OO33hhR3AXRf/5h4No/7G9+D2vsVeeRl3pNkU+XjN5nED3qZa+YGYnLFgi7XoCeVjTCZ3vSFOHWc1IdQDhw8nngIqUgMqyyGrcjxOMx0u/w+afybTcsHIaXgt3RnDT3NiwY4xOcJg0rBrUUbyaLoVdB0woMFx5Q+N0too8a1mpHY25xPFPlkFqGNc/TxXRK/OByBkPBqJh9aTEWuwSsWSRoM3I5zv/8j9LbeJCMZ938qxBwGyCggeC5Xm3/lokTBceBc8GfAJoiZLUpPhUSGakx2hmV5BgKu57bR9LAN22Nnt1bhIKLRnPEOyX8HG6a5Rv3MiCOqqgwzgnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BpidCM4inhZJOyY7IgAOv5jbgdWd5+AbSvhsmjFE2g=;
 b=Jj1tAteXJSHj9G9/4PfxfjZv8TFAfhBxOeMwr1ETmw2KMJB4j628rysdoTFNq4NR8BoaAtAuuE4Et5Co0InGzKnNAwyamGC19k00U7cX5IbqL5tbFN0n/m5qsS3XYFWcKlg7Hmre6pgGSckbRLvL0kEgNXAIii0iN3iMTGf1s/1vENRDKfIw++r4bx5Z/ZscKAP3hoP+SKHwAof+FlRIOcpI19kMPexsjb+3bRqlpAC4UX4N2HHt7ZRT5k0jaY1kzZqZkDSk3T20dLO9UPdEkkZ2W7Jt945GLnkRoyTEJ1SWaTrVgKzcBWU4tDE8ZrH8EVKN4SV1D6B4o+9Tdi1MFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BpidCM4inhZJOyY7IgAOv5jbgdWd5+AbSvhsmjFE2g=;
 b=sl/Aji6HlRb4+gFnSHCgfhGBFew/VMVioYuoOHtdzNusvOGoFRjmeODXDOExw8Ni1ZnciY9sMqiNeLTQJ5lAarkktSAFnDe+w20yOg2XSVv5Ce7QOxd+aq3ofBBT9SnvSKIY0Nkl9N7d3btsIGrIzWHyBvuLHaNLl6/m2ESJ15o=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (2603:10a6:803:121::30)
 by VI1PR04MB5615.eurprd04.prod.outlook.com (2603:10a6:803:e9::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21; Thu, 12 Nov
 2020 23:12:47 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b106:ac49:e3c7:6dc8]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::b106:ac49:e3c7:6dc8%7]) with mapi id 15.20.3541.025; Thu, 12 Nov 2020
 23:12:47 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>, Scott Wood
 <scottwood@freescale.com>, act <dmalek@jlc.net>, Dan Malek
 <dan@embeddedalley.com>, "Software, Inc" <source@mvista.com>, Vitaly Bordug
 <vbordug@ru.mvista.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCH 11/25] soc: fsl: qe: qe_common: Fix misnamed function
 attribute 'addr'
Thread-Topic: [PATCH 11/25] soc: fsl: qe: qe_common: Fix misnamed function
 attribute 'addr'
Thread-Index: AQHWsfYdbwHBfwkab0WTBHn8WjNsY6nEWnYAgADTsyA=
Date: Thu, 12 Nov 2020 23:12:47 +0000
Message-ID: <VE1PR04MB66877659A67152AE02CF443F8FE70@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20201103152838.1290217-1-lee.jones@linaro.org>
 <20201103152838.1290217-12-lee.jones@linaro.org>
 <20201112103300.GE1997862@dell>
In-Reply-To: <20201112103300.GE1997862@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.1.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 842e099f-011c-4979-c556-08d88760780c
x-ms-traffictypediagnostic: VI1PR04MB5615:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB561539B8644BF4CA118093D78FE70@VI1PR04MB5615.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C1LZRS/6RDK7cldiTkNBfxUITSC1PIF3nXFWBdRpdNDJ5het3xJAxota8lCY/RnwpnOr6qHoW4/5RKBXx3LYpNmL8G6L9+ibw2NSPviZ2oiParDtMysJcCCP+zdOo14CWXHhBXxK4egdlxQ3VJdRhvgiyI62Gysa/PiNjhpHkjgVaoEbELgM/ZLZ3VJPLAm7Fo16M6Atm9xpr2T6KktZ5cZKIZ1hoz5F88UiZKxL5NgpIfzfRbvgX6yrQD+h148TuJfSJTCEkpIWLY305LR+QE1Gomdnk3WK+DUmXz3iu7UsQ9tmfwWGozlrGjXwAGyWnaj6TPXDK2ALmn6ij3VcZROF1/DbjoxGTC9SLSoZsVxQm8lxRNmz3Gou/WWgCDmA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6687.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8676002)(2906002)(9686003)(26005)(33656002)(86362001)(316002)(64756008)(66446008)(5660300002)(66476007)(110136005)(66556008)(66946007)(8936002)(76116006)(71200400001)(6506007)(52536014)(186003)(83380400001)(478600001)(53546011)(55016002)(7696005)(921005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: XD5lhS0842Z/8CA1nNY+Tr2NhXin+9IlBId51s++ygVRlO+eRmebfpIbIhJpSX3CH5nHWAh4bR1nH2VJme3zRwYYgn1QhSPSIGN1P+sXs6FPjOS6Z+NmkMfyB75/qypmWeL8a1w3eTKSlYs1zYSe7G+TLRSqA8biVQe2X4oiLz6Mh8do+4S3tzHFV4l17RijQTgf+TD3Yhz/zOmJX6MU3S1EZzZpnyR/D/rT2sJAZOsGunq5KqlzBF0bauwWYAjytGb+rU1P31bnLq9Q5i9/jtllR3Pu2CTI64stmtDnvcPLOp4L6f75HytPsT+0vCJeZJYUrtI3388owCJ7RbKc95vbt+36NmWv3UCVIS79xcFW4dVL5gNTys51cdkHgI+VbQUL+XXDKGikooVn/Zdco11S2zXa/31NfjzxLZ8etyKFek2Hpf3jquc4ZFFymnwpXU6WAbY8/JyNORl41HcaRiwBpLRICQjHcHl2vXplwFTVarzMiyNBNwQkbaMWr1esGQ9qd6rTdvK8PnyDu9cQbt0cQ+9WDvlIBtm030Sz3H2mBKaBZicJTGqfUvDmChjcBmADwjO5zQ5bwubA9kZP8ahHZuKcEQc43eVGfmeThIjtruM3luBwegkM6pB6ddfKzZApPJSYtfYoR11wn7bAzQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6687.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842e099f-011c-4979-c556-08d88760780c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2020 23:12:47.2948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0X6sM8VVLHOq7uTFHrgLqRaKWeBtJdq/hSlhZv1HfZkFqU5FF9HnpPf578uNZdKPJDNfz883xa+3b0fl6Q5Sxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5615
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVlIEpvbmVzIDxsZWUu
am9uZXNAbGluYXJvLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDEyLCAyMDIwIDQ6
MzMgQU0NCj4gVG86IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29t
PjsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBTY290dA0KPiBXb29kIDxzY290dHdvb2RA
ZnJlZXNjYWxlLmNvbT47IGFjdCA8ZG1hbGVrQGpsYy5uZXQ+OyBEYW4gTWFsZWsNCj4gPGRhbkBl
bWJlZGRlZGFsbGV5LmNvbT47IFNvZnR3YXJlLCBJbmMgPHNvdXJjZUBtdmlzdGEuY29tPjsgVml0
YWx5DQo+IEJvcmR1ZyA8dmJvcmR1Z0BydS5tdmlzdGEuY29tPjsgbGludXhwcGMtZGV2QGxpc3Rz
Lm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxMS8yNV0gc29jOiBmc2w6IHFlOiBx
ZV9jb21tb246IEZpeCBtaXNuYW1lZCBmdW5jdGlvbg0KPiBhdHRyaWJ1dGUgJ2FkZHInDQo+IA0K
PiBPbiBUdWUsIDAzIE5vdiAyMDIwLCBMZWUgSm9uZXMgd3JvdGU6DQo+IA0KPiA+IEZpeGVzIHRo
ZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMpOg0KPiA+DQo+ID4gIGRyaXZl
cnMvc29jL2ZzbC9xZS9xZV9jb21tb24uYzoyMzc6IHdhcm5pbmc6IEZ1bmN0aW9uIHBhcmFtZXRl
ciBvcg0KPiBtZW1iZXIgJ2FkZHInIG5vdCBkZXNjcmliZWQgaW4gJ2NwbV9tdXJhbV9kbWEnDQo+
ID4gIGRyaXZlcnMvc29jL2ZzbC9xZS9xZV9jb21tb24uYzoyMzc6IHdhcm5pbmc6IEV4Y2VzcyBm
dW5jdGlvbiBwYXJhbWV0ZXINCj4gJ29mZnNldCcgZGVzY3JpcHRpb24gaW4gJ2NwbV9tdXJhbV9k
bWEnDQo+ID4NCj4gPiBDYzogUWlhbmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KPiA+IENj
OiBMaSBZYW5nIDxsZW95YW5nLmxpQG54cC5jb20+DQo+ID4gQ2M6IFNjb3R0IFdvb2QgPHNjb3R0
d29vZEBmcmVlc2NhbGUuY29tPg0KPiA+IENjOiBhY3QgPGRtYWxla0BqbGMubmV0Pg0KPiA+IENj
OiBEYW4gTWFsZWsgPGRhbkBlbWJlZGRlZGFsbGV5LmNvbT4NCj4gPiBDYzogIlNvZnR3YXJlLCBJ
bmMiIDxzb3VyY2VAbXZpc3RhLmNvbT4NCj4gPiBDYzogVml0YWx5IEJvcmR1ZyA8dmJvcmR1Z0By
dS5tdmlzdGEuY29tPg0KPiA+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiA+
IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+DQo+ID4gLS0t
DQo+ID4gIGRyaXZlcnMvc29jL2ZzbC9xZS9xZV9jb21tb24uYyB8IDIgKy0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlX2NvbW1vbi5jDQo+ID4gYi9kcml2ZXJzL3NvYy9m
c2wvcWUvcWVfY29tbW9uLmMgaW5kZXggNzUwNzU1OTFmNjMwOC4uNDk3YTdlMGZkMDI3Mg0KPiA+
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZV9jb21tb24uYw0KPiA+ICsr
KyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZV9jb21tb24uYw0KPiA+IEBAIC0yMzEsNyArMjMxLDcg
QEAgRVhQT1JUX1NZTUJPTChjcG1fbXVyYW1fb2Zmc2V0KTsNCj4gPg0KPiA+ICAvKioNCj4gPiAg
ICogY3BtX211cmFtX2RtYSAtIHR1cm4gYSBtdXJhbSB2aXJ0dWFsIGFkZHJlc3MgaW50byBhIERN
QSBhZGRyZXNzDQo+ID4gLSAqIEBvZmZzZXQ6IHZpcnR1YWwgYWRkcmVzcyBmcm9tIGNwbV9tdXJh
bV9hZGRyKCkgdG8gY29udmVydA0KPiA+ICsgKiBAYWRkcjogdmlydHVhbCBhZGRyZXNzIGZyb20g
Y3BtX211cmFtX2FkZHIoKSB0byBjb252ZXJ0DQo+ID4gICAqLw0KPiA+ICBkbWFfYWRkcl90IGNw
bV9tdXJhbV9kbWEodm9pZCBfX2lvbWVtICphZGRyKSAgew0KPiANCj4gQW55IGlkZWEgd2hvIHdp
bGwgcGljayB0aGlzIHVwPw0KDQpJIGNhbiBwaWNrIHRoZW0gdXAgdGhyb3VnaCBteSB0cmVlLCBi
dXQgSSBoYXZlbid0IGNyZWF0ZWQgdGhlIGZvci1uZXh0IGJyYW5jaCBmb3IgdGhlIG5leHQga2Vy
bmVsIHlldC4gIFdpbGwgbG9vayB0aHJvdWdoIHRoaXMgc2VyaWVzIHNvb24uICBUaGFua3MuDQoN
Cj4gDQo+IC0tDQo+IExlZSBKb25lcyBb5p2O55C85pavXQ0KPiBTZW5pb3IgVGVjaG5pY2FsIExl
YWQgLSBEZXZlbG9wZXIgU2VydmljZXMgTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2UNCj4gc29m
dHdhcmUgZm9yIEFybSBTb0NzIEZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJs
b2cNCg==
