Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 384918923FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 20:17:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oiNfQ6d0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5qsr6rJ7z3vgP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 06:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oiNfQ6d0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2606::701; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20701.outbound.protection.outlook.com [IPv6:2a01:111:f403:2606::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5qs467fLz3dTr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 06:16:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtKDypFkFICJCHuAiZORDG//MnVNwUl7Mb7OWNdpxovo0QkFeRSJ0mpERdBaOuSwCwppKcX/W2u96EDwgHyhAdkD9r2wBcKuCqPX7Z3Cjg/6faoBTxO5gwJcHekjV1NL4O+x/hf+nMiW4SToPtIrYTHvYjufs3AyEGSFo7wsSm6hAfXxsPn7eroZ8WrID95D3F6yscxQrS+PeSqdEAjdKrWpZiHErYaqsRjHFr21iXCmtdZCA0woB5tBH5AlGLZGVu776sDgek0GJKz9RlOtqlcEcFCDNq9Zu4/j+3HF1bz8AtpS6LdCg1fiiG7LeZGiYr/dpbZ+WYTQA8GqHVGmSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8AYQ6FZplMeVwqAs4M+y7QWehTbEKcT9XNZyNNZmow=;
 b=MRipVClNMyjpfQolRPhkXHgGNvEBReIuqUU/fY1WwsSnLnmrqI6SLEZVz3lqw/DwkebHOs8DLvxpvyelEgG/gnnPxgqGTf0YssC5/eo36u5D0T4OMsfCvrV4dBptUSiFM5b7u2wsA6MXOpZTwc3j8uw4iStOe/x4lXWxaPwvUo6c54k2+/qWQWnrmZWiDEgPB54SSaiTB2FFMAbm6I9lUp7+Z9Ji0Cu85mk7px2mmdH21TQLia5QIXsF80weJ5MdRaPMkOnkulwN9ioM1nBYjmOovc4rPUrBrzVp2OSmyylkYTH7cU01cad6nKTaKy1GKLRXQeJrn8wrfXTTMQfTEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8AYQ6FZplMeVwqAs4M+y7QWehTbEKcT9XNZyNNZmow=;
 b=oiNfQ6d0D3lkXeO4i+yLib/tIBD5/2EgfLbip400D4SXOZlQFQ2iEGLoGfckwgHMDKGq7UfCIjGO+ENupZXi0Q0FJrwYYovdwhgZhlOpaBWXUCr7qYD0/s+nB2vxnHPNatQa6iMnFdBphUyApBSpE81fLyZNmh8oYkUQhoN+ER0=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8578.eurprd04.prod.outlook.com (2603:10a6:20b:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.42; Fri, 29 Mar
 2024 19:16:16 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 19:16:16 +0000
Date: Fri, 29 Mar 2024 15:16:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v12 7/8] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <ZgcTc9q4I9K9GA4c@lizhi-Precision-Tower-5810>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
 <20240327-pci-dbi-rework-v12-7-082625472414@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-pci-dbi-rework-v12-7-082625472414@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0147.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8578:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	74KJ7diYFNJ7dZE7jQAbFYmWwy30vNLSUk8kjps95bKr9HtxnN4fQ02pyQHd3dBhzTp3gwEoiYoNeFzK2T/1GJbGYotytXyoG6u78JKhp4f/hGrJLi34ANXsHXqf2v7s4EHp/NXI6zcLx2j7D3wOuImAvHuX+wPG3CbfqA6HDoygYxQdGDI28eTTzV9QZyHfAyRVaqCyEVmOC18jJEayzVT6mOd3ZVfRoMCfDBwzovtITlrFD5ogxayapAYD3GgnbXgqCzdkgsi0FCub6Be+SNWkUnZwM7eASOoewbsJV95bLRu4IQiQXfrwzXTZ7lm3BQhC6CzeOooS0oZ1BWaVN59Y6tv3aUVAb05/Nwe70LJO8bBtL08msRoSDHkQXmTKhS4H3/9Iu7cZk3ah7pluaJcKh8jAw/fT9hBhlphYh/IA+BCd1T57rqIGVzEfzTXwnDl4n+1JytgEuWmVpcczJHE0L/w70Hc7Mh/15mfCDfs4ur4Qzg/KnQ3FXrOTDG8GI2UAqYpwA3zW1KLvyAcDuxcRsGW2DYV4ZU04nhqFq06GhVZ7gtyTn5F421KClIU3V08pSWE4g+DcLowwe0e0QzzIIsu3AAolWVrG50dkFLqg4XjbsBPbIFWNXk1HObs39pjJ/07wBxgmhvS45JvW6zqdfK3FGFbbPhQoHKANou9Oq36kjjQiO7U6OE3LBOwrWHAkkh5vJyoaOIoOpuPU8ARSFXz/tSbhYXaoddBXimw=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(7416005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pZMtGtcmg/RJTeMNebUdoZq1RBQx+5EGyM4jJLU0o/babCZBVP/rE5B1aWvv?=
 =?us-ascii?Q?QQAgLd0ig5znGEaqqfJjpiHY45JqVEeKPPDm3mCWyRvS2tHr4VdxvMFqgcoo?=
 =?us-ascii?Q?6dXRO9xpgV/V7SNk7l7RYfyx7zXcVLC9q2yMsPvdPW0p2zs30Riq0FZkh087?=
 =?us-ascii?Q?RVkHB3bx4icK88ckpoC83I13dvspHu6smvmsQ0wOnOHrBhbNhvcYezpBTgGu?=
 =?us-ascii?Q?c5Pe1UZDFAdK3oMpWO91QvQI2K6mSDEs/8AppOMhC7PPz7evWGEmiuNyf1ud?=
 =?us-ascii?Q?inPGZT/48Z493UiLj9DPLeJIzHIJI92nMTGSCKpeBiUkCntICqNevn6ntvKX?=
 =?us-ascii?Q?tdnpHHXpL0Sag/tKkPhoCFzzG9RA53r7COLeUDdFp7iPLSY0UW8/KnA2ZuWI?=
 =?us-ascii?Q?M9mJ1/pjMUMCuAUv1sPEysLvMu9pRekcKTLO+VFpzw8SdYF9vIQu2MVCG7+3?=
 =?us-ascii?Q?V7piLmZHuO0d/he+Xc9NtV6EFA07cvVzBKOFCR5j3axoGjXH0xvaajuQ45ER?=
 =?us-ascii?Q?iygxgFlUqaztkGsqpMkh4INaS60ZkGKqqNJBvRJHFGJ9mP9GMz/LnnAYbGnO?=
 =?us-ascii?Q?xJvPOERgWuv2HPAbkfp3ILmh9Gy0lgAoZhNUQL3OKnNFMzp0Gd2LXcSAfYFl?=
 =?us-ascii?Q?i7yUWb9LIFJPAXImzmWqwIyhMxYJXXoQUZwHqPrdJdLYzJMWhoZw6kssdh6D?=
 =?us-ascii?Q?gZs7mCxI/fNcTwMjSPmSAnvuy2Bg9XvKBGaYrCCG2a9oNvpnbibqyviQxh6Y?=
 =?us-ascii?Q?/+9PKYjye1CRoFF95DwEADn6omOFvvSjoMKFxpPNGnMLqMo8NtIuJvXtj3+P?=
 =?us-ascii?Q?H4zNyHUjiWXVqlhpHIeZ3dkmwZY60QxX1MfINxCcCJxowoImUeUt/W5xNwMy?=
 =?us-ascii?Q?cRdKDZOtrn+L7GCv3SEZo7d+vOoKUhAzyXiA5BNeySgRUQyn5qez4VBclfPC?=
 =?us-ascii?Q?q3jpX3+AbbENMZWC+rY8y1GreAiwJna5amOEUnoMKapYGGM4VXfuyAR+sdmc?=
 =?us-ascii?Q?GzCKi+XwSwWZPJ3ooGkiSE9DilVZh+V4n2cK38Mbf+DycJNdw60NNrQJgpwq?=
 =?us-ascii?Q?rqkkpQnWoqlsqX/bcKZmBBYKIjQycRmpmNaf5kJzyEjvJb/SB9qPuIC9cu4g?=
 =?us-ascii?Q?iZNOhAhyd3MiyYFaBh7EHbCSjfLMD1j45BPvNS+OehfGrPxSkyiEdBvwxbTf?=
 =?us-ascii?Q?KC7WTUarXOpXi6R4f16b90A3XFZrtLyh2GgvUPuAZuMELjeI7meb4JZlFuD3?=
 =?us-ascii?Q?EIHSTASy+xkhtA4qovCPYVNQhdV8SW+4pRXBOzZuPF/6ZCjFY9IWaTvLiqgE?=
 =?us-ascii?Q?6HdyZqNfXQGeAh4FMBEH1EweMK7ChrDIXSEaD66dlc8njaQzIeyTeHXHvBj4?=
 =?us-ascii?Q?UcUniWzkKRSq4Q6tXjYySJ3V39RfxoCq/tI555e0Bjms2zydRjDlkQIw+Bw7?=
 =?us-ascii?Q?E0R2iv6rD166LigBaTj9ndNOFIk1JGq0XVrKcY3gsasrN3oPv3z5ObeTYKw6?=
 =?us-ascii?Q?443KemyJ/HAyBIUjVLODkcECxGtalGGCdn/NTcY1hS8c7vvoWP5ihIoInI7m?=
 =?us-ascii?Q?9lYaLyAdj8/aB0k2jPjV055x1D0fF+cCMJdbhPhU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea6d61e-e4dd-4f41-86f3-08dc5024b4db
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 19:16:16.4965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ovFnF/n1lV31r4SNNbvkuiVgp6NKYZ6fT/S1cGcHzbY8X8StkbzuXvTmx3k1Q02OKXOFFCpG7VafoAjSuTSfdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8578
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>, Shawn Lin <shawn.lin@rock-chips.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-ke
 rnel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 02:43:36PM +0530, Manivannan Sadhasivam wrote:
> Currently, dw_pcie_ep_init_registers() API is directly called by the glue
> drivers requiring active refclk from host. But for the other drivers, it is
> getting called implicitly by dw_pcie_ep_init(). This is due to the fact
> that this API initializes DWC EP specific registers and that requires an
> active refclk (either from host or generated locally by endpoint itsef).
> 
> But, this causes a discrepancy among the glue drivers. So to avoid this
> confusion, let's call this API directly from all glue drivers irrespective
> of refclk dependency. Only difference here is that the drivers requiring
> refclk from host will call this API only after the refclk is received and
> other drivers without refclk dependency will call this API right after
> dw_pcie_ep_init().
> 
> With this change, the check for 'core_init_notifier' flag can now be
> dropped from dw_pcie_ep_init() API. This will also allow us to remove the
> 'core_init_notifier' flag completely in the later commits.
> 
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
>  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
>  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
>  drivers/pci/controller/dwc/pcie-artpec6.c         | 13 ++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
>  drivers/pci/controller/dwc/pcie-keembay.c         | 16 +++++++++++++++-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
>  10 files changed, 90 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 0e406677060d..395042b29ffc 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -467,6 +467,13 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
>  		return ret;
>  	}
>  
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		dw_pcie_ep_deinit(ep);
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 99a60270b26c..8d28ecc381bc 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1123,6 +1123,14 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		dev_err(dev, "failed to initialize endpoint\n");
>  		return ret;
>  	}
> +
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		dw_pcie_ep_deinit(ep);
> +		return ret;
> +	}
> +
>  	/* Start LTSSM. */
>  	imx6_pcie_ltssm_enable(dev);
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 844de4418724..81ebac520650 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  		ret = dw_pcie_ep_init(&pci->ep);
>  		if (ret < 0)
>  			goto err_get_sync;
> +
> +		ret = dw_pcie_ep_init_registers(&pci->ep);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +			goto err_ep_init;
> +		}
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", mode);
> @@ -1295,6 +1302,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  
>  	return 0;
>  
> +err_ep_init:
> +	dw_pcie_ep_deinit(&pci->ep);
>  err_get_sync:
>  	pm_runtime_put(dev);
>  	pm_runtime_disable(dev);
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 1f6ee1460ec2..9eb2233e3d7f 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -279,6 +279,13 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	ret = dw_pcie_ep_init_registers(&pci->ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		dw_pcie_ep_deinit(&pci->ep);
> +		return ret;
> +	}
> +
>  	return ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index 9ed0a9ba7619..a6095561db4a 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -441,7 +441,18 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
>  
>  		pci->ep.ops = &pcie_ep_ops;
>  
> -		return dw_pcie_ep_init(&pci->ep);
> +		ret = dw_pcie_ep_init(&pci->ep);
> +		if (ret)
> +			return ret;
> +
> +		ret = dw_pcie_ep_init_registers(&pci->ep);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +			dw_pcie_ep_deinit(&pci->ep);
> +			return ret;
> +		}
> +
> +		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", artpec6_pcie->mode);
>  	}
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 761d3012a073..2063cf2049e5 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -821,7 +821,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
> -	const struct pci_epc_features *epc_features;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
>  
> @@ -867,29 +866,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		goto err_exit_epc_mem;
>  	}
>  
> -	if (ep->ops->get_features) {
> -		epc_features = ep->ops->get_features(ep);
> -		if (epc_features->core_init_notifier)
> -			return 0;
> -	}
> -
> -	/*
> -	 * NOTE:- Avoid accessing the hardware (Ex:- DBI space) before this
> -	 * step as platforms that implement 'core_init_notifier' feature may
> -	 * not have the hardware ready (i.e. core initialized) for access
> -	 * (Ex: tegra194). Any hardware access on such platforms result
> -	 * in system hang.
> -	 */
> -	ret = dw_pcie_ep_init_registers(ep);
> -	if (ret)
> -		goto err_free_epc_mem;
> -
>  	return 0;
>  
> -err_free_epc_mem:
> -	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
> -			      epc->mem->window.page_size);
> -
>  err_exit_epc_mem:
>  	pci_epc_mem_exit(epc);
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 778588b4be70..ca9b22e654cd 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -145,6 +145,15 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
>  
>  		pci->ep.ops = &pcie_ep_ops;
>  		ret = dw_pcie_ep_init(&pci->ep);
> +		if (ret)
> +			return ret;
> +
> +		ret = dw_pcie_ep_init_registers(&pci->ep);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +			dw_pcie_ep_deinit(&pci->ep);
> +		}
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 5e8e54f597dd..b2556dbcffb5 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -396,6 +396,7 @@ static int keembay_pcie_probe(struct platform_device *pdev)
>  	struct keembay_pcie *pcie;
>  	struct dw_pcie *pci;
>  	enum dw_pcie_device_mode mode;
> +	int ret;
>  
>  	data = device_get_match_data(dev);
>  	if (!data)
> @@ -430,11 +431,24 @@ static int keembay_pcie_probe(struct platform_device *pdev)
>  			return -ENODEV;
>  
>  		pci->ep.ops = &keembay_pcie_ep_ops;
> -		return dw_pcie_ep_init(&pci->ep);
> +		ret = dw_pcie_ep_init(&pci->ep);
> +		if (ret)
> +			return ret;
> +
> +		ret = dw_pcie_ep_init_registers(&pci->ep);
> +		if (ret) {
> +			dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +			dw_pcie_ep_deinit(&pci->ep);
> +			return ret;
> +		}
> +
> +		break;
>  	default:
>  		dev_err(dev, "Invalid device type %d\n", pcie->mode);
>  		return -ENODEV;
>  	}
> +
> +	return 0;
>  }
>  
>  static const struct keembay_pcie_of_data keembay_pcie_rc_of_data = {
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index de4bdfaecab3..e155a905fb4f 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -416,6 +416,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie_ep *ep = &rcar->dw.ep;
> +	struct device *dev = rcar->dw.dev;
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
> @@ -424,8 +425,17 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  	ep->ops = &pcie_ep_ops;
>  
>  	ret = dw_pcie_ep_init(ep);
> -	if (ret)
> +	if (ret) {
>  		rcar_gen4_pcie_ep_deinit(rcar);
> +		return ret;
> +	}
> +
> +	ret = dw_pcie_ep_init_registers(ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		dw_pcie_ep_deinit(ep);
> +		rcar_gen4_pcie_ep_deinit(rcar);
> +	}
>  
>  	return ret;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 639bc2e12476..0e5e7344de48 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -399,7 +399,18 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  
>  	priv->pci.ep.ops = &uniphier_pcie_ep_ops;
> -	return dw_pcie_ep_init(&priv->pci.ep);
> +	ret = dw_pcie_ep_init(&priv->pci.ep);
> +	if (ret)
> +		return ret;
> +
> +	ret = dw_pcie_ep_init_registers(&priv->pci.ep);
> +	if (ret) {
> +		dev_err(dev, "Failed to initialize DWC endpoint registers\n");
> +		dw_pcie_ep_deinit(&priv->pci.ep);
> +		return ret;
> +	}
> +
> +	return 0;
>  }
>  
>  static const struct uniphier_pcie_ep_soc_data uniphier_pro5_data = {
> 
> -- 
> 2.25.1
> 
