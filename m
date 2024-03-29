Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98815892406
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 20:18:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=o9Wt7c0+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5qvg2yKmz3vgc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Mar 2024 06:18:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=o9Wt7c0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::730; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0730.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::730])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5qtv3fBLz3c4C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Mar 2024 06:18:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMGVUlx3O2KTdhvYmqmh+qCukAQ/H7bPV1aINfgwuMvylJbz80bg14/m3IjWHV76HzmJBzem43WLcQVR7yrpIkZRJZcg95e3ZYKosWPNWLt5hw4XpqiQqCeYPopIG8APxhcB4fCskwfmJdKN3W+7UmNW46AfkfwcEjixjfZQTNXc5thPqhRTDl1KBmmMwd8rKDrbKL2B185T4WLChVWg4kikxNFfxWWwcF4Rb1gkkr7KFGMxYUrOteiZtub/MSUtHiaDSWFM00WhpOJcGSxNPastaa+yecwlthwN8p2OzOjwz32KhQYnnRBsBZVLl0kC/oJmP88qoNOLpgW8lSxlQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxFt3FUSCaOpW1ICuamsOQIXz2wziGmTdfP8W5QisUM=;
 b=Xw9Anf8QaGbOR3Nzqar9f7gpXqODiQuamnKsSc+DovzdH3Hyfgl91R22NEfYpLFdiu4AoF775kg46GJnPVOOmNP+/ejbyVuEPPbS1KWQZzcSpVxuJddlj/RdRjXRv1ZdOoHJC8U6iBnQM4hWeFWIEij0qA5tu1gJo7umzZC5Rem6kEoUxxusWPbOn2fwgSFQlojzQdnQJ2HZBZ6aPcDcesSgkdB1VSDhRH7XaaGq8hNLK0xTuCvF+uk0YXFff0S6caQfXHlomSqS1Kzefc6HJdVIlAV6uCKKDzucjbjfd9GSnPGZL/X4l/p+2mH0bN4EbPOIVQUE+S1Vn1+JwmzGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxFt3FUSCaOpW1ICuamsOQIXz2wziGmTdfP8W5QisUM=;
 b=o9Wt7c0+Imn2onvBtDgLnW0b//ohKMKVg1XIegGlLC2uMuNytKGPD58rFp1Q6JMahjO+5PBqxWGy5R8NEuJd9TdH71t0Yi6jlnPGf22iJev2V+FERFCrXarvrtMNTpUYiWi2GaL7WC0QeIi0Dh8GvzvjwiQSl1nEcckNyyzcj14=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM8PR04MB7266.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.40; Fri, 29 Mar
 2024 19:17:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7409.039; Fri, 29 Mar 2024
 19:17:55 +0000
Date: Fri, 29 Mar 2024 15:17:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v12 8/8] PCI: endpoint: Remove "core_init_notifier" flag
Message-ID: <ZgcT1Ts7zn5jrRCS@lizhi-Precision-Tower-5810>
References: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
 <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327-pci-dbi-rework-v12-8-082625472414@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0110.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::25) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM8PR04MB7266:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	71QQuPaFCOZ6d6uBWMTZKu8vLTlkiNCLtNS+JtX0vmQHQCAbhfCk5cw4EAokjQHxFleaI4AJdZr2UeM0izYXSpFWtSYMT2H34RtZkbb/XPh8nhumPaKcwAqqShOL719DshAg8/Sp/bwRepbsP9ag3othjM/eHb5wA+apnhG9Fo2eg0tvnKmycy32bUbqXMlhzMrozfyBrvxsU2oXJaEK1S6+F+TdqN/pDUnzD2ebHqqvqQN2wmyXqMlU2s8ILbZ5DeZCTeZK4a3MRMwGXNzER8A1PbRz3C4gSCOo8bUVeMYo9/ca1IzGVNHkE83gj3Ac1KWKeZf8nbKUImfEyFuO09PEBxpINBy3RCkXwYPTXqm+LayX4PzsC2wObHVRMvmmc4rta8qU4C58raeaKCEDyzDTbEf6RafLC+MZlHt0yPtolYGFjVwdi0BWSjVydOio01Fr5wIC9AmpztFDThCslblUnSew0K/0kSoM75gMoiHQmpKCXegSaG0LRGTFl4hxV2RvjKtqOWajipRgtMsuOCgyP9ZPhtc9hZBtqpozXwICnKE4QVgIOJ2hBZPSb8VZX7B6C2pKYgp/MSJFd5ZEHCuigS0FPvlcyzLt7zoOzzstB61yPjL3zjT0tDzseU7WuHMlZaMOl91FLOhmWijGDZKdEeh1ZFk9rNZJ5+XVugR3JSxfImFrKH9/f5Epr8JhT1Rt06TZHo1O6gI9osUItSrkSwb6PngL6D3NT62NEZo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(376005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mUd7/SwiecNjqJn4LfA1j0qLd9lsgbjige0L8KVjD3KrUvlqiH570ZxRFoMe?=
 =?us-ascii?Q?hkPDu2z2bZNjmmU6JpKFvV038terN7VEROARAM8sxqC7BzOoC3pgM9MyQM7N?=
 =?us-ascii?Q?tPEDUHgmDJu14TxKEHTwHQGgn4XV9vQMgOaTA/jUWwssqwEqMAuc44vrEFTO?=
 =?us-ascii?Q?zYIReKND9TmjoWwtaibg9rwT+qhjP6zxIbfH5Y6WOnLurBALWP00EWaAnXrH?=
 =?us-ascii?Q?HKggal+Ymm3wloHN2bnD2b2q07HkHplUTbd5j2KCrjGntEnnIPaz9gKwTWw6?=
 =?us-ascii?Q?vdUFY9vB9xab/j3iu8TkpgaASeqvpRR3USTr82TJLJ7K4tBM5gRbUC/Do/Yp?=
 =?us-ascii?Q?BST5fRRCnGhjZ60P8HWshjAIzP4oyQWtvXS5haOCzrdgYG0fJ4GkFZKTVWmR?=
 =?us-ascii?Q?lkIwHWi5+K861Pfzzd8sA9HOH4Zun4bh9uQ1UHL5KOyvLJGZm/e3cji0bd4f?=
 =?us-ascii?Q?KbzCiE0S1kDEiDf7L4iOQzR+9uB1I/UpOa3k8wgo0F+gsxicmrUQ2o3Y217M?=
 =?us-ascii?Q?gQAenP+xeytMO/5H8R30LFTITxxSXmcjIXTXj50+xylcvn1PgVr/WiW1Qx2k?=
 =?us-ascii?Q?BVlPC/zd32VbbgdSuPkYxLXuD42TIsI8244yn/E1JVZFh7uJYwYxzzKiXQd1?=
 =?us-ascii?Q?9xEhNU3SHXQQYhp9NZVcNpu5hyuHKf3gsoSOai12pb/KHRwjuHRGwk8qbf/p?=
 =?us-ascii?Q?taZIIPjy4HdEIrcmngpq9w+bXi3H+nEY73a6t+p5n3mpBPKwKSvR4QU3xtxL?=
 =?us-ascii?Q?2DrDo6dknf2+84XnbIlfQY1pu4Dc5qH1QVf/GpfwZEqwJr+QoiDglmPNHl5Q?=
 =?us-ascii?Q?yc5OLdkC716NiawH52USTXLBsuLWcik+yiqwkfTdS/d2K5EcjBZ4K683mf7l?=
 =?us-ascii?Q?wU3faHhcVMLzm1vbcFr9I8Np9spdHsK+iganvSVMGuuyPTCTEC1D3nGtZif/?=
 =?us-ascii?Q?z2MtbK402cZ7p/BLiQdMgP/D4TCDji1TfHu8oZj4g96dQcTMxNywSkl6hhad?=
 =?us-ascii?Q?1lp5ruHwtiHtEkZsb1cVifjtsOgsX/t/msMHufdD2OQJ/hCh1/Ebw+aSCG0G?=
 =?us-ascii?Q?minJAL2u87qA25PGkrWrzf7ryBEAasn/qRBtYHZbTtllHGiTdLDz8XjH/0t0?=
 =?us-ascii?Q?zrcv4yP3igCFyHNaooTBJrakAOIi6j42y+NCT1gWeimdBldEE/Op148MokF3?=
 =?us-ascii?Q?Q7yOmxfEn+FsT5vFr1XFWE3HtG84kpWRLX82ialKLjIbQEetN7wz5QARDUyC?=
 =?us-ascii?Q?pbTHKAfQky3ljAP7F5yQX3FKHksQggaaLVuJUnuWImz3l/CnRGYvcl7UyYjo?=
 =?us-ascii?Q?rJaVi8bEXu00fkOn6GNNb8Za42dKHCWdpxBh+PsB28F9WbZZZStgiYaIm5ha?=
 =?us-ascii?Q?QkOgoZKrx8rxtIeYnHr79GnWx90CPA13Utj4xO6bAYq8a4/XMiNCAF0kXMRE?=
 =?us-ascii?Q?0bdVVqfD+HjlLFTNNKNURnXCJjyxJAb+Vmy/imsvLJdXzwqB0qfPHOcMH0P9?=
 =?us-ascii?Q?t7qmr1hgxyrUb2HRZMbsAEWeF/RnP0Iul47QIeVYgpfdrokhBPCjxCol5Jeo?=
 =?us-ascii?Q?Bt+uDg1uu/A2lRms58JZXPiDHynQOu2uMT6sEB6X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b8e5ce-37e7-494e-da2e-08dc5024efd6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 19:17:55.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QdgtUGLprSCJ0Z3NCkknUnDK7JWAPudKAAudEpwN3SibVSNQERXNef3jqAbFhRNpJqcqhxr+12b4eod00Muzgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7266
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

On Wed, Mar 27, 2024 at 02:43:37PM +0530, Manivannan Sadhasivam wrote:
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
> But this also requires the EPC core driver to deliver the notification
> after EPF driver bind. Because, the glue driver can send the notification
> before the EPF drivers bind() and in those cases the EPF drivers will miss
> the event. To accommodate this, EPC core is now caching the state of the
> EPC initialization in 'init_complete' flag and pci-ep-cfs driver sends the
> notification to EPF drivers based on that after each EPF driver bind.
> 
> Tested-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/controller/cadence/pcie-cadence-ep.c  |  2 ++
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 ++
>  drivers/pci/controller/dwc/pci-imx6.c             |  2 ++
>  drivers/pci/controller/dwc/pci-keystone.c         |  2 ++
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 ++
>  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 ++
>  drivers/pci/controller/dwc/pcie-designware-ep.c   |  1 +
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 ++
>  drivers/pci/controller/dwc/pcie-keembay.c         |  2 ++
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  1 -
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c        |  1 -
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 ++
>  drivers/pci/controller/pcie-rcar-ep.c             |  2 ++
>  drivers/pci/controller/pcie-rockchip-ep.c         |  2 ++
>  drivers/pci/endpoint/functions/pci-epf-test.c     | 18 +++++-------------
>  drivers/pci/endpoint/pci-ep-cfs.c                 |  9 +++++++++
>  drivers/pci/endpoint/pci-epc-core.c               | 22 ++++++++++++++++++++++
>  include/linux/pci-epc.h                           |  7 ++++---
>  19 files changed, 65 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence-ep.c b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> index 81c50dc64da9..55c42ca2b777 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence-ep.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence-ep.c
> @@ -746,6 +746,8 @@ int cdns_pcie_ep_setup(struct cdns_pcie_ep *ep)
>  
>  	spin_lock_init(&ep->lock);
>  
> +	pci_epc_init_notify(epc);
> +
>  	return 0;
>  
>   free_epc_mem:
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
> index 8d28ecc381bc..917c69edee1d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1131,6 +1131,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	/* Start LTSSM. */
>  	imx6_pcie_ltssm_enable(dev);
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 81ebac520650..d3a7d14ee685 100644
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
> index 9eb2233e3d7f..7dde6d5fa4d8 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -286,6 +286,8 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	dw_pcie_ep_init_notify(&pci->ep);
> +
>  	return ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index a6095561db4a..a4630b92489b 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -452,6 +452,8 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "INVALID device type %d\n", artpec6_pcie->mode);
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 2063cf2049e5..47391d7d3a73 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -632,6 +632,7 @@ void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  
>  	dw_pcie_edma_remove(pci);
> +	ep->epc->init_complete = false;
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
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
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index b2556dbcffb5..98bbc83182b4 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -442,6 +442,8 @@ static int keembay_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> +		dw_pcie_ep_init_notify(&pci->ep);
> +
>  		break;
>  	default:
>  		dev_err(dev, "Invalid device type %d\n", pcie->mode);
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
> index e155a905fb4f..cfeccc2f9ee1 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -437,6 +437,8 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  		rcar_gen4_pcie_ep_deinit(rcar);
>  	}
>  
> +	dw_pcie_ep_init_notify(ep);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index db043f579fbe..ddc23602eca7 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -2006,7 +2006,6 @@ static int tegra_pcie_ep_raise_irq(struct dw_pcie_ep *ep, u8 func_no,
>  
>  static const struct pci_epc_features tegra_pcie_epc_features = {
>  	.linkup_notifier = true,
> -	.core_init_notifier = true,
>  	.msi_capable = false,
>  	.msix_capable = false,
>  	.bar[BAR_0] = { .type = BAR_FIXED, .fixed_size = SZ_1M,
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index 0e5e7344de48..a2b844268e28 100644
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
> diff --git a/drivers/pci/controller/pcie-rcar-ep.c b/drivers/pci/controller/pcie-rcar-ep.c
> index 05967c6c0b42..047e2cef5afc 100644
> --- a/drivers/pci/controller/pcie-rcar-ep.c
> +++ b/drivers/pci/controller/pcie-rcar-ep.c
> @@ -542,6 +542,8 @@ static int rcar_pcie_ep_probe(struct platform_device *pdev)
>  		goto err_pm_put;
>  	}
>  
> +	pci_epc_init_notify(epc);
> +
>  	return 0;
>  
>  err_pm_put:
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
> index c9046e97a1d2..8613df8184df 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -609,6 +609,8 @@ static int rockchip_pcie_ep_probe(struct platform_device *pdev)
>  	rockchip_pcie_write(rockchip, PCIE_CLIENT_CONF_ENABLE,
>  			    PCIE_CLIENT_CONFIG);
>  
> +	pci_epc_init_notify(epc);
> +
>  	return 0;
>  err_epc_mem_exit:
>  	pci_epc_mem_exit(epc);
> diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> index cd4ffb39dcdc..212fc303fb63 100644
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
> @@ -890,8 +895,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  	const struct pci_epc_features *epc_features;
>  	enum pci_barno test_reg_bar = BAR_0;
>  	struct pci_epc *epc = epf->epc;
> -	bool linkup_notifier = false;
> -	bool core_init_notifier = false;
>  
>  	if (WARN_ON_ONCE(!epc))
>  		return -EINVAL;
> @@ -902,8 +905,6 @@ static int pci_epf_test_bind(struct pci_epf *epf)
>  		return -EOPNOTSUPP;
>  	}
>  
> -	linkup_notifier = epc_features->linkup_notifier;
> -	core_init_notifier = epc_features->core_init_notifier;
>  	test_reg_bar = pci_epc_get_first_free_bar(epc_features);
>  	if (test_reg_bar < 0)
>  		return -EINVAL;
> @@ -916,21 +917,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
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
> diff --git a/drivers/pci/endpoint/pci-ep-cfs.c b/drivers/pci/endpoint/pci-ep-cfs.c
> index 0ea64e24ed61..3b21e28f9b59 100644
> --- a/drivers/pci/endpoint/pci-ep-cfs.c
> +++ b/drivers/pci/endpoint/pci-ep-cfs.c
> @@ -64,6 +64,9 @@ static int pci_secondary_epc_epf_link(struct config_item *epf_item,
>  		return ret;
>  	}
>  
> +	/* Send any pending EPC initialization complete to the EPF driver */
> +	pci_epc_notify_pending_init(epc, epf);
> +
>  	return 0;
>  }
>  
> @@ -125,6 +128,9 @@ static int pci_primary_epc_epf_link(struct config_item *epf_item,
>  		return ret;
>  	}
>  
> +	/* Send any pending EPC initialization complete to the EPF driver */
> +	pci_epc_notify_pending_init(epc, epf);
> +
>  	return 0;
>  }
>  
> @@ -230,6 +236,9 @@ static int pci_epc_epf_link(struct config_item *epc_item,
>  		return ret;
>  	}
>  
> +	/* Send any pending EPC initialization complete to the EPF driver */
> +	pci_epc_notify_pending_init(epc, epf);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/pci/endpoint/pci-epc-core.c b/drivers/pci/endpoint/pci-epc-core.c
> index da3fc0795b0b..47d27ec7439d 100644
> --- a/drivers/pci/endpoint/pci-epc-core.c
> +++ b/drivers/pci/endpoint/pci-epc-core.c
> @@ -748,10 +748,32 @@ void pci_epc_init_notify(struct pci_epc *epc)
>  			epf->event_ops->core_init(epf);
>  		mutex_unlock(&epf->lock);
>  	}
> +	epc->init_complete = true;
>  	mutex_unlock(&epc->list_lock);
>  }
>  EXPORT_SYMBOL_GPL(pci_epc_init_notify);
>  
> +/**
> + * pci_epc_notify_pending_init() - Notify the pending EPC device initialization
> + *                                 complete to the EPF device
> + * @epc: the EPC device whose core initialization is pending to be notified
> + * @epf: the EPF device to be notified
> + *
> + * Invoke to notify the pending EPC device initialization complete to the EPF
> + * device. This is used to deliver the notification if the EPC initialization
> + * got completed before the EPF driver bind.
> + */
> +void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf)
> +{
> +	if (epc->init_complete) {
> +		mutex_lock(&epf->lock);
> +		if (epf->event_ops && epf->event_ops->core_init)
> +			epf->event_ops->core_init(epf);
> +		mutex_unlock(&epf->lock);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(pci_epc_notify_pending_init);
> +
>  /**
>   * pci_epc_bme_notify() - Notify the EPF device that the EPC device has received
>   *			  the BME event from the Root complex
> diff --git a/include/linux/pci-epc.h b/include/linux/pci-epc.h
> index cc2f70d061c8..acc5f96161fe 100644
> --- a/include/linux/pci-epc.h
> +++ b/include/linux/pci-epc.h
> @@ -128,6 +128,8 @@ struct pci_epc_mem {
>   * @group: configfs group representing the PCI EPC device
>   * @lock: mutex to protect pci_epc ops
>   * @function_num_map: bitmap to manage physical function number
> + * @init_complete: flag to indicate whether the EPC initialization is complete
> + *                 or not
>   */
>  struct pci_epc {
>  	struct device			dev;
> @@ -143,6 +145,7 @@ struct pci_epc {
>  	/* mutex to protect against concurrent access of EP controller */
>  	struct mutex			lock;
>  	unsigned long			function_num_map;
> +	bool				init_complete;
>  };
>  
>  /**
> @@ -179,8 +182,6 @@ struct pci_epc_bar_desc {
>  /**
>   * struct pci_epc_features - features supported by a EPC device per function
>   * @linkup_notifier: indicate if the EPC device can notify EPF driver on link up
> - * @core_init_notifier: indicate cores that can notify about their availability
> - *			for initialization
>   * @msi_capable: indicate if the endpoint function has MSI capability
>   * @msix_capable: indicate if the endpoint function has MSI-X capability
>   * @bar: array specifying the hardware description for each BAR
> @@ -188,7 +189,6 @@ struct pci_epc_bar_desc {
>   */
>  struct pci_epc_features {
>  	unsigned int	linkup_notifier : 1;
> -	unsigned int	core_init_notifier : 1;
>  	unsigned int	msi_capable : 1;
>  	unsigned int	msix_capable : 1;
>  	struct	pci_epc_bar_desc bar[PCI_STD_NUM_BARS];
> @@ -225,6 +225,7 @@ int pci_epc_add_epf(struct pci_epc *epc, struct pci_epf *epf,
>  void pci_epc_linkup(struct pci_epc *epc);
>  void pci_epc_linkdown(struct pci_epc *epc);
>  void pci_epc_init_notify(struct pci_epc *epc);
> +void pci_epc_notify_pending_init(struct pci_epc *epc, struct pci_epf *epf);
>  void pci_epc_bme_notify(struct pci_epc *epc);
>  void pci_epc_remove_epf(struct pci_epc *epc, struct pci_epf *epf,
>  			enum pci_epc_interface_type type);
> 
> -- 
> 2.25.1
> 
