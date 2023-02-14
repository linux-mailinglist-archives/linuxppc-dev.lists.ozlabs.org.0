Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525E2696BCE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:35:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGSyj18jXz3cLc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 04:35:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UBHqc2BP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::601; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=UBHqc2BP;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0601.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGSxk63TNz3cF0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 04:34:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oa+A2AUeq5Qc7CE7BX9VqvHFRsaRgK7SJ4lUvMS8GvrC9FaX2x2kYILXb2fFUK+xgwRql6zVj9KHrw6Jyhsqvz+/GKL+h8Gm/jNyi8EQNIPk6fewZd4r79m5oRbzVNVuJiAfMdkOgFRTBXZuKduYUpLumGayP9Ouabn//lL0dxAUE4PMO5jEiisHw2CE5c7RQON2f6AiwjvpvTdQtAN6xcraGfYNQpiOY68OZSfoQRzjBuNOd1g6xqk6/e9VDMCde+KfNcz9U3QcuOzJWBA2bWEXcLKIycgAzXQkgMhQhJvdkbgLwufKch4Um8vZLes8o8meyzRi7x8VcY7VQcWd1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/L1QfcTGw20zRX3LGfijYOmqsx2VAQsW/41Hsia4mfk=;
 b=GjEI1VH3XJPtFCCQbvjbDYZGGLDFdcCOhJ/Gt1IvsxOac+j/uJwvWlX5mNwivbdiXP6ivKoGBgqwHOeu0Toy9tgzt3iq7/dkIuWeLgE7ZE/NORLHfndue159vWEpxfj6QsxL6s/1RQpiu/54QzXp8ZUNNUS7MMYNC8I9qYQgmWPwjl3osQqGO9lOf9yA9RF7b0iC5s6mRrG48wrxjY42td9NH2Q+kUP0iwHhmfMj2cloE6XizpJjuStvC554YaVrxt8/x5HDSV2gTEAhZ7H5qYBHBKsum/cmy2wKWFTA6QdZ1dw1xDkY9P9H7931glU8Zxe353HCC7aNVUoPzucBlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/L1QfcTGw20zRX3LGfijYOmqsx2VAQsW/41Hsia4mfk=;
 b=UBHqc2BP2djNKzTj0sQUUHTJkgA0gaqGHWJpd34YLjWCxXlagrzM5FwjF1V7as6gtqB5diHfsuRipvmkd6Cu5SxQF5pUkhLZbeFphPwHpCaDOSDME5HBsRhtGYuuv+oDQ4pMj/UJh6ZiKE31HxnVO0pOIn2Hpe4/2lw1RbjTxZk=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by PR3PR04MB7306.eurprd04.prod.outlook.com (2603:10a6:102:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 17:33:59 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6086.023; Tue, 14 Feb 2023
 17:33:59 +0000
From: Frank Li <frank.li@nxp.com>
To: "M.H. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, "open list:PCI DRIVER
 FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>, "open list:PCI
 DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>, "moderated
 list:PCI DRIVER FOR FREESCALE LAYERSCAPE"
	<linux-arm-kernel@lists.infradead.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Thread-Topic: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
Thread-Index: AQHZJr5WwkFDleZU9E2wO25hi20GTK68DjRggBLZEQA=
Date: Tue, 14 Feb 2023 17:33:59 +0000
Message-ID:  <HE1PR0401MB2331FFC2DB890713521DC46788A29@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230112194433.1514149-1-Frank.Li@nxp.com>
 <HE1PR0401MB233120D46B7AA9F23AFD51C688D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
In-Reply-To:  <HE1PR0401MB233120D46B7AA9F23AFD51C688D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|PR3PR04MB7306:EE_
x-ms-office365-filtering-correlation-id: cc67f61f-93c3-42e9-d092-08db0eb1a7f3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  KrrNVT3GNIGqiJPqZQqOSKEj2ymB846dhek5GLmfVgrx8BLdHT5ehOjDhaeqO/EIVUUPxeTcbf/Rl9DM726LU4bvs5AuxqJaEm9VL1qM8ork4j1a7W3vAl4ViilTBXiMMevpGj6dZ45iib1GCieZsTMZLiDxMbLFHOZ5dnMqcM93XshfHvY0r1j4hUIu8eI801ijS1+8WkZUeSklSrcYKXrJkV8QR2+ZC7/j0oDXt+tGXwWmjvY83Ow62PsspNyFRlpWZ2f1dipBPgT2HRZDdC12AXrgJMKxcOf0W8IaG1DBzEnmnDIDIl2muUwi6ldfMiH8aXJCMDqLMMt2I85UkoLTi5q3YSyljyANXptNpfriwBQZSVudILS8J+oHaZWoxW6otsIxC6TJww78Efj9LG88ckfqdCBGnyuTMdDit+hnt3qO2J8tJjT6TKniQdOKkpOKrHIEyV9bAac09cV5Mg+QgsmrYGYFs4bm8uftdjwLcTljDqXvH3KkamUDCEfJYpuZHNPuFIchzRNAkby4dhYXCrLyrh8rzHTPe4MYFqA4Oocpw35leXY6nzqaaCguQNteTB9FKGxq9N/yUDay4WEGe3GHGuQqOXavB32pvL+V0Qb6OglSfV3uUNB+TfmGpHGBtAdXfmA5FS+fNdss+yG7XSYwKRv6b1U37GYXV9dSmp8fBiI//+POF7pbYHCE/1HWQrHH1J3pCOiRU6uHzeGDWPoo2pJncYwE1VgZ8Hk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199018)(5660300002)(52536014)(86362001)(8936002)(41300700001)(44832011)(38070700005)(33656002)(2906002)(4744005)(83380400001)(38100700002)(921005)(122000001)(7696005)(66946007)(71200400001)(478600001)(66556008)(26005)(8676002)(55016003)(4326008)(186003)(316002)(64756008)(66446008)(76116006)(66476007)(110136005)(55236004)(6506007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?voMd3CFV1/181WvvwyUSetu55OUys61RNDGcVDGkjsHq4b3h0ZdR04/fXb?=
 =?iso-8859-2?Q?CbNPdwJKv0/U1SOrcvW87u4tm+w6R+fmCJkIOQvJ1Xj/dJfLHzmm+zkTs8?=
 =?iso-8859-2?Q?yZxQtBxTB8bzb6EtLBXYaNbE50VDvRVIkazCT8ho0RKlrVFvL/96tUNuz9?=
 =?iso-8859-2?Q?4MS1im4a5paDF1VUkQ5R3zzLkK7Co6cwepV0yyTtCcRpElVnfTwUIAM8GR?=
 =?iso-8859-2?Q?gnDMtMDy9D4HGVBBAGwe0j23l+Tu68h4FBWOacJhMDHaSPnOAqTdnYubzE?=
 =?iso-8859-2?Q?jgdxut6In52gonh484GG9/A78d3MSPfluO7ST8nq/JAgs6t2uBxC/Lslgm?=
 =?iso-8859-2?Q?i+YaWiiLOkBxxFJ4l577WdE9yXtOoXjC1HhPM6hs9tigUr4CqH8jLAPWNY?=
 =?iso-8859-2?Q?WHEuL0cL3FlGTppH21pLGg5sxJYLlvB0js41y1D9Qf5fgt8pyAAZOUwaJ+?=
 =?iso-8859-2?Q?nIchxOG/s4zNIi9K97NhKUsziUmFTAZJZAq+xPr/rw7J/ibNDx7rXSydTV?=
 =?iso-8859-2?Q?1g5hxpV/Oy/1G5Gw2y0ezjeP61LVhOqh+Gh74n1pjOUXQ5m+rM4KYUNNiW?=
 =?iso-8859-2?Q?coMPr6c/ZvvuBDoQ5Rbm8Eo4XwRCC4ZPSmmTgDtI+CpT6pGfXevYtqCg7q?=
 =?iso-8859-2?Q?I6eOU1o9TMyK9KYLmH0ayepyJfedmVmkyGTxD2By3oikuCRQBXtUliUp+d?=
 =?iso-8859-2?Q?PAT8F5uAeZ92QPKYGV1C3SMt1zhRlCR5oEPYzyWlUuUuXOR1SMBhAY1y/7?=
 =?iso-8859-2?Q?GECccOOOf1vmLCXzyEQVlABdt+2bzz5tA+YnOsgSFVvm1FbRlmypk+ME8a?=
 =?iso-8859-2?Q?/6RkUaQLi2LO9zz9eQsMg1pkvQ3byGjHVKV0ztn48lD3ZUG+j8RqClVYWC?=
 =?iso-8859-2?Q?ge6tecHkf8TMa4usTNWDzX6lCyTWm1DzC4fREcpraBD+31BusYXJ+1gHzQ?=
 =?iso-8859-2?Q?4I6KFTbHmufaZyKjmsKywvQfIExgPH3A24fwdDTKYNcHy4+bWca5rk2A3Y?=
 =?iso-8859-2?Q?2vMRU138ZNEP/vYAYXNkg+AOQUVTfW3lec9q8llXlyffWXB10gB5k19V7z?=
 =?iso-8859-2?Q?TOh6CK62GIGXTXo/pdIyF5OZnpAYXZo24a7KgT5awL3IC/eKNGnj2v8tgf?=
 =?iso-8859-2?Q?I42y5MAPpS6OFSmsWOBv8Vfsw1/JS35lj7f+EWtunhNZsI3d2mau8zPI8H?=
 =?iso-8859-2?Q?3dr6CnpcaMnSBrxMifPlqF/7xyIsh4hUEKteOPUi8yPweK0E+xTyUnsCN5?=
 =?iso-8859-2?Q?jR21cOm52h91TeuTz2btrccMZauT2UphTV6GH/gaSVT3MVQYOquZ653szo?=
 =?iso-8859-2?Q?SIo07IeTTjoufwjpx0O50MlKYhnT2EV2nZAXm70ihUV6q73F0COShoUDVe?=
 =?iso-8859-2?Q?V2IfmazLXO0hEjpEJe1sW8eaUrZnM4vhgqj8G7dLVkm1pWFIWaaEAhi63C?=
 =?iso-8859-2?Q?PxdBLM8krvNXnN7dMlWx3qXbpaqTI+5vKWYRE5kO2iq0f7q4LyqAXdlCGO?=
 =?iso-8859-2?Q?GdcxcsGWe7znRXzW5pbE9rucJXivDJfVteXcMo6hGI1GFr9VrVxeoWi9sU?=
 =?iso-8859-2?Q?N9MM1lVzBz9/P4Z7dOJztGlqmnlNmu6A+pOoh+KefMdLMR6lHBnUJ0P/eB?=
 =?iso-8859-2?Q?KNsDe+BPsGh64=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc67f61f-93c3-42e9-d092-08db0eb1a7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 17:33:59.2362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hP0vWfqz7g9vQ+tldH2VwwxaUdCwJkotwxeWQIaa90wx7k5TXNwts3I3fIeX57InyybTSSR0OTnmRkk13bhoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7306
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
Cc: "imx@lists.linux.dev" <imx@lists.linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> -----Original Message-----
> From: Frank Li
> Subject: RE: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
>=20
> > Subject: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
> >
> > From: Xiaowei Bao <xiaowei.bao@nxp.com>
> >
> > When a link down or hot reset event occurs, the PCI Express EP
> > controller's Link Capabilities Register should retain the values of
> > the Maximum Link Width and Supported Link Speed configured by RCW.
> >
> > Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> > Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
>=20
> Ping

Friendly ping.=20

>=20
>
> >  static struct platform_driver ls_pcie_ep_driver =3D {
> > --
> > 2.34.1

