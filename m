Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B75D5867E03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:19:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Vrvedm4Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6mh351Qz3vdB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:19:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Vrvedm4Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::601; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6lv2wLsz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:18:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/FF/83zoIIgdWxiIrH2fE+bDsCkjriug/YIO7n+7nuUe8qm3J7J5FrXkhJj/3fVQ1XCgDZkSTA5iPiY6OsPbYyVsEa4kCZBOoX7GQHumGYgDbg/VleUAMYetI/Gl9KK45YRzwj2QGj8rll5/BKWQ4QpdG6nKeoGtkhbvR2Mi/ITKlXmF/AAoVu0lJhuptsooVByLPoUGa4sTV3+xs4H3v9cOCucff/J2GK7wPk9lT47PtDtR7PPMCHkTIh+q87yvxIAc6OAMejq5BCSO9mrnWle4D6X7X0QrLDE+Xnof5j8DECBllRczPVDlrxE/DhfAou76VdIjfilAPHMh02lGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JxAX39VbC7N743LHgrZapPTlOdJiqihDth52kThK4I=;
 b=VPaYqU30IQfAdee0SdsNJan7qZTxyVSiMmtCtIAC56rVoZnZwNcX1ZIiS+vIX5wlgd9RDePPpjdD+lPITPDsfO5bXIz2yvqhsi+8bnQu1hzmHWKoepl62EE7ZnT9u/5WY55UinxKKJJNBYCNzxMk6BlfQbLRBA+vHz/2tvqGmpcQQHmfl+KExl6Teiv4YZCeIDbDm94dhCKZNTfH1JKptX6d4sPJmTMOhhNAWRzIbOgM90cJPTVtdZtWSXggHw+LOM4IMSiulfomQvm9wieWd0A86NnC5YH2snlSWbfnCwuWkoTUCVMp/IfSdEybYi0wBEK+w+6uakd5lQmYpHg2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JxAX39VbC7N743LHgrZapPTlOdJiqihDth52kThK4I=;
 b=Vrvedm4ZukAMEvA6gO86NJBCW5bSep/FXo+lvfhDaOdZ4lWKXpz7IqnzXE9ql4IVAMmBBmJKHcI2LT9P5K0mPtxm5broVi8ak2mca4oubSYM8/a2O1gA0Y8CRduECQAmgeK7/ssrQXU58LwRM1UCGGlpWi1rJyxiOHpDViGqXl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 17:18:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 17:18:30 +0000
Date: Mon, 26 Feb 2024 12:18:18 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 08/10] PCI: dwc: ep: Add a generic
 dw_pcie_ep_linkdown() API to handle LINK_DOWN event
Message-ID: <ZdzH2lOSwBsIp/Jc@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-8-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-8-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0053.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: 15090d3d-2fcd-4604-7f6a-08dc36eef3fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	DyqiXDrsV5AHHdNgbT+k4Ou3kiGnNm5x4pd86MDmu2zoo7Pv+eI9KdhaZeXJyRKtcI6FwBOUG9ZBPJ33QF528FfW4j8OuMq1NKmUVjbYAYJnaJCBEvp+P/uEBECcbPdO0jsMDFUyzm69MqneF898b7wzvqJfAJNMCV3MP+KUnNS+QffQJobm0i+7x+AoKMahllStbbGl5ghaP5Oj/kRfusqdibQz8bGVuesw0fiHp/pAAVRAZlfVfmctnl5ezhHqNo5VsQFX4QQLC0tjia9ec6zWffFauF1NQYgLfIsRs3zcfFP6NpwPpVJkH6buxlFf8iGgiuxghB6eTU44nMC+LdUA60tus/9BgXdnLRakK21CUa6EXAfbjsZ9nIVIvcmn5VEgUSlqJdc7jKbnTpn3HAGmndT5jU/ekLSoLBHgG39cR6v0cQBlPckgx5dxqwih3yCsVX2G8OzQ2Uv3Riy73hVdl1AHUQ4jPulpApk0TaK2/ZaAbL7mrtSuPIQLbHovOZBqWGrCACPwHQIVbHQPsV0dm1UyZM0Vfj49U3hR/ezR6xqtfpItFgIyfgVa7FOkL2IXPJITOKt9J9xykg8N2nQU9k/NNM1IDCBSmQcHNMzCMsvOIykBCXqyc4DENhlNgJuf5DuFoqGe54A8rHKGJQE+H/smp0fw2GZi76fPttaqV8tZij4SaTSANJmxd62dC14ZF/HsHna6UnmPH5tnwg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?KZzNv/WxCHv3NqZh3Esg6+EM7sHxuaPNnZ4k2py8zVYSsChRNKlFCxQqxu+b?=
 =?us-ascii?Q?B74g4wK2hlOLyI4KsJhXbWMuKfM7KYkSGCmhAQqT3Obouj+ViRjhOn/Z/MbD?=
 =?us-ascii?Q?dutyNduUWTgNnbJ7yWPPItde5CPIwHPqVxUBzov/Y0QOyjohzde/FcpOy69M?=
 =?us-ascii?Q?Jav1cPM51mrWaYRrVUvRShuheFVg4swr9pvnDGuEX1AxwAh5dlcB9StOIXoW?=
 =?us-ascii?Q?0pr9qJBz/lCwW5DAA9Is4Rcu1lW91Khk+igf3c/dttJAnYWvtF03ox8WMJFW?=
 =?us-ascii?Q?0ymG+AzK6GCl+HUgRSWgafRRdvheCcpaI3ym4nCdI/qPRie42B/9uWfOo3kc?=
 =?us-ascii?Q?Ukh9IYXv81bRxlGF0Dgf+sMKsVODF2Vn6XqZJ2Cl2hGzwKetYQO7+CsHA3TC?=
 =?us-ascii?Q?cHGlzn0oV9Fljli4OFou3vnqScYG6bXPbNP/OQfRLmka1TyNmDVGA4lchqGm?=
 =?us-ascii?Q?9iafPf1C1J+sWHsmjzDaYwfC7k2GDslOTMD95K2wernYyplYGENCfBjDWTT4?=
 =?us-ascii?Q?4hKJQRe8QTFr12CIic7d9mKybuc8Tj+SY5q9oeIPAwWyXashmzdT9A77DOeL?=
 =?us-ascii?Q?uhnJ5HLfxulNryd0DJgZbAl6VAYI/y2zjD6u0WabeqdGWVHf9equQrahSuXa?=
 =?us-ascii?Q?F+VBythD6EAFIuigJxzTnI1lVQ1HTv5RapvOB6HJ9sn2IMfY7cCHClhmbLVD?=
 =?us-ascii?Q?0p8DDIhgRa1JWHyM+4m58rlab8tRXfTTqgVGErLmnu+zeoh/mdWr+sx3858k?=
 =?us-ascii?Q?ekJf2kctAYTb9X34Ro5Y7rSvXpx8RAcd01gsT9DwpLH49o3GXCaWYXKSm9wc?=
 =?us-ascii?Q?6yIkgJ2ja2wsoguP4wZVFc0TwJIDVo5kgp2eLdlBvVGUmXrfWJ0iEneVcWkY?=
 =?us-ascii?Q?omyVp6m4dMep8flyf0+PoBM2Y+jCn8GZQ+agxpfTd8mN8FDKzH0qjxlzqfnt?=
 =?us-ascii?Q?a3W+cXLrnlyLnd9/LBwZfoktA3Y91pgOFwb1c5LAOG+2eT/T9U/J1w7YvqG7?=
 =?us-ascii?Q?eRmdYbm+vi6haW0bAnLhdc1q/a4P0hq2xwb7GT1bVrlyY6dcMB3j3rsi3dAW?=
 =?us-ascii?Q?6Qp6gIrpEDDdTvYujEldtJvaro2hffVaRE5bYwlgDaC6iIbqU1SReAmOrEp3?=
 =?us-ascii?Q?Wuou0scqp8b5v9boKIkAskIaBh5ZkqB1LgJtUrlY2ZCYjB1Gc1iKS+ZYlhKt?=
 =?us-ascii?Q?tBV0OaAdwiayX+t6vi8oFdWEkBU+ZrAUDEM1QpGuzwlSXzpMmFCsQoQ7IYQ3?=
 =?us-ascii?Q?qYbcydDg3x5XnZ6ukeG02iPCeTwrnhNXF7Kn35hlbzY623P443QXUPg4mumv?=
 =?us-ascii?Q?GXGlv3S4dcdtSl5gMUwF1ZcKH7CpvriLbg97CxoFdXOY3B5dbIrh9c8ZpxXU?=
 =?us-ascii?Q?+OJnvVxe8eR58WlDJPBZe9h4+CvqRIUW4OODPOiUBcdUgKszyfUYFojUGiZc?=
 =?us-ascii?Q?i+GTFaEs3UU6gs85PI/imq8HQJBgKnUg1nVH7c+0LHlrh8qWdoJVvdtIIOb6?=
 =?us-ascii?Q?qiQ0FcNgY8pqxqzIYMmJzlc6JbQNPkNO+VEyItGB0tO8AREJ8vC0KSoqeSui?=
 =?us-ascii?Q?j+ZPXdc45FuRzqHcjLUlQqBomeBb/KYbtomVvywm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15090d3d-2fcd-4604-7f6a-08dc36eef3fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 17:18:30.6098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: REQaLNdWW7npNl0lGm95MGxgJzOkIwAHwwtw8tGdFEiu7M3OkUrwANZbSnquWPcnCfcuSefJyTvyQw3WIya9uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8032
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

On Sat, Feb 24, 2024 at 12:24:14PM +0530, Manivannan Sadhasivam wrote:
> The PCIe link can go to LINK_DOWN state in one of the following scenarios:
> 
> 1. Fundamental (PERST#)/hot/warm reset
> 2. Link transition from L2/L3 to L0

From L0 to L2/l3

> 
> In those cases, LINK_DOWN causes some non-sticky DWC registers to loose the
> state (like REBAR, PTM_CAP etc...). So the drivers need to reinitialize
> them to function properly once the link comes back again.
> 
> This is not a problem for drivers supporting PERST# IRQ, since they can
> reinitialize the registers in the PERST# IRQ callback. But for the drivers
> not supporting PERST#, there is no way they can reinitialize the registers
> other than relying on LINK_DOWN IRQ received when the link goes down. So
> let's add a DWC generic API dw_pcie_ep_linkdown() that reinitializes the
> non-sticky registers and also notifies the EPF drivers about link going
> down.
> 
> This API can also be used by the drivers supporting PERST# to handle the
> scenario (2) mentioned above.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 111 ++++++++++++++----------
>  drivers/pci/controller/dwc/pcie-designware.h    |   5 ++
>  2 files changed, 72 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 278bdc9b2269..fed4c2936c78 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -14,14 +14,6 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> -void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> -{
> -	struct pci_epc *epc = ep->epc;
> -
> -	pci_epc_linkup(epc);
> -}
> -EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> -

No sure why git remove this block and add these back.


>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -603,19 +595,56 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  	return 0;
>  }
>  
> +static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
> +{
> +	unsigned int offset, ptm_cap_base;
> +	unsigned int nbars;
> +	u32 reg, i;
> +
> +	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> +	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	if (offset) {
> +		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> +		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> +			PCI_REBAR_CTRL_NBAR_SHIFT;
> +
> +		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> +			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> +	}
> +
> +	/*
> +	 * PTM responder capability can be disabled only after disabling
> +	 * PTM root capability.
> +	 */
> +	if (ptm_cap_base) {
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> +		reg &= ~PCI_PTM_CAP_ROOT;
> +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> +
> +		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> +		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> +		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +	}
> +
> +	dw_pcie_setup(pci);
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dw_pcie_ep_func *ep_func;
>  	struct device *dev = pci->dev;
>  	struct pci_epc *epc = ep->epc;
> -	unsigned int offset, ptm_cap_base;
> -	unsigned int nbars;
>  	u8 hdr_type;
>  	u8 func_no;
> -	int i, ret;
>  	void *addr;
> -	u32 reg;
> +	int ret;
>  
>  	hdr_type = dw_pcie_readb_dbi(pci, PCI_HEADER_TYPE) &
>  		   PCI_HEADER_TYPE_MASK;
> @@ -678,38 +707,7 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	if (ep->ops->init)
>  		ep->ops->init(ep);
>  
> -	offset = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_REBAR);
> -	ptm_cap_base = dw_pcie_ep_find_ext_capability(pci, PCI_EXT_CAP_ID_PTM);
> -
> -	dw_pcie_dbi_ro_wr_en(pci);
> -
> -	if (offset) {
> -		reg = dw_pcie_readl_dbi(pci, offset + PCI_REBAR_CTRL);
> -		nbars = (reg & PCI_REBAR_CTRL_NBAR_MASK) >>
> -			PCI_REBAR_CTRL_NBAR_SHIFT;
> -
> -		for (i = 0; i < nbars; i++, offset += PCI_REBAR_CTRL)
> -			dw_pcie_writel_dbi(pci, offset + PCI_REBAR_CAP, 0x0);
> -	}
> -
> -	/*
> -	 * PTM responder capability can be disabled only after disabling
> -	 * PTM root capability.
> -	 */
> -	if (ptm_cap_base) {
> -		dw_pcie_dbi_ro_wr_en(pci);
> -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> -		reg &= ~PCI_PTM_CAP_ROOT;
> -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> -
> -		reg = dw_pcie_readl_dbi(pci, ptm_cap_base + PCI_PTM_CAP);
> -		reg &= ~(PCI_PTM_CAP_RES | PCI_PTM_GRANULARITY_MASK);
> -		dw_pcie_writel_dbi(pci, ptm_cap_base + PCI_PTM_CAP, reg);
> -		dw_pcie_dbi_ro_wr_dis(pci);
> -	}
> -
> -	dw_pcie_setup(pci);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> +	dw_pcie_ep_init_non_sticky_registers(pci);
>  
>  	return 0;
>  
> @@ -720,6 +718,31 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
>  
> +void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
> +{
> +	struct pci_epc *epc = ep->epc;
> +
> +	pci_epc_linkup(epc);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
> +
> +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> +	struct pci_epc *epc = ep->epc;
> +
> +	/*
> +	 * Initialize the non-sticky DWC registers as they would've reset post
> +	 * LINK_DOWN. This is specifically needed for drivers not supporting
> +	 * PERST# as they have no way to reinitialize the registers before the
> +	 * link comes back again.
> +	 */
> +	dw_pcie_ep_init_non_sticky_registers(pci);
> +
> +	pci_epc_linkdown(epc);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
> +
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	int ret;
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f8e5431a207b..152969545b0a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -668,6 +668,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
>  
>  #ifdef CONFIG_PCIE_DW_EP
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
> +void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> @@ -688,6 +689,10 @@ static inline void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  {
>  }
>  
> +static inline void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
> +{
> +}
> +
>  static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	return 0;
> 
> -- 
> 2.25.1
> 
