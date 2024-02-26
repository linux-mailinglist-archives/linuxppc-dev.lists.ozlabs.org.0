Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E83F9867D25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:00:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BQXNqjLC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6LK5PRXz3vj9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=BQXNqjLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::600; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6KY07Nnz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 03:59:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XQC1BiONsbiIYgKbj8tQy5vekQ39D8rkTvHsYDKPvkH1B2VpN5VPaHh0wX3iCLBJd7ILWPB5JnAbMKoeGs5B3v6AzLCO2rllf+e4MX7cr1o8c9mU0dPcrav5p7xIvI4mled1qN/pUZm1pRl0USqDZiPFUWcnrROBlc7FtEbOaYoO0/4nAwsKK/DS03PY5jufAHrotql0CxCEeifb4/T8cPZIA7VUEHFH8ysVfZGdZlDxTxAB5nU14zyNESX+MiaHWYvEJAsv91AaI+15F6ogM+ducgOw5DxgUqktwAonvSsXxzMwJx3YVYdA1y4/mI3iF7SAx8KSEv/UinLvQpOsdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RxnYoO6KlKEWzfj5f/hxd6meXhnIb0JaVQ0DTNRBz0E=;
 b=i+wtkTyhoC3xsEvKGt+a4k+oqA+ghCtXamPUqMn4wJj1sWDmNI/78gj8HIPD7mtDKaArmKF6vn0eRhdsjQdrNxnqM98wOCk/4RaS1XgA2C7cVa+mPB7lfeHIxPIKzezj5Fp5gXZ2sJA1lmRU3O099TqI1/SIf05yLylDOk067bUj8GB3yquEGv6y4vPTutQRujWrLdsi5rVLNouPjk/0z01ZyG+OVpcC0B5D7L6BY7rPyh8b3l/PDXY52xQA3L314tPS7V4f4mxcQJ9oWOr1hk88bmsyeLPUygXB8aCCPLC7j5dDdEpBpvfF4ffTHk4iWT9cs9ZltWkrOEe2nqoUyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RxnYoO6KlKEWzfj5f/hxd6meXhnIb0JaVQ0DTNRBz0E=;
 b=BQXNqjLC061hvL+stn8QElu19ZPCZEhtR9iVk5Po2sNI5rTPKXGZlSImsNwdCmrglNkOAFBwvPr3BghQdDwbl1F69VUST1Fcjm4q057yVKlSqbzjDtUFm0O6atq+4KiEqzezqdzvBoCHCVNn37x8k8vIEIH8uwKnj6MNFdCUNfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7867.eurprd04.prod.outlook.com (2603:10a6:10:1e5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.31; Mon, 26 Feb
 2024 16:59:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 16:59:09 +0000
Date: Mon, 26 Feb 2024 11:58:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 05/10] PCI: dwc: ep: Rename dw_pcie_ep_init_complete()
 to dw_pcie_ep_init_registers()
Message-ID: <ZdzDUq8vWUTnoHnd@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-5-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-5-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7867:EE_
X-MS-Office365-Filtering-Correlation-Id: c1336876-c741-4897-abfa-08dc36ec4043
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	lECJoM4lDQaxlNkQTuxADwUO3YRl7GTmsRW+jS1cC3Ec3wX0tn9VEYtByKKkJdb7WRcrT+2UR9GzbcobaZjUUR4cwSf3iOiEiNUf8TYDfy+w+H0SArW4CxZx3ERtxJjnVzi2/C2RCYSt9LAmt/hyo0dhKznKdugG8Iw0oor7K1es4GaqVSP/1+aj/UktIL5WN/DAm/pLnStUAIWonsuafKH36e+bQa0arnOGHpbX99b87d3QqzFTFm/Inzt8+XJP4wwW/tvOgC5XzFmSniJNdjMb3m9MWwlKq/DSC0y3RcqGTsrd4vlUN1A+1m74HJF9UhooI2D3+too1n85UkGdrtFz3uDJ03IAOQJqdj3mwK61TkrkH/uUyrrF+yfW9lYU9XyIakY32hDRzDTdpemw0smUhkqxbaF0ZuSD0SCNdDgkeTVuuboKroVsX711DRq85S8oVZuTLLuyMqFcd8qPR6onnyXbVw2J2duw4UUkkvqrSF1VH1q7Ys0W0TXFyLeVgBt4WjCMupUcPDQpC7SeoFDT8GcV54eE8YOpDDTEzhy9MoFZReWc3yxGH+1nEM+gcyGByesU5nwga2aMpoP8BQDhM/rUsbN4QK6m4efjJ630CQtzkoxx4woUPVCWwf5bWfaho/jp5H/Dxi3mOjwNcznNgHlKNbT8O31ygjnmJHBFejaQoUB0MtAopFgfPxleEI68tvActuFfDnqU+3GZs3H90uQABXV3Q51miS9Nu3I=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?k7uWCshUUwsT+lM871dGjnuvMOYM2f+Gblr1Avt9fY8ZaQE66k4o3Wz8Bei0?=
 =?us-ascii?Q?fHRJg4ygePvW6R8/gfhZZW46AnnQ9BDrajyq4o8FDDoYYS4MHJydw6XXsrr+?=
 =?us-ascii?Q?rADYVkguh/ikWrtdpIKB5ZDgIaaqXh8G7VKfwnCgIGGTmnuJMBz42mRw6+wj?=
 =?us-ascii?Q?Ahusy7XY6ed1EerCpKnmFK2jIEcNv+mDWZGjIxFK2BFQAkhwyQ7p0rswwdbN?=
 =?us-ascii?Q?Z5LGk1kzr3xAEYG5qZ+qUXH1A3lyUh2by+CTCtkkg/pe0QRpMQKCXChv1te6?=
 =?us-ascii?Q?jvi68rSPLtNnLj6OH5Fh8bB0UeKECm7ylnkfm1M09fXdgjtpk82wzugNRfOk?=
 =?us-ascii?Q?LK5g/4JdlVuae8lPQkowTo8KaDcEJVf//orwiCFhdRRyc/0f8vObhZ1xmuEM?=
 =?us-ascii?Q?q4q77XklJlyTStBMZFvBks+7mN6f7SIGpjRkWQ54Jdv8U3G9QpWOTX9Yo6th?=
 =?us-ascii?Q?A8D6OWGTC+2RZZkDm4NK1OT12LUKYGEUgD7kMfy8wTwA2Iyc3DHLG0L0wiKJ?=
 =?us-ascii?Q?Xg4Rjn2H1XVMZWMONPSL5wQ9M2aExqr4i/zpdz9RH6dBjltTWZeOOQOtcW/S?=
 =?us-ascii?Q?9CpaCEs7Tf/lbJW6XAcQpX3HFpkQQszqZc1lerXi900djck3OqJw/uZ+QY7E?=
 =?us-ascii?Q?0wdMye+cqws62aHty3cggyDZdo8sV0uwj2g7pWUcdtm/zi5fi4pCELBWStnX?=
 =?us-ascii?Q?9vQTLiQLHEXa/jPSBq4kYB+zz3ukcDLT4bC6nqgy4FLqZNc6kxVwCounnynu?=
 =?us-ascii?Q?jzzy5DgXJAfnbNJgwE3zYtjzN2KjUcz0XOJMjNBjqjMK2y6RDX7noRLxId6N?=
 =?us-ascii?Q?+savGe1dGiOyDsi6UgZWv50xYB7qDyzeCi+TsOp43Hc5M7tndqMQNg58AOTt?=
 =?us-ascii?Q?gz0usMP6dHadFU8KvFYPrh/dRE98xZ6FT8ILJisBJSRuAfkuOzckO4TEHjLD?=
 =?us-ascii?Q?zepmFDLe9rsSdmchby1EWXCrGfofjBDbFV5EwDbvIhoFOwiQWqJATsDKhzmV?=
 =?us-ascii?Q?hA2XMTRDD3J0VZMik5tf6qaKwFJqh1yLvNl+2OPznATwyeWhq4AEiXl89Ijg?=
 =?us-ascii?Q?b8Qe+mRErrWRPyVjaPE+VB1v9XVXxeKDnIKYJpR6X6zMw9u1MIfiO3CRHDTC?=
 =?us-ascii?Q?7FhOktRijiINKE+rHSwjtDZZotsMrT8Nz5HvCCSQNojTagEgSHaphEK119s1?=
 =?us-ascii?Q?p9dHcUeXND9tv7R2/ipIJlaOr75NRrOhaHjuZoyCehn5AgeRHilrS9VYBit4?=
 =?us-ascii?Q?ih5M2w8NbvFNDHgT2kqJqzQv6JvZR5MlGjj3gwdSOK8F7+alwniwEDaLX2O5?=
 =?us-ascii?Q?Vc3wTwonJkPFvTJNtnbE61cKXmrkB5MrAjWqQHVIWaAEx9R7YbHItoRf02JA?=
 =?us-ascii?Q?gsGu5u0/EXCu8GStOhSnl7BYZChW1QFm+r6LWrbVbeXRqwHnKNdtM7C+N6vl?=
 =?us-ascii?Q?1u1kjxVbAgtBMWvdQx3w2kD3dhIST5/PeryYFpXRw3+fJV9pMGBrhGwtLpgv?=
 =?us-ascii?Q?sD3g2Gwa7EyV0waQqhwBbH+Tz93VDTbBvx9sqN7YgbcQdvyi1vBv82NsB5tI?=
 =?us-ascii?Q?1a8jWAxCWZw+YV8zM3Z4Ddp3ugnWqUzBQqc1HsJs?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1336876-c741-4897-abfa-08dc36ec4043
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:59:09.9246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6ba0TCFmi0oRbHexaowphp9Cm40fQ6z85CzdO2mLS1Oc5aUpqPZXCgUIYHAczA3YLY7llbg6gjHghrAB5EeAdg==
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

On Sat, Feb 24, 2024 at 12:24:11PM +0530, Manivannan Sadhasivam wrote:
> The goal of the dw_pcie_ep_init_complete() API is to initialize the DWC
> specific registers post registering the controller with the EP framework.
> 
> But the naming doesn't reflect its functionality and causes confusion. So,
> let's rename it to dw_pcie_ep_init_registers() to make it clear that it
> initializes the DWC specific registers.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 6 +++---
>  drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
>  drivers/pci/controller/dwc/pcie-qcom-ep.c       | 2 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c      | 2 +-
>  4 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 99d66b0fa59b..ed1f2afd830a 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -603,7 +603,7 @@ static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  	return 0;
>  }
>  
> -int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
> +int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct dw_pcie_ep_func *ep_func;
> @@ -718,7 +718,7 @@ int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(dw_pcie_ep_init_complete);
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
>  
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
> @@ -788,7 +788,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	 * (Ex: tegra194). Any hardware access on such platforms result
>  	 * in system hang.
>  	 */
> -	ret = dw_pcie_ep_init_complete(ep);
> +	ret = dw_pcie_ep_init_registers(ep);
>  	if (ret)
>  		goto err_free_epc_mem;
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 351d2fe3ea4d..f8e5431a207b 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -669,7 +669,7 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
>  #ifdef CONFIG_PCIE_DW_EP
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
> -int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
> +int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
> @@ -693,7 +693,7 @@ static inline int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	return 0;
>  }
>  
> -static inline int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep)
> +static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  {
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 59b1c0110288..3697b4a944cc 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -463,7 +463,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
>  	      PARF_INT_ALL_LINK_UP | PARF_INT_ALL_EDMA;
>  	writel_relaxed(val, pcie_ep->parf + PARF_INT_ALL_MASK);
>  
> -	ret = dw_pcie_ep_init_complete(&pcie_ep->pci.ep);
> +	ret = dw_pcie_ep_init_registers(&pcie_ep->pci.ep);
>  	if (ret) {
>  		dev_err(dev, "Failed to complete initialization: %d\n", ret);
>  		goto err_disable_resources;
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 68bfeed3429b..264ee76bf008 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1897,7 +1897,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
>  	val = (upper_32_bits(ep->msi_mem_phys) & MSIX_ADDR_MATCH_HIGH_OFF_MASK);
>  	dw_pcie_writel_dbi(pci, MSIX_ADDR_MATCH_HIGH_OFF, val);
>  
> -	ret = dw_pcie_ep_init_complete(ep);
> +	ret = dw_pcie_ep_init_registers(ep);
>  	if (ret) {
>  		dev_err(dev, "Failed to complete initialization: %d\n", ret);
>  		goto fail_init_complete;
> 
> -- 
> 2.25.1
> 
