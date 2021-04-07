Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 684D3356206
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 05:39:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFVWJ0zm7z3brl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 13:39:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=WLru/v+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.66; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=WLru/v+J; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFVVm5QT9z2yYx
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 13:38:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K6hEqoi56jNAXwv78Wv/AzCDJxgi09dWNS0fDg7pxwP1J0FybdXKsVqtNa9RnWGrrKhJmByyvQh20Fla25B5I4dTQPBaNHZeznabPq/hoXI5IcKcR4QyRd5cMq2jlRcFzNJAhu6WkIYXV1rxFNUocXoamhB2lr5KsnRdbCbPJerY5wpz8YlQyPX/TNeBg7Xpskzm96kkYOgTV1wZqpspSsW2eD6P4vqwn4BMtRB4q0oA2IKKEjyE5uV1PDlKBwvFzKg/YN6kxPndQh+1RpIpRGA5B0gTfXJtRFtthX1flMZwvLV4Ab7ESegpSeWyi7O0WbuqW5AVQFWUAxSWfpUdzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/G3+FH7pk9v0DlnTL490jRvg509sxXZrq6DCRadkJM=;
 b=haZ+2meqPDtayePGZksMgONspvjVqtZlB4H7Q2PeKB9x14fpPK+hr3mzK8pAwpkAaGRTJhsKb0kN+RQSsDT8ATyg45Bw8Qeo8JWR9/99uVonTs/tArYi6zHd6mBsvUo/AxPlZg3pfpS/THIx+pnJ8zqR1QTRdkx1PMi/DrG6VFhetfXs2YSMhIkdr2D3ch4nZtYfZeR9xK0u8HSYKmbrwxF0whB0CjF3TsYksk6WDysQ53uQkFf9/ePxr5FP209UuqNTLiJVI/QKeGaTB+VqGW9LTLQz5i8mrmpaui6zvX0adDlFKA2XzlY7VK9xBn3+K5YdnMEZZY1Sy3lcP7y6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/G3+FH7pk9v0DlnTL490jRvg509sxXZrq6DCRadkJM=;
 b=WLru/v+J/sNYOktNZk6iTIfOxKiFmGqspeVM5aB/dccPSXji7gvPcPqsF4MWkCO2KcvXGN0YQA9UaAbO83LYBE2BNFSZHSFuq1nMXZje6Ef+7TNnxdFUXDMyL3nP106sepqTRrY6g3GcUBI6LBJgHVPXTU5RE7sNAExyqbSzmWs=
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com (2603:10a6:803:67::30)
 by VI1PR0402MB3438.eurprd04.prod.outlook.com (2603:10a6:803:5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Wed, 7 Apr
 2021 03:38:46 +0000
Received: from VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::8c2c:2497:951e:4896]) by VI1PR04MB4478.eurprd04.prod.outlook.com
 ([fe80::8c2c:2497:951e:4896%6]) with mapi id 15.20.3999.032; Wed, 7 Apr 2021
 03:38:46 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: RE: [PATCH v6] soc: fsl: enable acpi support in RCPM driver
Thread-Topic: [PATCH v6] soc: fsl: enable acpi support in RCPM driver
Thread-Index: AQHXFxzhJ56Ut1zN/ECNh+6T2L69Y6qoLhiAgAA4tzCAACjc0A==
Date: Wed, 7 Apr 2021 03:38:46 +0000
Message-ID: <VI1PR04MB447896C7673D9B3F77ED3D9C8F759@VI1PR04MB4478.eurprd04.prod.outlook.com>
References: <20210312085822.12136-1-ran.wang_1@nxp.com>
 <CADRPPNRv_T9o=Kg4dCJ6jFPxOWMY24wgDXCzyTpz3oh_yL+4Tw@mail.gmail.com>
 <AM6PR04MB5413E08499BE566F67AA62ABF1759@AM6PR04MB5413.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB5413E08499BE566F67AA62ABF1759@AM6PR04MB5413.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [136.49.83.111]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b86ca101-2bde-40af-d58a-08d8f976a631
x-ms-traffictypediagnostic: VI1PR0402MB3438:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3438BE2C80D3158E973A99098F759@VI1PR0402MB3438.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 38KHx+2Fw4gdW1+1X6ZUNkxvo8Wmc/3ARYDKF6RdEQiUUOStfo+dLXCHlg5+Jr4zR0ZwYwyuUmNAQC1I/skntkk3xCUM4dfWw/9Yg6wJDjrLSKC5Vd7+UWsWxz0MqusEoWzKCjKG2v3e1v3W3GweH/xW3RI8qcWeWSgPeKDyZwpH0hwqptPGPf1opNxBy7/9FDo5JTA9YtE0WcZx3CEUZEdD0w1kIghXeZN5ndNsfwEm71s9q6MzughPNsSWKFy+qGSARzGv4e7iIN2PYpQC8MCcOQCVnZSVgjTjdLYFy3MXjLO8Zb363xQwV5ZvrFDCNT7w75DhQB0WMB799KzdpVi8kRPoT25qVGcXu4GhDZ9D53n1TpwYjomj+RYcl4rrL08UjQFTkcrL5J2JSHF2lVKWptS3hf6tuJP1zC2e4wBEQzFsbg1rUShtNutCBay2tsMLRbe2l0WB/QiYGHtMjw/RFXwJCkpaQxVfevmOb2hJbKQ/iSmIr25RlSBZJjsuuh4tOD+GASbHvb9/rlu7Wf+P9iLc6HIAeZgeD40BEUdAVuRGPPmz/q7/EzY6tnsemX2a4XDmNPA6ey+SobHHWocbKbuPCMK3c7RMW4KA0B7WW7VngmS2kIQBwMJocj93ZlgBwnNtDHO3fDPp89hypRtAepfjbZnqXrSBavsJGA0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4478.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(86362001)(7696005)(33656002)(9686003)(478600001)(4326008)(6506007)(52536014)(6636002)(53546011)(38100700001)(83380400001)(8936002)(316002)(8676002)(66556008)(64756008)(66476007)(66446008)(2906002)(186003)(71200400001)(55016002)(26005)(54906003)(5660300002)(76116006)(66946007)(6862004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?U3ZaYTV0bWh5TWExUGs0bEVGU2tuUWRNN2FmOGU4NGJjaFI4cmM0L2Fpa1Q0?=
 =?utf-8?B?bUV0TFdlRGtsZTRCWjBMSjZSemRxa0RQWW9ycDUvcnRjcjB1aDd2ZjNyekll?=
 =?utf-8?B?MDZYcjlkVWYvZ0NpaDllZDJqa3dTRzYxQS9HSWRoQWMvaUJUT2p1c0R0R0o1?=
 =?utf-8?B?WFJ2ekRURDJQR05KNEVacHNEVGpIRFJpMEI0UzVqc3RoWm51enQyTFFKUWJ3?=
 =?utf-8?B?NzhUT3BoQXdwNFppSE9LTzRzRTcyK2xDM1Q1c2pBcE5nSE50TmZ4aWV6bC9a?=
 =?utf-8?B?dWxVOUpVeUhySFdBU0pzalI0U2J3U2ZZSUM5dXlnTnRkbjRsTU92Q1RYelhL?=
 =?utf-8?B?M0ZUMldCUnBua242d2oxTjJETlV3TUtxUW1HbnJsV1IzZk5TMzY3QVBxdzd6?=
 =?utf-8?B?ZVVuNWZJT3pYOVZaNVdocnR3bzRLdEtHK0dUZHJzWGtnSzR4bUlORTArSGNX?=
 =?utf-8?B?Wk5JdU9WWHVoUmZaRzBsTGZPRVVkYkJjV2FSL3c4bVZqaUZndHVPd3RNSjdF?=
 =?utf-8?B?eVMySGw1MGdRWTZkbjQvRS9ua2lZM0JHWUoxdzl3V2dGTThXWiszdzNYUFRa?=
 =?utf-8?B?TitNTTNKT0tsZlZ6bGFtRWFqelhXRit3bnptMG5xaHNtZWVnemdLMXp0UnI5?=
 =?utf-8?B?NnJDRWE1Y0FXbWNEZk8wdXJDUGNBQnBLcXN3WTBMUTdsOHJyN3RXRUhvMEVq?=
 =?utf-8?B?OG9OZnordWNuZFVCU3FNVm8vakxJa2EzUGVQbU1KdXYrTERGQzFoR25uMVBH?=
 =?utf-8?B?WFkrRER5MzliZDdJUU40WXRTTzVsY0tGSXM5S2t3dEtTT2NYdGVqY3BEejMx?=
 =?utf-8?B?WlhSUGFqR1ROMjFjR0tweUhqUzlJdjBlY1lVdmtxUFF1dkkwQjhZcTlWOGpQ?=
 =?utf-8?B?SnBHZlRTalBMVmptcUJOeEcyRE5QVlNHSUlubStLcisyZEJ0bFkxeTl4WmNZ?=
 =?utf-8?B?Q2xSb01xK2ZYcFVkdGM2MUlvTWtwV2lnTFdpUldYUGs2bTlKcU1QWXFDYnQv?=
 =?utf-8?B?bkh2Sm14U0dnY0xEaHhucm1sNGZvdHduMEZTVmJIOEFMYW4yU3M0KzZ5Sk1I?=
 =?utf-8?B?aDA4NlNFN3R6N0EzRXJ3Rk1hS1Q0VTZZUUtHcGpLOTA2OHN5dlVOZzlKUCs3?=
 =?utf-8?B?clM5YlZLTGVuam1ieVk3WTE5ZDhUQnlTdExFcnBFamgrOFNxbnhYTkFoU0sy?=
 =?utf-8?B?STNBOSttbXJYdlBBdTJEdnFGNWg4R0c0dURQSVpDTzNKMG1lRXhZWkxaTytH?=
 =?utf-8?B?Z3ppUGFsT045ZUl2M002bjVxNzRlaXpESitDZjBoUlFGOGlmUjJtRWhaUXZ2?=
 =?utf-8?B?MWdseGwwTEpXd2ZHNWFQa0RNSlJOWmFnZFMyVThPM3lzQ3lTeStMK0JIYlc5?=
 =?utf-8?B?MXRiaXRDdnhqMUw2L091ZElDTEE3bzNDWjcvM1RYcEpJSFpHZjBPc09MM0dw?=
 =?utf-8?B?WitQQWtyYnEwa2gxUHZMRGFlemtmamJaenN5VUI2TTAzSExiVWpBRjFMSzFH?=
 =?utf-8?B?YVU2UEZRcFhoNk9sME1JREhqdlllbEZmRHByekZ0eVZjV20zRWdXenRxYUpF?=
 =?utf-8?B?SzlGM0JQOC9kZDRrZ3c1bnRwcjZ2eUV3VC9LajY2V1ZpMERCZ05CRjJaMWVj?=
 =?utf-8?B?V3RwU0NmaFZqb0xza0xKLzBRdTBpbUVYNGZmS3hlK1g5cHJkU2xZN0s2OHBh?=
 =?utf-8?B?Zlg3amNIZllRSithKzFMS3cydC9tQ1Qyc3k2V0pyZ1hjTVNVU3d4S1RleHBX?=
 =?utf-8?Q?lVAt37exPmvlkKq8l5swJhHMTyHeAwS7a5syqXf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4478.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86ca101-2bde-40af-d58a-08d8f976a631
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 03:38:46.1576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc0bztf9eUXzH0tS8DMxMaR5KNEpOLqsXTmVJEnYZ8pWnJAkCYwJb9XF2Gsdkdb0doxH5D0aHcCp86xkmbUnfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3438
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFuIFdhbmcgPHJhbi53
YW5nXzFAbnhwLmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXByaWwgNiwgMjAyMSA4OjMyIFBNDQo+
IFRvOiBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gQ2M6IENocmlzdG9waGUgTGVyb3kg
PGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT47IGxpbnV4cHBjLWRldg0KPiA8bGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmc+OyBtb2RlcmF0ZWQgbGlzdDpBUk0vRlJFRVNDQUxFIElNWCAv
IE1YQw0KPiBBUk0gQVJDSElURUNUVVJFIDxsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmc+OyBsa21sIDxsaW51eC0NCj4ga2VybmVsQHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVj
dDogUkU6IFtQQVRDSCB2Nl0gc29jOiBmc2w6IGVuYWJsZSBhY3BpIHN1cHBvcnQgaW4gUkNQTSBk
cml2ZXINCj4gDQo+IEhpIExlbywNCj4gDQo+IE9uIFdlZG5lc2RheSwgQXByaWwgNywgMjAyMSA1
OjQ1IEFNLCBMaSBZYW5nIHdyb3RlOg0KPiA+DQo+ID4gT24gRnJpLCBNYXIgMTIsIDIwMjEgYXQg
Mjo1NiBBTSBSYW4gV2FuZyA8cmFuLndhbmdfMUBueHAuY29tPiB3cm90ZToNCj4gPiA+DQo+ID4g
PiBGcm9tOiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+ID4gPg0KPiA+ID4gVGhpcyBwYXRj
aCBlbmFibGVzIEFDUEkgc3VwcG9ydCBpbiBSQ1BNIGRyaXZlci4NCj4gPiA+DQo+ID4gPiBTaWdu
ZWQtb2ZmLWJ5OiBQZW5nIE1hIDxwZW5nLm1hQG54cC5jb20+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSYW4gV2FuZyA8cmFuLndhbmdfMUBueHAuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiBDaGFuZ2Ug
aW4gdjY6DQo+ID4gPiAgLSBSZW1vdmUgY29weXJpZ2h0IHVkcGF0ZSB0byByZWJhc2Ugb24gbGF0
ZXN0IG1haW5saW5lDQo+ID4gPg0KPiA+ID4gQ2hhbmdlIGluIHY1Og0KPiA+ID4gIC0gRml4IHBh
bmljIHdoZW4gZGV2LT5vZl9ub2RlIGlzIG51bGwNCj4gPiA+DQo+ID4gPiBDaGFuZ2UgaW4gdjQ6
DQo+ID4gPiAgLSBNYWtlIGNvbW1pdCBzdWJqZWN0IG1vcmUgYWNjdXJhdGUNCj4gPiA+ICAtIFJl
bW92ZSB1bnJlbGF0ZWQgbmV3IGJsYW5rIGxpbmUNCj4gPiA+DQo+ID4gPiBDaGFuZ2UgaW4gdjM6
DQo+ID4gPiAgLSBBZGQgI2lmZGVmIENPTkZJR19BQ1BJIGZvciBhY3BpX2RldmljZV9pZA0KPiA+
ID4gIC0gUmVuYW1lIHJjcG1fYWNwaV9pbXhfaWRzIHRvIHJjcG1fYWNwaV9pZHMNCj4gPiA+DQo+
ID4gPiBDaGFuZ2UgaW4gdjI6DQo+ID4gPiAgLSBVcGRhdGUgYWNwaV9kZXZpY2VfaWQgdG8gZml4
IGNvbmZsaWN0IHdpdGggb3RoZXIgZHJpdmVyDQo+ID4gPg0KPiA+ID4gIGRyaXZlcnMvc29jL2Zz
bC9yY3BtLmMgfCAxOCArKysrKysrKysrKysrKysrLS0NCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MTYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2MvZnNsL3JjcG0uYyBiL2RyaXZlcnMvc29jL2ZzbC9yY3BtLmMgaW5kZXgN
Cj4gPiA+IDRhY2UyOGNhYjMxNC4uN2FhOTk3YjkzMmQxIDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJp
dmVycy9zb2MvZnNsL3JjcG0uYw0KPiA+ID4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3JjcG0uYw0K
PiA+ID4gQEAgLTEzLDYgKzEzLDcgQEANCj4gPiA+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0K
PiA+ID4gICNpbmNsdWRlIDxsaW51eC9zdXNwZW5kLmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPg0KPiA+ID4gKyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQo+ID4gPg0KPiA+ID4g
ICNkZWZpbmUgUkNQTV9XQUtFVVBfQ0VMTF9NQVhfU0laRSAgICAgIDcNCj4gPiA+DQo+ID4gPiBA
QCAtNzgsMTAgKzc5LDE0IEBAIHN0YXRpYyBpbnQgcmNwbV9wbV9wcmVwYXJlKHN0cnVjdCBkZXZp
Y2UgKmRldikNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxyY3Bt
LXdha2V1cCIsIHZhbHVlLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
Y3BtLT53YWtldXBfY2VsbHMgKyAxKTsNCj4gPiA+DQo+ID4gPiAtICAgICAgICAgICAgICAgLyog
IFdha2V1cCBzb3VyY2Ugc2hvdWxkIHJlZmVyIHRvIGN1cnJlbnQgcmNwbSBkZXZpY2UgKi8NCj4g
PiA+IC0gICAgICAgICAgICAgICBpZiAocmV0IHx8IChucC0+cGhhbmRsZSAhPSB2YWx1ZVswXSkp
DQo+ID4gPiArICAgICAgICAgICAgICAgaWYgKHJldCkNCj4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOw0KPiA+ID4NCj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoaXNfb2Zf
bm9kZShkZXYtPmZ3bm9kZSkpDQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiAgU2hv
dWxkIHJlZmVyIHRvIGN1cnJlbnQgcmNwbSBkZXZpY2UgKi8NCg0KQmV0dGVyIHRvIGJlIC8qIE9u
bHkgaGFuZGxlIGRldmljZXMgd2l0aCBmc2wscmNwbS13YWtldXAgcG9pbnRpbmcgdG8gdGhlIGN1
cnJlbnQgcmNwbSBub2RlKi8NCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChucC0+
cGhhbmRsZSAhPSB2YWx1ZVswXSkNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29udGludWU7DQo+ID4NCj4gPiBJdCBsb29rcyBsaWtlIHRoYXQgd2UgYXNzdW1lIHRoYXQg
aW4gdGhlIEFDUEkgc2NlbmFyaW8gdGhlcmUgd2lsbCBvbmx5DQo+ID4gYmUgb25lIFJDUE0gY29u
dHJvbGxlciBhbmQgYWxsIGRldmljZXMgYXJlIGNvbnRyb2xsZWQgYnkgdGhpcyBzaW5nbGUNCj4g
PiBQTSBjb250cm9sbGVyLiAgVGhpcyBwcm9iYWJseSBpcyB0cnVlIGZvciBhbGwgZXhpc3Rpbmcg
U29DcyB3aXRoIGEgUkNQTS4gIEJ1dA0KPiBzaW5jZSB0aGUgZHJpdmVyIHRyaWVkIHRvIHN1cHBv
cnQgbXVsdGlwbGUgUkNQTXMsIG1heWJlIHdlIHNob3VsZCBjb250aW51ZQ0KPiB0byBzdXBwb3J0
IG11bHRpcGxlIFJDUE0gY29udHJvbGxlcnMgb3IgYXQgbGVhc3QgbWVudGlvbiB0aGF0IGluIHRo
ZQ0KPiBjb21tZW50Lg0KPiANCj4gSG93IGFib3V0IGFkZGluZyBzb21lIGNvbW1lbnQgYXMgYmVs
b3c6DQo+IA0KPiAvKiBGb3IgQUNQSSBtb2RlLCBjdXJyZW50bHkgd2UgYXNzdW1lIHRoZXJlIGlz
IG9ubHkgb25lIFJDUE0gY29udHJvbGxlcg0KPiBleGlzdGluZyAqLw0KDQpPay4gIE9uIHRoZSBv
dGhlciBoYW5kLCBpdCB3aWxsIGJlIGNsZWFyZXIgdG8gdXBkYXRlIHRoZSBleGlzdGluZyBjb21t
ZW50IGFib3ZlLg0KDQo+IA0KPiBSZWdhcmRzLA0KPiBSYW4NCj4gDQo+ID4NCj4gPiA+ICsNCj4g
PiA+ICAgICAgICAgICAgICAgICAvKiBQcm9wZXJ0eSAiI2ZzbCxyY3BtLXdha2V1cC1jZWxscyIg
b2YgcmNwbSBub2RlIGRlZmluZXMgdGhlDQo+ID4gPiAgICAgICAgICAgICAgICAgICogbnVtYmVy
IG9mIElQUERFWFBDUiByZWdpc3RlciBjZWxscywgYW5kICJmc2wscmNwbS13YWtldXAiDQo+ID4g
PiAgICAgICAgICAgICAgICAgICogb2Ygd2FrZXVwIHNvdXJjZSBJUCBjb250YWlucyBhbiBpbnRl
Z2VyIGFycmF5Og0KPiA+ID4gPHBoYW5kbGUgdG8gQEAgLTE3MiwxMCArMTc3LDE5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkDQo+ID4gPiByY3BtX29mX21hdGNoW10gPSB7ICB9
OyAgTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgcmNwbV9vZl9tYXRjaCk7DQo+ID4gPg0KPiA+ID4g
KyNpZmRlZiBDT05GSUdfQUNQSQ0KPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgYWNwaV9kZXZp
Y2VfaWQgcmNwbV9hY3BpX2lkc1tdID0gew0KPiA+ID4gKyAgICAgICB7Ik5YUDAwMTUiLH0sDQo+
ID4gPiArICAgICAgIHsgfQ0KPiA+ID4gK307DQo+ID4gPiArTU9EVUxFX0RFVklDRV9UQUJMRShh
Y3BpLCByY3BtX2FjcGlfaWRzKTsgI2VuZGlmDQo+ID4gPiArDQo+ID4gPiAgc3RhdGljIHN0cnVj
dCBwbGF0Zm9ybV9kcml2ZXIgcmNwbV9kcml2ZXIgPSB7DQo+ID4gPiAgICAgICAgIC5kcml2ZXIg
PSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgLm5hbWUgPSAicmNwbSIsDQo+ID4gPiAgICAgICAg
ICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcmNwbV9vZl9tYXRjaCwNCj4gPiA+ICsgICAgICAg
ICAgICAgICAuYWNwaV9tYXRjaF90YWJsZSA9IEFDUElfUFRSKHJjcG1fYWNwaV9pZHMpLA0KPiA+
ID4gICAgICAgICAgICAgICAgIC5wbSAgICAgPSAmcmNwbV9wbV9vcHMsDQo+ID4gPiAgICAgICAg
IH0sDQo+ID4gPiAgICAgICAgIC5wcm9iZSA9IHJjcG1fcHJvYmUsDQo+ID4gPiAtLQ0KPiA+ID4g
Mi4yNS4xDQo+ID4gPg0K
