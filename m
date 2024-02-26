Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 262F6867D9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 18:11:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cU3o7Rzz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tk6b16c9Kz3vdg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 04:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cU3o7Rzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::60a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tk6ZG3jR1z3btm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 04:10:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOG0xGnRNDjCx26pu1hL6rsk0MeZAde5EElCiGGaTU+nEWqNP4BUSZ8V0DW7RAK+c/AdDCY77vypRlMiOlX31X9sOtVR7lpZuE1d2J0An78AzBFOZCydWaHsEyuQhGzBMMAGedPLnX0qMuQYIJvu493xrdfib5gv4Hoq6/rtTq+rhChpeREJePAjSCUY0OdeNOYrzE9Q4xh+Y4Lw2AlAj46Y2EG6g984zLdy1BhUzUr+wgA3shReXvyvjDK35DYBlWG6evcy9mZhVolT01zf310Oba2pbboH/t4O/6Xr6VjpKjpi4SvlGACIGRlbuvs1pYdIUCcPj0KEmX/wKT/N4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaEiQIyd1ndXsjAxRuZCIGg3qPeFz0Yb6fkrd1l6rsU=;
 b=iw885B4IZyJkLv75ddu9HN0jXB20blKuyeb1mIcp2QdIvgt0RWsZO6VNNROgnewaT/bqTeoMKTlG2t4HkU4L90r5F8edNElnKcUIEqkAyVK1mKivgqE3Uaq9xEmlIrOeGJbkBf+Q9nXIcxkoA1+3gUQV/6L3G3SAtCuN603n3Wgpw3FgP0X1ggCf+cEHI0EjmSpGOrdinWTI8McE4qaMKyQ5Q/rVme8kiIaqBadCoe3n68hrnT6dY6de8L+ZBCi8ebY+b3+JacEdL4X8zX3fSWgQ1/o9mb0Rj/PLz27HpNFB0xzqygFXMhORx9VMteLL8Mc8q4G9X+mmWA9gOdcF8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaEiQIyd1ndXsjAxRuZCIGg3qPeFz0Yb6fkrd1l6rsU=;
 b=cU3o7Rzz3aSazOvBSvZju/nRX2bvVh2P+hc2yKO7PgJ1bZPiiKa70yO7PpN0npz8mfLKcPSGuRbKyH4YOxuJWW2Twp0sGXJR0P8ZlpPv8T5TgLztxoTW9+7O+9+bG3lv5oahJ9p+W6eialHFH6m7gvtH/TS0r2babLxnuLT3U/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 17:10:10 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 17:10:10 +0000
Date: Mon, 26 Feb 2024 12:09:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v8 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <ZdzF5u2yB+BKIkD3@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-7-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-7-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1891e4-9ffa-4862-ce6e-08dc36edc9df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c47WGKfWqbdF6nF3B/8Lv4NwXSb+oI05Mh+pyBd4cRW/SzcrRLSSezFd0dXJ296JvfcvcCg4dSMCruHX5H4gBOhk8uBdNNygIOzH0qCGREXX7qfskh/WPTbIuuxldHSkM273aYPgmjia57GvgBllo4iDRFrbdPcQlpoca/zK/RR2HNb8cwLd3g1EF07f3Xu6ZbhHItEzQ+0XVJZwCl2cjhSdjyKRpCkqZwzSueAqCGQFLHXje/Pv55qvTcBX9oMFwYWGZMTtCP0AN6rlEW9wv7nfpLNUkT/V5SkshlWKalfiXonRjXychm8tUnJVlDW6rAK8Q8bo5SGOtFNyIqgH6Ws5pgfhTEqF4YTW1IQh+oPQnaeniadt08uq+h7apKskOq1pZ9E2af2tEZP4k9ZxYb8sjsGl6VlPYgEnzKDa+AiPilHJKFzfmmGJPBJGnoWEm0kSTMPuBlIB4BxE4OYgZ9F25yk+qiW2knAYWKEZ5lyU+R8+q+RiR5iIzgr6iTZvydpoyiVuGS4oW3eyomXahfw2+lztyReiBfUt2IjgAlVx8SG2dAK12OxUcAY+84EXWqifM+2ir7v0fxIXXfIWS5ULyuEmFGbIBxDMi2g1OIirLxRna/5vM1i+nkGMjUWnJSLTlR7uyKHmy55d90tQMdjioAp0kOIdVQ0ow3+VXnMSXYtcTfeYJl5QRWq2lIfvmEL8bLAEYwciRKLFkRN0SA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Atw/a3qGkPGDVJVGNkhDkNmy5aqcEpwbdKY/LLRs6RZVX3DRfeGJwXPPeUji?=
 =?us-ascii?Q?u1tvMZ+7tx7zs6opIkfBCjOMLYTwHLa1n7DwJz1X1r0ksjdZ/fkLWFwFwovu?=
 =?us-ascii?Q?0F0Who5VIQNxSB/pdn3ugjGuDWx/UCt/0UIqKWiP5pWOV6dkrZnd46LDCVxW?=
 =?us-ascii?Q?whmljgmvVHLuLcwttSFT1hTap1Zw8McVUOavrmdU/Za+VTXS1sMt5tu75hO6?=
 =?us-ascii?Q?MSSLzG00gAjY1U97E2CVxub+qwYswcmweN3FtkUP9KSEG2rYF2VJ1LHyyLP4?=
 =?us-ascii?Q?9MQfwURNN50qTDMumaKDAVAPL9ZkFRSUAZgqG5zmZasJ3EEMHBzKohu72GDL?=
 =?us-ascii?Q?6GFz1Gp3S9D3VuCFGkKlWJCK6nkaMdqckOXK1M0LmrwHnECpde384AZNV+vW?=
 =?us-ascii?Q?/gZ7wgNKNb3OFeXMwDf/AZ/sjB2/yw2OAhqZGuttGUe8fTuAl8JR33rRhPo6?=
 =?us-ascii?Q?dta9sD8sQ9o71jnW6e9FFT38dLePqr7bCj00nVm6tv0z+8+z5rAog8n7w47t?=
 =?us-ascii?Q?bq/CYJzfMRQN7ZtQBWQrzFp4/jUItdGo4PMGXGCirut1m8jwjDE6yWJYGS+n?=
 =?us-ascii?Q?cm1AkbTLrjb4fFTeCVpk/TWjVgONsVvtl4xwSjXoFJt185Bm+I2w/2nT9YsW?=
 =?us-ascii?Q?q+Dhdah8YOfyh3yhdLarZyk5f15lSDAzC4W2xQNogut5KLYr50R+YlebZBDj?=
 =?us-ascii?Q?sdvZpVOLU90ZdJS7HqoeFONIWJON6voGWzEPEgq3qqWgfWCpqiNkSxBxYUF3?=
 =?us-ascii?Q?FPoNFjvCrB2NOO/52dnQrBKYHVWYxSnH5HaYABRCXbaQdG6AXbzW8Gj/nHIu?=
 =?us-ascii?Q?06UY/or84Trr18qG8TnCf2sB9WYAuPq8GYLLmZq51+swpCBCHnT/PdY0nUVq?=
 =?us-ascii?Q?w7zbHt7rwlhE9LvJ2XfepiZSWmIU3UHDfrJEOKxG2GV4b0uasST4b4IJi+3/?=
 =?us-ascii?Q?W1n8Jtc4EaANLyGcSy86oPRBxRyxLtDO9S9ChtONsjC6qrhY4ah8Vq8quWMg?=
 =?us-ascii?Q?3mDNbH5qzIUSLQssg1NZDP9gUk3mKa2PZ9qwdEPOPkURq1yQwa3AIxQmL0Ra?=
 =?us-ascii?Q?DSYjkghsAaOUKHEq1iupvmXJaseQLHKOIj+9tZF+MVsdldpZ9CYWTgT2fpBt?=
 =?us-ascii?Q?wU2DZx+d9YyHGyoVXUiRf1t6hwkq3kz0kU0xCzh2+JoNf5B3uOzQSp6m+zx1?=
 =?us-ascii?Q?Q652MahvgQLkFSWo2bw7d4GJEy4TB3/jpym2w5k9kvxCEnGnhw8UD5+GOAYD?=
 =?us-ascii?Q?at51O6SspLKETQTPx1AF5z7kLK+Wy94hyw0qlI7XOi/4lEJPQCljbS7QEqeo?=
 =?us-ascii?Q?lKvzBvKyM9sb4/4usjY36qNDBk9O3+8D8NOh97xmj0dmXYzjLx85NDMASUL4?=
 =?us-ascii?Q?bCfiDc3PB9+fBog7BOYghhCtmMkmIw8DGUQEjY9Bzibrp52/x62i6kUBI3uW?=
 =?us-ascii?Q?8T/Ej+oyBe+phi/P6uzPOyv77Pl9LeQJ/4aECqv9ImF/uZFkdf5y4Z+7LlYM?=
 =?us-ascii?Q?Y23x8gwIeE9URrR8sLz8NIOrcGrnP6ngT4HEUS55D816xKY4Tmo4SnDuE7Z3?=
 =?us-ascii?Q?aOUqLZ2riM84gremPac=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1891e4-9ffa-4862-ce6e-08dc36edc9df
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 17:10:10.5341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CgOfTiFw83f+gbMQz43FAmiAGu2ZD8pCNer0Slez9Qk3GMikFEHIYejOATCD0g48XK+1Lgu5HXOKsE29bstW2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8020
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

On Sat, Feb 24, 2024 at 12:24:13PM +0530, Manivannan Sadhasivam wrote:
> "core_init_notifier" flag is set by the glue drivers requiring refclk from
> the host to complete the DWC core initialization. Also, those drivers will
> send a notification to the EPF drivers once the initialization is fully
> completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> will start functioning.
> 
> For the rest of the drivers generating refclk locally, EPF drivers will
> start functioning post binding with them. EPF drivers rely on the
> 'core_init_notifier' flag to differentiate between the drivers.
> Unfortunately, this creates two different flows for the EPF drivers.
> 
> So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> a single initialization flow for the EPF drivers. This is done by calling
> the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> send the notification to the EPF drivers once the initialization is fully
> completed.
> 
> Only difference here is that, the drivers requiring refclk from host will
> send the notification once refclk is received, while others will send it
> during probe time itself.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
>  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
>  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
>  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
>  include/linux/pci-epc.h                           |  3 ---
>  11 files changed, 19 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index 395042b29ffc..d2d17d37d3e0 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -474,6 +474,8 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bfcafa440ddb..894b5de76e3a 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1144,6 +1144,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	/* Start LTSSM. */
>  	imx6_pcie_ltssm_enable(dev);
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 8392894ed286..1d00c5fa14ce 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1293,6 +1293,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  			goto err_ep_init;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", mode);
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index b712fdd06549..c513598a46d7 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -283,6 +283,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(&pci->ep);
> +
>  	return ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index ca9b22e654cd..8490c5d6ff9f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -154,6 +154,8 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
>  			dw_pcie_ep_deinit(&pci->ep);
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", dw_plat_pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 3697b4a944cc..2fb8c15e7a91 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -775,7 +775,6 @@ static void qcom_pcie_ep_init_debugfs(struct qcom_pcie_ep *pcie_ep)
>  
>  static const struct pci_epc_features qcom_pcie_epc_features = {
>  	.linkup_notifier = true,
> -	.core_init_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = false,
>  	.align = SZ_4K,
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index fb7c03639a53..0448928017f3 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -435,6 +435,8 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  		rcar_gen4_pcie_ep_deinit(rcar);
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 264ee76bf008..e02deb31a72d 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2006,7 +2006,6 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  
>  static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.linkup_notifier = true,
> -	.core_init_notifier = true,
>  	.msi_capable = false,
>  	.msix_capable = false,
>  	.reserved_bar = 1 << BAR_2 | 1 << BAR_3 | 1 << BAR_4 | 1 << BAR_5,
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 82ccaea089be..eb1d79fdb1f1 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -410,6 +410,8 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(&priv->pci.ep);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index 18c80002d3bd..fc0282b0d626 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> @@ -753,6 +753,7 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
>  	const struct pci_epc_features *epc_features;
>  	struct pci_epc *epc = epf->epc;
>  	struct device *dev = &epf->dev;
> +	bool linkup_notifier = false;
>  	bool msix_capable = false;
>  	bool msi_capable = true;
>  	int ret;
> @@ -795,6 +796,10 @@ static int pci_epf_test_core_init(struct pci_epf *epf)
>  		}
>  	}
>  
> +	linkup_notifier = epc_features->linkup_notifier;
> +	if (!linkup_notifier)
> +		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
> +
>  	return 0;
>  }
>  
> @@ -901,8 +906,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  	const struct pci_epc_features *epc_features;
>  	enum pci_barno test_reg_bar = BAR_0;
>  	struct pci_epc *epc = epf->epc;
> -	bool linkup_notifier = false;
> -	bool core_init_notifier = false;
>  
>  	if (WARN_ON_ONCE(!epc))
>  		return -EINVAL;
> @@ -913,8 +916,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  		return -EOPNOTSUPP;
>  	}
>  
> -	linkup_notifier = epc_features->linkup_notifier;
> -	core_init_notifier = epc_features->core_init_notifier;
>  	test_reg_bar = pci_epc_get_first_free_bar(epc_features);
>  	if (test_reg_bar < 0)
>  		return -EINVAL;
> @@ -927,21 +928,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  	if (ret)
>  		return ret;
>  
> -	if (!core_init_notifier) {
> -		ret = pci_epf_test_core_init(epf);
> -		if (ret)
> -			return ret;
> -	}
> -
>  	epf_test->dma_supported = true;
>  
>  	ret = pci_epf_test_init_dma_chan(epf_test);
>  	if (ret)
>  		epf_test->dma_supported = false;
>  
> -	if (!linkup_notifier && !core_init_notifier)
> -		queue_work(kpcitest_workqueue, &epf_test->cmd_handler.work);
> -
>  	return 0;
>  }
>  
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index 40ea18f5aa02..03d22aed5ac6 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -148,8 +148,6 @@ struct pci_epc {
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> - * @core_init_notifier: indicate cores that can notify about their availability
> - *			for initialization
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @reserved_bar: bitmap to indicate reserved BAR unavailable to function driver
> @@ -159,7 +157,6 @@ struct pci_epc {
>   */
>  struct pci_epc_features {
>  	unsigned int	linkup_notifier : 1;
> -	unsigned int	core_init_notifier : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	u8	reserved_bar;
> 
> -- 
> 2.25.1
> 
