Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18430466AF6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 21:36:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4nmk0Qzpz3c60
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 07:36:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BhcsYARe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.62; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=BhcsYARe; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10062.outbound.protection.outlook.com [40.107.1.62])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4nm16VVSz2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 07:35:59 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nqQ+2DlUMablSlnbOVM0nz3of9HfmwQfxi2BqlEtcKczG32HdYjIGiTa5fLe5KL4xalEeX5yUZ8HV+cSIqaQrZi5VBVjP7OaQVNxnxEmBBKxo/BINee9wqXP59/lbXcvya/R5FWzrKtNVRhu25fyOLU4HZc1NRGBC9WwpsyG0TzArbn2a570AmPSz4q6oVEzE+Bg0QcUTwdTTGE7vU2hkdkp5MUP4zXPAn+mjGX/LcKdsMPf+Sv9la97/1IeXQKWGjneayrOlWRC4FqVEgyOUoGX7o1iOdfJXABzrRxSqljjP6SeNab0hjpZ0DpefV3E83kg04Yo78Fr4Mgilg+8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qn+zCk43ctQrPa/+QANvBRIJF+LrO8EKuDysZY5WY+E=;
 b=iU0g3cge6/hI8SrrHioP4/y7TXHJTnudPepPwmy0jEOv35sYN8DRqKmGRrsh9XJEFEKi1NOhon2MRXIjZMb4WnZDkgDzXOgV99L+db/QOwHNzAUp+m284UL2L2G9mMl/AKcEwonbgrb3I5aFbihu9xKznS0Wx79LaYwd9mgGTvZe+tQIjEiQO95/jQ/JMGner4xnzRFYh+xjVOUWvmAgGU4maBAjNhnyYB2bHP4GlBzbwB/ZOWnekMk7syY3aYtIdq9cECjpl2hzEMw2qpSksTC32xuDBdCYr5idJdYciUCVyrI/Agm7xgViCfA/DzUm9sAGADiEl/qHPexmNrY3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qn+zCk43ctQrPa/+QANvBRIJF+LrO8EKuDysZY5WY+E=;
 b=BhcsYARetnzTtHPGkWjRqtWnNx18IG5q9N10rxhzKKP5iAadVEFnJ5DXEf1hn5ciXuQ9cO96Dd29PZiOJzOrCcsCQ8ibG3zC06sIvr79AFMFwHCEA1np65MvZN0AHzfzn5pqEHTtmjr74QyO1jrbLzS4Dm4vmRba8WkK9uXC0/g=
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com (2603:10a6:20b:42d::18)
 by AS1PR04MB9503.eurprd04.prod.outlook.com (2603:10a6:20b:4d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 2 Dec
 2021 20:35:40 +0000
Received: from AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b]) by AS8PR04MB8946.eurprd04.prod.outlook.com
 ([fe80::60be:d568:a436:894b%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 20:35:40 +0000
From: Leo Li <leoyang.li@nxp.com>
To: "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcAAD9HUaA=
Date: Thu, 2 Dec 2021 20:35:40 +0000
Message-ID: <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <2c275adc278477e1e512ea6ecc0c1f4dcc46969d.camel@infinera.com>
 <6659a2c7fd9fffac766b8389244e5885ccbd38bd.camel@infinera.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
In-Reply-To: <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b9843075-3042-4db7-8574-08d9b5d34e61
x-ms-traffictypediagnostic: AS1PR04MB9503:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AS1PR04MB950357BAEF1D2A37EF9B85B98F699@AS1PR04MB9503.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EBXwdQhsVkT7eC7uWVefF2yCjLEQd/LjW6/UE/7CLBCCz5IuKcttShNEP+6iAd1SEpJlYui1LpiKd7Iyq0fksjUbkeBdxl5Dva2vT2CAWOWP3UU8uMKn+5hccBlpvAeHwyw8eUussrLv84iryXhfykXB3zNM4WoHFJo2r1v+nAfD02kzyMaluvkPxE4m9WUBWoKWAuv12z81/4wOVGllbN2buajXeLon1kQJLzIdRgMbFIoYS7MHHW/NkrWxZjX3dmHWEugy7LEbBJwHGd22QHk/6L4+tZF5t2ybx2G74xSQgQzr2Hz2QSjhKTISn0QSladR5rcvQaLLzwvS4bsy6DHHwW7dR6k71l5K7ChkI2W+lcgDTvATO2qUlCjw5ILU4S/IQEnfuTCoovDT1xJ02kLeYEGJZARrvwSKXiHrjWJJ00VT6cY3hsS18uFVWk0d18W63vPGMCprAq2XBSLwLZNnSAFR7cXr5QerJ/s81hE5Z2OqNmY6VOueX5tgcueXxhXEl7+PjVuIHjjf97KnGg94E7tKJdddiOClLZAV5wrW7xSPdLnqCzZYuAfOT82OzQwekfsxZ8KUt9SVsheYXscTuCYhwDd/5wwMqF1lbBUFw0yTj2rPBL27uxgMjaXE3jGnfcNd61+MyDuqr8jD8wi0Nz64Y1X/piWSo/DfLe5UTsBmn+vCyhaPSuMuHh+9GBru8pUYXp34VvKFDwPWTuRD29u/5PpPbgk/h+5mrqI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR04MB8946.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(33656002)(66556008)(66476007)(38070700005)(55016003)(26005)(38100700002)(52536014)(186003)(76116006)(71200400001)(53546011)(6506007)(66946007)(66446008)(64756008)(316002)(8936002)(8676002)(2906002)(4326008)(86362001)(4001150100001)(7696005)(122000001)(54906003)(5660300002)(508600001)(9686003)(110136005)(491001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlFDbHZsWnBIMm0zR2RteitvK2hLMnlkbFZYUXQ0RzdpOEwvVUI1MU5UcXg0?=
 =?utf-8?B?Y25nbTBka2JjeGRuSFJjNHk2OU5Fbm1WdWVGUWZjRnpDa2hQMEF0RmErNEFQ?=
 =?utf-8?B?WDJyaGZvdmZ0UjVha0lJUGlkNStzc2RGbzNjYm9pRFYrVHROc09ZTkNrMDN5?=
 =?utf-8?B?NzdwODBocVFPMjlZSXdjOUpkTFhBLzhyeUs3am8rQyt2VWhEQ1l4QXJVT1A0?=
 =?utf-8?B?RmhmdXRXdnoyd0loZEl6NE5JWEZldDQ4bG05Vk5mTndxeHFvOVZ4azdLdU9w?=
 =?utf-8?B?VkJGSkszcGMzWU9hbzdkNDJ0NzBod0JNbjNiM1lWaFVmQkZ4QUR3c2Y2THh3?=
 =?utf-8?B?Z0VUM3ArN28wSElpQVhFcVBIM3lJMHhScDF1UE9zU3NsY0tnRC9veStPTEZu?=
 =?utf-8?B?ZnhWVEdyeWc5dmpBYU5SK0tBeDMwR21vWjNHU1VkQVNPNmU2cENGMkc4SkFQ?=
 =?utf-8?B?MUpwcXJaMGV0UkgrRWFQL0pDc2M1OUN3T2tQZzVVR2x2czFSbVVQaGozVjdI?=
 =?utf-8?B?NlJkZWp4SEFCdUUwNzdoOU40aEhueEJvMUtaa3N2NVF0MGJkOVBuL0tpSnFl?=
 =?utf-8?B?TldYcDFKQWxmdGUzWlh0K0M3Q3NoekQ0eTh6K01pOU45Tm90MW9QRVdaeG5T?=
 =?utf-8?B?bHpHL1JwbnZVZ0dpeWI1SFNjZE5KUmJmK1ptRzA3UFJiaVFmRUk3Uko4N21B?=
 =?utf-8?B?SUFEUG9mb2J6TTQvT2IvZTZRM3dMZ0hyTVR4WkI2MjNyZEtkY0IySDA5T1Qr?=
 =?utf-8?B?UmF5Ym52ZzVoVDVzTG5kcTZSbEVTVWtLREt5Uk5QcEUxTmM1L1hSWVh3Z2p6?=
 =?utf-8?B?cUV2ZTNNaWNYQTFDNmtkSVIvYWxWbUluTCtUWWNpVTdwbUFxR2JVb0JrNWJI?=
 =?utf-8?B?bkhOUHNEUHJvNU9idzk2WDIwbzhJMjE1cG1xS3Nnd0kwUVJyampYRE9EdTdP?=
 =?utf-8?B?T2cwQm8xRlI3RXhhZlFMYXJJU0xOM0RkYU1DTFpsaE1mSWgrNFBlSDdZRTVW?=
 =?utf-8?B?Mk5mVTRYdjAzRDJKeXpGYWdZek5yeDNPM3dtajFYYzRmMWtiMzg5VzNWMlB5?=
 =?utf-8?B?MVplOGViZ2VlNXJ0NUp4MDRlT3RRbzBzRDdncDRHOFJOVnljby9FT3JkVncr?=
 =?utf-8?B?dTZSSzF5S0VhdE5NL2Q2bzBSbFJSMGtXbWluZnREbWYycW9Xa0pIdEdkTFNX?=
 =?utf-8?B?aEJucVJjWkRGMEp5MlV0MlFsOWZnbXp5cVhHMy83WWlzenk0Q0ordzFFVjdN?=
 =?utf-8?B?ZFZjTTEzajh0THRpcHFWdlJxUExyd09mS2VuWHhlQ2lrUVUwSmNyRnJJMW9T?=
 =?utf-8?B?dWVEc3B4R3VVczhWcGhuWURDZWhpajlXMHQ2bkFqbTVZVDNSL0dRUDFJcUUy?=
 =?utf-8?B?U1ROTm5LN2p4Q3V1SmY2V1kwQ1EvMDl3NWZKcnNaWjE2SEFpTG9EWEREdEtn?=
 =?utf-8?B?RDgrZmxJUGFINkx1enRrZnY5enh2aWloc1dTL2lQU21IVTBFQlFiVi9MTC90?=
 =?utf-8?B?cnhjNVRWV1RwZ3lZa3ZOYzJ3SlNrRXYyV1R6dWNEUUxVR3p3NGpvTWhDK21Z?=
 =?utf-8?B?RnpGY01lK21hUzlRNVBWenYyRTNvMmFEWkl1NkZabURQTGdoZ2oxYm04dkpq?=
 =?utf-8?B?VmlnM3lObGM0UHNORm9hdDRCaFFrSWhUWFNybVdDczdrRlVXa2Zpeit2M2U4?=
 =?utf-8?B?NTlnU1VIelhvZ1VVN0NTSU9SM1c5UGFpQXlseXdiemhNRVFLaEpFNjk0QWdR?=
 =?utf-8?B?RzNEYk81c0RSR09HTXlMRnRNTlBRdTlueXVLMUhVeHZwZ1h4ZFRUMmY1MDJj?=
 =?utf-8?B?NWh1MXI5dFI1dzV6WEZJSFZlZ3NMdHFJOVYvWjJNblJQc0V3a0RLcWIxUFNz?=
 =?utf-8?B?VUtxV1hnbVlPM1lRdFQvdWNyQmtOcyt0SW5nL3lwZkN4SExUclJCVFhyVzNh?=
 =?utf-8?B?L2JDWU1UMEp3VGYxRlpld3djV0pxcjcrTkU2QVpmSkJHb050TlE2SmpaZ04z?=
 =?utf-8?B?ZWkxYVREQUk5RDNGSFlRcmUvMEJ6V3JMelZhMWlROC9wZkhUQk1ISGpzMDMr?=
 =?utf-8?B?Vm1TYVdZbm9Lam1MTnN5Y1lqbTVJWGJOV283MG9qNmNqTElpb1ZWWWZVVXlO?=
 =?utf-8?B?NGJ2QURYcVlFZENQUlBxY2h5MUxIaWpmQkFGTlVIN0hMSm5wYlhVVzlMbHVK?=
 =?utf-8?B?c1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8946.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9843075-3042-4db7-8574-08d9b5d34e61
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2021 20:35:40.6918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hfv4hTFms5fgmwmqFI+uzQNt27BnK12XR9yO2QTaG1atHElTqVNotfSZReDY7GpdK09r0cWsvBYxeszhXTH6Kw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9503
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
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "balbi@kernel.org" <balbi@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9ha2ltIFRqZXJubHVu
ZCA8Sm9ha2ltLlRqZXJubHVuZEBpbmZpbmVyYS5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgRGVj
ZW1iZXIgMSwgMjAyMSA4OjE5IEFNDQo+IFRvOiByZWdyZXNzaW9uc0BsZWVtaHVpcy5pbmZvOyBM
ZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47DQo+IEV1Z2VuZV9Cb3JkZW5raXJjaGVyQHNlbGlu
Yy5jb207IGxpbnV4LXVzYkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4cHBjLQ0KPiBkZXZAbGlzdHMu
b3psYWJzLm9yZw0KPiBDYzogZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IGJhbGJpQGtlcm5l
bC5vcmcNCj4gU3ViamVjdDogUmU6IGJ1ZzogdXNiOiBnYWRnZXQ6IEZTTF9VRENfQ09SRSBDb3Jy
dXB0ZWQgcmVxdWVzdCBsaXN0IGxlYWRzIHRvDQo+IHVucmVjb3ZlcmFibGUgbG9vcC4NCj4gDQo+
IE9uIFR1ZSwgMjAyMS0xMS0zMCBhdCAxMjo1NiArMDEwMCwgSm9ha2ltIFRqZXJubHVuZCB3cm90
ZToNCj4gPiBPbiBNb24sIDIwMjEtMTEtMjkgYXQgMjM6NDggKzAwMDAsIEV1Z2VuZSBCb3JkZW5r
aXJjaGVyIHdyb3RlOg0KPiA+ID4gQWdyZWVkLA0KPiA+ID4NCj4gPiA+IFdlIGFyZSBoYXBweSBw
aWNrIHVwIHRoZSB0b3JjaCBvbiB0aGlzLCBidXQgSSdkIGxpa2UgdG8gdHJ5IGFuZCBoZWFyIGZy
b20NCj4gSm9ha2ltIGZpcnN0IGJlZm9yZSB3ZSBkby4gIFRoZSBwYXRjaCBzZXQgaXMgaGlzLCBz
byBJJ2QgbGlrZSB0byBnaXZlIGhpbSB0aGUNCj4gb3Bwb3J0dW5pdHkuICBJIHRoaW5rIGhlJ3Mg
dGhlIG9ubHkgb25lIHRoYXQgY2FuIGFkZCBhIHRydWx5IHByb3BlciBkZXNjcmlwdGlvbg0KPiBh
cyB3ZWxsIGJlY2F1c2UgaGUgbWVudGlvbmVkIHRoYXQgdGhpcyBpbmNsdWRlcyBhICJmZXcgbW9y
ZSBmaXhlcyIgdGhhbiBqdXN0DQo+IHRoZSBvbmUgd2UgcmFuIGludG8uICBJJ2QgcmF0aGVyIGhl
YXIgZnJvbSBoaW0gdGhhbiB0cnkgdG8gcmV2ZXJzZSBlbmdpbmVlcg0KPiB3aGF0IHdhcyBiZWlu
ZyBhZGRyZXNzZWQuDQo+ID4gPg0KPiA+ID4gSm9ha2ltLCBpZiB5b3UgYXJlIHN0aWxsIHdhdGNo
aW5nIHRoZSB0aHJlYWQsIHdvdWxkIHlvdSBsaWtlIHRvIHRha2UgYSBzdGFiDQo+IGF0IGl0PyAg
SWYgSSBkb24ndCBoZWFyIGZyb20geW91IGluIGEgY291cGxlIGRheXMsIHdlJ2xsIHBpY2sgdXAg
dGhlIHRvcmNoIGFuZCBkbw0KPiB3aGF0IHdlIGNhbi4NCj4gPiA+DQo+ID4NCj4gPiBJIGFtIGZh
ciBhd2F5IGZyb20gdGhpcyBub3cgYW5kIHN0aWxsIG9uIDQuMTkuIEkgZG9uJ3QgbWluZCBpZiB5
b3UgdHdlYWsNCj4gdHdlYWsgdGhlIHBhdGNoZXMgZm9yIGJldHRlciAidXBzdHJlYW1hYmlsaXR5
Ig0KPiANCj4gRXZlbiBiZXR0ZXIgd291bGQgYmUgdG8gbWlncmF0ZSB0byB0aGUgY2hpcGlkZWEg
ZHJpdmVyLCBJIGFtIHRvbGQganVzdCBhIGZldw0KPiB0d2Vha3MgYXJlIG5lZWRlZCBidXQgdGhp
cyBpcyBwcm9iYWJseSBzb21ldGhpbmcgTlhQIHNob3VsZCBkbyBhcyB0aGV5DQo+IGhhdmUgYWNj
ZXNzIHRvIG90aGVyIFNPQydzIHVzaW5nIGNoaXBpZGVhLg0KDQpJIGFncmVlIHdpdGggdGhpcyBk
aXJlY3Rpb24gYnV0IHRoZSBwcm9ibGVtIHdhcyB3aXRoIGJhbmR3aWR0aC4gIEFzIHRoaXMgY29u
dHJvbGxlciB3YXMgb25seSB1c2VkIG9uIGxlZ2FjeSBwbGF0Zm9ybXMsIGl0IGlzIGhhcmRlciB0
byBqdXN0aWZ5IG5ldyBlZmZvcnQgb24gaXQgbm93Lg0KDQpSZWdhcmRzLA0KTGVvDQoNCg==
