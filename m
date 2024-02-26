Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94D867C9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:51:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XBVnTpkR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk68D0hTvz3vbc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:51:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=XBVnTpkR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::609; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20609.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::609])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk67L0X0Kz3dV1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:50:35 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EmiF2bzruhGsyiLPDCtN0mRqNeXrqe48XCLJRh5mVzAAnAdUVeoxTObQsOHtYS/HZElIIq3oJbSCaqYKnswi6fGUJM9VedAE1ox7y7WhokgEliv4na4N0X3/0/SaMJx9oPcYcL13yMVsR1g7Z18FKr2sP0+yZk+YR8VEWOwTURto7hFs3qXbF/R1ay7lJ4MapUYuCFmJbQvq/OjQt0xjxxyGspIRUDSujCRHDZ9SA8NJxnBjvM+tNw5LojlUwfiusBUSGPFAYRHiQHWjbTzi7S2nOH7qfaXTSHZAQroy6QrbcBQZbtw6SU8aPvYoBvBnSeNbISkCAR7ZBPgl7Ba6NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CBLxvv3jrT4IsyNnHOYPMk7LjMg+NASRIlTlSE2sx5Y=;
 b=KBqDLLgP/wGtuaDagPnqlmkDdY0Xo45yetjLGWqYKQvLXgzEhQ6HkTEpn9lsHP7aeap11TUebe+aMmCJ3o8Ma9YhQ6KHryjIHei5Hih+gwOGL38zCtDPkW2ojHm0XXnW3EkWHbiFh85o8VUH29Z1k89IOeRC/vopUKe+8csH6F1eReDvah9F3VDjIJJpTezuEPdHMHlEKpPk03lbfWPml9MNzcisCO7EQApKO1Bb37kUoI3DqoQp/KOIxRKIBQWn7VDyDCnqTjyHfKA98gbAJtkP/b5erAqkpZOQHufIpTELnDd3Bb7LSZcVAbkmSkQ9iI6K1+hJ+fcvtnkq1YXpig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBLxvv3jrT4IsyNnHOYPMk7LjMg+NASRIlTlSE2sx5Y=;
 b=XBVnTpkRFOaX6dajciwtqKq8EORJF4i60AdxfSyVkmVA6BDn/DHch6fKeH/kF3Jel2m1dg4oXI865YDeEg87oZvh28VEd8lW/bKXakwXOL8OHdhGWi4/s7aJ4uW3hyQKtImLJvCBR4qnqkg4rWcEu5kDx85BbUoG+pAp5uZqtbA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 16:50:12 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 16:50:12 +0000
Date: Mon, 26 Feb 2024 11:49:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 01/10] PCI: dwc: ep: Remove deinit() callback from
 struct dw_pcie_ep_ops
Message-ID: <ZdzBN9keX7OOKymF@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-1-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-1-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BY5PR17CA0020.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d81d69-200c-4972-53c4-08dc36eaffb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	wpkmt8NcFolwmZSeJY6IOnJkjCAqGYcTKy99wGLDKbsKOJ0uaTxPopg9roKGmRnMPeeLVXQjfCSGZTiGmHLk6xUJau8UpeyXeyhIRX0kmCeyF/kEGYBEQ+P1Im5QbDGRuvqKYlqHKtXvo410Td6kgrTakx4TK/A/IDHu2qRFqaNBuoNewo82D3xoPjQw8A9NFzNNRVJDvpNU2vwoXW4YEBklZHLUie6MJL+9jxaInh+n49UrsVzhyEYvEe+m/qYd0XhjcuP30n7y+I08KMPVuacoJZsD4Ne1Ag10Owp6FDgcMBcKyikauBHM6/snxAsCQynqev84+nIcqHuv7bWfEeBk1SCKJloxpUemhayB/r10EbZawgouBBHO9ZH5srwsiEZOd0PLTvtBTVrbxIPBp/Fp41ZXR4Taoi77cOYjTsYwv5oqkiuKBIzEOWW/lGQT0yYyAn5yKI4FzV1UOlgNq7vI/WhHnU5KnpbLZjYpVLTEhv4hxdr3QfvmO/AkTAwrttOOR28VUD1pB2eoFDMEyKQh+NFhCfsdXvS4N+1UVssw7MkC/pc/FGPf3dVAEeemeqIUX0CrPCWMajBF4nUhTmsRtuavdZDX9nqyiEAzwYnBrD2ohGaFbACJ5tLVIj48n+f6F1bch/c9kL2JaJv1TzwIunI/XZWlUGC/s8O7mJbsUh8yBQw4UV6ww2phFtcNRizEzkF0N4wNt2CdLVj2oTpsh4rDV9Ch1VtuNxa/jAs=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?5TKcuV10yY0m5WZQwEezLF3T0EuPyWmB3oLxq0p45hr3e4+svP72VWXoDVct?=
 =?us-ascii?Q?e6VQf7q4bvRpMGWP+1kSoHWtlDGDNy4EGC/NsPDJ10M8/7g2RJKBephfyR78?=
 =?us-ascii?Q?9tRWSLSadT1tlFEx1REzUTj1QLw4prdYrn6WABY2Zuq5lT72Nn7DtlW4Bjt6?=
 =?us-ascii?Q?0KXsBEWiNhwpiCxUvzhw+2rjwQBa8xXUQ0V/RKnm6boSqi0sNNkqM+1I1Q+W?=
 =?us-ascii?Q?nwrc7j1on1T7siN7TUhyNmQiDnQ9TbsemKSPOUq8/fjkLZt1plOU6IRwuPWn?=
 =?us-ascii?Q?Z1t2pO8jHJm4S9LeQsf/TpxRSqGjaZvHVVii5gzCc6zZcGtFwRnSC/rn7wol?=
 =?us-ascii?Q?WUWMAa1EL6OOU3cnNcAD544mBThiePi7+Hmj7gsmf7kbtBhp9676b4VKuLvF?=
 =?us-ascii?Q?Ve9H2Nl58HNjrsWLSY4u+DQ6nQVsPkWAdPffVt0hyczekWlM3Uzyigo0kmRw?=
 =?us-ascii?Q?UE2CTKiaI8d4MLlETu017fq9h8M2BUWqt7M/Xmy6IWgWm/dbLcRNeULFUZ2P?=
 =?us-ascii?Q?FeQLVV1GGH3rypmiAxvhPf1RgIqtK1Z6GIswgjnER/CLHcPrqP7tLyTvkf2Z?=
 =?us-ascii?Q?3GWys5WyY5X+9zaXFwsUhw2nT1WdzqzDjQ6qWwGB0i0cbGGsQEKHijBHnkXx?=
 =?us-ascii?Q?pZloxXJtKMVtQ2FJYo+oK41L+QpX8+Qkzb8vMxbgxvoW6UMVy+4UDWObuiN5?=
 =?us-ascii?Q?ALgNqOgAcXS8OLCEQCkfuxr9gx9D1N+NVHQmnMi5nW52GXlncbCjaLw16tG1?=
 =?us-ascii?Q?uoOX8IAICFABRXV9kK0J1KQuoK8HH/iu6WOYAjAAc5zCTabrPQU3itiSB5Va?=
 =?us-ascii?Q?WQSWdGFaS8dTk9H1rVVA2g26r7smZKpHVA7XqnGd850sX5J0GxSdl+9uTVzN?=
 =?us-ascii?Q?cpMvZJHlgZXsGeSczxCA22JByNg0YPlOMSY5xoliDRbz1YVbyv6khBP/dEZP?=
 =?us-ascii?Q?NY54fPtp6QL4xP14wLPh1dy4Uy5UiLwnQyBoRAVhOgQTB/3SNLaEzUnJRukA?=
 =?us-ascii?Q?sg1423Wf04y1deWvtW00AuUKx8q/xupLMcFcz3eFmuBDdppJIU5N1s8I4t3n?=
 =?us-ascii?Q?lD1AKI5knTEY1FK5baMwHwyOpNJKwGdiEs9E0DmLUv6BMWBG/MDj4HKc9jOD?=
 =?us-ascii?Q?vLoKIAQ7ZPNt7PIM/WGN0cdPdKvdP207r6pDo+fDulptE/j9fxjKS4/zHpA3?=
 =?us-ascii?Q?d/MQSSPu+M4raNrTFmpFT7ptGXtXuLPF/p8Kn4tw325k00wmxJRf4aHuG84l?=
 =?us-ascii?Q?5JeFOD9rCIKCEGx4VY1onJEKSgWft3G5jLksIbVAOS8lO1FUIjycNrL6ps/7?=
 =?us-ascii?Q?83vbQdXfYBJZhN6eQ3/kGRVpwMo2tda4HiPe2JY15Fy5wbyk1L5O9basknVO?=
 =?us-ascii?Q?rGBmtvzJfcE+WgPn7ssUoCerorHV9Wlg//eYGHEb+YM1dyHMs7HFhIstbz9X?=
 =?us-ascii?Q?dHQZY2FcWrVCv0BFdcJaFO5emBHpL4dsMm3pLjzdUgsWJdb7XU4NQieTl0Ih?=
 =?us-ascii?Q?jJ0AQyL9QBbA86NkkV5a8vwhLX0FL7fT5+LzJ8WhvqwXy7u9C7aX6qj3fLDS?=
 =?us-ascii?Q?7oboAbdCUZb3+43JCUs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d81d69-200c-4972-53c4-08dc36eaffb1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:50:12.1614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +B7Un7jmF4Twjj3N1xh5H6Qzv32rh7CXrLcin1ZZvoCn90hUXgKpyrlfPHNdLJ8z757vVbK/c2W4jk7Nc6ZVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Kishon Vijay Abraham I <kishon@ti.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, linux-tegra@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>, NXP Linux Team <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, linux-arm-kernel@lists.infradead.org, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshih
 iro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, Vidya Sagar <vidyas@nvidia.com>, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Feb 24, 2024 at 12:24:07PM +0530, Manivannan Sadhasivam wrote:
> deinit() callback was solely introduced for the pcie-rcar-gen4 driver where
> it is used to do platform specific resource deallocation. And this callback
> is called right at the end of the dw_pcie_ep_exit() API. So it doesn't
> matter whether it is called within or outside of dw_pcie_ep_exit() API.
> 
> So let's remove this callback and directly call rcar_gen4_pcie_ep_deinit()
> in pcie-rcar-gen4 driver to do resource deallocation after the completion
> of dw_pcie_ep_exit() API in rcar_gen4_remove_dw_pcie_ep().
> 
> This simplifies the DWC layer.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c |  9 +--------
>  drivers/pci/controller/dwc/pcie-designware.h    |  1 -
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 14 ++++++++------
>  3 files changed, 9 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 5befed2dc02b..d305f9b4cdfe 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -575,9 +575,6 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
>  			      epc->mem->window.page_size);
>  
>  	pci_epc_mem_exit(epc);
> -
> -	if (ep->ops->deinit)
> -		ep->ops->deinit(ep);
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
>  
> @@ -738,7 +735,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  			       ep->page_size);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize address space\n");
> -		goto err_ep_deinit;
> +		return ret;
>  	}
>  
>  	ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
> @@ -775,10 +772,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  err_exit_epc_mem:
>  	pci_epc_mem_exit(epc);
>  
> -err_ep_deinit:
> -	if (ep->ops->deinit)
> -		ep->ops->deinit(ep);
> -
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 26dae4837462..ab7431a37209 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -333,7 +333,6 @@ struct dw_pcie_rp {
>  struct dw_pcie_ep_ops {
>  	void	(*pre_init)(struct dw_pcie_ep *ep);
>  	void	(*init)(struct dw_pcie_ep *ep);
> -	void	(*deinit)(struct dw_pcie_ep *ep);
>  	int	(*raise_irq)(struct dw_pcie_ep *ep, u8 func_no,
>  			     unsigned int type, u16 interrupt_num);
>  	const struct pci_epc_features* (*get_features)(struct dw_pcie_ep *ep);
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index e9166619b1f9..ac97d594ea47 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -352,11 +352,8 @@ static void rcar_gen4_pcie_ep_init(struct dw_pcie_ep *ep)
>  		dw_pcie_ep_reset_bar(pci, bar);
>  }
>  
> -static void rcar_gen4_pcie_ep_deinit(struct dw_pcie_ep *ep)
> +static void rcar_gen4_pcie_ep_deinit(struct rcar_gen4_pcie *rcar)
>  {
> -	struct dw_pcie *dw = to_dw_pcie_from_ep(ep);
> -	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
> -
>  	writel(0, rcar->base + PCIEDMAINTSTSEN);
>  	rcar_gen4_pcie_common_deinit(rcar);
>  }
> @@ -408,7 +405,6 @@ static unsigned int rcar_gen4_pcie_ep_get_dbi2_offset(struct dw_pcie_ep *ep,
>  static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  	.pre_init = rcar_gen4_pcie_ep_pre_init,
>  	.init = rcar_gen4_pcie_ep_init,
> -	.deinit = rcar_gen4_pcie_ep_deinit,
>  	.raise_irq = rcar_gen4_pcie_ep_raise_irq,
>  	.get_features = rcar_gen4_pcie_ep_get_features,
>  	.get_dbi_offset = rcar_gen4_pcie_ep_get_dbi_offset,
> @@ -418,18 +414,24 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie_ep *ep = &rcar->dw.ep;
> +	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
>  		return -ENODEV;
>  
>  	ep->ops = &pcie_ep_ops;
>  
> -	return dw_pcie_ep_init(ep);
> +	ret = dw_pcie_ep_init(ep);
> +	if (ret)
> +		rcar_gen4_pcie_ep_deinit(rcar);
> +
> +	return ret;
>  }
>  
>  static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  {
>  	dw_pcie_ep_exit(&rcar->dw.ep);
> +	rcar_gen4_pcie_ep_deinit(rcar);
>  }
>  
>  /* Common */
> 
> -- 
> 2.25.1
> 
