Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F79867E31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:23:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ju41FPsq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6rs54LTz3vYb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:23:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ju41FPsq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2612::600; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2612::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6r75Lm0z2xPd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:22:31 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmN1PzcyKxjmVqoSagKGby86YmYheDPVLAqYo+YOyKwUDwkrmQL3qsgbp7IMgBnNrpogTwg92JY4FV8xMCiBcv01mfz62gc7h0gjFMuTjrrNRiL/U2mP123kwfzSQdrlnF/HaqKqDjBm7HxtliC8+sA/JrY/t1vAO7pdkhzJ8fNa9z2gG8CrOi8n3y/EvtqaRNolp58vaikO2ptJETENdhJvPSTq4c+CkZXAYFBMf9+mhj3tByQMnxShf8L97PC3sSwZKX4sLWdRJTNYKrZb6A12qhV5gzECzwcIVESvK5KvOElHW7jPutwMvqz1HxJZCsUoCrReu2prE0sXkxPxGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfDX1Cbt8721jRgx5yD3L/XZ3IW87b0Rj5sOby8pE1A=;
 b=mZTy8CumcQu/2MyG79kKaiGlIUWiNaszF8eTofuwTDtvkLbbVNRiPvF5rsnTiBZsCcWqK23Cgi6dCMRxjipyf4jIDj5NWdPRPS7ns7wGw5eGzYzFOvcIygTHXG2hCIJAfPp8PcT4xGgiZPv70bzwC1IK+QoSiBoJyO6mJDEmkNvXru/rohFdyuJlVRcgxFMatcBYWy/jO66OQNCOshZMD3MhSf8NJw/vJpNJYUp0F5UAycirx+HOAGPsZbT+nMsbauiJvSghiqvrz8iA/X2OL1wHQwN0UgeRT0FiQZFGt14+B1t8wHwg1oWbz3iEFBtG5EG6Wq8RKuYM7GuBGfi25A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfDX1Cbt8721jRgx5yD3L/XZ3IW87b0Rj5sOby8pE1A=;
 b=ju41FPsqxiq9MrbjXLjaa+Lab4ggn72AbaL7VPhAV1nw6UxOz1UIptE/Z3Ul0i7/8rR1z3krfFb88x4zgQh1tL9dqf1HmznMco5/VyXrTiIYNMbGObtmV8rwLRC1hIQOu0LcIxZQAGqDQNAJyglLDZue5Q3nToS4sxVv2lJxUq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB8032.eurprd04.prod.outlook.com (2603:10a6:102:ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 17:22:11 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 17:22:11 +0000
Date: Mon, 26 Feb 2024 12:21:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 10/10] PCI: dwc: ep: Add Kernel-doc comments for APIs
Message-ID: <ZdzIt8aqogaoW22Y@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-10-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BYAPR21CA0004.namprd21.prod.outlook.com
 (2603:10b6:a03:114::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: afb1a931-4667-40e2-d5fc-08dc36ef77de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	r1B56Cm/QPCi/CAMl4C3WTfEJIbcnE9szgjFw1iCgXR+CPBNMcj6h83GEaLrtIy5dbD4poJdikOBkF4AqpqWOfptpUpgc2TZNiRAvP6N5HsNM1qzECvElL/05vlGP+IHSqayZuMj7LHEUcMgURO/82DdnwzFkoJ8o6+9w+kmPJFzPFZryih+Sd9p7pWBWMLFjFRkXNal0EgTea3gzN8zXvjONprotVQJ3McSqLi4VjpMDVnOX1/9PM+hUG9Jf+eM9BiuWgOmPfumI1oSLA7cM5UTJ3rZOPLv0VbL3FsCtt1sptZ4qoeUAOtY4v23ih4sn+qda6AreCMG/PJG4+Oo9nw2ugcG+4hnsVSitSLiuF/pk9BjGqa+yNocRXGiSDaQHvNbtGg2jazFgzUxiSF12NAkPsga8qI7cNlATgFh1TwbQb+2QDchJXrdkyl9SQ1pkvtuec9GJYMFZM/mq8tPNATuyasrvvUaOh1/XSnbSYfdV569P4lSwULup1HldzrOxEftinU5ZwOFdl8cK+04ptVx6f7f24NiGn51xszBrk+0RxA4QnluRNDqV9dCIxxEcvKm1Z1p2fRIDvNqxOw59O14eAxVqqY2yfRUQBUHrWcRdRJokRnnqhTj+Zu441yAj1KXlM+kegFbkkFj5Kmirfyu32NlnwkfhihZUFDxVy2vArAy0OPwGrYx2GNdE9LnXUXbnpEOGTlnRWGVAoBxjA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?4EkRx0h2QDVyJW0jk5xLsgvFnKdqQp1FW8bxoskEIAlSPCBRQJ9mH7V+BQ87?=
 =?us-ascii?Q?e9i+j5Pnm910PbmxI4390yOzQOMRI9Ochj6x5Bn/PsSeyhLPDut83JolMHEg?=
 =?us-ascii?Q?lj3EHHrp7zK7UWuqvZn2MecBqSwGUaIqA7p9FeeNuHQ0qNdAMMStiF6G40zr?=
 =?us-ascii?Q?E3mJfJ4t89lJoWLAFNYLhDLROYwC6RItjnBN9kfX598TTpVDZWiTBTI/OObb?=
 =?us-ascii?Q?PofLYXRTSP623n8WZvt/Ne9FB410c4DpgmxoeOGafQI/0mEdHJGCCkrS9uWI?=
 =?us-ascii?Q?y+LCIH8q8Kx8T+tuozZ1kfWjoBnvdb9dLkJrhWyNxSXqEiBTFJX1jcufRsEI?=
 =?us-ascii?Q?hvERSLfD0eZK/Es3saVkvyGJwhw0JNL9j/oLy/rbvGc4gc8mSAqu9MoP0tkh?=
 =?us-ascii?Q?JC9Sla+tLIBV8n9wUqC7j+UF8jqxzYelHc2GPr5YNDX8oYJHtnvwfohopW4z?=
 =?us-ascii?Q?EZKM8Ba+DEln/AOrPSGac4QeQazg/06KNuK0GN1YbNdMRlck2tGjLoybEOe5?=
 =?us-ascii?Q?2wd1v2gvktgJ9vQuxgOoAYN+1gl3hTiKhv6KjD9nyZnYu0wpL8aDrLKaqh81?=
 =?us-ascii?Q?aF1p7t8fv0tQfr5pmmvFBFAZ1NangO7MJ0jqlzhfYL4yIG/g4kD+wg4EsjNX?=
 =?us-ascii?Q?A4zx8/lttovgHvDF2Uhj3LSJNwEW3MNUWfeUItb2dF/owVwfYrIKKcfQUhWJ?=
 =?us-ascii?Q?lbayPb3+ThAChQmHgDXk6eSApDxnJsizb8QB1oVe3jSZx1nigFz95r02/dQB?=
 =?us-ascii?Q?S4nQcnvLHix+5DKfM2GsjhOZEkH451N2M8qiqKuXq8PL6Fpy8MIBzAoyQXX7?=
 =?us-ascii?Q?K5DONb49hVz3NZMe86WFxYFt5S6D0gmB1mZrM6YPM0kSHj5JK5a+NNUErqQ5?=
 =?us-ascii?Q?loZFdPEqyBJNt3VkhdsFV1X5wQostZnTA9kjq5cwVR0+yeL5wVf4r3V4xn7n?=
 =?us-ascii?Q?NXVZ0PT+ombUg9L81Xs/RabLQHsGqXbN1x+P3VKQ/AlX5YIulA/jaXmR83Gk?=
 =?us-ascii?Q?o+yOw4bYU2hWpnyvbX/iHHWHTRbsdnsIlVxe3L9KrSiKNAGvZAMVE9VlvilA?=
 =?us-ascii?Q?O+fVkdsQCTX7kyfNLZVn0TRYaBxqxn4jApeMf9zYLJN39xgD7GwMu1SoYRQp?=
 =?us-ascii?Q?NnL9dbhjL5H3Br+OfNN63V1phv5s4zg9FKUjyXF66C9DnFY4u5geg50R3gDw?=
 =?us-ascii?Q?St5vOJTq/ZaJ/YiyS7sKCCdtzR9b4TxOBVsD9lIL3ldh0KgMGchNTwCeFw4v?=
 =?us-ascii?Q?gVO0H8drMMp8+ps06ESjoy5nPX69QRn4DAa6NYBbN4lX6zcJED6aUkt3pipQ?=
 =?us-ascii?Q?vn5KdUG9sPZqekw+hXVN0Y+CP+PYKEqnVJTWmhBnd3u9MMO2DtRux02ywubo?=
 =?us-ascii?Q?pIKp1JrlYPNYgDU/Vm3vmkV1hUPOAuq7h5Ujn898x/X3mjKFN/mOUAT39Soq?=
 =?us-ascii?Q?y8LceudKH4pklf1BO+hNw4hBLrYdNPP2saxPYDhVngOscQsLKWLcM9+sk4rQ?=
 =?us-ascii?Q?1sMsjEULxssBX0YvwABdNmEGDF2XucCtH9g/uepuNTRgfx4jZGDX1qtCkkGW?=
 =?us-ascii?Q?qO/hOTbl1UyWGygbMi+a2ZLDlL2ZkV/pwxbvQ8Ej?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afb1a931-4667-40e2-d5fc-08dc36ef77de
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 17:22:11.8313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uq6Y0kGoQtT0O+mgwXrnShRwO1YvxbFtD9DA/mx7+gxpARnHIfpr7gZvwfzUGXAlgqs6WpTroVEbrfZvT5GgZw==
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

On Sat, Feb 24, 2024 at 12:24:16PM +0530, Manivannan Sadhasivam wrote:
> All of the APIs are missing the Kernel-doc comments. Hence, add them.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 92 +++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index fed4c2936c78..cdcb33a279db 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -14,6 +14,11 @@
>  #include <linux/pci-epc.h>
>  #include <linux/pci-epf.h>
>  
> +/**
> + * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization
> + *			    complete
> + * @ep: DWC EP device
> + */
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -22,6 +27,14 @@ void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
>  
> +/**
> + * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
> + *				 the endpoint function
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + *
> + * Return: struct dw_pcie_ep_func if success, NULL otherwise.
> + */
>  struct dw_pcie_ep_func *
>  dw_pcie_ep_get_func_from_ep(struct dw_pcie_ep *ep, u8 func_no)
>  {
> @@ -52,6 +65,11 @@ static void __dw_pcie_ep_reset_bar(struct dw_pcie *pci, u8 func_no,
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  
> +/**
> + * dw_pcie_ep_reset_bar - Reset endpoint BAR
> + * @pci: DWC PCI device
> + * @bar: BAR number of the endpoint
> + */
>  void dw_pcie_ep_reset_bar(struct dw_pcie *pci, enum pci_barno bar)
>  {
>  	u8 func_no, funcs;
> @@ -431,6 +449,13 @@ static const struct pci_epc_ops epc_ops = {
>  	.get_features		= dw_pcie_ep_get_features,
>  };
>  
> +/**
> + * dw_pcie_ep_raise_intx_irq - Raise INTx IRQ to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint
> + *
> + * Return: 0 if success, errono otherwise.
> + */
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -442,6 +467,14 @@ int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_intx_irq);
>  
> +/**
> + * dw_pcie_ep_raise_msi_irq - Raise MSI IRQ to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errono otherwise.
> + */
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num)
>  {
> @@ -490,6 +523,15 @@ int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_raise_msi_irq);
>  
> +/**
> + * dw_pcie_ep_raise_msix_irq_doorbell - Raise MSIX to the host using Doorbell
> + *					method
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
>  				       u16 interrupt_num)
>  {
> @@ -509,6 +551,14 @@ int dw_pcie_ep_raise_msix_irq_doorbell(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_raise_msix_irq - Raise MSIX to the host
> + * @ep: DWC EP device
> + * @func_no: Function number of the endpoint device
> + * @interrupt_num: Interrupt number to be raised
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			      u16 interrupt_num)
>  {
> @@ -556,6 +606,12 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> +/**
> + * dw_pcie_ep_cleanup - Cleanup DWC EP resources
> + * @ep: DWC EP device
> + *
> + * Cleans up the DWC EP specific resources like eDMA etc...
> + */
>  void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -564,6 +620,13 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
>  
> +/**
> + * dw_pcie_ep_deinit - Deinitialize the endpoint device
> + * @ep: DWC EP device
> + *
> + * Deinitialize the endpoint device. EPC device is not destroyed since that will
> + * taken care by Devres.
> + */
>  void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -635,6 +698,14 @@ static void dw_pcie_ep_init_non_sticky_registers(struct dw_pcie *pci)
>  	dw_pcie_dbi_ro_wr_dis(pci);
>  }
>  
> +/**
> + * dw_pcie_ep_init_registers - Initialize DWC EP specific registers
> + * @ep: DWC EP device
> + *
> + * Initialize the registers (CSRs) specific to DWC EP. This API should be called
> + * only when the endpoint receives an active refclk (either from host or
> + * generated locally).
> + */
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -718,6 +789,10 @@ int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_init_registers);
>  
> +/**
> + * dw_pcie_ep_linkup - Notify EPF drivers about link up event
> + * @ep: DWC EP device
> + */
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  {
>  	struct pci_epc *epc = ep->epc;
> @@ -726,6 +801,14 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
>  
> +/**
> + * dw_pcie_ep_linkdown - Notify EPF drivers about link down event
> + * @ep: DWC EP device
> + *
> + * Non-sticky registers are also initialized before sending the notification to
> + * the EPF drivers. This is needed since the registers need to be initialized
> + * before the link comes back again.
> + */
>  void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> @@ -743,6 +826,15 @@ void dw_pcie_ep_linkdown(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_linkdown);
>  
> +/**
> + * dw_pcie_ep_init - Initialize the endpoint device
> + * @ep: DWC EP device
> + *
> + * Initialize the endpoint device. Allocate resources and create the EPC
> + * device with the endpoint framework.
> + *
> + * Return: 0 if success, errno otherwise.
> + */
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  {
>  	int ret;
> 
> -- 
> 2.25.1
> 
