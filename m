Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4634867CD3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 17:54:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nYIT8cSv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6D03B2Vz3vgQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 03:54:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nYIT8cSv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6C91Vgdz3vXk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:53:56 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7KM+2rMgFd1yKQK4k4BKHi6gyLWDVLqVtOipCYT9+/CxOWzYUb4v4wt6F5JmENSRtQcEBKHUJi+wFFgalfIzWdVEuvscouzdKQLUokQZzHV01KKh8wzK/HVG1vx4onOEZ+QrF7OZc3ncIEkbTfx9ZDNnqAUoiJy1FR6CJzcz1LI0ECdEN/+FYpU3IurDvHT2F2UDacPZRRmYVEnbMnh8v7ITdPhg++c5S0HRLD8R0FL9vbFJBhd1feTGj3RVQ9kQAAZ0T9QIgGhGYz6ggK7PZWCug6GCLYj95FuLmDW+rVGzL9ILFWH4Q835ssjgAIrQbcXUqlsowLTmHJ/ZzVakg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DkoCRbvidKcvmQerzKbNMVC3/VjYmKwc7BRr0Nmdg8=;
 b=dp8UJ3mYcsZdDwKY8thK9eGR86iisBKZ49z6ue4glZxFqp6Ykwu+Ga9nGqsBFl1+ySSAOkvpQ4Pnu/Li8Hd8L/75BMehmpCAiVBfwO7E53k4MiLD1jShXkBRyK5HKfUiEdJ3LSD1wBOvKsr8DVnd2TxVIWKl0irEZYnybBrdACVhI1ct4UK897g6wgcAVGho796w1llxz1EQa2WtLl4rshyp0zW8YGwQkESaMs4BTeJJrXNqDcL2F18yGlCwuqh+eaTrmo86cVTinE6WERo85DO7kDvdnJ/GlH8iFJQGyQxckb5XgkX4WsUavX8p6Yr6OPx5XV3w9uMzWU36bcep0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DkoCRbvidKcvmQerzKbNMVC3/VjYmKwc7BRr0Nmdg8=;
 b=nYIT8cSvINrokQ2PaojL0kEFbuHbLUAQi2rzFZC3axGB+ak6rY+x8Bg1hwLc7yBm5HDWvsuQaKjTseHsN0YI8jlg5qS7ZYp8qc9PYIj6xTXjXGjM36o3WVfBCfeAJncpR0LYNbNzhnaeOCunT1+Nh14b+viBI4EnShEizJvGc3U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Mon, 26 Feb
 2024 16:53:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 16:53:36 +0000
Date: Mon, 26 Feb 2024 11:53:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup()
 API for drivers supporting PERST#
Message-ID: <ZdzCA262QssACk7+@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: 65731e56-445d-40cf-b62f-08dc36eb795c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mhOGL6D6FUFBSfcOtoPEvi3zJYBbn8+Fe+6KmJ43MFBX32K3OrOsueRXCi6vamWrl+XmNs5rnQQSopjt5oXHE7vWdTMNNqmQ8zx6n4W6W5NLR/svfckToLFaKeHXCp1PLylSas2NzYKHCct8Eg6WNrhpfgWsuyRzQyzdjQKYKintc1aF4xfyPeF+MX6XiFkiSZq6cFIM4s+ZbNpOF/V9D4b5Li1qO8lQwT8NPLuHIQFettrQJRZCdwRTnPt9aIffiNVt9TDDe3YFzy6h7V9qtsneFW1Gtq9LUnFP0B26rLXbtjrks8UjlXsYevRuoGtYzOhpGxLZh9tBaB8pvTCTFzmb8Y0g0U22mMEZztVddRxWGTEPPj/oJkE/eHAhBgVpOq/zlJ2RKiVGSVyd7Ei7LT0GerZUniCposyi3ttYvgAvd+lQKVuCSWlqUjhoYm0DdTv3SdwxL3jNLRwsM/p+T/x4337ooYmh+Gd1ruRnc9tbDvPx0KeumNuiSbeIxJosv/PqSaxcYivdPtBVvNaFeUPQ/Mvpu68HHLP+1Obk1T7Xf5ROOw6g0F5f4pjgSd4mTTLAfuxzJ2XMW0ir1M1oU4R+DJMTKcXvuz+0XPxSLpiSejfwbKWYkxZNV8VpK2sacp6Ou0E7AQ/vG+oGi4VrxsNOTVY6LfhyIjl4nVLAkiIZ7KlUCzHAvtenZ0hKdbSvhlebFqJZEZhpAvkY3Mvysw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TiOammgPzRweGYingOgx4yXymRKsT3gBR4yNBfmYIwKJsHorNIEL/uRJ9CWw?=
 =?us-ascii?Q?xCnfl+QXKly3B6JWDEPRjTgau1w7UZBwAQq+D2XJg1IbT4YjBNQtNZVEUPaU?=
 =?us-ascii?Q?z+xu+ZTrP9aD/o23lIgUfa8YEgo9CYQmEpSmqPxrdHAIW9pZ/FvQNGn5O8zi?=
 =?us-ascii?Q?FGdpDK/I4BeTe5eu9pmhimbbbwzhXC0+SoGeeUbBNsYaFQH8/+boVyboRoMe?=
 =?us-ascii?Q?v1h2tFCe9X420QP1IlKm2e2GGHcrknvl3+yDE2GQV1AyMCnC8+3xnf+xOY2z?=
 =?us-ascii?Q?KjUE5lmW97YXeT4IK//UTLSnlBD//zDH53oKqdm6Rdr1cFfQPKYIQB2VJkmG?=
 =?us-ascii?Q?2wXKgH6McCLi2g0y/WSaWqT/Xs15/aSAa2+dPzxH5bZp3EoIRD7bMR1IV0Hr?=
 =?us-ascii?Q?e+xihS4eVgS2z7ubDXM22tAIcJo50D5G+5CmLDQo5yiOaNn77vU5wVq1DZ6v?=
 =?us-ascii?Q?UugH4SkiPBrdJRHC+aLjEXG1ZqqdNZFN4PRb2avibp78/JJm0+PL/h1M6vF3?=
 =?us-ascii?Q?S6bhyJVNdZ2YRpFnHKwjIQtCfV8TfJzlPN7xl7IB+xmFxOlZ+BVYPPQY64WA?=
 =?us-ascii?Q?7D4EW8auqYIIIpGO8misKh0HqLt4J1ulVLfVNBXCNXXGsfoVCh7FzsSAIYs8?=
 =?us-ascii?Q?8/e3JwDI2oJ20sXbCmploi/zyB/LVWnphsDrKgm0Gpgwf9lKM2Rj2kZzACqw?=
 =?us-ascii?Q?snU4qXnmMyGXPuohblyB45xVl0Omqdd6LOBZDJtZ3aMhZgEXLwWrAlVaoO3h?=
 =?us-ascii?Q?n4/yA/zpBIA1SOYMSELbpDTp2z+DM4sP2TBfMybbDKlm7BI0Iib0Pv4jum5h?=
 =?us-ascii?Q?b/XIzQWbnItXsY35oWjQL1V7cwE3wJ4IYjVo0WO+Vqb4GqS60zaq3rlCwPgc?=
 =?us-ascii?Q?Kc3E3TD8XjLPmRF3jv4b/2vMDUiaJ+AgVpNuRep/tJU8EvLBRyRMvBVeSwTi?=
 =?us-ascii?Q?awSwsXCKKzVz4JkNCnxSKp460HrrQUdjs057/nDCO/8CDTTnmaMFPyWSQz0Y?=
 =?us-ascii?Q?yhbTMY8xFCOdzOqvVZpjWIMVFlRpanYFIGLmNzUTJQV8y+OWfSCFD0tB8/i+?=
 =?us-ascii?Q?rcRC4+X2ImQBzrL6odT8ZVrZsjoJH7un/aSI6BsDS4sKbSww57b8qsjhYsQe?=
 =?us-ascii?Q?kl7Gx0LLynWGdP8W4pUtcoXopjcenCluwZV55LsMn00si29Daa7ot5+doPHE?=
 =?us-ascii?Q?3mnivY8BQFHzAFK2XKjmcrkDqK7cwwfjpX6qqBnSo0C4OvL+fJ6czx+7pcfW?=
 =?us-ascii?Q?LuB9cONxOGPYT61CDT6pmHrODa/LUqGNBD+NPyJXjyimzmlrJnhblMuY3nZa?=
 =?us-ascii?Q?cL4iXgR2LtdFy4/Cn9WWHSeVz1HyqCzQXz4wy3iHfuAEr3YIDDTFXs0z1eoo?=
 =?us-ascii?Q?i4XMfaFp2gAdidgNPkQdBdMwSwZxmTtAVV1E/KyR0CbQOZM2BxDZVHoSqugj?=
 =?us-ascii?Q?OC4ytrHJOceWNRFPsbtf0bU1VJcGQNqjVruL6ViRBDjxqH3OJzJg1Je0N+AO?=
 =?us-ascii?Q?CPFT50H6lxDCiIu4h1b+hwLZvob1+j+qbDb9zKP1FNwcJqVhmSPctZjh67SY?=
 =?us-ascii?Q?wphA3fXWHqCV2NwozzU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65731e56-445d-40cf-b62f-08dc36eb795c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:53:36.2196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8SlVvmA0qDpNjWzdNn5PU4keeywoAnkRK7d7yk+ytLUEtqyGCxTKmgXvJPzm8gTAcjuw+lBAe6+13aa0/7INQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7867
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

On Sat, Feb 24, 2024 at 12:24:09PM +0530, Manivannan Sadhasivam wrote:
> For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
> of the DWC resources like eDMA should be cleaned up during the PERST#
> assert time.
> 
> So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
> drivers to cleanup the DWC specific resources. Currently, it just removes
> eDMA.
> 
> Reported-by: Niklas Cassel <cassel@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
>  drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
>  4 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2b11290aab4c..1205bfba8310 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> -void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> -	struct pci_epc *epc = ep->epc;
>  
>  	dw_pcie_edma_remove(pci);
> +}
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
> +
> +void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> +{
> +	struct pci_epc *epc = ep->epc;
> +
> +	dw_pcie_ep_cleanup(ep);
>  
>  	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
>  			      epc->mem->window.page_size);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 61465203bb60..351d2fe3ea4d 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -672,6 +672,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
> +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num);
> @@ -705,6 +706,10 @@ static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  }
>  
> +static inline void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
> +{
> +}
> +
>  static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	return 0;
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 36e5e80cd22f..59b1c0110288 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
>  		return;
>  	}
>  
> +	dw_pcie_ep_cleanup(&pci->ep);
>  	qcom_pcie_disable_resources(pcie_ep);
>  	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 7afa9e9aabe2..68bfeed3429b 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1715,6 +1715,8 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
>  	if (ret)
>  		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
>  
> +	dw_pcie_ep_cleanup(&pcie->pci.ep);
> +
>  	reset_control_assert(pcie->core_rst);
>  
>  	tegra_pcie_disable_phy(pcie);
> 
> -- 
> 2.25.1
> 
