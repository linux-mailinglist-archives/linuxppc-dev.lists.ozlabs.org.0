Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C51877B5B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 08:34:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qsDX8yAI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtT786cQ3z3dKY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 18:34:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qsDX8yAI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::602; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20602.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtT6Q4GD4z3bw2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 18:33:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knqT3Ur5pho315cCQTnKRuLTWC8mfcvFcKkiercchtkJF2EmmJ1wyMdODNz0Ru8xT0ranDjLb1iKjsfDWmLL3C2UvJLP5VgSsIJfDghcrzXMx2Az9zwSsG63l72qIWoIrQRTKmX4sLZrl7w+jW7i8Hhv8KMcPYBASKhtcEkEqLZPubc64H/1iGTM2QSauhs103RoY0TthqKIx2UFFXmctHXpheuvC93YzSQFZgK9pgJ2/o3YPqKB5CACt1ortLEeFDRJU9wbmL8BV3PPiw4tSnr9KB4eVCEZ7YVFfXfOTAlKM24liaHZ4aVG/zrSPTcxn1JchhaV3RI26KfFt4QQUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSIJYXVongSciVpZXChs9ntLOrNCipW1Gn7rh90zia4=;
 b=k1Dj7JG/luTSqJKT5FNs/qzS837qYhG9rUKvHWWvopsIe9h+aTQOd5zR7pcryYdARtZk6Zk+lKABpCIiHHo4iDzNVQzPDiPLIj86nAJNsb2fzfVjl+mV35pzPN3XeJe5iqmd1WbJc4Q35kLabjn4dYEIHaQkk7FkyGPvokbMl4TmqimDBBgHZhxt/hXfkNgNVxw3K6ZvERS4kDZH9Z6n48BnJ/hmojtQlLGb4yWD1xFYLHF0CvEeE6AB0JgWiTcpE0zF8Mj8UcYzGXkfguKl1JuDsmNkjxTLP5H1AmJCvPIxbRfhIfl9DXED4/1k0jS7jN64HviVyJHweG0Jbyk7bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSIJYXVongSciVpZXChs9ntLOrNCipW1Gn7rh90zia4=;
 b=qsDX8yAI/qVZzfGi419aSbwVaJmQVBSUC3TpRa+P77E9Dm7/NfUz68fz+W6CkwCEEW1oTWhIos1wLzT5jO3cbD5bSKJPSL1E1ykdlX0IrFKkaLjq9bB8VHKnxN07Ima/HRIaVpZB1wugQM7bLj293/hCES34LAgRYl3GxeBmrIY=
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9843.eurprd04.prod.outlook.com (2603:10a6:10:4c1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 07:33:26 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 07:33:25 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "shengjiu.wang@gmail.com"
	<shengjiu.wang@gmail.com>, "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
	"festevam@gmail.com" <festevam@gmail.com>, "nicoleotsuka@gmail.com"
	<nicoleotsuka@gmail.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	"broonie@kernel.org" <broonie@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
	"tiwai@suse.com" <tiwai@suse.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
	<linux-imx@nxp.com>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: Re: [PATCH v2 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT
 node
Thread-Topic: Re: [PATCH v2 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT
 node
Thread-Index: AQHac4ZnjREGpFiM70SHTkfsbEsGOA==
Date: Mon, 11 Mar 2024 07:33:25 +0000
Message-ID:  <DB9PR04MB9498D38D392816018B8FE8CEE3242@DB9PR04MB9498.eurprd04.prod.outlook.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
 <20240307074437.1472593-5-chancel.liu@nxp.com>
 <3509c637-23f0-4e7e-847f-bf3f4f3bf8a0@kernel.org>
In-Reply-To: <3509c637-23f0-4e7e-847f-bf3f4f3bf8a0@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9498:EE_|DB9PR04MB9843:EE_
x-ms-office365-filtering-correlation-id: 48f571b4-996f-4cf5-0cab-08dc419d89e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  3SgkzzkiUzwxPwTVq2ZKSWhO3rSY0YGoITYzy8/Rp/b81CWIDwcCFaTfb/WGDRGnn4XfOYXwvmktEzUjUwIOfhxyb/Gm5ss/XaSq90+cpt1dR9cZ5xOrB9t+1EVwZO4YVmHjN53rF22G6s/vL/euuwuGrE51B9Bndlcw0Mcc/m65Y/DCMjaWX3R1OMGGsBSvz6seakXbKSZg3WUtIk9mBPLD8cTcET7RP17YcnMi66vdceYdoCfaPNlzUAO+2VZXN9dAI2uztSGDmPU6hIQIKnTjcIR1QEy3B7IYo2+/bYcXQVJ/OVvFJfn9IEchiOFe+C62TJxQberVkBmZ5/ZKYRPEFgPdqx7bOv1O1zbqRGoacXFqjeaqpsIGYYs2GaY697brfXZHiX7wlLZA2f/o6tcTSlocoCSavTuNHRuXIH5VTpYxcUpLTkOaXXcGYlg+q5sjBxISwKtiMusVTiJ+lHEwg+XKoTGDRZfSCyLiiD3yVohBNBO/9jr5jSXfFiNFFSVOa2kEDdemfpy2eUesZdPmp9smOks35kd84Kpf3f/5U4m3VxpjHbZh5VW1phokkfurAVMRREmkk0iHHjz0/Njm0VQXEjCVaUsaYajudImBWh7EfaCqwTGvCR2iNYIfsIEcb1rCT6Rut6+u5sxyQn6XgiE22W9TF4v68TsRKIuUp/FBnNIIhkhB6S+P1ojfiatOsdofugng3i0SPk+WW3/iXKOdmX6ZSaiZScUEhew=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TU1aOGp3UFdlbFJhQVM5aDIzdlhMdFNaOTBLNEFscUwvUmpSbEVoVk1MUkk5?=
 =?utf-8?B?dlJzUzhtWnh3ZHBGdlNDZ3JqTitkcTZpRytTdXVMK1huLzF4L0lMUC9PRFcz?=
 =?utf-8?B?MlBEOHBuM3hycmc1ZFQ2U0RLcUZ1UU5KcVd6R2N3TzRycWVJRjhYaklPRTVM?=
 =?utf-8?B?dTk2ZFJDSnVKdzBqWW1LS1E2c1JreXI0VXpoQWgveTd3dzVxbVZ6RmZCemhW?=
 =?utf-8?B?V3RaTGlGdGI3N3VUeldxTVUwREQ3cmh6T09aMTZXaEFUSXNrT2ZNRHZBNnpj?=
 =?utf-8?B?em1MZENQSDRKaWFSNGdLRU1RL3dNTzkydmRqeC9DTGFsSW8vYm5FUEF4R2hQ?=
 =?utf-8?B?NXB6NW95Q1ZubjI3UVlDcmFTcE9XWVNrSSsySWs4RCtxUTdxM011YzRPKzhl?=
 =?utf-8?B?a29kUEJIQ2hGTVYvOUZUakdsT3ZWWktPSW84TzhOSGNWd0FPaUVaVjdLV3ZY?=
 =?utf-8?B?UDBXZmFMMHdyMW5qRmtFZ0QxQmE4YTUrdWlkWWEwUkhlRUFTbjN2SHkzRExP?=
 =?utf-8?B?Y1c4bE4rdXRFZGkzT040OUt2U1RBZElOU0UyWFB0VnF3RWRmUUlKUnl0VzQv?=
 =?utf-8?B?b0wxYkUyWjNJSEdWbHdiS0xYRnhCQUQ2M2pzbGltODA3ZFExdkJXME4xWkFu?=
 =?utf-8?B?VlpQakdtQkNJb05uQWNsV3JTdWxvRjVYZTRVMXVhRGRQU3IyU0RpRzd3YmdV?=
 =?utf-8?B?VE9NaitHS0NkRlBoTGRpNnJYSE84RXR0TG1iNFd1ZXRzMkQ3eGhPRGcvOHdI?=
 =?utf-8?B?VUNBRTl2ai83TW9ZSEs2MWYyWk5kQjA1am1Da1FmRVU1T25uM09RU2RGVmVZ?=
 =?utf-8?B?UWQ3RGlTLzE0MzR3aStwL0tVSjVEc0YwbkZZak9rWjhTdlFGM0ZVR2FkaHN3?=
 =?utf-8?B?eVF3eVMwWTRZcDYwZExCakl4ZzVPeWdhQlVwYU5jY0RaL3BZNWZRekRZMGpO?=
 =?utf-8?B?Z1ExOVlDcjE4a1VZVmNiZENhZ2syN0lTZHV4VDhxYTNaUjcyWmNXNXdKSGNJ?=
 =?utf-8?B?cVcxcHZIQmk5ZVVoREFuYlpESTFFei9qcm1mRDlNQjMvWlYxMXFjV3NlUnRv?=
 =?utf-8?B?czRoYjBRT21EcjFZZlhzMjZnRUlxUW5HK3NDY3BOdGwreS9ZOU96cXBqNFQ2?=
 =?utf-8?B?SktRMVM3eGt3eGZjNGh2Q0FRNXZxRTMzNVNoeWgwN1VaeGFETzBqQzlpY1Ev?=
 =?utf-8?B?QUdSV3lab3NDOVl3TWNBNTJtVmlaNmhEZTBBK291TitzWkorNTV6eW03RzJD?=
 =?utf-8?B?N2xGVTAwcXBUSld4WFlrdGVPSWo2cmVCdGhFbTY5dWxHc1VrQjE4WTg2dTE5?=
 =?utf-8?B?ZDVsUkdYVEVBVXE3Z1JxNXBYQTI2b0NQRzg3aEN2RGJFdjdQRFh0cjJpbnNI?=
 =?utf-8?B?UjVodk90QmdvVGNBb0tmeHh1S08xSW9uWW1MU0dlaS92aFFtNWZOUHhUMWla?=
 =?utf-8?B?YXkwcVZySlpkNEJ0TW9rb043TzNhUm5EMGZ4TU10VTdDUmdjWlBTOFQ0NlJI?=
 =?utf-8?B?QndWNHgzZVdac2ZsMm10eXYzeXNxNWVFenIyUFg1V1BKRnpTOFltL3YyVFNV?=
 =?utf-8?B?cnoyRWpIWDQ2RVE4QW9KbGxUc2IwazRtQ1pIZFBYcXgwb092Z09Zdk5KV3l4?=
 =?utf-8?B?WXIrL3VuSzlaRU1LMDViN3RldXVSOWdRY3BsTzNFeXpsZlJYQ2wzSnhVYm5v?=
 =?utf-8?B?cE1hSnRXdkgyTkpJbUxBTE5yYVVvUkdQbGR0aGNpMVp5Tk1wbk9QMFZFM0lh?=
 =?utf-8?B?dnNaKzE3TFJxWEptY2M4K0djYnJsaWNpbjMvQy9VbzRVQVhoMmhPZU82Z1Vz?=
 =?utf-8?B?aDBNL0VUbGc0ZXhjVEpLQ2pMZkQ4SHMza3JCQ0NwUFRwRVZlNXc2UXk4V3k3?=
 =?utf-8?B?MVdkQ0RjVG11MHhpM1JHVld5bnhtb0wvb1dkckNhWDlXUXJyQzRRZytWZDlD?=
 =?utf-8?B?Y0V6RmFyUnJialpOTTdwVzcxWUkvbUp1TXI3TUFlbXpvMk1PbkMzTzhEamlJ?=
 =?utf-8?B?VkZrOWRnTkZYeHJCT0t1NTZ3aUZUWDNmaDc4UFdEdGxydGlQZVRiTy83cUtM?=
 =?utf-8?B?VmcvdGxzbFdvdjBjWFRNY0RkK2Q4THdYUWtlM202NXZaS3FFQXZQTkJlSUM3?=
 =?utf-8?Q?tDHQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48f571b4-996f-4cf5-0cab-08dc419d89e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 07:33:25.8553
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJr/Ro/ObDS2udCM4zROYHuQYjBfpyqZV4BGF1l9285fWFH4BdubuM0ICoG8mKVjDJor7cEpGrq6r8R3X+aJ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9843
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PiBPbiAwNy8wMy8yMDI0IDA4OjQ0LCBDaGFuY2VsIExpdSB3cm90ZToNCj4gPiBQbGF0Zm9ybSBk
ZXZpY2UgZm9yIGNhcmQgdG8gcHJvYmUgaXMgcmVnaXN0ZXJlZCBpbiBpbXgtYXVkaW8tcnBtc2cu
DQo+ID4gQWNjb3JkaW5nIHRvIHRoaXMgY2hhbmdlIERUIG5vZGUgb2YgQVNvQyBDUFUgREFJIGRl
dmljZSBpcyB1cGRhdGVkLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhbmNlbCBMaXUgPGNo
YW5jZWwubGl1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIHNvdW5kL3NvYy9mc2wvaW14LXJwbXNn
LmMgfCAyMSArKysrKysrKysrKysrKysrKystLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvc291bmQv
c29jL2ZzbC9pbXgtcnBtc2cuYyBiL3NvdW5kL3NvYy9mc2wvaW14LXJwbXNnLmMNCj4gPiBpbmRl
eCBlNWJkNjNkYWIxMGMuLjI2ODYxMjViMzA0MyAxMDA2NDQNCj4gPiAtLS0gYS9zb3VuZC9zb2Mv
ZnNsL2lteC1ycG1zZy5jDQo+ID4gKysrIGIvc291bmQvc29jL2ZzbC9pbXgtcnBtc2cuYw0KPiA+
IEBAIC0xMDgsMTAgKzEwOCw5IEBAIHN0YXRpYyBpbnQgaW14X3JwbXNnX2xhdGVfcHJvYmUoc3Ry
dWN0DQo+IHNuZF9zb2NfY2FyZCAqY2FyZCkNCj4gPiAgc3RhdGljIGludCBpbXhfcnBtc2dfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgew0KPiA+ICAgICAgIHN0cnVj
dCBzbmRfc29jX2RhaV9saW5rX2NvbXBvbmVudCAqZGxjOw0KPiA+IC0gICAgIHN0cnVjdCBkZXZp
Y2UgKmRldiA9IHBkZXYtPmRldi5wYXJlbnQ7DQo+ID4gICAgICAgLyogcnBtc2dfcGRldiBpcyB0
aGUgcGxhdGZvcm0gZGV2aWNlIGZvciB0aGUgcnBtc2cgbm9kZSB0aGF0IHByb2JlZA0KPiB1cyAq
Lw0KPiA+IC0gICAgIHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnJwbXNnX3BkZXYgPSB0b19wbGF0
Zm9ybV9kZXZpY2UoZGV2KTsNCj4gPiAtICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcnBt
c2dfcGRldi0+ZGV2Lm9mX25vZGU7DQo+ID4gKyAgICAgc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cnBtc2dfcGRldiA9IE5VTEw7DQo+ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IE5V
TEw7DQo+ID4gICAgICAgc3RydWN0IG9mX3BoYW5kbGVfYXJncyBhcmdzOw0KPiA+ICAgICAgIGNv
bnN0IGNoYXIgKnBsYXRmb3JtX25hbWU7DQo+ID4gICAgICAgc3RydWN0IGlteF9ycG1zZyAqZGF0
YTsNCj4gPiBAQCAtMTI3LDYgKzEyNiwyMiBAQCBzdGF0aWMgaW50IGlteF9ycG1zZ19wcm9iZShz
dHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAgICAgICAgICAgICAgZ290byBm
YWlsOw0KPiA+ICAgICAgIH0NCj4gPg0KPiA+ICsgICAgIGlmICghc3RyY21wKHBkZXYtPmRldi5w
bGF0Zm9ybV9kYXRhLCAicnBtc2ctbWljZmlsLWNoYW5uZWwiKSkNCj4gPiArICAgICAgICAgICAg
IG5wID0gb2ZfZmluZF9ub2RlX2J5X25hbWUoTlVMTCwgInJwbXNnX21pY2ZpbCIpOw0KPiA+ICsg
ICAgIGVsc2UNCj4gPiArICAgICAgICAgICAgIG5wID0gb2ZfZmluZF9ub2RlX2J5X25hbWUoTlVM
TCwgInJwbXNnX2F1ZGlvIik7DQo+IA0KPiBXaHkgZG8geW91IGNyZWF0ZSBBQkkgb24gbm9kZSBu
YW1lcz8gV2hlcmUgaXMgaXQgZG9jdW1lbnRlZD8gV2h5IGNhbid0DQo+IHlvdSB1c2UgcGhhbmRs
ZXM/DQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpUaGFua3MgZm9yIHlvdXIg
cmVtaW5kZXIuIFRydWx5IEkgc2hvdWxkbid0IHVzZSB1bmRvY3VtZW50ZWQgYmluZGluZ3MuIEkg
d2lsbA0KdXNlIOKAnGZzbCxycG1zZy1jaGFubmVsLW5hbWXigJ0gdG8gcmVmaW5lIHBhdGNoIHNl
dC4gUGxlYXNlIGhlbHAgcmV2aWV3IG5leHQNCnZlcnNpb24uDQoNClJlZ2FyZHMsIA0KQ2hhbmNl
bCBMaXUNCg0K
