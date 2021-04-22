Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3483C3677FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 05:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQjhQ1v1xz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 13:34:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=qGlbIL9u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.21.81; helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=yibin.gong@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=qGlbIL9u; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2081.outbound.protection.outlook.com [40.107.21.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQjgs6fW9z2xZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 13:33:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JE6reM9kj7vNjfSfPiuyl5vd+7QCkLR/ADWC2ZmmDb24EJN3WaVNtCk94AqQL535PfLM4CTkRZtQZLUtbzDsVMgqlYGFCTBf7BhnyfxfPVXmY9jtmMPPikkPGsXdmJhYntnJPWXhle2PwlCymybkZxXct9za1mu/e2MY7jrtOHT7cGIU3sQlHyqfnRpiW8HHf5iyTKvORNu/RObzPEA/dRDALBNZnnSOfY4I/11WykFXRgrxDxP7o1AyksOPsZ2qudRQmCzccKw1fUEvUmR2EnKWU2LGg+heYgRrAht0pfZsmjUAkcI0ToBsuevIb+LLDvi1TQzbb4r9LEmewyab4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o03vfC+4NXzUr0PHV++OJDwB3OIuaNMObXIfMV2ySFM=;
 b=UN9IHsywbxfSJg7sX5FidcD2/mwgQ+cDSbI/SOTLYqwXwjJrI0V0CQ2a0RcVmJyA4Df0uHGIfP9uI+2qZXo75/OUcznzQk/FqheukeAeJKd0uXAPm1G48ntDKX5q3y/5KfdDqqHBX7ZMKbOkWOmPe2mYbq3CjmpkN5nqp/K2CUHlJuzredKEyBORYGQGKb9ZbYUY36pDzgTlL5baGFHPLnLBFMYhiWuc6pN7k8sqrwAV0jpjMFSURwlk2ld8MORyCHnQGTwR+cQPTSjQWZyYAYvu3K8aDROTN9lCCSt7pcjlt9081ZpI1HwfL6Ev9Jb+IxxZoKP2IM6OgwXgzfzpwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o03vfC+4NXzUr0PHV++OJDwB3OIuaNMObXIfMV2ySFM=;
 b=qGlbIL9uRBQiHJ5dbu3hIB5LiStDj0ziod7c5N4KdJR5CvXyjSoIBGlU/XzCw1AO4qh0XwFyhQSB/d7+YXyx5by7kAjxqaTPV9zLypNrEpcXB4x0OvLX8d4kZNTD2E4aaNWdJfdheyzpOcs6mVerJNNcHg1NITj4b+ynC9o2Aac=
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (20.179.235.153) by
 VI1PR04MB4733.eurprd04.prod.outlook.com (20.177.51.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.24; Thu, 22 Apr 2021 03:33:33 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca%7]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 03:33:33 +0000
From: Robin Gong <yibin.gong@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Shengjiu Wang
 <shengjiu.wang@gmail.com>
Subject: RE: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
Thread-Topic: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in
 probe
Thread-Index: AQHWLcMcvbp0uyGgYk605EKKtgH/8aivLYuAgAF2HACAABbKAIIDgX+QgAHvdICAAJqQwIAG4DOAgAHNh+CAAAv2AIABkvaQgAA9gACAAIks0A==
Date: Thu, 22 Apr 2021 03:33:32 +0000
Message-ID: <VE1PR04MB6688F1C65295C1A0D689C5A289469@VE1PR04MB6688.eurprd04.prod.outlook.com>
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
 <VE1PR04MB66387217EDE5133FD2D8F793894E9@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <50ef17a2d57b022c48bbca71fd4e074cc3ca9be5.camel@pengutronix.de>
 <VE1PR04MB6638EE85485768351755557B89499@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <97262466d537402ad4032098ef277d6d47734f1f.camel@pengutronix.de>
 <VE1PR04MB6638659EC8557D01861042B189489@VE1PR04MB6638.eurprd04.prod.outlook.com>
 <d8d084aa7ff183e2f78128a46a0ce5241f357c9a.camel@pengutronix.de>
 <VE1PR04MB66887C731E32BDBB340B044C89479@VE1PR04MB6688.eurprd04.prod.outlook.com>
 <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
In-Reply-To: <18fbdc4bf0574a722134400ad9e4510d3cbcb767.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7698a4c-fc54-4ba8-fc53-08d9053f67c6
x-ms-traffictypediagnostic: VI1PR04MB4733:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB47336C17EFA022581A71AA2089469@VI1PR04MB4733.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8NYef9/JSyHTn5YNuNNNtjVHxwzz1eI/y3DFt9duHjinAATnWug6nGAiNBfOo0gOapOghvi45JxFFH8uruLi7JXwDT1jq+/3/S++id8e+5Wc06zFXE5f0eKT4bgSHXIdMYu67HHOkHo+lQJzUXONYpYdnrUtU8QDMSd8L2d+cyZl1XhGZQDsMhcVHxi3vRdQibS2qhsDQLB9PEPIk2fxJ4cA8VyRbQVKbwWKcFkXa8SOOJJCIVIUNfARbN1GNl0XY2SRnoEjflznt7oSGzXbcg+z/tZtlBVEX/EhyhKH4Z61dL6kQHYP5rzCiGCCA5Nkuf1RWxCwnYktrMz2rkglY/2sPpI0mNugkH3U6ru2RmiVCnJFLIE0MEpv0fb0UDTbCCfN8fSlcAcSN+dC9aXMbquoMpru5ehdIEThepDryZC5L5ZawPlCAuQBYtrMvSPs9myEXQ70SVo+ThEGxSN4/cgkolHztJYnWfHKg0WtiwQpOS16fOJh1XLBiIaMNDCZrQDA8hDfHNL2JL+uRGFYQteYUbwT57Q1p8KYCd7JxiRCCsVfP2gZpPJMP9rLopzAz2fpdBRFCNtRG19pJ8fHxyVT67cf6Wo9lr5dSJ8Ml4E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1PR04MB6688.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(478600001)(6506007)(71200400001)(26005)(86362001)(38100700002)(54906003)(8936002)(33656002)(8676002)(83380400001)(186003)(110136005)(5660300002)(122000001)(66476007)(76116006)(66556008)(4326008)(7416002)(66446008)(55016002)(66946007)(64756008)(316002)(9686003)(52536014)(7696005)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?dVYyQlk5WFcvUE5WSkVKemRYam9paFkxbWFGLzhMS01aMFROWURiZDNqMGNi?=
 =?utf-8?B?bWJxbThhSml0ZDhlOTdHUmFSNEsweExFemhQcjh3ODFoRm5INXlnYUh4b1Jr?=
 =?utf-8?B?blAyRC9mbTMwNWZEUGpEVmFQSDJrdFVleWhkQWdYS3hEWFZ2elpCWWhLeE4w?=
 =?utf-8?B?Q21iUU16WVpjTTdkZWJWMTBFVCtteW9xYzduRHlUcXYycEtZNzRLVFZjaTB2?=
 =?utf-8?B?RFdsWnRvZUxEdStBSWNWSEhxRkMwTktDcHdWb3UvNlY0Uk9mL1hVRDkreFFD?=
 =?utf-8?B?dm0vUkRMdklGNWJUVmhva0lzaitRMktPWDJrakpzUXpiWVl2QkNFRXk2MFdx?=
 =?utf-8?B?RzQyQmFZTEhZS2NUUlZiaHl6V1VVWWprSzRDbXd3bWxobVNwcHREbHVycHJY?=
 =?utf-8?B?VGJJWU9wSWlETlVqbW1GSDlseExKMTltYy95WjJaRUROYjdhMHg5eXlBRHNI?=
 =?utf-8?B?bEVrelZQRkdKUXRydEVtNXM4TjU4R1NlMFFjcldBeis2Rm5KamZTY1V5ZkZW?=
 =?utf-8?B?akNsdU4rVEkwanJEbFB6bjNWdmRrN29jTjZNWHl6MEF0YlhUTjNCZXZSSWVn?=
 =?utf-8?B?d2M1Zm1BQ2FqaEVhM2FkWFd3QmF0RldkQTZoanJ1aUMzM1o1ampFTUZpREJr?=
 =?utf-8?B?SmVPaWtEbTgvK2FFdEduNXlBRlhJUmFyelN3RWRWb2IrTUZ5WERDM0VEWk9v?=
 =?utf-8?B?UzZtZHNIT1VQUDdUOUc4YzB1M2g0ODNsbllUbkRpSi9xaHlZSzVNS3hQcXhD?=
 =?utf-8?B?T3JRS1M1UWRSaVlWQzgyc3FRRUR1cWVjM0Q5dkpJc094Q1NvREl5N2tKUmZ0?=
 =?utf-8?B?MEhEd0Y5NU5KcFZ2WVNqMXNuVS9taXVFZ3ltOGNod2pZejZ4U0JnaVM5eXkx?=
 =?utf-8?B?UGVmc1RmM1F1WExrb3Bod3NEdXFuOWNJWHBNOU9PWHk1OFdTU29LdnduS3cz?=
 =?utf-8?B?a0hIdk9Hb0xUdkovNGU5ZmlWdEJZaHZmUzIyS1dxUjEzQmlEa3ZIOXZLNkFN?=
 =?utf-8?B?Q011REhIV204NEUxb3lNNzl4enZQNkVvSWNOMFVOaFNDZHRpQ1l0ZEtoNVZR?=
 =?utf-8?B?QVJ0QlhTWGI4Sm5vUXF1TkFVR3dSay83WWNpSFZpOGhnWmlrWHBYK1ZhUURV?=
 =?utf-8?B?MTY3UW5QS3JRdVNDR1R4bmIySzM1dktmMzlKZkl2TTNtbWRDeTc1aFRxeFhX?=
 =?utf-8?B?d0hUcW0ySk1VWUpVYU55cU5NSkxIUENGZ011ZHRGZURsRGJEOUdjaTJwZmNU?=
 =?utf-8?B?NFcvYm5pRFFvR1N0T1ZKa2oxZlh2OGtSdFRiSktpd0NKcjc3Rk5BMksrM3I4?=
 =?utf-8?B?OGRxLzdVTkhoWDF5TmJMZjRMbm92cCtCMUM3NFRudk1QOGZ0SEtIZmlaWWYw?=
 =?utf-8?B?RDd5WHliS0hSci9FaWpZYThxTlJ6ekV3NkMxVEFwbHp5YVZUVGpSbUF1dnpI?=
 =?utf-8?B?ekw2UVJzUW5wUEMvc0thQ0FhZlRSeUUyMUZ1TVBieGh1dU9XN3Jzb3h6OG5W?=
 =?utf-8?B?SC9Sd0NXN0M1RURZaVJVelpZVisxNmYwZ2wwcHlMOWx6RlQvSWlzY3B5R21i?=
 =?utf-8?B?a0lHOUxwWFFPTy96bkhhQlNQSUtZWHMyRzN3WkROa1hiOE5hc3YvVTlpcjZW?=
 =?utf-8?B?REZQak5uU0s1SS83bnhzbjZuWThPOE9VR0ppOFNqR1oweDVweTBzMTRqQjZW?=
 =?utf-8?B?a1BJd0phVWx3d0w1anNvMmtpZWFYc3pjZGZSVmZuTmpibTFFTUhacUpZUkJq?=
 =?utf-8?Q?H9KEyx0HJWJjx8v2hRq7SPrE+KwOOCC5e/CtzXL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7698a4c-fc54-4ba8-fc53-08d9053f67c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 03:33:33.0369 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRNocrvJrpVhgdQz0MnWUuHlv0/0Hui0f9cCAp0kWdvMJISOPcOgPDqlmuIc8PAclL56q0X8WqSZuEg45OjmIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4733
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
Cc: "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "perex@perex.cz" <perex@perex.cz>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMjAyMS8wNC8yMiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4gd3JvdGU6
DQo+ID4gQnV0IHRoZSB0aW1lciBvZiBydW50aW1lX2F1dG9fc3VzcGVuZCBkZWNpZGUgd2hlbiBl
bnRlciBydW50aW1lDQo+ID4gc3VzcGVuZCByYXRoZXIgdGhhbiBoYXJkd2FyZSwgd2hpbGUgdHJh
bnNmZXIgZGF0YSBzaXplIGFuZCB0cmFuc2Zlcg0KPiA+IHJhdGUgb24gSVAgYnVzIGRlY2lkZSB3
aGVuIHRoZSBkbWEgaW50ZXJydXB0IGhhcHBlbi4NCj4gPg0KPiBCdXQgaXQgaXNuJ3QgdGhlIGhh
cmR3YXJlIHRoYXQgZGVjaWRlcyB0byBkcm9wIHRoZSBycG0gcmVmY291bnQgdG8gMCBhbmQNCj4g
c3RhcnRpbmcgdGhlIGF1dG9zdXNwZW5kIHRpbWVyLCBpdCdzIHRoZSBkcml2ZXIuDQpZZXMsIGRy
aXZlciBzaG91bGQga2VlcCBycG0gcmVmY291bnQgbmV2ZXIgdG8gMCBpbiBzdWNoIGNhc2UuIEJ1
dCBJIHRoaW5rIHRoYXQgY2FzZQ0KSXMgYSBjb21tb24gY2FzZSBpbiBkbWEgY3ljbGljIHdpdGgg
cnVudGltZV9hdXRvX3N1c3BlbmQsIHNvIHNvbWUgZG1hIGRyaXZlcg0KYWxzbyBhZGQgcG1fcnVu
dGltZV9nZXRfc3luYy8gcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQgaW4gaW50ZXJydXB0IGhh
bmRsZXINCmxpa2UgcWNvbS9iYW1fZG1hLmMgZm9yIHNhZmUgcmF0aGVyIHRoYW4gb25seSBwbV9y
dW50aW1lX21hcmtfbGFzdF9idXN5KCkuDQoNCj4gDQo+ID4gIEdlbmVyYWxseSwgd2UgY2FuIGNh
bGwgcG1fcnVudGltZV9nZXRfc3luYyhmc2xfY2hhbi0+ZGV2KS8NCj4gPiBwbV9ydW50aW1lX21h
cmtfbGFzdF9idXN5IGluIGludGVycnVwdCBoYW5kbGVyIHRvIGhvcGUgdGhlDQo+ID4gcnVudGlt
ZV9hdXRvX3N1c3BlbmQgdGltZXIgZXhwaXJ5IGxhdGVyIHRoYW4gaW50ZXJydXB0IGNvbWluZywg
YnV0IGlmDQo+ID4gdGhlIHRyYW5zZmVyIGRhdGEgc2l6ZSBpcyBsYXJnZXIgaW4gY3ljbGljIGFu
ZCB0cmFuc2ZlciByYXRlIGlzIHZlcnkNCj4gPiBzbG93IGxpa2UgMTE1MjAwIG9yIGxvd2VyIG9u
IHVhcnQsIHRoZSBmaXggYXV0b3N1c3BlbmQgdGltZXINCj4gPiAxMDBtcy8yMDBtcyBtYXliZSBu
b3QgZW5vdWdoLCBoZW5jZSwgcnVudGltZSBzdXNwZW5kIG1heSBleGVjdXRlDQo+ID4gbWVhbndo
aWxlIHRoZSBkbWEgaW50ZXJydXB0IG1heWJlIHRyaWdnZXJlZCBhbmQgY2F1Z2h0IGJ5IEdJQyhi
dXQNCj4gPiBpbnRlcnJ1cHQgaGFuZGxlciBwcmV2ZW50IGJ5IHNwaW5fbG9ja19pcnFzYXZlIGlu
IHBtX3N1c3BlbmRfdGltZXJfZm4oKSApLA0KPiBhbmQgdGhlbiBpbnRlcnJ1cHQgaGFuZGxlciBz
dGFydCB0byBydW4gYWZ0ZXIgcnVudGltZSBzdXNwZW5kLg0KPiANCj4gSWYgeW91ciBkcml2ZXIg
Y29kZSBkcm9wcyB0aGUgcnBtIHJlZmNvdW50IHRvIDAgYW5kIHN0YXJ0cyB0aGUgYXV0b3N1c3Bl
bmQNCj4gdGltZXIgd2hpbGUgYSBjeWNsaWMgdHJhbnNmZXIgaXMgc3RpbGwgaW4gZmxpZ2h0IHRo
aXMgaXMgY2xlYXJseSBhIGJ1Zy4gQXV0b3N1c3BlbmQgaXMNCj4gbm90IHRoZXJlIHRvIHBhcGVy
IG92ZXIgZHJpdmVyIGJ1Z3MsIGJ1dCB0byBhbW9ydGl6ZSBjb3N0IG9mIGFjdHVhbGx5DQo+IHN1
c3BlbmRpbmcgYW5kIHJlc3VtaW5nIHRoZSBoYXJkd2FyZS4gWW91ciBkcml2ZXIgY29kZSBtdXN0
IHN0aWxsIHdvcmsgZXZlbg0KPiBpZiB0aGUgdGltZW91dCBpcyAwLCBpLmUuIHRoZSBoYXJkd2Fy
ZSBpcyBpbW1lZGlhdGVseSBzdXNwZW5kZWQgYWZ0ZXIgeW91IGRyb3ANCj4gdGhlIHJwbSByZWZj
b3VudCB0byAwLg0KPiANCj4gSWYgeW91IHN0aWxsIGhhdmUgdHJhbnNmZXJzIHF1ZXVlZC9pbi1m
bGlnaHQgdGhlIGRyaXZlciBjb2RlIG11c3Qga2VlcCBhIHJwbQ0KPiByZWZlcmVuY2UuDQpZZXMs
IHRoYXQncyB3aGF0IEkgc2FpZCBmb3IgZml4IGJlZm9yZSBhcyBiZWxvdy4NCidJIGhhdmUgYSBz
aW1wbGUgd29ya2Fyb3VuZCB0aGF0IGRpc2FibGUgcnVudGltZSBzdXNwZW5kIGluIGlzc3VlX3Bl
bmRpbmcgd29ya2VyIGJ5DQpjYWxsaW5nIHBtX3J1bnRpbWVfZm9yYmlkKCkgYW5kIHRoZW4gZW5h
YmxlIHJ1bnRpbWUgYXV0byBzdXNwZW5kIGluIGRtYWVuZ2luZV90ZXJtaW5hdGVfYWxsDQpzbyB0
aGF0IHdlIGNvdWxkIGVhc2lseSByZWdhcmQgdGhhdCBlZG1hIGNoYW5uZWwgaXMgYWx3YXlzIGlu
IHJ1bnRpbWUgcmVzdW1lIGJldHdlZW4NCmlzc3VlX3BlbmRpbmcgYW5kIGNoYW5uZWwgdGVybWlu
YXRlZCBhbmQgaWdub3JlIHRoZSBhYm92ZSBpbnRlcnJ1cHQgaGFuZGxlci9zY3UtcGQgbGltaXRh
dGlvbicgDQoNCg0KDQoNCg==
