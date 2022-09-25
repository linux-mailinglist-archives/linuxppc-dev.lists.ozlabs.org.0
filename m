Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAD5E91A9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 10:30:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MZzc04rkpz3c9m
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Sep 2022 18:30:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RBd7MfRf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.22.59; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=RBd7MfRf;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2059.outbound.protection.outlook.com [40.107.22.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MZzbC5qh9z2xZV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Sep 2022 18:29:57 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1HVAW1Mz4aR+BxsXmw2t9nFr6n+ZtkuVJMjBCnp1uK4hTD74g6NWFLVmVoLnMy9cgKUpaE/RbReFoebIohjLpgCE9d7dWZVceBmegWadybF0JSc2PGh89B2xM2qwRTe3K4kv4yNZyM8aE/N4Td8FGFgLzx3Y/ZRv/+uw8Ay57BL6m6HcQZ6PTzejiLoWt7RhN1pSX3/u/KYKxK5/I7fDBmlOmYI5IvlK2pk5Xx4Y6THF5eqGUJWre03JdjR9uoMEiyhWfr1VNAzy5zGVtkqXVWzouHbDtOBQszpJqRBBEyDuydf1ohm1CQDdyU3e2dx7YAv32XVg3EE/ocPkjL5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT8xtDNFqbTRlcsdJyhhL9yhJWU3XYbiLPGgvtE2CYg=;
 b=YNSG5OwVkFceMGa7D3MimW4IZWR787nLpVRqHDPAHKr8ysQEw+b9/LgGVgU16fOv/WU+K+yQZd0VpErTJ06mtRzEnHOgzHIN6WGI0Y40iw3CqeWajoxZ9tlBZ7fHQGceGCkDUhl48LrFRhIF8hFVchw1AqIxiDtbx7R6sZH3zm2XsCLrhVrIqjs29kj844P/d3S7Vxw9Epf3DjaJwbkFXc40zhtax2auq2SlD0pzciTmltk5/nkvQ36hMBjqznMEqTmbiyb1PD+HKGu6qEwE9oK0tehf/MAwj2o9OzpkTyN04dC1qukWb7mZLDn8F4am9hV5Ny1uP8ogKNUoAeN2Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AT8xtDNFqbTRlcsdJyhhL9yhJWU3XYbiLPGgvtE2CYg=;
 b=RBd7MfRf4J5Ly4/te9mRSDy6kO/jVHllyc/ARTdGzPy2J0/W1et2IOljR2p4wcZjwZkawyWdukrpknbbljJwhV61irBjY0s6DGpLjhMr/xOPTcMTpHQrjgKWIG2neKEqJBiwyk4GZ97xLtrCkiwuO3R79cPdywj/d74c02Qwxns=
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by DBAPR04MB7320.eurprd04.prod.outlook.com (2603:10a6:10:1a8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Sun, 25 Sep
 2022 08:29:36 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5654.020; Sun, 25 Sep 2022
 08:29:35 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring
	<robh@kernel.org>
Subject: RE: [EXT] Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a
 property to assign the rpmsg channel
Thread-Topic: [EXT] Re: [PATCH v2 1/7] ASoC: dt-bindings: fsl_rpmsg: Add a
 property to assign the rpmsg channel
Thread-Index: AQHYzzKzIRcLJ21/30SyeFStqUuMIq3s0JkAgAMBQVA=
Date: Sun, 25 Sep 2022 08:29:35 +0000
Message-ID:  <VI1PR04MB422241656623886682D4B1D1E3539@VI1PR04MB4222.eurprd04.prod.outlook.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
 <20220914105145.2543646-2-chancel.liu@nxp.com>
 <20220916185048.GA1061412-robh@kernel.org>
 <VI1PR04MB4222BDB1378A01E99DFC6211E3519@VI1PR04MB4222.eurprd04.prod.outlook.com>
 <eba9df27-cf91-b20d-bdc1-5acc5f02753a@linaro.org>
In-Reply-To: <eba9df27-cf91-b20d-bdc1-5acc5f02753a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB4222:EE_|DBAPR04MB7320:EE_
x-ms-office365-filtering-correlation-id: c925a6b0-c91a-4b3b-3db9-08da9ed01449
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  nctlUfdQGqDuA5vbLoMKRsPFPo58ZX9mEwqBWYwIPSYpmaowrvFggciQ7jaq3lBDZSgFaKcJyTeXAIeM3K/0xNdzwsbGrvaDTErsfsJSdVXPQlA9H1JDhNOXm2lMz7HgdWRQzVQGcY1b25lSiltubo0L76hn8ZEmm5TnQMYzocTMTqIDGdcCxCGo/XdcP7XF+tgasn6Po0pWOoE7XSG5pDOHwcoVI/PY6ebYVaFKQSDub/KR2i28sIoU3/yil48sLYiniU9/Hvgqw5Sd9LG0A1fTkA4LfFIkGDtLXW61XuNVR5pe/TNnMM4/NguhK9QVtNTiUSRVNyjoJXQk/y012YBOfU3U9F5pkFos4vwOIz12TrQ/X+ala7P5nIkszFKGz4G4cLbiG4VuCeGUz4aGLkgoKTPnL0ym5Sg3yDtiWSG9P8o1TpYImasDhxMKiNyzY/Inb/1Ig5sVDjVwlJAjVMm8DTew8fCtMT0qQGJKbbP4qSiJFRvlWKe/juUcw76Cm+LrNWtTWYkcgXOC7McQGVtAZKyI1+Lz5k0/CojocDIig2Us+4VRdxmsyfFw3AT0eel5zf8mJm7tMIIDqLpERE7qc93fEy90QPYb6fyWfiYjceXr48iB5IRSEqUTm60a1Qr8tIEsR2G8nU6Kf8VPIycLpFhBvCNHKzDYuKQBNvrfFHjufxoTU0c8YmhFhT5p6Sox4SWivMAulIc6lKcJd0GzynP6GNQ/cxBtGMPAniarm0VhPE2gpvW1PdG9DASe5X0xc+kzEeFGu61RhFDx0w==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(366004)(376002)(396003)(451199015)(83380400001)(66476007)(66446008)(64756008)(66946007)(8676002)(66556008)(71200400001)(4326008)(5660300002)(76116006)(7696005)(6506007)(8936002)(7416002)(122000001)(38100700002)(186003)(54906003)(110136005)(38070700005)(316002)(478600001)(2906002)(44832011)(41300700001)(33656002)(26005)(9686003)(86362001)(55016003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?c0RyMFNHQTBKSTV6ak1EaTZyakhOTHdIeDBvRkNPK0dWSDVIeFdTQktVenhi?=
 =?utf-8?B?eVk2WUZFZzNXWEdxS3RzMWRrM3RCbGJvUTZYMXYydXNJRGhEblNsVW5qQjJF?=
 =?utf-8?B?RFlEUUxtbzhTM3Z3RXF1MzZVYnJZYU5IQUlyejF0d3cyTm4xSVN3Q3JpZXdU?=
 =?utf-8?B?TzRlTzFRTk5qdGlMNTZ2Uld0NkdmYlAwV2RDbEFieXQ5Y1llbmZoNGVOZGFo?=
 =?utf-8?B?aVY2TDh2dTRMQ0hNVWVuVmhWY1VranpjaXN4YXpiSlFzTWRUb2o0ejEyUjJU?=
 =?utf-8?B?eTRhb0VDdWNHTndJL2xoLzFIZFY1WmFINUxXRzY1Z2FqUUgzV0JJRncvbWd4?=
 =?utf-8?B?Mms1M09GdnpIeWs0ZDBPWkxyL041RS9od09UUXZhbm84alRCMG5SckRUcXVX?=
 =?utf-8?B?NHNhYm5Yb3BSRWV6Z2lWTWNBRGo1a205aTJBSGxhZk1BY0xFeU5lQ1p3emNp?=
 =?utf-8?B?SmZHYUNtSnNVSTlhMmYxVTdPdjVLRXdXc09tRTFGaDg2Qm5yYlBJanBCTVIz?=
 =?utf-8?B?SGliZ1hMVk9VT0cvMStVazZ2cVorSkV6d3p6ZEVtb2FDTmhNREVsSHZqaEhW?=
 =?utf-8?B?SXJ2aHFJZnIrellHaG54bTd4WXNUYmszdDI4NXJvR3FRLzg5RGlKMW9Jbm9n?=
 =?utf-8?B?a2xtSXByNC9YRDBRbE5kN0x6QmJMNzFUWnR3VFFGQmhYOXZOK20yM01tcmIv?=
 =?utf-8?B?WEtBQzBlNWx6dzFWQ2NiYnF5U1BzYnNzWXlIQmpQWFQwbVoyM3laSkxudUs1?=
 =?utf-8?B?WVZDaDhLQkt6VlUvYURGNWlrc0VtVGVWekMwVm93TnJ2UkVvTk10cUd4eTQ1?=
 =?utf-8?B?K3paYnNFL1lSWlR2dkVwVURFNU02eWMza2FlU2plWk1kVWo3WnU2OFFLMGpt?=
 =?utf-8?B?WldNd0tvSnJRSlRuSmZqOU12cW9rdmswYkxpaG1NZ0hvQ1FTbEJGSVlzditl?=
 =?utf-8?B?cTQ3MnE1WWJQUzBMU3EzWVRtcjE3Zld6QU1lRDNHMUM0SUtDWW9pQXhJc3RD?=
 =?utf-8?B?TGp4ME5jd1VKc0tTckNRUnJnZjJNOHJwZXRIYkJyN1h1NzhSem5lM2xzZStK?=
 =?utf-8?B?ZnJRNUZpZE9ZYzE1Nk9OeFBHWDZVMVliOXM5QlJoMFFzRER6WmhFODNaWEU2?=
 =?utf-8?B?WS8yRkhCZ3lvemRjcXJreTVsUE5qMHpzYk1tQzFFdVJteXo0ODBiR2N6b3JU?=
 =?utf-8?B?clgzSGprVjQ5R3FUTnNZemNmeWg4dHM5Y2xXMXJyeFQvNE0veGZNckk1b0Zs?=
 =?utf-8?B?ZG1LK3JuR0ZGOFdueExmVFpJQWVXY1k4eVBsOVgybGRYaGNKZTJBRms4Z3lu?=
 =?utf-8?B?UlJRSWM2c2tSdzhTbURMV0NTaUJXMUU2NjFFQzNhWmN6MFcyRnN5WnYrWUxp?=
 =?utf-8?B?NEVib05oREF5c3dpQXIxUnNMZjBRQU1scDgrdFEvS2lHNC9ZSkpzbnd3U01u?=
 =?utf-8?B?amJFYWU4Tjc0SHZtY2ZxeENHd3NvQzhPd3JpWjd2ZTU0NnAxenZkR2pKMnhP?=
 =?utf-8?B?dlZSWFhBcWpGVk1Pb0xQejJUNElEeDZ0NDVwYnJVTGFUWHk4K1FwNjdQVUtW?=
 =?utf-8?B?TUJTN1piaFIwRHUrSEdqdWZuQ0syMnZpeE5Ca3BTRitVVjFQYlZXV09RNUlu?=
 =?utf-8?B?ZXU2Tm5HZFJVeGJORlF6N2JUQ3lEcWxVQ05YZ3dJRU9POUhjNWZKdmh1REVY?=
 =?utf-8?B?VDBhU2VjN1FFY1M5MGRBMHZ1OHFKMGFNQWUvc2xtZ1pqcXZHT2FybHoyZTRO?=
 =?utf-8?B?bUo0VU10VmtqaUU0WjJ6MmYwZTFJY1M2QWNoN2NSTEowQ24yTkF3d1dUSDNo?=
 =?utf-8?B?ZjhoVGo3R0dBQmlXQlRESGczWmh3ekVKWWZSVUxEWDRQSFg0VmI1M0NVNHBh?=
 =?utf-8?B?V1h3Q2pyZjBaaFFNaE8ydkltb1p2ZEZnS2dSYUJPd29hcSt3TlRXS21xUzU5?=
 =?utf-8?B?MDJ2TnNST05Xdit6TW1iekt5TkszN053aEpPaWdWd2VkWi9iY0p2NUdDdkgw?=
 =?utf-8?B?M3dsZHV1TEtxYnNHd2xOTnRvb2diSGpCZVNBSmw5bDFyZVFyVyszbUdPN0h0?=
 =?utf-8?B?NzZuODJmOGJpUnE5TnVkend5b1YxdWo1SVJaV2JpTW9COFRvY1FEQjdLZ05N?=
 =?utf-8?Q?fUYzIluxD6F7B733O4Sq8NkLC?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c925a6b0-c91a-4b3b-3db9-08da9ed01449
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2022 08:29:35.6764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yY9P5oZW23AArj+ETqEa94RBKcous6G5tylLmWTu3720XGi0LHdo/PbXnnu5lNFG1vwXBaw3me9/XoNp0Ni4Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7320
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "festevam@gmail.com" <festevam@gmail.com>, "S.J. Wang" <shengjiu.wang@nxp.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "tiwai@suse.com" <tiwai@suse.com>, "nicoleotsuka@gmail.com" <nicoleotsuka@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, "perex@perex.cz" <perex@perex.cz>, "shengjiu.wang@gmail.com" <shengjiu.wang@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiA+Pj4gQWRkIGEgc3RyaW5nIHByb3BlcnR5IHRvIGFzc2lnbiB0aGUgcnBtc2cgY2hhbm5lbCB0
aGlzIHNvdW5kIGNhcmQgc2l0cw0KPiA+Pj4gb24uIEl0IGFsc28gcmVwcmVzZW50cyB0aGUgbmFt
ZSBvZiBBU29DIHBsYXRmb3JtIGRyaXZlci4gVGhpcyBwcm9wZXJ0eQ0KPiA+Pj4gY2FuIGJlIG9t
aXR0ZWQgaWYgdGhlcmUgaXMgb25seSBvbmUgc291bmQgY2FyZCBhbmQgaXQgc2l0cyBvbg0KPiA+
Pj4gInJwbXNnLWF1ZGlvLWNoYW5uZWwiLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IENo
YW5jZWwgTGl1IDxjaGFuY2VsLmxpdUBueHAuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwgIHwgMzcNCj4gKysrKysrKysr
KysrKysrKysrLQ0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4gPj4gYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4gPj4+IGluZGV4IGQz
NzBjOThhNjJjNy4uMzc0NGFlNzk0YzAwIDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL2ZzbCxycG1zZy55YW1sDQo+ID4+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc291bmQvZnNsLHJwbXNnLnlhbWwNCj4g
Pj4+IEBAIC0xMSw4ICsxMSwxMSBAQCBtYWludGFpbmVyczoNCj4gPj4+DQo+ID4+PiAgZGVzY3Jp
cHRpb246IHwNCj4gPj4+ICAgIGZzbF9ycG1zZyBpcyBhIHZpcnR1YWwgYXVkaW8gZGV2aWNlLiBN
YXBwaW5nIHRvIHJlYWwgaGFyZHdhcmUgZGV2aWNlcw0KPiA+Pj4gLSAgYXJlIFNBSSwgRE1BIGNv
bnRyb2xsZWQgYnkgQ29ydGV4IE0gY29yZS4gV2hhdCB3ZSBzZWUgZnJvbSBMaW51eA0KPiA+Pj4g
LSAgc2lkZSBpcyBhIGRldmljZSB3aGljaCBwcm92aWRlcyBhdWRpbyBzZXJ2aWNlIGJ5IHJwbXNn
IGNoYW5uZWwuDQo+ID4+PiArICBhcmUgU0FJLCBNSUNGSUwsIERNQSBjb250cm9sbGVkIGJ5IENv
cnRleCBNIGNvcmUuIFdoYXQgd2Ugc2VlIGZyb20NCj4gPj4+ICsgIExpbnV4IHNpZGUgaXMgYSBk
ZXZpY2Ugd2hpY2ggcHJvdmlkZXMgYXVkaW8gc2VydmljZSBieSBycG1zZyBjaGFubmVsLg0KPiA+
Pj4gKyAgV2UgY2FuIGNyZWF0ZSBkaWZmZXJlbnQgc291bmQgY2FyZHMgd2hpY2ggYWNjZXNzIGRp
ZmZlcmVudCBoYXJkd2FyZXMNCj4gPj4+ICsgIHN1Y2ggYXMgU0FJLCBNSUNGSUwsIC5ldGMgdGhy
b3VnaCBidWlsZGluZyBycG1zZyBjaGFubmVscyBiZXR3ZWVuDQo+ID4+PiArICBDb3J0ZXgtQSBh
bmQgQ29ydGV4LU0uDQo+ID4+Pg0KPiA+Pj4gIHByb3BlcnRpZXM6DQo+ID4+PiAgICBjb21wYXRp
YmxlOg0KPiA+Pj4gQEAgLTg1LDYgKzg4LDE3IEBAIHByb3BlcnRpZXM6DQo+ID4+PiAgICAgICAg
VGhpcyBpcyBhIGJvb2xlYW4gcHJvcGVydHkuIElmIHByZXNlbnQsIHRoZSByZWNlaXZpbmcgZnVu
Y3Rpb24NCj4gPj4+ICAgICAgICB3aWxsIGJlIGVuYWJsZWQuDQo+ID4+Pg0KPiA+Pj4gKyAgZnNs
LHJwbXNnLWNoYW5uZWwtbmFtZToNCj4gPj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFt
bCMvZGVmaW5pdGlvbnMvc3RyaW5nDQo+ID4+PiArICAgIGRlc2NyaXB0aW9uOiB8DQo+ID4+PiAr
ICAgICAgQSBzdHJpbmcgcHJvcGVydHkgdG8gYXNzaWduIHJwbXNnIGNoYW5uZWwgdGhpcyBzb3Vu
ZCBjYXJkIHNpdHMgb24uDQo+ID4+PiArICAgICAgSXQgYWxzbyByZXByZXNlbnRzIHRoZSBuYW1l
IG9mIEFTb0MgcGxhdGZvcm0gZHJpdmVyLiBUaGlzIHByb3BlcnR5DQo+ID4+DQo+ID4+IFRoYXQn
cyBhIExpbnV4IGRldGFpbCB3aGljaCBkb2Vzbid0IGJlbG9uZyBpbiBEVC4NCj4gPj4NCj4gPg0K
PiA+IFdlIHBhc3MgaGFyZHdhcmUgcGFyYW1ldGVycyBpbiBkdHMgbm9kZSB0byBzZXQgdXAgY2xv
Y2tzIG9yIG90aGVyDQo+ID4gY29uZmlndXJhdGlvbnMuIFRoZXNlIGNvbmZpZ3VyYXRpb25zIGFy
ZSBmaW5hbGx5IHNlbnQgdG8gQ29ydGV4LU0gYnkNCj4gPiBycG1zZyBjaGFubmVsIGJlY2F1c2Ug
Q29ydGV4LU0gYWN0dWFsbHkgY29udHJvbHMgcmVhbCBoYXJkd2FyZSBkZXZpY2VzLg0KPiA+IElm
IHRoZXJlJ3Mgb25seSBvbmUgc291bmQgY2FyZCBzaXRzIG9uIG9uZSBycG1zZyBjaGFubmVsIHdl
IHdpbGwgbm90DQo+ID4gbmVlZCB0aGlzIHByb3BlcnR5LiBCdXQgaWYgdGhlcmUgYXJlIHNldmVy
YWwgc291bmQgY2FyZHMgd2UgbmVlZCB0bw0KPiA+IHNwZWNpZnkgY29ycmVjdCBycG1zZyBjaGFu
bmVsLiBUaHVzIGhhcmR3YXJlIGNvbmZpZ3VyYXRpb25zIGNhbiBiZQ0KPiA+IHByb3Blcmx5IHNl
bnQgdG8gQ29ydGV4LU0uIEZyb20gdGhpcyBsZXZlbCB0byBzcGVhaywgdGhpcyBwcm9wZXJ0eSBp
cw0KPiA+IGhhcmR3YXJlLXJlbGF0ZWQgc2luY2UgcnBtc2cgY2hhbm5lbCByZXByZXNlbnRzIHRo
ZSByZWFsIGhhcmR3YXJlIGF1ZGlvDQo+ID4gY29udHJvbGxlci4NCj4gPg0KPiA+IEhlcmUgSSBh
dHRhY2ggdGhlIGRpc2N1c3Npb24gaW4gdmVyc2lvbiAxIHBhdGNoZXMgZm9yIHlvdXIgaW5mb3Jt
YXRpb246DQo+ID4gLS0tDQo+ID4gVGhpcyBwcm9wZXJ0eSBhaW1zIHRvIHRlbGwgdGhlIEFTb0Mg
ZHJpdmVyIHdoaWNoIHJwbXNnIGNoYW5uZWwgdGhlDQo+ID4gc291bmQgY2FyZCBkZXBlbmRzIG9u
LiBJZiB0aGVyZSBhcmUgc2V2ZXJhbCBzb3VuZCBjYXJkcyBzaXQgb24gcnBtc2csDQo+ID4gd2Ug
c2hvdWxkIHBhc3MgY29ycmVjdCBpbmZvcm1hdGlvbiBpbiBkdHMgbm9kZSB0byBzcGVjaWZ5IHRo
ZSBuYW1lIG9mDQo+ID4gcnBtc2cgY2hhbm5lbC4gVGhhdCBpcyB3aHkgSSBtZWFudCB0byBhZGQg
dGhpcyBwcm9wZXJ0eS4NCj4gPg0KPiA+IEFjdHVhbGx5IHRoaXMgcHJvcGVydHkgaXMgaGFyZHdh
cmUtcmVsYXRlZC4gQXMgd2UgZGlzY3Vzc2VkIGJlZm9yZSwNCj4gPiB0aGlzIGtpbmQgb2Ygc291
bmQgY2FyZCBiYXNlZCBvbiBycG1zZyB3b3JrcyB1bmRlciB0aGlzIG1lY2hhbmlzbQ0KPiA+IENv
cnRleC1BIGNvcmUgdGVsbHMgdGhlIENvcnRleC1NIGNvcmUgY29uZmlndXJhdGlvbiBvZiB0aGUg
UENNDQo+ID4gcGFyYW1ldGVycyB0aGVuIENvcnRleC1NIGNvbnRyb2xzIHJlYWwgaGFyZHdhcmUg
ZGV2aWNlcy4gVGhpcyBwcm9wZXJ0eQ0KPiA+IHNwZWNpZnlpbmcgcnBtc2cgY2hhbm5lbCByZXBy
ZXNlbnRzIHRoZSByZWFsIGhhcmR3YXJlIGF1ZGlvIGNvbnRyb2xsZXIuDQo+ID4gLS0tDQo+ID4N
Cj4gPiBUaGF0J3MgbXkgaWRlYSBhZGRpbmcgdGhpcyBwcm9wZXJ0eS4gRG8geW91IGhhdmUgYW55
IHN1Z2dzdGlvbj8NCj4gDQo+IEkgdGhpbmsgeW91IG1pc3VuZGVyc3Rvb2QgdGhlIGNvbW1lbnQu
IFJvYidzIGNvbW1lbnQgd2FzIGRpcmVjdGx5IGJlbG93DQo+IGEgbGluZSB3aGljaCBoZSByZWZl
cnJlZCB0by4gVGhhdCBsaW5lIGNvbnRhaW5lZCBhIHN0YXRlbWVudCByZWZlcnJpbmcNCj4gdG8g
TGludXggZHJpdmVycy4gQW55dGhpbmcgcmVsYXRlZCB0byBMaW51eCBkcml2ZXJzIGRvZXMgbm90
IGJlbG9uZyB0byBEVC4NCj4gDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpU
aGFua3MgZm9yIGV4cGxhaW5pbmcgdGhlIG1lYW5pbmcgYW5kIGdpdmluZyBtb3JlIGRldGFpbHMu
IEkgd2lsbA0KZGVsZXRlIHRoZSBzdGF0ZW1lbnQgcmVmZXJyaW5nIHRvIGxpbnV4IGRyaXZlcnMu
IEluZGVlZCB0aGlzIHByb3BlcnR5DQppcyBkZXNpZ25lZCB0byBhc3NpZ24gdGhlIHJwbXNnIGNo
YW5uZWwgbmFtZS4NCkRvZXMgaXQgbG9vayBiZXR0ZXIgaWYgSSBtb2RpZnkgdGhlIGNvZGUgbGlr
ZSB0aGlzOg0KDQorICBmc2wscnBtc2ctY2hhbm5lbC1uYW1lOg0KKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9zdHJpbmcNCisgICAgZGVzY3JpcHRpb246IHwNCisg
ICAgICBBIHN0cmluZyBwcm9wZXJ0eSB0byBhc3NpZ24gcnBtc2cgY2hhbm5lbCB0aGlzIHNvdW5k
IGNhcmQgc2l0cyBvbi4NCisgICAgICBUaGlzIHByb3BlcnR5IGNhbiBiZSBvbWl0dGVkIGlmIHRo
ZXJlIGlzIG9ubHkgb25lIHNvdW5kIGNhcmQgYW5kIGl0IHNpdHMNCisgICAgICBvbiAicnBtc2ct
YXVkaW8tY2hhbm5lbCIuDQorICAgIGVudW06DQorICAgICAgLSBycG1zZy1hdWRpby1jaGFubmVs
DQorICAgICAgLSBycG1zZy1taWNmaWwtY2hhbm5lbA0KDQpSZWdhcmRzLCANCkNoYW5jZWwgTGl1
DQo=
