Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F415B9A3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 07:37:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J6JW0F8tzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 17:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.88; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=M8rteVZ9; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80088.outbound.protection.outlook.com [40.107.8.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J6Gz1pRczDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 17:36:23 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LjoNqon6x9iMiIPou19cgfDfJsLncYoQqkBJ4nhoBSGFfVFt87i4M6yZivmVnBgh6jpG4PcwslQeA+rOGO4KywW17/W7yvbqxvyfkvUZxW0FZZ6ltnqCLvlvAZRIy/5XVZnR7oImUm7sKF4w3L1d9KjNaFSqMj3WglSNyaviUqOqwAKZReuDzj05TrE2vSC0mPZ6dOG6eKsJidaxtm6rjcOGdOC06Q8xzrQdQt+iraAngF1ss/RJfit6THf2qYJZ0CjsGobUj9eMIOxFIpIPoejd6Sorp2sQGdJqqxpX6e/Xuz2ip5I1iMFG3wbgrCcodtWIzNakGYH5IuOPOvEyKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n87dds8nwrMXM5t5tZ0j7rDrB7m3cFCVPq5zrQ3Lm6s=;
 b=GFsBDI7IPOdqkN9jF7OXLtVl6k7gtsAVhnzv3okZ3lHEAHijf5hS6be9BPXVsWdQ8n+O45KSZBCPirAK1VBDpTaVC5t7u6GOzu14rb8jghTAaJ359en0TnY/TeX+GWOC2hPaYiqgWscIlB645umFHU66hLAQg0ndN0bv5OIXL7QPHGnKipQgvfykzWj2Kq83GpVERBPyuLb0ao8+bX9uYoI5aF2e72oy6bojWOYFVDX1aF6NX4Go+555KvPcIHfTZASwSTIg6Jd8dpiUDlOxFEWyL1dvN7Ph76vaFIDevrBs9Jinr6+aMI9iJN3sDwifE2dXFrM6fr1G1GlATvtSdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n87dds8nwrMXM5t5tZ0j7rDrB7m3cFCVPq5zrQ3Lm6s=;
 b=M8rteVZ9Zoa0ZC/jrc/9YXIkA9iMaZzO582B34v54pRPWyt5Dpc6ebbS8bL9SVJ/99VAYaI2JCtyqmK0mBYHufzJMBmJVcC/+V6raxh7cLd/H4wa9W76cqv80j6ub+13XZLPVcpXQV7bHi7oZ6c7TIJjugZxYbEyPpfluRP6nI4=
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com (10.255.118.26) by
 VE1PR04MB6607.eurprd04.prod.outlook.com (20.179.234.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.25; Thu, 13 Feb 2020 06:36:17 +0000
Received: from VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::b1d4:f0d5:b56c:365b]) by VE1PR04MB6768.eurprd04.prod.outlook.com
 ([fe80::b1d4:f0d5:b56c:365b%5]) with mapi id 15.20.2729.024; Thu, 13 Feb 2020
 06:36:16 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Leo Li <leoyang.li@nxp.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Subject: RE: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
Thread-Topic: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
Thread-Index: AQHV4bApbcHQWh4/P0SAWF2GezJkLKgXpBIAgADUkHCAAC5lgIAAAdyQ
Date: Thu, 13 Feb 2020 06:36:16 +0000
Message-ID: <VE1PR04MB6768B1BFFED67B35D048D72D911A0@VE1PR04MB6768.eurprd04.prod.outlook.com>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
 <aee10440-c244-7c93-d3bb-fd29d8a83be4@c-s.fr>
 <VE1PR04MB6768B3B0F369280338370B87911A0@VE1PR04MB6768.eurprd04.prod.outlook.com>
 <0c217693-7c73-1696-8a86-e81dbabefe02@c-s.fr>
In-Reply-To: <0c217693-7c73-1696-8a86-e81dbabefe02@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3779b45b-0bf6-429e-6cdd-08d7b04f0742
x-ms-traffictypediagnostic: VE1PR04MB6607:|VE1PR04MB6607:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VE1PR04MB660769C574A0C74EFDBE8F4F911A0@VE1PR04MB6607.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(189003)(199004)(71200400001)(2906002)(76116006)(66946007)(55016002)(53546011)(6506007)(110136005)(26005)(186003)(44832011)(86362001)(81156014)(9686003)(4326008)(54906003)(8936002)(81166006)(33656002)(316002)(8676002)(478600001)(52536014)(7696005)(5660300002)(66476007)(64756008)(66446008)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6607;
 H:VE1PR04MB6768.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P5wfT7cnqh1wCT8QVBeZO2Kok6wEZUVKqO8GVwe+vqW4phFXhiRtNNcYCpweYFm9uc77rmxC33IRLHA0TQk7uDVJhYNc003ylhJVita6aGanIOyETY0lPO8xx+UInvK4eBRLvDrUe4Ky0nsqg4KSvbKFC+9YkRClPoedv40YEylFdbuRZU8jWCm8Oq35tI2TFAkaOxrcNU7ikb2Ozoq92Q17smFpl4T8VEBoDRABSDCTAvggqR9GXwdbAflt+//gRCXcRYNfsIjV8WrScII4xeDupmnAK+3CFxdcJcRNE01BV09ol5mVoATFNUsmMu2lDna3TKjKJIinr6n3ff3K7BQPKOVGBm3G80KSU09Qf73R68Lv/oxY6J4qwvkNMpHahB42A4VeSRXZRogbTJqWkn1L0uMFFuxTNpbykPI0upsrbtfyQsQwI2MtjcTI33IJ
x-ms-exchange-antispam-messagedata: pu0nthYVnV818s2AnWd3Q4lTQFPm5Ko+JRluORO/RRvY7vrGeZ+qGvVaj04YBjf4QEwfxMw6xmXS5xyZr0mMUF9z767AU2zp+PY6c9SRy/J6Yo22fPhwAtYa3CqRmytfyeOSsTfoLPEr02cQtRMkpA==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3779b45b-0bf6-429e-6cdd-08d7b04f0742
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 06:36:16.6313 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NKJDHyzBjtKfCT6QjR3GAu9+5c43rRBeuIhGsRFLUgJ5tn3UNQqb5aUkPjXRT1+7/wp6qZYIhtC9T4rLUaZiCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6607
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
 LKML <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMDIvMTMvMjAyMCAxNDoxNyBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3Bo
ZS5sZXJveUBjLXMuZnI+DQo+IFNlbnQ6IDIwMjDlubQy5pyIMTPml6UgMTQ6MTcNCj4gVG86IFFp
YW5nIFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNvbT47IFJhc211cyBWaWxsZW1vZXMNCj4gPGxpbnV4
QHJhc211c3ZpbGxlbW9lcy5kaz47IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsgR3JlZw0K
PiBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gQ2M6IFNjb3R0
IFdvb2QgPG9zc0BidXNlcnJvci5uZXQ+OyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsg
TEtNTA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1JlZ3Jlc3Npb24gNS42LXJjMV1b
QmlzZWN0ZWQgYjYyMzFlYTJiM2M2XSBQb3dlcnBjIDh4eCBkb2Vzbid0DQo+IGJvb3QgYW55bW9y
ZQ0KPiANCj4gDQo+IA0KPiBMZSAxMy8wMi8yMDIwIMOgIDA0OjM1LCBRaWFuZyBaaGFvIGEgw6lj
cml0wqA6DQo+ID4gT24gMDIvMTIvMjAyMCAyMjo1MCBQTSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90
ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQo+ID4+IFNlbnQ6IDIwMjDlubQy5pyI
MTLml6UgMjI6NTANCj4gPj4gVG86IFJhc211cyBWaWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxl
bW9lcy5kaz47IExlbyBMaQ0KPiA+PiA8bGVveWFuZy5saUBueHAuY29tPjsgUWlhbmcgWmhhbyA8
cWlhbmcuemhhb0BueHAuY29tPjsgR3JlZw0KPiA+PiBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4NCj4gPj4gQ2M6IFNjb3R0IFdvb2QgPG9zc0BidXNlcnJvci5uZXQ+
OyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gPj4gTEtNTCA8bGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZz47DQo+ID4+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1JlZ3Jlc3Npb24gNS42LXJjMV1bQmlzZWN0ZWQgYjYy
MzFlYTJiM2M2XSBQb3dlcnBjIDh4eA0KPiA+PiBkb2Vzbid0IGJvb3QgYW55bW9yZQ0KPiA+Pg0K
PiA+PiAtLS0NCj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9j
cG1fdWFydF9jb3JlLmMNCj4gPj4gYi9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3Vh
cnRfY29yZS5jDQo+ID4+IGluZGV4IDRjYWJkZWQ4MzkwYi4uMzQxZDY4MmVjNmViIDEwMDY0NA0K
PiA+PiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvY3BtX3VhcnQvY3BtX3VhcnRfY29yZS5jDQo+
ID4+ICsrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9jcG1fdWFydC9jcG1fdWFydF9jb3JlLmMNCj4g
Pj4gQEAgLTEzNTEsNiArMTM1MSw3IEBAIHN0YXRpYyBpbnQgX19pbml0IGNwbV91YXJ0X2NvbnNv
bGVfc2V0dXAoc3RydWN0DQo+ID4+IGNvbnNvbGUgKmNvLCBjaGFyICpvcHRpb25zKQ0KPiA+PiAg
ICAJCWNscmJpdHMzMigmcGluZm8tPnNjY3AtPnNjY19nc21ybCwgU0NDX0dTTVJMX0VOUiB8DQo+
ID4+IFNDQ19HU01STF9FTlQpOw0KPiA+PiAgICAJfQ0KPiA+Pg0KPiA+PiArCWNwbV9tdXJhbV9p
bml0KCk7DQo+ID4+ICAgIAlyZXQgPSBjcG1fdWFydF9hbGxvY2J1ZihwaW5mbywgMSk7DQo+ID4+
DQo+ID4+ICAgIAlpZiAocmV0KQ0KPiA+Pg0KPiA+IEhvdyBhYm91dCB0aGUgcGF0Y2ggbGlrZSBi
ZWxvdz8gSnVzdCBhIGRyYWZ0Lg0KPiANCj4gWWVzLCBJIHNlZSB0aGUgaWRlYS4gSSB0aGluayB3
ZSBjb3VsZCBnbyBmb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4gQnV0IGluIHRoZSBwb3dlcnBj
IDh4eCBjYXNlLCB3ZSBhcmUgdGFsa2luZyBhYm91dCBjcG1faW5pdCgpLCBub3QgcWVfaW5pdCgp
Lg0KDQpZZXMsIGNwbV9pbml0LiAgDQoNCkJlc3QgUmVnYXJkcw0KUWlhbmcgWmhhbw0K
