Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B8867D5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:05:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=K1RwleFT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6Sv2Jvzz3vZd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:05:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=K1RwleFT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260f::600; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6S32Np2z2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:05:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JNvLMVDAeTU5xGpk6JdeFq+5+AZLYuX9vdmC+HzS4CVX2Zs0TvK6/C9cD/6cHcqNvMimvricIeWLxwv2iGzvJVixIguWUlDe1U6UYNxWu1KM+rM2ZEdlEt/8PKZWTaLc8eWFIxGM8L7Iw56duFAMFCDVRzvaH0KWkvzKfMyra/3FjodSbgZCSIg9EYiKc38ieT1hqBGhHQifU+qpqPe6UBmp50zQzvbPxsibrmhyR1ZMulOpsZz4MB4cjoh4sU5CZKilTb7FFA+wzE8zhh+7VsZjpf6dCpbdVRbgHUF99C2JKKL+mVowwIB3UTIFpJ4wfRWroHKTOLludbTLMVGj5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgnUFmJUrI0cHdJ6noOvxgaagPsRUL2bYYKbrhtmtFM=;
 b=nHRolmB/XCLObfliar1A6kRV49e22KLr9phTkavPBT3DlzgLgzWwQbQoDCpEn6/pa8UNbUWM407Q3Yrz5b1OppnYSxREyOd6uyAa0tTSClnmAee2a1BN5CO5NuYZT9MaOazEv/UrGeFmL4TE0hnWExn4tNPPKXTyOaKpucvousvI6lTpKgHceCAR8WdjC80m0cxifFx+WeukpMj14SP0482+OhRtZVpGWMQviHx2+BQoVDX1qQR1mfuMAu80+by9bKcGXeFUOItjjoK5aFFuHua+jMro0PRfx7p/e5hTI72h0U1LFCrDfZ/vWCy2P9OqbVoiL+9jIRZNEx32VC1Ohg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgnUFmJUrI0cHdJ6noOvxgaagPsRUL2bYYKbrhtmtFM=;
 b=K1RwleFTPk66pJwWZV/GRqxShdcdtt239htycRhQBsiKFCmzs2XkI6nOkfHDqzOoU2Idc4wj+bV4Y/YQUDQDx09XOSZFr1geuY8fezvy/Cwm0V8e4obwVOBimv84HiLLq97qrgnNvfmXeUPkmTYPcmu7rrnYZOZg+EbwCKAYjRE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM7PR04MB6984.eurprd04.prod.outlook.com (2603:10a6:20b:de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 17:04:45 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 17:04:45 +0000
Date: Mon, 26 Feb 2024 12:04:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 06/10] PCI: dwc: ep: Call dw_pcie_ep_init_registers()
 API directly from all glue drivers
Message-ID: <ZdzEoXwU42rFCF/W@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-6-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-6-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM7PR04MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b35674a-bd2d-414e-3435-08dc36ed083e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jc9/K57ZKWRTpFiuv8fhEVO3cSozRbz0Mdr0143sxCfzjjNl1HCeke1mOquhRG+yA0CyD+rocsu7nhMmlXGWa8rEICLtGEnJQOsualgYJBdmQYaX9xqJLccF/a8eOMH+deGlNEYCpDSso31fowIDU7aeblzruZBim7OIMJID6PHZ7aSGUHMFBb98k6j4+VpjDuTISLERTSDD45ZiEiDGF27cYuE9obpkZ6k/y7h5cCeYr5E9tr/4A1ssL0/B4Rg9mxD0I8KvInqK8TIRnVAxb2e80m0VgycPxTr5B3gMvIsE/d7TU/VqVAoTvp0WMxL10iCHEfKd81SZQUQFuxZXxrcW10CLHNFEphd3GtAliVyJcTEAq1IhJER4IueSjnP0H3PICzDwjJAnwKtcYImfYnehZ0Wvdr/OC6uictf/2A2RTqIZiMryjtiXjVIEMNMTc+do/cIkKGU16VClQqadW81VTVFjGUkNhk/lEEwVK+nAFvxcDYxMMWfdMt53kLJPhPWOmPhDTdrMR56UUQFiV/DwtaK03uRJWHQZD6ZMCSBuTmSRIaDUjQZLEXPZwJJQeomYPe1vEbNomZiuZZ1GBzSqu+Z/o1WE39WJhgDSutC9bEHa6OmmRbJ2kx35cVqb9SUWfRLpOC25RDHYHpnoT2hyjTGzUgaB06FlWWQZNs0fIsqih2ZOXturda/XwXTddujLapmaZwtgw0BIBxXIVlsTvNhCaP4vJfnoWb8u91M=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?/9yaYU6SJQYw813z1EFQXJcz7YwBAxV8T6mbei1uEpItEl3B1jwmEVF0bYBa?=
 =?us-ascii?Q?qY7eEWIjq59++7HEDIVu95eE3SchxKAO2ITxNznzJXknXRt8SUezGmjSnPmM?=
 =?us-ascii?Q?vkXdAksQBc+AeJRQzsURfcrKUYDmZ1nzYFX0RjlKIhjIsaNxl8J5pj5NzyVn?=
 =?us-ascii?Q?uwnVK9u0VCY/J+fwr+YZe89cIQrKzk00MHnN6Y9itBvct+vQI3XS1kAMntSI?=
 =?us-ascii?Q?XSQiFabN6glBkGH/RH6tBatKRHibvJJoZp2GCw6yvnoUUkdM7fA9gxy0YAp0?=
 =?us-ascii?Q?mK7CtXRgKMDJNcugz/JDSnrGCzzrmaAgWK6wuhQO/vDlPnk6MndsJmeqRXaU?=
 =?us-ascii?Q?Rf6n09BXGYUbDoTvan7U+d/kTr/U4SQ6j/d93O/7/HRhBLIySh/Pvtz+J1rW?=
 =?us-ascii?Q?eU2flXngOurn1sCxhfnhmzZ095DxNN73wgg20+6TBmTpmtKqaqOljAMRM66v?=
 =?us-ascii?Q?W+bmI3A4op6WLemx8gCnHaT6o7g9Tc+rFsTEnFMJ1Vx5XToovq7mCLpjwa3d?=
 =?us-ascii?Q?Lvt0qSVNTNzNWDuT5yWxsHW/XBQ4KGUZYLP5uXqMHTeSYQu12TXbDoL96wj7?=
 =?us-ascii?Q?6EyZj6bycwbKnYZRBBPsN0+tE5FnOmg3NNZe62bl9h+b9bdN/LkNubklQlef?=
 =?us-ascii?Q?x14irtGcQeU6nGMAIluoWBZK6LxKHzXZ/pIY4jSrc6iqD2iR79CXK5QkELuw?=
 =?us-ascii?Q?qhqQiE2idNTdRElREJhn2SCavOZcr2KvsEfh75d6qY4b5oEa/ukbhpxEmQg/?=
 =?us-ascii?Q?DP0RuEpqBkcnyTm/Le6z9VsnNxaxFz/txVDfZtFNSTxURhoSS1uw8+IfC2u1?=
 =?us-ascii?Q?uSyGapOWPWa+Hh/L4yY6BCRAA6ZfMvf+8PKL+s2lIyO811963bvzKqwUvToo?=
 =?us-ascii?Q?cgyNrFXhfEH/oDOhvQ3M6joYsp75zQutY88o0e3s1hhlZbFqpeSrrUaKygB8?=
 =?us-ascii?Q?vInci+kkj6MoRNkbG8Clj3ZYd8x2IcFi3rihcz4hwu86MjHJHC22MfVR3sV/?=
 =?us-ascii?Q?h2UMeM0Le0bFQI07nD4MrLqOc4pmPEsWGgHCf3D+tyy67iadcRycRbYAyxRe?=
 =?us-ascii?Q?CExKn/pXeV7uYOm603GzbEH0RpZN+ukt8BSqrFxiV+cGUnMr6e/HQa8W4UAF?=
 =?us-ascii?Q?R94uITB4DulfgkO5rn8ohMUC7ZWdQ7g+jtuRxyVVkLl+Z2kBgMKlgh3Cv/Gn?=
 =?us-ascii?Q?328okaV/VygjBqej+VGZ37ElcOkOJZtMYLvluucJEm2orol4RbOVFOruB/ZM?=
 =?us-ascii?Q?gumKOuNMA+X11t3vzquX42ASGh75fMEzzBpcy140+ln09PVjQN09xf/ScEBb?=
 =?us-ascii?Q?od+w+AHd9NyxoEtialhPsyVAyMvld/LcK2xEiH0/KS92Lxx9AHp50JCRC3Zn?=
 =?us-ascii?Q?c3HVLSeiz2ubdmzCyaKZsfyzuahywldVzK1sWCnhTpM+iUzJ3J2KOylOVi8b?=
 =?us-ascii?Q?DrG7f7ixncAvHp4s8VP4Uu1Wl0XjyxCgVXFYcOeWt9p2HZWxv2vJus+A1Ab/?=
 =?us-ascii?Q?HHeTf2W+Y1oPz4cj4dz74V4izxZu2z1qRMyPLi5NrEchX4RbkpaxUhYW/sPF?=
 =?us-ascii?Q?eXrEI9xaksW7JbCIObV2owU8kKbVGv357uhv/4a+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b35674a-bd2d-414e-3435-08dc36ed083e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 17:04:45.5891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQMDPBYlrIQxWwmHHrWIW7/L2vSfF9H9qVxKTDqwOKDNCcRdywmfx+umBvpnHVRN5dGlvBRRlVM1+dJuFVc/wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6984
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

On Sat, Feb 24, 2024 at 12:24:12PM +0530, Manivannan Sadhasivam wrote:
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
> This change will also allow us to remove the "core_init_notifier" flag in
> the later commits.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  7 +++++++
>  drivers/pci/controller/dwc/pci-imx6.c             |  8 ++++++++
>  drivers/pci/controller/dwc/pci-keystone.c         |  9 +++++++++
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  7 +++++++
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 22 ----------------------
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  9 +++++++++
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 12 +++++++++++-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     | 13 ++++++++++++-
>  8 files changed, 63 insertions(+), 24 deletions(-)
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
> index dc2c036ab28c..bfcafa440ddb 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1136,6 +1136,14 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
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
> index c0c62533a3f1..8392894ed286 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1286,6 +1286,13 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  		ret = dw_pcie_ep_init(&pci->ep);
>  		if (ret < 0)
>  			goto err_get_sync;
> +
> +		ret = dw_pcie_ep_init_registers(&pci->ep);
> +		if (ret < 0) {
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
> index 2e398494e7c0..b712fdd06549 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -276,6 +276,13 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
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
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index ed1f2afd830a..278bdc9b2269 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -729,7 +729,6 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
> -	const struct pci_epc_features *epc_features;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
>  
> @@ -775,29 +774,8 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		goto err_exit_epc_mem;
>  	}
>  
> -	if (ep->ops->get_features) {
> -		epc_features = ep->ops->get_features(ep);
> -		if (epc_features->core_init_notifier)
> -			return 0;
> -	}

why remove this check?

Frank

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
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index 9d9d22e367bb..fb7c03639a53 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -414,6 +414,7 @@ static const struct dw_pcie_ep_ops pcie_ep_ops = {
>  static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  {
>  	struct dw_pcie_ep *ep = &rcar->dw.ep;
> +	struct device *dev = rcar->dw.dev;
>  	int ret;
>  
>  	if (!IS_ENABLED(CONFIG_PCIE_RCAR_GEN4_EP))
> @@ -422,8 +423,17 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
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
> index 3fced0d3e851..82ccaea089be 100644
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
