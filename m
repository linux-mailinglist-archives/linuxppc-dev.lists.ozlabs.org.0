Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D561886945E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 14:53:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UuSC19GG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkf874RGsz3dVK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 00:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=UuSC19GG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:261d::701; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:261d::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkf7N1sznz3cPc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 00:52:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfNzRgNsw3nxPE1hxvuLxfK0SkY8PQUSdYLfPtC+i4CiYgJeTXR3xgyWx9nD+8K9hacYQtHHAayyT6udWxx2EiopP1cC88RUdMaHjXZ/natuDIlipPGGy5l+IKgwztOfl0pCeQMWECHQF7jODrYtSxbPx1X+crn70iATwe2mVHaelEw1achfICjEu9VQL9KLmKz9Y7OfjuEpq3DCj8oNSddWXV8wxLd1nLMpjD6m/riXVTvk/d4s9cEgaOrZlZUR1xgGOoUEwnuL5TYwaZhCEDy4YXSR17Xf47SOKtsapFrJCrIUpb7l2h9V3gXRMCvJEE6jIVdT8cJELtd0po+TWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipoyLsMj9NOl7bfoVTaUvUqWYYBoOKKz29OcoeafgMQ=;
 b=a2YCDVG0lEIChBERCDtgbUAin4JVKUC2vh8LEeU8tFLGwwTpOPsuB3rtc4KtBj2uh0iuEflDO27yln9t1YeL3KK4HMr86d2L4Gtha8hxG5oasyaXU88sU1iCUJo9xSn8rmbIv9HEBS/Io9nBiudDrn8y0wHiGBhBfSZKuQzYnoEJhAbL0e3i1gV037Wfpi8XCSIw2gPV61GB2jgABkEXOk9TYktIRhLZNwRofbbqtM3Swk4KlTcq6IbXu1BOM0iV/OpUd0KjRF3hpDDVsO4dfhVYpv/zr8zESfvrXVic3aC5jPa7BWxLlaP8zkng62X6AgYKWixntRI4IVySoa965A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipoyLsMj9NOl7bfoVTaUvUqWYYBoOKKz29OcoeafgMQ=;
 b=UuSC19GGVy74T378zWKhw28I8VIGLux5K3pFG759qy+sUVfJ8MZ5MqIyXftmlhzNksaTjPO4oaP108YUfxz0OdlHaXnC9nnxltcu2kzDEjXjrfdGt2/0EfCfp4KuF5/AYsYF3ydtjDwZx5VQqrY6aEWsDI2ICui+SwlUn765MNsSHCS4hyoUZVmT/mMnQQiBCKEGYV00a6mJLSE2wgjilPBbZGTkcocDtyudZQ5yqcgDiHVujjwBI9im39eUTnGiLL9ZKx4DKENwFsyG77NAtCa0l/KwlSvWVlwsfZd27vy58cE6+jLa2XCxToJlW+ZDMSLjiX+m4xmkqTQTaTiY0w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2395.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Tue, 27 Feb
 2024 13:52:07 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c192:d40f:1c33:1f4e%6]) with mapi id 15.20.7316.035; Tue, 27 Feb 2024
 13:52:07 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>
Subject: Re: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Topic: Increasing build coverage for drivers/spi/spi-ppc4xx.c
Thread-Index: AQHaaVmCK95ONeBdo0m9TjsdjqM3v7Ed+80AgAAJa4CAADBigA==
Date: Tue, 27 Feb 2024 13:52:07 +0000
Message-ID: <2fe58bc5-2f1b-4f51-8f01-fa397a1c9291@csgroup.eu>
References: <qvuhez7vrcoui7i6s4yohd4ednneuoejcp6tw6iwzeefgpyvd6@fkwwtwozhakf>
 <6fab09e0-1f21-4ada-b5ae-472bf71a1225@csgroup.eu>
 <7ah7rzijbwkvr3hmtqfjh7syxave756usevumrypqspn27wgyv@ln42tyqxo5ai>
In-Reply-To: <7ah7rzijbwkvr3hmtqfjh7syxave756usevumrypqspn27wgyv@ln42tyqxo5ai>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB2395:EE_
x-ms-office365-filtering-correlation-id: 1321d65c-42f6-4e29-40e2-08dc379b49e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  amWMseLPEb940qdd8YnmNKxNUazfkOaubSAevBf6eeNkGz+9DXMnl1D3mJ06qqjABzdcgWqfAHZVdFN6kU950uCuM7iMBW5mxLKvz8Dl0ZHcx/ucXIj386HJRlFKkoQTpKrABlDeH1j4oY4hsXPrMQNeuOzC+aF7CH8AxYGjD8f8nfZBFCLXyGEHwCRuCL/OQKOBUkVKWnzErbEId7zAzVSJQ1RGX9D+2QKnrig9htaGADrJ9d4ed8BhJHWMugtwwpwYknZi+p2Y9xEgZMAIRfkIGEytSXK5YK1owm+g4fgfhRJZ4kS65pzTdXl+YF/HV7LLMRL6/Nhm5IdpNZRrd3d/f66SWDvKyRHvdX3lttExfo4hPr7DJBkFlUkFbZXCN8baipK/h5fvzbT5MIpcs6OeQyuzOSjwdyHn86bcuNmJCh+hHnzP3cAMOA6pEjWe9kA40E+eTST0LAxkZVDMxLuk4lnAJ65jDh4CK2bm/o0b2d0fYRiOEoXXOZ2aqetoO8s3HXCTgdfTZt61hU360ZvbbIVoJwkKdkt/umX+mG5Dc4nOWvGN8YeXykCJ4DoMCW536Ri3mlpBwynyNs2UPerdnCub/1aoDdL0agZe2i9oisl9KXTHGKvsCF35peAs7kA6Ep+DX0urH/dkAoxzRSvKqOq50NNX/Bziv3a7J07Uldsl9E5u2foQynBLoWlqLDFokYEtZy3j065CPyfrEQab8V+u1soa6tP/Veua2tI=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(230273577357003)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Y2pBN25rdUJrVEo5MWhMZS9hQUJsVys0U3Jrd0ZxWW9FZHZadmFyZUJKS0xr?=
 =?utf-8?B?YlFLN1hVQW1lVkJuWkFjMXhBbUFBazcwYjVBZmNsVnc0d3ppcFZsVmtPckdC?=
 =?utf-8?B?cGFPLzNEMzdBY2RjV1ZyR21GYjMrQVRIcFdzOGJXa3pyQnMxM0FpZHMzTTVp?=
 =?utf-8?B?ZExwN0pXODBJMFQ2Nm0rVThCY28rQXoyaVo5NWZZWXdMWXg2ZWNBT1ZPbkJV?=
 =?utf-8?B?b3JmbExEU0JqV0U5RElsc3F2aTlKM1dEY2VGeFhOaGhyQ083VzVWRnhsZlBT?=
 =?utf-8?B?MjdlZklxVjBVOFpJQjFJeUxsRjdTYkFlVHh1emdpMDVKQXZhRHVlRlRTNDFH?=
 =?utf-8?B?aWZIbDRyLzdvRVFMSzJ4S1lTc3BpM2hibXpXL3VEN3VRcG5PMzBrWWNCcy96?=
 =?utf-8?B?cUxlc2VDdEwvWkNTbCtoMlg2bDQ4RUpqdThNUWh3djlxQ0MrcEFIbittMStz?=
 =?utf-8?B?N0FMZFJsUTd3T0M2a1JNcU9DT0h6cVcraCtQckRHTkhtVnRqSHVocHpmRTB6?=
 =?utf-8?B?cjhjL1RLQ3J6Rkd2cXhBZEhKYmJsQkJ0QW41dktSZ1VTL2RpelZkalEvL1BX?=
 =?utf-8?B?cWkvdS9GRGN5TktYVkt0Mnp1Y3JISmN4R1MwVGFNT044SG9hNTJlZXY1ZUFk?=
 =?utf-8?B?c2ZvOExta05mNCs5NFJycXVSdjZXQ2dlSjhzdkRQT3BIYStEWHEvNER3cFh1?=
 =?utf-8?B?VEtGMVZRVk8rTWdCbmVOUHlRNTlJVzRKV2dJbVJ1OXp0MktxTWlsV3ltRFRw?=
 =?utf-8?B?b3VOTkFqcG1JSFF6a0dWMHZOZlNaMXlpbi9pRG44czZCT3owUkNralAva21h?=
 =?utf-8?B?cThVZUZuMTF4QVdoT3NOOG0vd09VQjkyYkR3c3RRYVY3Nm5GNXh0WWt3a2RY?=
 =?utf-8?B?NGRPeXNab3puSC9HdXRtZ1VlWDBhSlVGREN5cFVTUnhKSGRzNnQ4Uk9OYXRV?=
 =?utf-8?B?NlFiUFlqTGwwcWcxQzlHdDliempmRzVXMjlsYytwcFl0VHJFZ1RPTXhIcW9r?=
 =?utf-8?B?NWl0STdmcHFBTW1tVDM2RXdsanB6MVoyY1VLbkFqNlVBMFlYUEw0b1F4dHVL?=
 =?utf-8?B?dFJueTVwby9YNGJxN0lVNmJhZjJiZmZJZDZiUjFveVIrL0NiaHNZWjdyOE53?=
 =?utf-8?B?V2dVY09jSGpvUUZJYUFveDVxR0pCMlVPTm1uUVVPVGNjc1hieENHU0RFUThn?=
 =?utf-8?B?RS8rSFZKZGVoKzFvdllKS2QvaHlOVkx0Y3p0RTgzR1FHYVVpZ2VRajV3d1NT?=
 =?utf-8?B?Njg0OXI3WjE0dWVIZ210c21rUy9ZSEZNSGlFQlhDS3NEUHpLVVpGSGticlNV?=
 =?utf-8?B?YmgwTFU5alpBRklTdFZrT1ZudlU3ZWtCbzU2dUN2ajg3OGpzZUY2UTF3R0p6?=
 =?utf-8?B?a0RpdnBaZ2U1c0xtMVBsYUZLUTBhSkh3TnpIdllsMjBaWlNyZE1nSFZnNEN1?=
 =?utf-8?B?MjQ0RkNkQzhkYnJLZ0g2bDNaQ0ZDRVdoblZ0UnZrKzgwbXVOVEpFOVpWRW10?=
 =?utf-8?B?U01GN0dUNSticUtwYXVJYjVQUEdhR1lKd2VMdXlCV3NDR0VnbmNXSUVoTVRP?=
 =?utf-8?B?Yk0vNlFuRzNlNVpkMjFWdUc5NVpVS1JMUkFjS2pKQkd3ODlPNEpWVTd4OUlQ?=
 =?utf-8?B?NkRhc1FacStDdWpJNnBGMGEwV21OSXA3MWZNMGhHUVZTYXFQaG1yWHdieFFW?=
 =?utf-8?B?ZW5jTkIwMUhOSUZUWHpaRzFLWkh5Um5ZN0JOenNqWmlsdS9DNEJjYjBxdXYr?=
 =?utf-8?B?VW90SWd0KzFMMXIxZ01CQ2wvYjlMYnJmNXZEcE5rSm5JOVJyeHkxUklORkpV?=
 =?utf-8?B?NW9FcUFpcFg2Tk1ZbEEwb3lub21xbnlSNFdzcERoOTFWdytUR0VhNUN6bm9E?=
 =?utf-8?B?U0dyMURGWW9uWE4vL0FUU0dKTnZzbjYxMFQweDNzT0F4SlZ5eXNUM1ByeXNG?=
 =?utf-8?B?cUo2cEE2aUJvTDUzeCtDUzFHTDk2aER6RHZOeWtjWWsySE42bHhubjhjbDVQ?=
 =?utf-8?B?bFc0S1l6TmJxR2UzdEVzeGx1Y2lScUV2MjlkTzlNS2I0L3lMRUNxRXJ3eWNj?=
 =?utf-8?B?eU00ZjZpYWpqaG15UE9VM05NSHowV2g1VHdFckpsbDkyS0E3ZUY2bTloOXZC?=
 =?utf-8?B?SUxES0pBTUV6VnJia2lZRW55ZEQ0elFLZWh4Ni9FTGtuQ09hRWY3cVpJU2Zy?=
 =?utf-8?B?anYxNEo2UytJTHByaE4zQ2ZxY1BSSkYxc084d1dxc0pxQUZjWFRQeXJ6NFor?=
 =?utf-8?B?enkyT1k3aFQrZHBiNlNTMlgrbGlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F796C7006000E043A6D16406B24AF4CA@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1321d65c-42f6-4e29-40e2-08dc379b49e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 13:52:07.8161
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cK+T55p63imMKVQxozsO/9Bd8ZDgDYAAWn/4qXlm+jib8vFltPQHtiGa/fFkj5+jGASteD13KYO0YC6u1Zvv9oIPeUPOSGEHot2dzYOe1aE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2395
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
Cc: Nicholas Piggin <npiggin@gmail.com>, "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Mark Brown <broonie@kernel.org>, "Naveen N.
 Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI3LzAyLzIwMjQgw6AgMTE6NTgsIFV3ZSBLbGVpbmUtS8O2bmlnIGEgw6ljcml0wqA6
DQo+IEhlbGxvIENocmlzdG9waGUsDQo+IA0KPiBPbiBUdWUsIEZlYiAyNywgMjAyNCBhdCAxMDoy
NToxNUFNICswMDAwLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4gTGUgMjcvMDIvMjAyNCDD
oCAwOTo0NiwgVXdlIEtsZWluZS1Lw7ZuaWcgYSDDqWNyaXTCoDoNCj4+PiByZWNlbnRseSB0aGUg
c3BpLXBwYzR4eC5jIGRyaXZlciBzdWZmZXJlZCBmcm9tIGJ1aWxkIGVycm9ycyBhbmQgd2Fybmlu
Z3MNCj4+PiB0aGF0IHdlcmUgdW5kZXRlY3RlZCBmb3IgbG9uZ2VyIHRoYW4gSSBleHBlY3RlZC4g
SSB0aGluayBpdCB3b3VsZCBiZQ0KPj4+IHZlcnkgYmVuZWZpY2lhbCBpZiB0aGlzIGRyaXZlciB3
YXMgZW5hYmxlZCBpbiAoYXQgbGVhc3QpIGEgcG93ZXJwYw0KPj4+IGFsbG1vZGNvbmZpZyBidWls
ZC4NCj4+Pg0KPj4+IFRoZSBjaGFsbGVuZ2UgdG8gZG8gc28gaXMgdGhhdCBzcGktcHBjNHh4LmMg
dXNlcyBkY3JpX2NscnNldCgpIHdoaWNoIGlzDQo+Pj4gb25seSBkZWZpbmVkIGZvciA0eHggKGFz
IHRoZXNlIHNlbGVjdCBQUENfRENSX05BVElWRSkuDQo+Pj4NCj4+PiBJIHdvbmRlciBpZiBkY3Jp
X2NscnNldCgpIGNvdWxkIGJlIGRlZmluZWQgZm9yIHRoZSBQUENfRENSX01NSU8gY2FzZSwNCj4+
PiB0b28uIEkgdHJpZWQgYW5kIGZhaWxlZC4gVGhlIGJlc3QgSSBjYW1lIHVwIHdpdGhvdXQgZXh0
ZW5zaXZlIGRvYw0KPj4+IHJlYWRpbmcgaXM6DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9w
b3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9kY3ItbmF0aXZlLmgNCj4+PiBpbmRleCBhOTIwNTk5NjQ1NzkuLjE1OWFiN2FiZmU0NiAxMDA2
NDQNCj4+PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5oDQo+Pj4g
KysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaA0KPj4+IEBAIC0xMTUs
MTUgKzExNSwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX19kY3JpX2NscnNldChpbnQgYmFzZV9h
ZGRyLCBpbnQgYmFzZV9kYXRhLCBpbnQgcmVnLA0KPj4+ICAgIAl1bnNpZ25lZCBpbnQgdmFsOw0K
Pj4+ICAgIA0KPj4+ICAgIAlzcGluX2xvY2tfaXJxc2F2ZSgmZGNyX2luZF9sb2NrLCBmbGFncyk7
DQo+Pj4gLQlpZiAoY3B1X2hhc19mZWF0dXJlKENQVV9GVFJfSU5ERVhFRF9EQ1IpKSB7DQo+Pj4g
LQkJbXRkY3J4KGJhc2VfYWRkciwgcmVnKTsNCj4+PiAtCQl2YWwgPSAobWZkY3J4KGJhc2VfZGF0
YSkgJiB+Y2xyKSB8IHNldDsNCj4+PiAtCQltdGRjcngoYmFzZV9kYXRhLCB2YWwpOw0KPj4+IC0J
fSBlbHNlIHsNCj4+PiAtCQlfX210ZGNyKGJhc2VfYWRkciwgcmVnKTsNCj4+PiAtCQl2YWwgPSAo
X19tZmRjcihiYXNlX2RhdGEpICYgfmNscikgfCBzZXQ7DQo+Pj4gLQkJX19tdGRjcihiYXNlX2Rh
dGEsIHZhbCk7DQo+Pj4gLQl9DQo+Pj4gKw0KPj4+ICsJbXRkY3IoYmFzZV9hZGRyLCByZWcpOw0K
Pj4+ICsJdmFsID0gKG1mZGNyKGJhc2VfZGF0YSkgJiB+Y2xyKSB8IHNldDsNCj4+PiArCW10ZGNy
KGJhc2VfZGF0YSwgdmFsKTsNCj4+PiArDQo+Pj4gICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUo
JmRjcl9pbmRfbG9jaywgZmxhZ3MpOw0KPj4+ICAgIH0NCj4+PiAgICANCj4+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zcGkvS2NvbmZpZyBiL2RyaXZlcnMvc3BpL0tjb25maWcNCj4+PiBpbmRleCBi
YzcwMjFkYTJmZTkuLjlhMGE1ZThjNzBjOCAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL3NwaS9L
Y29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy9zcGkvS2NvbmZpZw0KPj4+IEBAIC04MTAsNyArODEw
LDggQEAgY29uZmlnIFNQSV9QTDAyMg0KPj4+ICAgIA0KPj4+ICAgIGNvbmZpZyBTUElfUFBDNHh4
DQo+Pj4gICAgCXRyaXN0YXRlICJQUEM0eHggU1BJIENvbnRyb2xsZXIiDQo+Pj4gLQlkZXBlbmRz
IG9uIFBQQzMyICYmIDR4eA0KPj4+ICsJZGVwZW5kcyBvbiA0eHggfHwgQ09NUElMRV9URVNUDQo+
Pj4gKwlkZXBlbmRzIG9uIFBQQzMyIHx8IFBQQzY0DQo+Pj4gICAgCXNlbGVjdCBTUElfQklUQkFO
Rw0KPj4+ICAgIAloZWxwDQo+Pj4gICAgCSAgVGhpcyBzZWxlY3RzIGEgZHJpdmVyIGZvciB0aGUg
UFBDNHh4IFNQSSBDb250cm9sbGVyLg0KPj4+DQo+Pj4gV2hpbGUgdGhpcyBpcyBhIHN0ZXAgaW4g
dGhlIHJpZ2h0IGRpcmVjdGlvbiAoSSB0aGluaykgaXQncyBub3QgZW5vdWdoIHRvDQo+Pj4gbWFr
ZSB0aGUgZHJpdmVyIGJ1aWxkIChidXQgbWF5YmUgbWFrZSBpdCBlYXNpZXIgdG8gZGVmaW5lDQo+
Pj4gZGNyaV9jbHJzZXQoKT8pDQo+Pj4NCj4+PiBDb3VsZCBzb21lb25lIHdpdGggbW9yZSBwb3dl
cnBjIGtub3dsZWRnZSBqdW1wIGluIGFuZCBoZWxwIChmb3IgdGhlDQo+Pj4gYmVuZWZpdCBvZiBi
ZXR0ZXIgY29tcGlsZSBjb3ZlcmFnZSBvZiB0aGUgc3BpIGRyaXZlciBhbmQgc28gbGVzcw0KPj4+
IGJyZWFrYWdlKT8gKElmIHlvdSBkbyBzbyBiYXNlZCBvbiBteSBjaGFuZ2VzIGFib3ZlLCB5b3Ug
ZG9uJ3QgbmVlZCB0bw0KPj4+IGNyZWRpdCBtZSBmb3IgbXkgZWZmb3J0LCBjbGFpbSBpdCBhcyB5
b3VyJ3MuIEknbSBoYXBweSBlbm91Z2ggaWYgdGhlDQo+Pj4gc2l0dWF0aW9uIGltcHJvdmVzLikN
Cj4+DQo+PiBXaGF0IGFib3V0IHRoaXMgPw0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vZGNyLW1taW8uaA0KPj4gYi9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20v
ZGNyLW1taW8uaA0KPj4gaW5kZXggZmM2ZDkzZWY0YTEzLi4zOGI1MTVhZmJmZmMgMTAwNjQ0DQo+
PiAtLS0gYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vZGNyLW1taW8uaA0KPj4gKysrIGIvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1tbWlvLmgNCj4+IEBAIC0zOCw2ICszOCwxMSBAQCBz
dGF0aWMgaW5saW5lIHZvaWQgZGNyX3dyaXRlX21taW8oZGNyX2hvc3RfbW1pb190IGhvc3QsDQo+
PiAgICAJb3V0X2JlMzIoaG9zdC50b2tlbiArICgoaG9zdC5iYXNlICsgZGNyX24pICogaG9zdC5z
dHJpZGUpLCB2YWx1ZSk7DQo+PiAgICB9DQo+Pg0KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX2Rj
cmlfY2xyc2V0KGludCBiYXNlX2FkZHIsIGludCBiYXNlX2RhdGEsIGludCByZWcsDQo+PiArCQkJ
CSB1bnNpZ25lZCBjbHIsIHVuc2lnbmVkIHNldCkNCj4+ICt7DQo+PiArfQ0KPj4gKw0KPiANCj4g
VGhlIGRvd25zaWRlIG9mIHRoYXQgb25lIGlzIHRoYXQgaWYgd2UgZmluZCBhIG1hdGNoaW5nIGRl
dmljZSB3aGVyZQ0KPiBkY3ItbW1pbyBpcyB1c2VkLCB0aGUgZHJpdmVyIGNsYWltcyB0byB3b3Jr
IGJ1dCBzaWxlbnRseSBmYWlscy4gSXMgdGhpcw0KPiBnb29kIGVub3VnaD8NCg0KSSBkb24ndCBr
bm93IHRoZSBkZXRhaWxzIG9mIERDUiwgYnV0IGl0IGxvb2tzIGxpa2UgdGhpcyBzcGktcHBjNHh4
IA0KZHJpdmVyIGlzIHJlYWxseSBzcGVjaWZpYyB0byA0eHgsIHdoaWNoIGlzIFBQQzMyLg0KDQpE
byB5b3UgcmVhbGx5IG5lZWQvd2FudCBpdCB0byBiZSBidWlsdCB3aXRoIGFsbG1vZGNvbmZpZyA/
DQoNCk1heWJlIGl0IHdvdWxkIGJlIGVhc2llciB0byBoYXZlIGl0IHdvcmsgd2l0aCBwcGMzMl9h
bGxtb2Rjb25maWcgPw0KDQpPciBldmVuIGVhc2llciB3aXRoIHBwYzQ0eF9kZWZjb25maWcgPw0K
DQpDaHJpc3RvcGhlDQoNCg0KPiANCj4+ICAgICNlbmRpZiAvKiBfX0tFUk5FTF9fICovDQo+PiAg
ICAjZW5kaWYgLyogX0FTTV9QT1dFUlBDX0RDUl9NTUlPX0ggKi8NCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci1uYXRpdmUuaA0KPj4gYi9hcmNoL3Bvd2Vy
cGMvaW5jbHVkZS9hc20vZGNyLW5hdGl2ZS5oDQo+PiBpbmRleCBhOTIwNTk5NjQ1NzkuLjJmNjIy
MWJmNTQwNiAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbmF0
aXZlLmgNCj4+ICsrKyBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9kY3ItbmF0aXZlLmgNCj4+
IEBAIC0xMzUsMTAgKzEzNSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX2RjcmlfY2xyc2V0KGlu
dCBiYXNlX2FkZHIsIGludA0KPj4gYmFzZV9kYXRhLCBpbnQgcmVnLA0KPj4gICAgCQkJCQkgRENS
Tl8gIyMgYmFzZSAjIyBfQ09ORklHX0RBVEEsCVwNCj4+ICAgIAkJCQkJIHJlZywgZGF0YSkNCj4+
DQo+PiAtI2RlZmluZSBkY3JpX2NscnNldChiYXNlLCByZWcsIGNsciwgc2V0KQlfX2RjcmlfY2xy
c2V0KERDUk5fICMjIGJhc2UgIyMNCj4+IF9DT05GSUdfQUREUiwJXA0KPj4gLQkJCQkJCQkgICAg
ICBEQ1JOXyAjIyBiYXNlICMjIF9DT05GSUdfREFUQSwJXA0KPj4gLQkJCQkJCQkgICAgICByZWcs
IGNsciwgc2V0KQ0KPj4gLQ0KPj4gICAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLw0KPj4gICAg
I2VuZGlmIC8qIF9fS0VSTkVMX18gKi8NCj4+ICAgICNlbmRpZiAvKiBfQVNNX1BPV0VSUENfRENS
X05BVElWRV9IICovDQo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rj
ci5oIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci5oDQo+PiBpbmRleCA2NDAzMGUzYTFm
MzAuLjE1YzEyM2FlMzhhMSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9kY3IuaA0KPj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Rjci5oDQo+PiBAQCAt
MTgsNiArMTgsOSBAQA0KPj4gICAgI2luY2x1ZGUgPGFzbS9kY3ItbW1pby5oPg0KPj4gICAgI2Vu
ZGlmDQo+Pg0KPj4gKyNkZWZpbmUgZGNyaV9jbHJzZXQoYmFzZSwgcmVnLCBjbHIsIHNldCkJX19k
Y3JpX2NscnNldChEQ1JOXyAjIyBiYXNlICMjDQo+PiBfQ09ORklHX0FERFIsCVwNCj4+ICsJCQkJ
CQkJICAgICAgRENSTl8gIyMgYmFzZSAjIyBfQ09ORklHX0RBVEEsCVwNCj4+ICsJCQkJCQkJICAg
ICAgcmVnLCBjbHIsIHNldCkNCj4+DQo+PiAgICAvKiBJbmRpcmVjdGlvbiBsYXllciBmb3IgcHJv
dmlkaW5nIGJvdGggTkFUSVZFIGFuZCBNTUlPIHN1cHBvcnQuICovDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvc3BpL0tjb25maWcgYi9kcml2ZXJzL3NwaS9LY29uZmlnDQo+PiBpbmRleCBk
ZGFlMGZkZTc5OGUuLjdiMDAzYzVkZDYxMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3BpL0tj
b25maWcNCj4+ICsrKyBiL2RyaXZlcnMvc3BpL0tjb25maWcNCj4+IEBAIC04MTAsNyArODEwLDcg
QEAgY29uZmlnIFNQSV9QTDAyMg0KPj4NCj4+ICAgIGNvbmZpZyBTUElfUFBDNHh4DQo+PiAgICAJ
dHJpc3RhdGUgIlBQQzR4eCBTUEkgQ29udHJvbGxlciINCj4+IC0JZGVwZW5kcyBvbiBQUEMzMiAm
JiA0eHgNCj4+ICsJZGVwZW5kcyBvbiBQUEMgJiYgKDR4eCB8fCBDT01QSUxFX1RFU1QpDQo+IA0K
PiBBaCwgSSB3b25kZXJlZCBhYm91dCBub3QgZmluZGluZyBhIGdsb2JhbCBwb3dlcnBjIHN5bWJv
bC4gSnVzdCBtaXNzZWQgaXQNCj4gYmVjYXVzZSBJIGV4cGVjdGVkIGl0IGF0IHRoZSB0b3Agb2Yg
YXJjaC9wb3dlcnBjL0tjb25maWcuDQo+IA0KPiBJIHdvdWxkIGhhdmUgc3BsaXQgdGhlIGRlcGVu
ZHMgbGluZSBpbnRvDQo+IA0KPiAJZGVwZW5kcyBvbiBQUEMNCj4gCWRlcGVuZHMgb24gNHh4IHx8
IENPTVBJTEVfVEVTVA0KPiANCj4gYnV0IGFwYXJ0IGZyb20gdGhhdCBJIGxpa2UgaXQuIE1heWJl
IHNwbGl0IHRoZSBjaGFuZ2UgaW50byB0aGUgcG93ZXJwYw0KPiBzdHVmZiBhbmQgdGhlbiBhIHNl
cGFyYXRlIHBhdGNoIGNoYW5naW5nIFNQSV9QUEM0eHg/DQo+IA0KPiBBbm90aGVyIHRoaW5nIEkg
d29uZGVyZWQgaXM6IFNob3VsZCBTUElfUFBDNHh4IGJldHRlciBkZXBlbmQgb24NCj4gUFBDX0RD
Ul9OQVRJVkUgaW5zdGVhZCBvZiA0eHg/IFRoaXMgaXMgYW4gb3J0aG9nb25hbCBjaGFuZ2UgaG93
ZXZlci4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQo=
