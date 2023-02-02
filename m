Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 015CD6885B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:44:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P75kp6Dlcz3f6L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 04:44:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y7JDw0AR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::606; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Y7JDw0AR;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20606.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P75jc6bZMz3f81
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 04:43:16 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H78EPL4AX+loWjRC5dcDg/Iv/dUlaXpTMdRtqA0l2LrIKuDV9eQM38hLrVDpu+tGHdFJLhe8ljbJKntcinKQ+GQbXa47GUCo0RC6lieTydiVWbAhz4KiHj2Bo/fRrpXh4+fNLeWZhsFIEojXkaY28yypMwKEpD2IF1yLWVOZ/lR3tnP+L1qCVFQnnRWFUVyY0imnTzJz1FdiUeBC4ypIazg6Y75dXUl2BLSv89OY9YvrM9anWm8eR28Rr3UXwxAaHKPLnZGNzqIiUzvtKwdtLx+nrFYy1+qyMbewTkLjFy0CFdZu3XfkBCqqPUROtie2NVoWcuSBv/HXsRf57TbI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8gzlcRAvxmbphFlMAB6u1Vc07bQ3sAVGCAcF3oREVI=;
 b=iOEBncqOPaeqK+G0fNwB7hvNaaS4Rj+JzlhZ0+gHNMi8gzOO3QHRt43t5zwB7X+N8QXHkAAof213Z8TNyWrKQiwIKAokqanIWvDAzyKZnwkLAeAYvG9VxaeGEvzPXMSarKTmYjEwJLc6PmzHvwE5bae1Sq8AzDyW5I0xlhq8Qm7sRYo72SCGXZZ9VTLUrXCiZas58MaUivOmgPwAlLjww0Eze85VVqf7XpCZLmW2R+1Zy7/BccQ4V3phkBhq/YawZWfM0vKUEPrH9DPZ/o8gipDd4eDmgxK023MQbfR2TIRwVpYs1ZVARKeJiukYU09g2W7zUKctVX7dIrUO0Y3oZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8gzlcRAvxmbphFlMAB6u1Vc07bQ3sAVGCAcF3oREVI=;
 b=Y7JDw0ARWGNxJRg+OOR8Ij6sBRibWvlWMdLoXbaH7wFDNmfXIygxEiTkWC597KBi3A6Lv/a+G1t3CqOd2AQ/1Im3YbRIMgAhInwAuG38uDLeY7yCy2yDQ7hn0BoDiEEpQYao6hg9DKB2xYJDbjT+9cBuiCj5zrZR+BzCe/LRBXE=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM7PR04MB7159.eurprd04.prod.outlook.com (2603:10a6:20b:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Thu, 2 Feb
 2023 17:42:55 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 17:42:55 +0000
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
Subject: RE: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Thread-Topic: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
Thread-Index: AQHZJr0yaCK3pFdB6EKPvZEvJoExp668Dfrg
Date: Thu, 2 Feb 2023 17:42:55 +0000
Message-ID:  <HE1PR0401MB233139AC4E34F2D5E495AECC88D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230112193621.1513505-1-Frank.Li@nxp.com>
In-Reply-To: <20230112193621.1513505-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|AM7PR04MB7159:EE_
x-ms-office365-filtering-correlation-id: 2c50bda0-0cfe-486b-f052-08db0544ea65
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  szHwT/uPoHvGui+gxZEoehVbJbCIOXpEK/fpnkPQ4SWz9glPV33Shw3ait6+ImqfESQ4MUF6UVRggzo18sFw4AUSgNCrb3KXnvLEDb3Ih4M2zV3gd3CnQr/8jNki7ug2s+P1gBtAA+dNw7fC/F5/gP/yoXao+SSKXxb81d4fSfeyA+QGk+OVvYA3Uv1eWuvdPXSE7WcYxrw5hca5Io6Oz4dfGnKJzs9REyxpL6rn8tu1KcwrTXG/IHlAgyVwUy04YP851WgvB5gSuFmeWu6L+hvVyr1Jtn11vW09GbxE+BXcaSAShCKFtGfhQsR+nKwUm6ls0mDpaw3MgP2UoY1OVYqI2y86xo4uXCK9BRuDFYE8rnN/AYMdu9upP4vNHdr0aEOy+HPmcotZySKFMWhMp7p4DpBk7/CBf4lA8T8JlBlgC9h9W4r5orKX7yJfhwc0InlvWSu3/bO77UVevDQsS24DmIbZdPbK38RNR8RiCSFUvwHbTbQ/TOKafhRcUWJvtndg+45JbDmB+PSeQot+QiE4T6NN9qow+uNoV/Tq1IOubQ+Br38RIjLd+fCWxexNtPgmK6xOOzyj431G23bPA4IauLeUliokR2b6wKqPPKkoCwTgOHi3ToXCM4ZZb/3tVyCpquJzb/D9cbStj8ubAJbVZe3NWaN70QY5BK7xle0E8jYT3//osCPcZNwPfBjEgfoD54/yolbPQv8X9JCXyM2qUQchBiyng36vHXzdSRs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(66446008)(4326008)(76116006)(41300700001)(66556008)(8936002)(8676002)(64756008)(5660300002)(38070700005)(6506007)(55236004)(26005)(122000001)(66946007)(9686003)(66476007)(33656002)(2906002)(186003)(110136005)(52536014)(38100700002)(478600001)(44832011)(86362001)(921005)(55016003)(7696005)(71200400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?Aow7ihOqe+cXhjKFMhEoWLfQ99cln/oDX1dvKnkp7qCxlQEt4GPDPTeLvT?=
 =?iso-8859-2?Q?u4JqOHe4SWQFNeEy5icjdWCXIGzhY4VFeShCR5kqvh8G8/o9G6oVShXUAc?=
 =?iso-8859-2?Q?+fL1MFiFTmH5Z6LbM3LUjVK6LzRgPLAsLuVGKSk9JvZy32iKiJQcmrQgai?=
 =?iso-8859-2?Q?NP6EQOpZ6vKW67N4svcjmBi8xoa3Ou3lB6Hnv/3ouPL2EJ+1XuYWuJMslL?=
 =?iso-8859-2?Q?tg+jGNkBMT/O6ZILOT4ai6XQIXpGlsNAR6j/vYat1+/oBgdbH54Pl8vxWF?=
 =?iso-8859-2?Q?dQHmCKHyhQno7fcFb5p1AkXWxCtjC+XknWx1s2pRz9HflkGjuk5u4xbIs0?=
 =?iso-8859-2?Q?+rKrRzp/azJ+DxihUuuuQn0sPkeyYQu30aqCF4TkYFuz7fFv0VHokU4oW3?=
 =?iso-8859-2?Q?wRM7QaqY1lKlL1zFP8aZH1X6d1u2zMCt6HHqwyQGtMFgOJohp1bVXGKxQL?=
 =?iso-8859-2?Q?LXrknS7REYbv0tTFg3NvndKvKWg/NbBftzo3Se12y9AeePJbr3F+81lvky?=
 =?iso-8859-2?Q?5DZs82hqSesIOHXtqnKnR0hCW6dDFaM3XXu2MJSnLnVzuN+7GvjxLbyqzN?=
 =?iso-8859-2?Q?iWOVB4fIJfBieUXIh+lnBpPlJcnLFXzXX22Y/07MNBJ/mfeHD1FBp7B6DS?=
 =?iso-8859-2?Q?KfPuqbhq1NN6Sz3mFHfX4aee1rDMrZ0vPV+90flfE6EE+G54nd//1chDXG?=
 =?iso-8859-2?Q?nCtCleebUHV6R0hFh0a0R9uNAny/OrSG6BIBKWJGn/xX6YQ7Tyw2ee+zmm?=
 =?iso-8859-2?Q?W7qdpM1pajzQ2XjhAZH8qJagtCm4gmVWWhmvMlOZu6CQjFSASpCVSHqHGB?=
 =?iso-8859-2?Q?t0J7X10qgkseFs4dHzfwEC2VDt3aJsqCAD8LoLEndEcwicDjHyPa7zXucb?=
 =?iso-8859-2?Q?s2J5pfYphSFsJCpeKmi+gBiE4bKTOeDSreh9liGESZmavbm1ZaJlAVlaDi?=
 =?iso-8859-2?Q?jMVuIp7MkTXrh9ZoRgRYJhVfpuWp39jTuh+7s3c7bcmPKHdTSuocUHUYAN?=
 =?iso-8859-2?Q?XipAXNz8uBpRTKD+VCIPZdZ4JgetQ45kHEVXoE0Z0yPKITPN5knuLqhpEQ?=
 =?iso-8859-2?Q?wEPoiwNvpaTOQ6G53koZB4HoaLPZ9LJjbrxXjhHizO371UrpnxnHn8ddf7?=
 =?iso-8859-2?Q?QXSzA7y0KvYtjvaEm2aO7+fMHkY2CUh2J9GhMLZdYyJFmkSnIGNpeSqRgX?=
 =?iso-8859-2?Q?qk4oUzUKiCBMdqgUP/ZiHC5imhTCJ/mcsARQRofQ17fOFO/FaN27TN+O+e?=
 =?iso-8859-2?Q?xZc7Xx9AVksXRvu/+qVS4uLX92HNGK0eOBfyWKmTNxxlZTppOeQY4rABtH?=
 =?iso-8859-2?Q?Ln7QI3UHGJD/o/Aj+/ztPjVpsgpcGwM+GRpODZ0OrSwyqJYHEamry0vqmW?=
 =?iso-8859-2?Q?gCmj1M16C2FLcrzAshcKqZhosDsrvbLe1b3kLuhFB14kQwS9qKAnA3EkGv?=
 =?iso-8859-2?Q?vxb2MOzydNx5U/IWMtehF+0kkfSBFSeS3GTOCilgmhA7FZTZSYXaKkRijb?=
 =?iso-8859-2?Q?vCrTcjKwr55T3Olj1Gs1YhEeBHeJaLs0Lu9sIEFhUw3ejrJpjoAADN3Wcb?=
 =?iso-8859-2?Q?I8msL+P6H9SYBoHh6UEhAc5UvvDAo2L+Zx0mgw9PAVM350T15mbMnU2hYi?=
 =?iso-8859-2?Q?czjxWzhCGgUvE=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c50bda0-0cfe-486b-f052-08db0544ea65
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 17:42:55.1208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kcExfFeGB51V80zXm8Wr4bHlNqkyu7cp7QAlXU9L2E/ZbEdVsJVQjgCF+MBQs+DIiA5dbxMYQPWWopOAApRU7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7159
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


> Subject: [PATCH 1/1] PCI: layerscape: Set 64-bit DMA mask
>=20
> From: Guanhua Gao <guanhua.gao@nxp.com>
>=20
> Set DMA mask and coherent DMA mask to enable 64-bit addressing.
>=20
> Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Ping

>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 1b884854c18e..c19e7ec58b05 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -261,6 +261,10 @@ static int __init ls_pcie_ep_probe(struct
> platform_device *pdev)
>  	pcie->max_width =3D (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
>  			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;
>=20
> +	/* set 64-bit DMA mask and coherent DMA mask */
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
> +		dev_warn(dev, "Failed to set 64-bit DMA mask.\n");
> +
>  	platform_set_drvdata(pdev, pcie);
>=20
>  	ret =3D dw_pcie_ep_init(&pci->ep);
> --
> 2.34.1

