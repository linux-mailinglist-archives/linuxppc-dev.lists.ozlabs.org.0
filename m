Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC7363C56
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 09:17:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNynl2pGGz3c0M
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 17:17:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=WRBTkOy2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.20.86; helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=yibin.gong@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=WRBTkOy2; 
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNynD6lX1z2xYs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 17:17:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zb4IJu2eJW3ezdH5+BsH+7MZ0u5MyhlA51XAPqbkHTsU3r78RCMeFBNdPrWq+KZ9fAV5KdxEaGXvAB6U4s3buam26DZUMNZ4W/5z1MylqskjfiZCPXxVySwFye6Of+3VxKeTTuG3FgnFe5icE0EOeVulq1XyXVJFw/dgZzuXIkGb6VaZAce86TgbYSA/kAreos3ENfNpsjqTZt4L+U5l4D5C+mgZuA6gZ+R4vUdbyvX/KvnaXPVBxLmcAWyAbh+hr2dDh6bBVYmhdhlr+rTwQJ48Wp5hjr0t2iTds/Q0T7Bx7bIc9waLdDS7bxQVMAUundHZZDPF8dc1MHnxy7wyeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekCE7p/zoelRNaTrGRClrl06ZLsWlzMs7OmoNEtD76Q=;
 b=cNuCw7/JQjbPgwatcPDnTrVbsGfuz65tF0ukA1lvsMcS5GidUrf/yrfXbvsxFFRxSJzy3BUkjBpZYpHb8L8/4uPV24DHayI84JdnYhzbiBaDWabMIb/X9C9Y6Cuu9Y+mIclWtX+GAXn6HWPuSf6ZM7+W9Vh4FBYeJ0vqE7iL6uLCZeBCxp4KsL8nEpuvbnjNKqOAINkGewLO3VXNtbcGGZ7FUdj4jcov0oWszysOdXy75rLPhUcHXx2HISVEhe/NLT6tF6OTX7pdHeC2tZSIG8vyTvkbWeIU6WHzV6FBWBdSMiG86RPqEkGH53041v3fT1v68+QKmIbqWLinnWj+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekCE7p/zoelRNaTrGRClrl06ZLsWlzMs7OmoNEtD76Q=;
 b=WRBTkOy2CgYMcepKzBCiNN9+zL7uGMuV8JeGP29gaojbBXizB78GOSzur+iYdiOE14Z5casPMrWfldDGYppn2dRAV+GO/dmyJ8sQEf0qwezYgcHCMhk6j/2+YnJ4yGt7k6e3lGBg3UaDwnWsThNVWHktyhIj0Z23lTrGrACf9BY=
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com (2603:10a6:803:119::15)
 by VI1PR04MB6269.eurprd04.prod.outlook.com (2603:10a6:803:fa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 07:17:13 +0000
Received: from VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3]) by VE1PR04MB6638.eurprd04.prod.outlook.com
 ([fe80::e8e2:7756:13bc:2cb3%7]) with mapi id 15.20.3999.037; Mon, 19 Apr 2021
 07:17:13 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Shengjiu Wang
 <shengjiu.wang@gmail.com>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+QgAHvdICAAJqQwA==
Date: Mon, 19 Apr 2021 07:17:12 +0000
Message-ID: <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
In-Reply-To: <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c671a55d-fa3f-4a11-a8d2-08d903032765
x-ms-traffictypediagnostic: VI1PR04MB6269:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6269B752CB78DD8AE00C066389499@VI1PR04MB6269.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cXV3FAJwL7dKbebGXSOD6wGmu0Zu8ha+t+jthq2Y3UWAG3ZJTKL9oINpw0logzR3YwSc88kO/A/AwLyvLL8YadIIz7M2b7lED9AKpCEsAw9eEZqKeyfsglasUONetU1KuVku51lA5KLgweNhsaklmIyeEInLa7ubIxvY/cdL+F+A/5lj/rHsB9CW13G4jGOBZSEFiiZ6IlKsdVMgAie2x+Plr+I0i9KVZ/hZuvITaf8PaN904IY2+XhH3SxXvCIokwbRqVRF64zRPx3qKQ1si+q7oYS8mlfSXa4k+FUTxDD2Z0B67SszWMA8uruuu6LFXH1TSq9oGF5AvkBs++no/anzgHpZikw7adRvMmCxgDDm++c4Dyx5QPhWKEEL9W6kPTaY/uBX98pDcNp7/fCCFmR5ubdQBHvV8tkykDSCTifQrCZZttAmxsWU0UFky8kSUHO/PO+Fc8SriUrMy1Xto5he0jRcrHYlA6zpITuNwpfcJRrgjfc7AC8WKbUSWKQH4Ch35LC0y72dFr69SHdfXA/jySBDtWSnRz97wmQkbm6fBHthJrXLFaRa+Cj6D9WEi0cOhF8yomNhR37h/7/vIW4GDE/A2Y7Xv20uAokag4SylN1qr+dEkSPQZFiEuUPHg0m1ipG3Ig++sNcFQUWE4A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6638.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39850400004)(376002)(346002)(366004)(86362001)(38100700002)(122000001)(5660300002)(83380400001)(2906002)(7416002)(71200400001)(4326008)(54906003)(186003)(66446008)(66556008)(66946007)(64756008)(66476007)(9686003)(26005)(6506007)(76116006)(8936002)(55016002)(7696005)(316002)(478600001)(110136005)(8676002)(52536014)(33656002)(53546011)(98474003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?d3FUK2VlbWh4N2RsaVpRRFg2cnRxY0hMT0ptVnJKT3JVZmhhdTh3UFBOajIr?=
 =?utf-8?B?NU50WGZNb05mYytuU2VVUHR1dDliTGkrL2V4Qm1iNjlnQ1I2SEJycEo3enUv?=
 =?utf-8?B?d1RVOWN2RDdKeHFRaEwzRHJiZXdNSDFCY0h0NEhpdEdaUmJyWXRNRWhXVWdG?=
 =?utf-8?B?WHJYVGU0U3lUZzRLcDRua3lmRHRVbGk3bTFYODJ2UDFHK3F4Um14cnFvZTF1?=
 =?utf-8?B?YklaSDU1VVg1RlBKbWhOUTd6ZjEra3ZpSk9ZS1JXSlhhdHJ2ZGRJZklsekR0?=
 =?utf-8?B?MHNOcXl0bnR0ak5YeXVYSG9yUldPQTZtbkl6TFpoSlRxZjBDTjNhOFgxMFBO?=
 =?utf-8?B?NzFrNk1STVJETE5SOHhZUzhsWXB3a2Iyam5QUzNGRnBhK2ZEQWxuQUtoTDEy?=
 =?utf-8?B?dEpiaTdEOXIzZFpPNnplc1VjMXZSaFdWRmhKQXo4QVVIdTM0Yk16U2hqdFNN?=
 =?utf-8?B?cjRZcndDTnphYmFTWUJjbDlqcHZEVjFJKzdaNFpJMVFRVmpoYzJVRnkxcGVM?=
 =?utf-8?B?K1JmcHJBcEhBd01SQVA1ME81ZElWU2NUYVdGTTJFaTEyR2REVm5LK2pmeEdx?=
 =?utf-8?B?cHd2ZHF6ZUJFTjlwSVdISDdXYWplOWhhbDdQdVRyRDZxYU1zRXVlV0FCTGE0?=
 =?utf-8?B?dGF2eFdxbllDbWo0R1RzdTdaVktUNEdRdnNuN2ZWWGVMZFhUTE9hWTRKMExl?=
 =?utf-8?B?QzgrdUgxWG95WDBUWFREdkt2L1FuaUx2T2xvQmk4MTA1Qm5OQWJvcHExc1BQ?=
 =?utf-8?B?Q1FVM3pyaHpSenQ2U1hJN3BTVkdUVWU1RTZnRjBqUnlxbDVaa1VOaWllUUZs?=
 =?utf-8?B?TktxNlRxb2FzZGQ3UkliNEZjTnhqNEViTjdLQXhOSm1uZ0pxaFBtM0N3ck14?=
 =?utf-8?B?RnhKczlDUkkrc0JxbFl0STBiVFY0cGlCVWFSRUlqb0VEM2wwZloxNm5BZGJy?=
 =?utf-8?B?cG5rdnAxbjdQL0kyMXdncTVTSnhsTTFUUnlSOGVJYjA2bldxQmkxa0pQZUUv?=
 =?utf-8?B?YjlxczBuUUYrWUFydnJJdHdKKzlTZVppcEdidGkrQ1VhQmc2VXdsNEFqUGdQ?=
 =?utf-8?B?ZFVwY3IvZGRuOFJYd2U1YnZwSXdFcmRPZktNbTI0SjNUZXZoYitWbVZVWVRo?=
 =?utf-8?B?ZmZweWhnUS9yQS9hS0ovSHc1Ym5DbVJiOExmbEdnb0gvbnJzeUI1UDVWNFBj?=
 =?utf-8?B?UXdLVWltbUkzV3ErWTdnUzVPUCtVMlUzbS9LYmwvM3FRcnpaeU55MjRMM3lL?=
 =?utf-8?B?ME9WRSsyWUk4QlUxRysxTHdudG9SWm1YTmRhU2pkTEV6NnZwbGhBNDBZamlX?=
 =?utf-8?B?RDVUdDBQM3VtNXlxQmplY0QzdGp6cWdvZWd6c21aMDBkUFNNM2lvV2xKd2FG?=
 =?utf-8?B?Z3A3TlVVczJqOEt3ZHNFai94RC9paFR1WmhmL1ZPNStDMzMyeEVNcndodEtZ?=
 =?utf-8?B?ZHVCMWFublltTWx4dWdDZjlnTThzYkN6clBiQUFJUVMrdSt0czZ5ZjlvMDl0?=
 =?utf-8?B?MmNYbXVOWnV5M1dxbmtWVktHdTU0akRORnMyMGtyWDNqcG0xSVoxUWd4Tmhy?=
 =?utf-8?B?S2FNdUdQc3VteDVmTVZwRmo1RFErbE9LczA1N0hqM2dkZG9RNkUyaHhNaURG?=
 =?utf-8?B?Mnl1eW1rWlZtakIrTVBJOVk1WlBJR1NTKzhlVGY0aHpKNUJjb3laN1hFUGJB?=
 =?utf-8?B?aHNicHVFb2dERTE5V2h4bzBYdWIrWkZpNzVadjBoOHZIMFVwL0Z4NjR0aTVs?=
 =?utf-8?Q?KNBQcnoFUQBRoKou6Vs1WNnBoXvT5KSS3rKz9Mw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6638.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c671a55d-fa3f-4a11-a8d2-08d903032765
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 07:17:12.8376 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: m+xT9767u59xQp3fEtrV2yAftwIcX66oC+yDgiUImqYZjo6ivzkTPaHqA7Yfoih53yNvjgIabQDldOGKyBpweg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6269
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, "perex@perex.cz" <perex@perex.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTHVjYXMsDQoNCk9uIDIwMjEvMDQvMTQgTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+IHdyb3RlOg0KPiBIaSBSb2JpbiwNCj4gDQo+IEFtIE1pdHR3b2NoLCBkZW0gMTQuMDQu
MjAyMSB1bSAxNDozMyArMDAwMCBzY2hyaWViIFJvYmluIEdvbmc6DQo+ID4gT24gMjAyMC8wNS8y
MCAxNzo0MyBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4gd3JvdGU6DQo+ID4g
PiBBbSBNaXR0d29jaCwgZGVuIDIwLjA1LjIwMjAsIDE2OjIwICswODAwIHNjaHJpZWIgU2hlbmdq
aXUgV2FuZzoNCj4gPiA+ID4gSGkNCj4gPiA+ID4NCj4gPiA+ID4gT24gVHVlLCBNYXkgMTksIDIw
MjAgYXQgNjowNCBQTSBMdWNhcyBTdGFjaA0KPiA+ID4gPiA8bC5zdGFjaEBwZW5ndXRyb25peC5k
ZT4NCj4gPiA+IHdyb3RlOg0KPiA+ID4gPiA+IEFtIERpZW5zdGFnLCBkZW4gMTkuMDUuMjAyMCwg
MTc6NDEgKzA4MDAgc2NocmllYiBTaGVuZ2ppdSBXYW5nOg0KPiA+ID4gPiA+ID4gVGhlcmUgYXJl
IHR3byByZXF1aXJlbWVudHMgdGhhdCB3ZSBuZWVkIHRvIG1vdmUgdGhlIHJlcXVlc3Qgb2YNCj4g
PiA+ID4gPiA+IGRtYSBjaGFubmVsIGZyb20gcHJvYmUgdG8gb3Blbi4NCj4gPiA+ID4gPg0KPiA+
ID4gPiA+IEhvdyBkbyB5b3UgaGFuZGxlIC1FUFJPQkVfREVGRVIgcmV0dXJuIGNvZGUgZnJvbSB0
aGUgY2hhbm5lbA0KPiA+ID4gPiA+IHJlcXVlc3QgaWYgeW91IGRvbid0IGRvIGl0IGluIHByb2Jl
Pw0KPiA+ID4gPg0KPiA+ID4gPiBJIHVzZSB0aGUgZG1hX3JlcXVlc3Rfc2xhdmVfY2hhbm5lbCBv
ciBkbWFfcmVxdWVzdF9jaGFubmVsIGluc3RlYWQNCj4gPiA+ID4gb2YgZG1hZW5naW5lX3BjbV9y
ZXF1ZXN0X2NoYW5fb2YuIHNvIHRoZXJlIHNob3VsZCBiZSBub3QNCj4gPiA+ID4gLUVQUk9CRV9E
RUZFUiByZXR1cm4gY29kZS4NCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGEgcHJldHR5IHdlYWsgYXJn
dW1lbnQuIFRoZSBkbWFlbmdpbmUgZGV2aWNlIG1pZ2h0IHByb2JlDQo+ID4gPiBhZnRlciB5b3Ug
dHJ5IHRvIGdldCB0aGUgY2hhbm5lbC4gVXNpbmcgYSBmdW5jdGlvbiB0byByZXF1ZXN0IHRoZQ0K
PiA+ID4gY2hhbm5lbCB0aGF0IGRvZXNuJ3QgYWxsb3cgeW91IHRvIGhhbmRsZSBwcm9iZSBkZWZl
cnJhbCBpcyBJTUhPIGENCj4gPiA+IGJ1ZyBhbmQgc2hvdWxkIGJlIGZpeGVkLCBpbnN0ZWFkIG9m
IGJ1aWxkaW5nIGV2ZW4gbW9yZSBhc3N1bXB0aW9ucyBvbiB0b3ANCj4gb2YgaXQuDQo+ID4gPg0K
PiA+ID4gPiA+ID4gLSBXaGVuIGRtYSBkZXZpY2UgYmluZHMgd2l0aCBwb3dlci1kb21haW5zLCB0
aGUgcG93ZXIgd2lsbCBiZQ0KPiA+ID4gPiA+ID4gZW5hYmxlZCB3aGVuIHdlIHJlcXVlc3QgZG1h
IGNoYW5uZWwuIElmIHRoZSByZXF1ZXN0IG9mIGRtYQ0KPiA+ID4gPiA+ID4gY2hhbm5lbCBoYXBw
ZW4gb24gcHJvYmUsIHRoZW4gdGhlIHBvd2VyLWRvbWFpbnMgd2lsbCBiZSBhbHdheXMNCj4gPiA+
ID4gPiA+IGVuYWJsZWQgYWZ0ZXIga2VybmVsIGJvb3QgdXAsICB3aGljaCBpcyBub3QgZ29vZCBm
b3IgcG93ZXINCj4gPiA+ID4gPiA+IHNhdmluZywgIHNvIHdlIG5lZWQgdG8gbW92ZSB0aGUgcmVx
dWVzdCBvZiBkbWEgY2hhbm5lbCB0bw0KPiA+ID4gPiA+ID4gLm9wZW4oKTsNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFRoaXMgaXMgY2VydGFpbmx5IHNvbWV0aGluZyB3aGljaCBjb3VsZCBiZSBmaXhl
ZCBpbiB0aGUNCj4gPiA+ID4gPiBkbWFlbmdpbmUgZHJpdmVyLg0KPiA+ID4gPg0KPiA+ID4gPiBE
bWEgZHJpdmVyIGFsd2F5cyBjYWxsIHRoZSBwbV9ydW50aW1lX2dldF9zeW5jIGluDQo+ID4gPiA+
IGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcywgdGhlIGRldmljZV9hbGxvY19jaGFuX3Jlc291
cmNlcyBpcw0KPiA+ID4gPiBjYWxsZWQgd2hlbiBjaGFubmVsIGlzIHJlcXVlc3RlZC4gc28gcG93
ZXIgaXMgZW5hYmxlZCBvbiBjaGFubmVsDQo+IHJlcXVlc3QuDQo+ID4gPg0KPiA+ID4gU28gd2h5
IGNhbid0IHlvdSBmaXggdGhlIGRtYWVuZ2luZSBkcml2ZXIgdG8gZG8gdGhhdCBSUE0gY2FsbCBh
dCBhDQo+ID4gPiBsYXRlciB0aW1lIHdoZW4gdGhlIGNoYW5uZWwgaXMgYWN0dWFsbHkgZ29pbmcg
dG8gYmUgdXNlZD8gVGhpcyB3aWxsDQo+ID4gPiBhbGxvdyBmdXJ0aGVyIHBvd2VyIHNhdmluZ3Mg
d2l0aCBvdGhlciBzbGF2ZSBkZXZpY2VzIHRoYW4gdGhlIGF1ZGlvIFBDTS4NCj4gPiBIaSBMdWNh
cywNCj4gPiDCoMKgVGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24uIEkgaGF2ZSB0cmllZCB0byBp
bXBsZW1lbnQgcnVudGltZQ0KPiA+IGF1dG9zdXNwZW5kIGluIGZzbC1lZG1hIGRyaXZlciBvbiBp
Lm14OHFtL3F4cCB3aXRoIGRlbGF5IHRpbWUgKDIgc2VjKQ0KPiA+IGZvciB0aGlzIGZlYXR1cmUg
YXMgYmVsb3cgKG9yIHlvdSBjYW4gcmVmZXIgdG8NCj4gPiBkcml2ZXJzL2RtYS9xY29tL2hpZG1h
LmMpLCBhbmQgcG1fcnVudGltZV9nZXRfc3luYy8NCj4gPiBwbV9ydW50aW1lX3B1dF9hdXRvc3Vz
cGVuZCBpbiBhbGwgZG1hZW5naW5lIGRyaXZlciBpbnRlcmZhY2UgbGlrZQ0KPiA+IGRldmljZV9h
bGxvY19jaGFuX3Jlc291cmNlcy9kZXZpY2VfcHJlcF9zbGF2ZV9zZy9kZXZpY2VfcHJlcF9kbWFf
Y3ljbGkNCj4gPiBjLw0KPiA+IGRldmljZV90eF9zdGF0dXMuLi4NCj4gPg0KPiA+DQo+ID4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBwbV9ydW50aW1lX3VzZV9hdXRvc3VzcGVuZChm
c2xfY2hhbi0+ZGV2KTsNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHBtX3J1
bnRpbWVfc2V0X2F1dG9zdXNwZW5kX2RlbGF5KGZzbF9jaGFuLT5kZXYsDQo+IDIwMDApOw0KPiA+
DQo+ID4gVGhhdCBjb3VsZCByZXNvbHZlIHRoaXMgYXVkaW8gY2FzZSBzaW5jZSB0aGUgYXV0b3N1
c3BlbmQgY291bGQgc3VzcGVuZA0KPiA+IHJ1bnRpbWUgYWZ0ZXINCj4gPiAyIHNlY29uZHMgaWYg
dGhlcmUgaXMgbm8gZnVydGhlciBkbWEgdHJhbnNmZXIgYnV0IG9ubHkgY2hhbm5lbA0KPiByZXF1
ZXN0KGRldmljZV9hbGxvY19jaGFuX3Jlc291cmNlcykuDQo+ID4gQnV0IHVuZm9ydHVuYXRlbHks
IGl0IGNhdXNlIGFub3RoZXIgaXNzdWUuIEFzIHlvdSBrbm93LCBvbiBvdXINCj4gPiBpLm14OHFt
L3F4cCwgcG93ZXIgZG9tYWluIGRvbmUgYnkgc2NmdyAoZHJpdmVycy9maXJtd2FyZS9pbXgvc2N1
LXBkLmMpDQo+IG92ZXIgbWFpbGJveDoNCj4gPiDCoGlteF9zY19wZF9wb3dlcigpLT5pbXhfc2N1
X2NhbGxfcnBjKCktPg0KPiA+IGlteF9zY3VfaXBjX3dyaXRlKCktPm1ib3hfc2VuZF9tZXNzYWdl
KCkNCj4gPiB3aGljaCBtZWFucyBoYXZlIHRvICd3YWl0cyBmb3IgY29tcGxldGlvbicsIG1lYW53
aGlsZSwgc29tZSBkcml2ZXINCj4gPiBsaWtlIHR0eSB3aWxsIGNhbGwgZG1hZW5naW5lIGludGVy
ZmFjZXMgaW4gbm9uLWF0b21pYyBjYXNlIGFzIGJlbG93LA0KPiA+DQo+ID4gc3RhdGljIGludCB1
YXJ0X3dyaXRlKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksIGNvbnN0IHVuc2lnbmVkIGNoYXINCj4g
PiAqYnVmLCBpbnQgY291bnQpIHsNCj4gPiDCoMKgwqAuLi4uLi4uDQo+ID4gCSAgICBwb3J0ID0g
dWFydF9wb3J0X2xvY2soc3RhdGUsIGZsYWdzKTsNCj4gPiDCoMKgwqAuLi4uLi4NCj4gPiDCoMKg
wqDCoMKgwqDCoMKgX191YXJ0X3N0YXJ0KHR0eSk7ICAvL2NhbGwgc3RhcnRfdHgoKS0+ZG1hZW5n
aW5lX3ByZXBfc2xhdmVfc2cuLi4NCj4gPiDCoMKgwqDCoMKgwqDCoMKgdWFydF9wb3J0X3VubG9j
ayhwb3J0LCBmbGFncyk7DQo+ID4gwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7DQo+ID4gfQ0K
PiA+DQo+ID4gVGh1cyBkbWEgcnVudGltZSByZXN1bWUgbWF5IGhhcHBlbiBpbiB0aGF0IHRpbWlu
ZyB3aW5kb3cgYW5kIGNhdXNlDQo+IGtlcm5lbCBhbGFybS4NCj4gPiBJJ20gbm90IHN1cmUgd2hl
dGhlciB0aGVyZSBhcmUgc2ltaWxhciBsaW1pdGF0aW9ucyBvbiBvdGhlciBkcml2ZXINCj4gPiBz
dWJzeXN0ZW0uIEJ1dCBmb3IgbWUsIEl0IGxvb2tzIGxpa2UgdGhlIG9ubHkgd2F5IHRvIHJlc29s
dmUgdGhlDQo+ID4gY29udHJhZGljdGlvbiBiZXR3ZWVuIHR0eSBhbmQgc2N1LXBkIChoYXJkd2Fy
ZSBsaW1pdGF0aW9uIG9uDQo+ID4gaS5teDhxbS9xeHApIGlzIHRvIGdpdmUgdXAgYXV0b3N1c3Bl
bmQgYW5kIGtlZXAgcG1fcnVudGltZV9nZXRfc3luYw0KPiBvbmx5IGluIGRldmljZV9hbGxvY19j
aGFuX3Jlc291cmNlcyBiZWNhdXNlIHJlcXVlc3QgY2hhbm5lbCBpcyBhIHNhZmUNCj4gbm9uLWF0
b21pYyBwaGFzZS4NCj4gPiBEbyB5b3UgaGF2ZSBhbnkgaWRlYT8gVGhhbmtzIGluIGFkdmFuY2Uu
DQo+IA0KPiBJZiB5b3UgbG9vayBjbG9zZWx5IGF0IHRoZSBkcml2ZXIgeW91IHVzZWQgYXMgYW4g
ZXhhbXBsZSAoaGlkbWEuYykgaXQgbG9va3MgbGlrZQ0KPiB0aGVyZSBpcyBhbHJlYWR5IHNvbWV0
aGluZyBpbiB0aGVyZSwgd2hpY2ggbG9va3MgdmVyeSBtdWNoIGxpa2Ugd2hhdCB5b3UgbmVlZA0K
PiBoZXJlOg0KPiANCj4gSW4gaGlkbWFfaXNzdWVfcGVuZGluZygpIHRoZSBkcml2ZXIgdHJpZXMg
dG8gZ2V0IHRoZSBkZXZpY2UgdG8gcnVudGltZSByZXN1bWUuDQo+IElmIHRoaXMgZG9lc24ndCB3
b3JrLCBtYXliZSBkdWUgdG8gdGhlIHBvd2VyIGRvbWFpbiBjb2RlIG5vdCBiZWluZyBhYmxlIHRv
DQo+IGJlIGNhbGxlZCBpbiBhdG9taWMgY29udGV4dCwgdGhlIGFjdHVhbCB3b3JrIG9mIHdha2lu
ZyB1cCB0aGUgZG1hIGhhcmR3YXJlDQo+IGFuZCBpc3N1aW5nIHRoZSBkZXNjcmlwdG9yIGlzIHNo
dW50ZWQgdG8gYSB0YXNrbGV0Lg0KPiANCj4gSWYgSSdtIHJlYWRpbmcgdGhpcyByaWdodCwgdGhp
cyBpcyBleGFjdGx5IHdoYXQgeW91IG5lZWQgaGVyZSB0byBiZSBhYmxlIHRvIGNhbGwgdGhlDQo+
IGRtYWVuZ2luZSBjb2RlIGZyb20gYXRvbWljIGNvbnRleHQ6IHRyeSB0aGUgcnBtIGdldCBhbmQg
aXNzdWUgaW1tZWRpYXRlbHkNCj4gd2hlbiBwb3NzaWJsZSwgb3RoZXJ3aXNlIHNodW50IHRoZSB3
b3JrIHRvIGEgbm9uLSBhdG9taWMgY29udGV4dCB3aGVyZSB5b3UNCj4gY2FuIGRlYWwgd2l0aCB0
aGUgcmVxdWlyZW1lbnRzIG9mIHNjdS1wZC4NClllcywgSSBjYW4gc2NoZWR1bGVfd29yayB0byB3
b3JrZXIgdG8gcnVudGltZSByZXN1bWUgZWRtYSBjaGFubmVsIGJ5IGNhbGxpbmcgc2N1LXBkLg0K
QnV0IHRoYXQgbWVhbnMgYWxsIGRtYWVuZ2luZSBpbnRlcmZhY2VzIHNob3VsZCBiZSB0YWtlbiBj
YXJlLCBub3Qgb25seSBpc3N1ZV9wZW5kaW5nKCkNCmJ1dCBhbHNvIGRtYWVuZ2luZV90ZXJtaW5h
dGVfYWxsKCkvZG1hZW5naW5lX3BhdXNlKCkvZG1hZW5naW5lX3Jlc3VtZSgpLw0KZG1hZW5naW5l
X3R4X3N0YXR1cygpLiBOb3Qgc3VyZSB3aHkgaGlkbWEgb25seSB0YWtlIGNhcmUgaXNzdWVfcGVu
ZGluZy4gTWF5YmUNCnRoZWlyIHVzZXIgY2FzZSBpcyBqdXN0IGZvciBtZW1jcHkvbWVtc2V0IHNv
IHRoYXQgbm8gZnVydGhlciBjb21wbGljYXRlIGNhc2UgYXMgQUxTQQ0Kb3IgVFRZLg0KQmVzaWRl
cywgZm9yIGF1dG9zdXNwZW5kIGluIGN5Y2xpYywgd2UgaGF2ZSB0byBhZGQgcG1fcnVudGltZV9n
ZXRfc3luYyBpbnRvIGludGVycnVwdA0KaGFuZGxlciBhcyBxY29tL2JhbV9kbWEuYy4gYnV0IGhv
dyBjb3VsZCByZXNvbHZlIHRoZSBzY3UtcGQncyBub24tYXRtb2ljIGxpbWl0YXRpb24NCmluIGlu
dGVycnVwdCBoYW5kbGVyPyAgDQoNCj4gDQo+IEFsc28geW91IGRvbid0IG5lZWQgdGhlIHJ1bnRp
bWUgcmVzdW1lIGluIGFsbCBvZiB0aGUgZnVuY3Rpb25zIHlvdSBtZW50aW9uZWQuDQo+IEZyb20g
YSBxdWljayBsb29rIGludG8gdGhlIGVkbWEgZHJpdmVyIGl0IGxvb2tzIGxpa2UgZm9yIGV4YW1w
bGUgdGhlDQo+IHByZXBfc2xhdmVfZG1hKCkgZnVuY3Rpb24gb25seSB0b3VjaGVzIGRhdGEgc3Ry
dWN0dXJlcyBpbiBtZW1vcnksIHNvIHlvdQ0KPiBkb24ndCBhY3R1YWxseSBuZWVkIHRoZSBkZXZp
Y2UgdG8gYmUgYXdha2UgYXQgdGhhdCBwb2ludC4gT25seSBsYXRlciBpbiB0aGUgZmxvdw0KPiB3
aGVuIHlvdSB3cml0ZSByZWdpc3RlcnMgaW4gdGhlIGRtYSBoYXJkd2FyZSBhbmQgYWN0dWFsbHkg
aXNzdWUgdGhlIHRyYW5zZmVyDQo+IHlvdSBuZWVkIHRvIHdha2UgdGhlIGRldmljZSBmcm9tIHNs
ZWVwLg0KWWVzLCBkb24ndCBuZWVkIGFkZCBwbV9ydW50aW1lX2dldF9zeW5jIGludG8gcHJlcF9z
bGF2ZV9kbWEsIG9ubHkgY2FyZSB3aGVyZQ0KSFcgaW5kZWVkIHRvdWNoZWQgbGlrZSBpc3N1ZV9w
ZW5kaW5nKCkvdGVybWluYXRlZF9hbGwoKS9wYXVzZSgpL3Jlc3VtZS4uZXRjLg0KIA0KDQo=
