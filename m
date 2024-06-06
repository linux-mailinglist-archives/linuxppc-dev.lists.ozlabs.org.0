Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65B8FF66D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 23:08:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=GIiSxaZ/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwH4154JBz3fpg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 07:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=GIiSxaZ/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwH3G0mvKz3dXT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 07:07:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lrOPyKH50RJzQJLuAHhhuGVReA07B0NbrSWHFVBWzz0bnWDMdHsC+9/5vBeixf5U3AwD1ALiUCJS9XqZiF/RBE4xRLK/WNM4viFXytlR3vhev/GSmlpNAfzHBQY56ipHwDMADnmxdLIZv5Lp2pz8tncIXKUmMewMfgW7sT4RwPqbkuGps7xJ2S9EUh4LRyGPjr66agyxuC+mNhPZSmPCdVprmhWEWQAi5Av+PchxWfCdShOwSBKPllkPMbqN+vIe2uNIXoHHHKMdljXPE1LTSjqFDrRfIVKwAGGmozRxC4l0U1rZF28T10xh7PJPnZRlXeCY5wuWQgCIW69Mhh2m1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwbQ3ZjvE9oY/cydrJJlnyx7xZ82kdvKtneakcCNQXo=;
 b=V3TbJItF4RmtzbYXxxQ1uor1sIfUOm/tIQsMzovczpjddDRBlVq1TqE8jl0fvBEGsTO/6T5+NqUJUmSY2aMPCCZmWDTvRFlzKjRU5jzn1DlenGV/8Bf6iy1BfW3QkEIwON23t2i7B1n1GrP6l2xgy3dunaEdK13MMMtl94qsbjeRkA3QOE/RODQ0kEV7l6uOrHstRfcpEa7hAo5MPRwO4x9RvrUcA2YJSCGGlpcoxs8mQ8EPJpSVbLnugkresb7aovcbY0k20DsNap20crYhj+fG6g7cYclSLrnuKU2lXPQpFDuBIAw2+aM7T4uhiDEXjGyJvA/K03m04nTJXf9KrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwbQ3ZjvE9oY/cydrJJlnyx7xZ82kdvKtneakcCNQXo=;
 b=GIiSxaZ/fiGcZaS/9S7t3e1uDjR50pIHit0ewp/lWo72LSPYhVFK2rVJnpNQoEJnobrhO/C5scFc6Y6dLqXnG2y8XP3S2ty9iZyJ2QywNbXn7Mo2CbUaaSIq1zyny+DFOvUCn85f+5CzReBkwBt7fc0qii+sZdg9u1DkdXw0FD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10208.eurprd04.prod.outlook.com (2603:10a6:102:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 21:07:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 21:07:09 +0000
Date: Thu, 6 Jun 2024 17:06:55 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 5/5] PCI: layerscape-ep: Use the generic
 dw_pcie_ep_linkdown() API to handle Link Down event
Message-ID: <ZmIk7zjzfiAENF3I@lizhi-Precision-Tower-5810>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-5-4395534520dc@linaro.org>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: 118840ea-47cf-43a8-8417-08dc866ca098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?JpLrNO/KpRUkJSUFbOB8bm4wY7SVAGrj+tvQf0WNTn4VydF5Jdx5bf+y2Zvz?=
 =?us-ascii?Q?4Yl8FHduixjncYVMcw7JlYJg71ryUMKRZnLB/80HegoBCDxvn2KDjuQ8KEyY?=
 =?us-ascii?Q?/n+/HTX1IgTsFZA6Lqft+79sQ4AqhanFqo3uzpPsg5RFDKHjYdQdiZsBF53l?=
 =?us-ascii?Q?m14G2DnXoE/0/ZK9XyBPUXY2tmyJb0rv7Adp7tH3jUTZJK2dlpp/wmr1H4Nl?=
 =?us-ascii?Q?0eK9XeoHicVSflDpl0IVzEt28yL2wUsoPcRaV/osmgvnTigonYqHRjmotBM9?=
 =?us-ascii?Q?bzxmFOyS23OWDJ8xGxR3EFQgCwHq48l6bKYvUZXpwIUpjgxRDQyaw7QK9X0J?=
 =?us-ascii?Q?vzbfA1t9yuBJp0+xfPacjtP8CZWdg8dvab76O9wR6dRPCPImOorDVQ4tjLzP?=
 =?us-ascii?Q?I0qmR6tv+PK4qsCQDx2mlMzL4hYWxCiJbgp+YaKCoHia7duXx8EY5imvbChU?=
 =?us-ascii?Q?zuTe52UkIJ3hYu7uryc1e/LjmQSCl4Twnrtg8unB9t/QyAuDdsWhV2n/U+tG?=
 =?us-ascii?Q?o0BnTeuo7S6cds3hcGD2qiCsEw/6sLXrzJbV8n/qwmIIUWTW4IG0bPyiDGsq?=
 =?us-ascii?Q?uzRv45E05QaDsNuHG9xjfwy3e0YklmbXG8VbEh0FLsrTrO4kbpkC/2M5PK59?=
 =?us-ascii?Q?ytmkONHLcS13+1jfQY7TIuj+yZXBXRLrecQyMiaztT7Y7YjrOdHodbJgTi+x?=
 =?us-ascii?Q?KGZ+8P44hkellx5lKTWmoju6pFS3CKb5Ni3Y2tsdWNRoB+YJT6XEqaPGrepU?=
 =?us-ascii?Q?HEWmnUCnuba86n4S+UC+FinmtCximpSknH1kyB+WCFQQaHchOGlb2DhqDDGc?=
 =?us-ascii?Q?1Q9+Qk5/1we0Jhtqdht3Ie0R7DhWIbMHJmBilBG7oQZ0s8KoSJyYEjNUWTFg?=
 =?us-ascii?Q?7wbV4W4fOx0sKAlJy+eoBrY04I932ezlI1udl89P1vmAMHnSs8tGOxcQpFVT?=
 =?us-ascii?Q?7BpEbJz7GaHulJSVJFEuBhdjh2/1w/7D0v4AMOXM49qRY29XeB3szIGIeGeJ?=
 =?us-ascii?Q?aVnFYY7rS7WFYgWkM/5/Q0iFJiLzVY78Xo/McrhzapqmyK/NUTSvNnE0+tLu?=
 =?us-ascii?Q?IO5irYe11F0g6h6SWhjkqwog36S9zaZ4uhU93rz1T0Anp3P3NpaLJnNhi64o?=
 =?us-ascii?Q?7VitqhfuVu4BsBb1zFeiS4HNDBnLQ0zSQ+iWwZx5fQOjlCV9aObTjFTmsF/v?=
 =?us-ascii?Q?zTo/aGHNKb667brxNj/4Gbss1DGbFyjqzsPMtQk9+Ih8WQ9cUZM2tK4YOxq/?=
 =?us-ascii?Q?HCIR+qbPkO59GPgrewBCw7FGp9VIF0uINXrPHm78kHfFT7JdUTtUPNjg7dzy?=
 =?us-ascii?Q?8PaJCPI3soAoJQj+zrvNeHovM9DvPM3+NmTQXaGYgFmIwUONgh3ikUaYiP9S?=
 =?us-ascii?Q?EOdw9q0=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fX8zybbuRxMqhwZelzXLXGsKE/Pb7DmFUhbXL9WEBRJ6pzHoTJRQZYs1xhCe?=
 =?us-ascii?Q?rR4y9Wgs/0WLtCSi+I1EoFZcpAQyjbnkhPBEq6o29nbIJpT34b0aPIy6IVsI?=
 =?us-ascii?Q?4YshyhnfhJ7+zZcIniLdzafNn217y3jdgyUKWm81IE3D6+d0Krqzzi0zqRTh?=
 =?us-ascii?Q?1auULzHnn7HuD/jZqOPDYPIXUTgH9UtBZ/3eFqNMGk7BopJMXY0xusmyKHzU?=
 =?us-ascii?Q?M28enIQGfRUn79pEFVsu3ycrIo2tnhJm6/Me1JGPOuHqdSV/t5TC7E8aOLNL?=
 =?us-ascii?Q?yfdGtEWLZ8IN1ENa5Tp/3AHtFZhVrs3fJBQaXaQqofu0RREozBq48L1dlswi?=
 =?us-ascii?Q?rw5JtFFdtAKWSO60+GsIAbaa1dwGEUb5JB/hDdjifbtCyJ9vC9EVRiUaLqnp?=
 =?us-ascii?Q?4LoD3oCwqoR9kQYiUjGsNoPqB28S5HvaGcQ8E80o0i7169gYC4T8C0T8Vy8Z?=
 =?us-ascii?Q?rg8DBr1zSrBE1rvZYuXTjrr+9aBK5ioTthJG/WWx+U13aXyeLirGZ3KPFGTx?=
 =?us-ascii?Q?8SXJG5mAQSIkPtwCDFW6MyaoT0jKv3LcJUS1UHRwDNsBev0wWI6KxMkTIOwn?=
 =?us-ascii?Q?w7qoFaCciNNTNEOSo2GYM8hSl4ecCnmiKhmKFTS43L7r3vJned+dn80xIB7z?=
 =?us-ascii?Q?OFu0IzqCDUjrb6Q+rkE+ouui2kmjxRs9nZ1ywmZcg6WBRagj9sRTZhXQM+Vc?=
 =?us-ascii?Q?FC2qJiDdUfEiHTMg36WOPZPdPa6ifz5lcIdBwQ61qi5H2b3KuTGBiqh7fihQ?=
 =?us-ascii?Q?DIOskOHbunonrpCHPgv8jbsAWLo9sQBQsluKLxzc/N2f8WvuF0SinOwqO1fq?=
 =?us-ascii?Q?+p420qzAq8E12YAUXgGnkkRZKjaDOKxM2A8fubC+Xcauq0fYdl+Zvy4FQiqH?=
 =?us-ascii?Q?904Tykk2mhT9bZXjvmuRJGpdHYlkz/5S02z3zaWqTsK2PQ6iGiuChKgT/uB4?=
 =?us-ascii?Q?qexw1Gp54DJRme/Iptr2agxA+A7vD3d+Nv14Zv5zD+RxVA3EjY9ALENQWjxK?=
 =?us-ascii?Q?06TywWy9zYq3gnnyYWfo2xSWO3Sc1NavURpuOw3yUEw0W/68bfCgOVQ5N966?=
 =?us-ascii?Q?O0/G09D3M/NR+IVMC4689hkamP5/mRKeAOH+57syBQH0eDgsgG0MShpDbAP6?=
 =?us-ascii?Q?IWp+HS0P3Pr1iu7KiK6J1ruTTXkdvSm5gdK09luh+ip3/WT17sx5NSlkbjR+?=
 =?us-ascii?Q?dy38SLcv00iCN+kYsU4FiJtbbH/q9zNRAeVTm9F076sJOoA4QyUTBm81Otno?=
 =?us-ascii?Q?mCHocPNDFFbX2zEexjHwDBhwtNapWkQ4xD/kowT5bQlA2wJazhgVTO0YQiJi?=
 =?us-ascii?Q?TxCrGzhXZl3G+uNLXJsMKEKNB8MQoWJ4A0VtaUbKpQ5bNvO3kG2zEDECKcJm?=
 =?us-ascii?Q?bnXxlcXB3zUJ5XVzdEMZv7IWwhf58t/IQvBlWSSnuQARr8wLeUaTDXZ4liRZ?=
 =?us-ascii?Q?mYRfC8xNUDmr48wQQp6YaTQ2rj4X/PjiToor80UgGg0eWxWJPFFvKVnToeOx?=
 =?us-ascii?Q?VOQF/UMdXQ5hzlcnK+yGzyf9bUVr1O5fnsO7U2wkrT0PVqog046H+eIi0f18?=
 =?us-ascii?Q?lWIsTJ0snT0x1+QZPLQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 118840ea-47cf-43a8-8417-08dc866ca098
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:07:09.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Svn2v8m8EN0GvgcgqCiLvPxbV0oaTGuc2IgLz0oPQIFOIu1HBvZl3BkBr3Hk4BQo7y80bKK7aX1gl7nn2XdvEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10208
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Vignesh Raghavendra <vigneshr@ti.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, imx@lists.linux.dev, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Jesper Nilsson <jesper.nilsson@axis.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@axis.com, Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org, Siddharth Vadapalli <s-vadapalli@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, Srikanth Thokala <srikanth.thokala@intel.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>, linux-omap@vger.kernel.org, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, linux-kernel@vger.kernel.org, mhi@lists.linux.dev, linux-renesas-soc@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 06, 2024 at 12:56:38PM +0530, Manivannan Sadhasivam wrote:
> Now that the API is available, let's make use of it. It also handles the
> reinitialization of DWC non-sticky registers in addition to sending the
> notification to EPF drivers.
> 
> Reported-by: Bjorn Helgaas <helgaas@kernel.org>
> Closes: https://lore.kernel.org/linux-pci/20240528195539.GA458945@bhelgaas/
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 35bb481564c7..a4a800699f89 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -104,7 +104,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		dev_dbg(pci->dev, "Link up\n");
>  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
>  		dev_dbg(pci->dev, "Link down\n");
> -		pci_epc_linkdown(pci->ep.epc);
> +		dw_pcie_ep_linkdown(&pci->ep);
>  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
>  		dev_dbg(pci->dev, "Hot reset\n");
>  	}
> 
> -- 
> 2.25.1
> 
