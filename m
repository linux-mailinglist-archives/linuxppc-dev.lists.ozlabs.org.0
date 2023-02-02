Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D52DC6885B3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 18:45:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P75lr5MfFz3fJL
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 04:45:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=be42uc49;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::601; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=be42uc49;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P75kT0MCQz3f77
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 04:44:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gINmPXnAkG9tZz//QMYXj+F6eQCXa2SkZfc1QNX1QRZHLNZCgs1ngAccV1ZYsS9x5YXs8vKBShcTfbieI5yqVc+m2+jXxRP1ei0ebdlK/ndSlGDm2Kg4io3cjXChJS4JBHwdjZH/dhcfimYGtQeVibq3wbJZt/fhV7JpH5V5oHF9s9hPcwcwECKxTffH4ds2yHAuERc9cYvkmKupOYvrpjaKKxMM/wS8vere45vT+32VClZL7GTifODXL8hvxFQN9OJTBNN3gerK6XVhjKwC6KjDncXzxayQQ+1s40mln1/yyf1jgjIEsS4SY57FctT67yLmSH89PdLaMmACtD0bRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pivN7g9MCH2SQ3PIvZgyvGakEcBuUDhYyGEBPLSRgNk=;
 b=ExRUJ2ms33WUHWPJ7FUK9rOOkNDoaIb1go9GjJYH8NBoS619xNCbaOhnreAUfokiVdpulpnf6Nli3Wf91Kz/ATW0Nw9D/WggFi9hV807iVUvhfysK22uTmJwxYwY+EbgLCk/2KMJv9rgQdussE7rhj6A4xS8nvngvkVv2wEXWz/eOkqXtqnMZIoQ1d+jiZAAvZ99PvRvCTF+aKGmp7zVl7zNhcJ94XzbRDKY0EZhLtRT4eQ8EQNhXXUjFwfxIfXcySOXxu4/fK1hdCba/cTknpgCI801xEpGMbVcCJ8xwayi9UqQ1kXQTREVvABAF2pLx0MbC8WQe5szkwAhNi4XZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pivN7g9MCH2SQ3PIvZgyvGakEcBuUDhYyGEBPLSRgNk=;
 b=be42uc49jRCjRcrP1NQZRE8ks4CcaxqxsRrAQwmxmX/jj2FD7q6Ezj6Rg5zURgUNEqWw7ks+yieVvucUAgVqZlilkpU6/ahdCzfXmCaEEwxxBxkT/k3KU2no1PuThWCOhnJJSmOQhl9NB+pjlPtgbLW+R5NpvwVHSbqjlE1ZhT8=
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AM7PR04MB7159.eurprd04.prod.outlook.com (2603:10a6:20b:111::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Thu, 2 Feb
 2023 17:43:43 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::ca48:3816:f0b6:3fcd%6]) with mapi id 15.20.6043.038; Thu, 2 Feb 2023
 17:43:43 +0000
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
Thread-Index: AQHZJr5WwkFDleZU9E2wO25hi20GTK68DjRg
Date: Thu, 2 Feb 2023 17:43:42 +0000
Message-ID:  <HE1PR0401MB233120D46B7AA9F23AFD51C688D69@HE1PR0401MB2331.eurprd04.prod.outlook.com>
References: <20230112194433.1514149-1-Frank.Li@nxp.com>
In-Reply-To: <20230112194433.1514149-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: HE1PR0401MB2331:EE_|AM7PR04MB7159:EE_
x-ms-office365-filtering-correlation-id: ef24103c-069e-4606-c6ad-08db054506e9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  DGEflz6wdnebIGDiysOGHguxqCjzUFQji4FK8qCG2E1H9zO6Km7SLHhhB2daX6EqYNFxiaQhDrH7rVzauEBs45FPtubsT2INaYn3Z8B7Gv1XHz4UWTIDa0aYL4G/zd1GaMOp/K4ib/tZ8fLCdeKC7KO1KzSiMBaxPaY2U1mSdlY8+32JTaE1GwV+E01S2YYpNTcJ5Su8tsgKJKACUU7vg8IjqleNLi045t9CyUJaParp6DYSX2KKlhUxUhYKv8n5WgU8+aJ5Vb0r/HLEtUwgQzDw1876wIKQRKHxkIJWgszCo16heAnwWv7JsfclctX36M5BWCBr1s2P+QgYDGEdviEsMPkBLZLi+ev/gjLrH9XS+/AvkHb6yDIMnAT7XFU5uDm66sEpe+4kqOpIDns+zM0NFG70u3h9XocQg0vhrbNMJ3hPSYRqkbThO5H/CTOqaTB/VtxRp4CprX6Ip4hdjfgl11tWZs0YjHk9RmSYLYk0D60KNo3obIHAe6S7ZNaOsLIzCJsDa2OWGcE/J5PGllYCUQ1TjaE6uBG8ZcqDbV8MC1YNNzWw4eAtsAbtS9fsMQ31hS9zBc1+fO5iH3dPCZCm9tTo5Bg+w8g2GXr6iESmiil/0oDzWZYDKcSe0YLxXneEoj3lDgdOtyq67mt9QgBy6dbSH9x01fxbrLtEDPhrsUstxditWr4q5LgnwptzRECPxBBBB7CVuToye0ea/C9n7pEMgaQCfbk/QWK7Kgs=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199018)(66446008)(4326008)(76116006)(41300700001)(66556008)(83380400001)(8936002)(8676002)(64756008)(5660300002)(38070700005)(6506007)(55236004)(26005)(122000001)(66946007)(9686003)(66476007)(33656002)(2906002)(186003)(110136005)(52536014)(38100700002)(478600001)(44832011)(86362001)(921005)(55016003)(7696005)(71200400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-2?Q?T0akJbOfptDp8OjDS+d2U4Au7Vpb/xBAPk1et1KsDa/KLmgNlI6hHd1Gqu?=
 =?iso-8859-2?Q?43s1jCCvHJgZ2hZ8MVL/y6ZiGESdHzBVn6TyU25P9umY3x/oov6orj0OQ9?=
 =?iso-8859-2?Q?yHnzJx395DXbjDavChe6o+Zwd58MoTpAUwRkn1vGBepJNZ8ux9fna7DZSE?=
 =?iso-8859-2?Q?KdPY4F/7Cv10CwK7IITRvOMJlET993xV4vFS53a0S0FfamPe8QkdnxzDeU?=
 =?iso-8859-2?Q?hRWuQhB/FwTmAsAskfuMc9XH9tH9H0XJa02XQKYikGPv61B6zZgSwqhU73?=
 =?iso-8859-2?Q?epWcEouwGtXXVGdiJCcXPmoMsQloiXcPSpvnpXjB+vPu/61240z2aO8XlE?=
 =?iso-8859-2?Q?LQoglmNak6Z4X3V/16b295FTIX+Z9QNC3/+nAQK9xejY2N/B+CR0zeeHdB?=
 =?iso-8859-2?Q?og0rG7bFZh2ooOuNJLruZqqLbrMQIlplYF5lDAe7l4vGOBz3KG2D6HxTB/?=
 =?iso-8859-2?Q?A4CoCWQrFjkHaCmiYIMxtICQ43po6CFv+Q7r73zweqBXUnfmgp7xgq8Hsz?=
 =?iso-8859-2?Q?iE0F0PjBvWZTLayKosb1cQB6C5BAwGvA3Pi2SO+eB6LnUXGSLNb20b06nK?=
 =?iso-8859-2?Q?t6suwp2Sr6z3KE30Vm1OmjcKRvfX3kglJ/uU6xPOIwYwEI9T+ykC2X7I04?=
 =?iso-8859-2?Q?tK1hXNzEpvG3ArurIoWTglaG5jHnC+kDRE/xIv4mKa1TNbFhn34QMIqRSd?=
 =?iso-8859-2?Q?93mhEhGKE+DFv1Ol5g1XJzNo4U137IUW4jL3TOdAJfdnI1F0sHIlUQAz63?=
 =?iso-8859-2?Q?Gq6c0qqwX1MGUFqtj1JubAPS6AVXUOLIqnstyOYMcfIWhsvABrhYOAoSBy?=
 =?iso-8859-2?Q?2y9eOuNVIoX8pztjnyojaxBQ5mAkML6anQpSA0QML+Qdx5sKGAeHa45Yal?=
 =?iso-8859-2?Q?S6OGiMeC0Zf5uXuGg11y5NteY/kYU4jRPg7oTP4BZ8nDqpbNUZGe/OrFLC?=
 =?iso-8859-2?Q?K///lYqSnfTtkXtXTifOQmpNuigQpQ6TP+vJfvwN+pWC2texNOVSdJW+Iz?=
 =?iso-8859-2?Q?SWJoJ7nzqiNWOeSb+e02GLcOzVxyFhDDY30KXpiw2gTQsisu8Ofa9WXHSU?=
 =?iso-8859-2?Q?NNAbP4jqdWfn5qTZSuiKjBuEclKwBugUfQpQetS9qepAYKTWf+wzn+Ty7a?=
 =?iso-8859-2?Q?/nOGMtwlJvJW3eIiRBAquiW+NyFL8+t+et2CqAHGlbxksva3C5o/Wypc82?=
 =?iso-8859-2?Q?HjCC6T3Rd9OQTLWEHZvsFX3CVWi7aGdFitJWDjncW3UQsq3EeWC1u9gwDI?=
 =?iso-8859-2?Q?NaCf1FSGnumS06WE2ocKTbCwq9iPTZ0RanJcfPmf2yZ1iKnBx1zUAQybys?=
 =?iso-8859-2?Q?y31gOm9II2EQniOkxcFtuft7GVM/AA0hXsqva5bhL4UTHVllrbGdA0AAs+?=
 =?iso-8859-2?Q?ku24MPPnYlFBNZtmUOsiOOpAVIquaZ2BevnYkY4KK7wUNNbQR0ptl0PWR6?=
 =?iso-8859-2?Q?XDxfhvjD3WwqvSUZQGnIvz38MqmnmWeQJoCCPwXMgbEbhIxHlTmiqrJ3N1?=
 =?iso-8859-2?Q?Iq/k2sKgkhqvDG5XToHLD+UQo2jXF3CZ2cZY6zYvF/KWtczVHtHTeSwBWB?=
 =?iso-8859-2?Q?Fpz0aVAmKeB8cr9xP8Gxyay1108dhZn5eRrIqAb4gMwgCTToVKeUpjsLCq?=
 =?iso-8859-2?Q?+JEIaXYzMuWtg=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef24103c-069e-4606-c6ad-08db054506e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2023 17:43:42.9454
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SydCLz5SjhwQjK0n6QhQegRXeA4KLDW60W4k/Z3JBVn3FKmxSbbqnU3bbDZz4eVVi3SQHiN2ykmrFlpVSNHhGQ==
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

> Subject: [PATCH 1/1] PCI: layerscape: Add the workaround for A-010305
>=20
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
>=20
> When a link down or hot reset event occurs, the PCI Express EP
> controller's Link Capabilities Register should retain the values of
> the Maximum Link Width and Supported Link Speed configured by RCW.
>=20
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Ping

>  .../pci/controller/dwc/pci-layerscape-ep.c    | 112 +++++++++++++++++-
>  1 file changed, 111 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index ed5cfc9408d9..1b884854c18e 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -18,6 +18,22 @@
>=20
>  #include "pcie-designware.h"
>=20
> +#define PCIE_LINK_CAP			0x7C	/* PCIe Link
> Capabilities*/
> +#define MAX_LINK_SP_MASK		0x0F
> +#define MAX_LINK_W_MASK			0x3F
> +#define MAX_LINK_W_SHIFT		4
> +
> +/* PEX PFa PCIE pme and message interrupt registers*/
> +#define PEX_PF0_PME_MES_DR             0xC0020
> +#define PEX_PF0_PME_MES_DR_LUD         (1 << 7)
> +#define PEX_PF0_PME_MES_DR_LDD         (1 << 9)
> +#define PEX_PF0_PME_MES_DR_HRD         (1 << 10)
> +
> +#define PEX_PF0_PME_MES_IER            0xC0028
> +#define PEX_PF0_PME_MES_IER_LUDIE      (1 << 7)
> +#define PEX_PF0_PME_MES_IER_LDDIE      (1 << 9)
> +#define PEX_PF0_PME_MES_IER_HRDIE      (1 << 10)
> +
>  #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
>=20
>  struct ls_pcie_ep_drvdata {
> @@ -30,8 +46,90 @@ struct ls_pcie_ep {
>  	struct dw_pcie			*pci;
>  	struct pci_epc_features		*ls_epc;
>  	const struct ls_pcie_ep_drvdata *drvdata;
> +	u8				max_speed;
> +	u8				max_width;
> +	bool				big_endian;
> +	int				irq;
>  };
>=20
> +static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
> +{
> +	struct dw_pcie *pci =3D pcie->pci;
> +
> +	if (pcie->big_endian)
> +		return ioread32be(pci->dbi_base + offset);
> +	else
> +		return ioread32(pci->dbi_base + offset);
> +}
> +
> +static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset,
> +			  u32 value)
> +{
> +	struct dw_pcie *pci =3D pcie->pci;
> +
> +	if (pcie->big_endian)
> +		iowrite32be(value, pci->dbi_base + offset);
> +	else
> +		iowrite32(value, pci->dbi_base + offset);
> +}
> +
> +static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
> +{
> +	struct ls_pcie_ep *pcie =3D (struct ls_pcie_ep *)dev_id;
> +	struct dw_pcie *pci =3D pcie->pci;
> +	u32 val;
> +
> +	val =3D ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
> +	if (!val)
> +		return IRQ_NONE;
> +
> +	if (val & PEX_PF0_PME_MES_DR_LUD)
> +		dev_info(pci->dev, "Detect the link up state !\n");
> +	else if (val & PEX_PF0_PME_MES_DR_LDD)
> +		dev_info(pci->dev, "Detect the link down state !\n");
> +	else if (val & PEX_PF0_PME_MES_DR_HRD)
> +		dev_info(pci->dev, "Detect the hot reset state !\n");
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +	dw_pcie_writew_dbi(pci, PCIE_LINK_CAP,
> +			   (pcie->max_width << MAX_LINK_W_SHIFT) |
> +			   pcie->max_speed);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +
> +	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
> +				     struct platform_device *pdev)
> +{
> +	u32 val;
> +	int ret;
> +
> +	pcie->irq =3D platform_get_irq_byname(pdev, "pme");
> +	if (pcie->irq < 0) {
> +		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
> +		return pcie->irq;
> +	}
> +
> +	ret =3D devm_request_irq(&pdev->dev, pcie->irq,
> +			       ls_pcie_ep_event_handler, IRQF_SHARED,
> +			       pdev->name, pcie);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");
> +		return ret;
> +	}
> +
> +	/* Enable interrupts */
> +	val =3D ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
> +	val |=3D  PEX_PF0_PME_MES_IER_LDDIE |
> PEX_PF0_PME_MES_IER_HRDIE |
> +		PEX_PF0_PME_MES_IER_LUDIE;
> +	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
> +
> +	return 0;
> +}
> +
>  static const struct pci_epc_features*
>  ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
>  {
> @@ -125,6 +223,7 @@ static int __init ls_pcie_ep_probe(struct
> platform_device *pdev)
>  	struct ls_pcie_ep *pcie;
>  	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
> +	int ret;
>=20
>  	pcie =3D devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
>  	if (!pcie)
> @@ -155,9 +254,20 @@ static int __init ls_pcie_ep_probe(struct
> platform_device *pdev)
>=20
>  	pci->ep.ops =3D &ls_pcie_ep_ops;
>=20
> +	pcie->big_endian =3D of_property_read_bool(dev->of_node, "big-
> endian");
> +
> +	pcie->max_speed =3D dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) &
> +			  MAX_LINK_SP_MASK;
> +	pcie->max_width =3D (dw_pcie_readw_dbi(pci, PCIE_LINK_CAP) >>
> +			  MAX_LINK_W_SHIFT) & MAX_LINK_W_MASK;
> +
>  	platform_set_drvdata(pdev, pcie);
>=20
> -	return dw_pcie_ep_init(&pci->ep);
> +	ret =3D dw_pcie_ep_init(&pci->ep);
> +	if (ret)
> +		return  ret;
> +
> +	return  ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>=20
>  static struct platform_driver ls_pcie_ep_driver =3D {
> --
> 2.34.1

