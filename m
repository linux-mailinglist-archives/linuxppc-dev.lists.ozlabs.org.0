Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 810EA8FF677
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 23:09:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oUEVBbCz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VwH5C4Z2nz3fqk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 07:09:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=oUEVBbCz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260e::601; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260e::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VwH4W0gn9z2yvx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 07:08:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kto19UZ43U+WUDF4Mq0YduH4hgJ535PaW70zvF9baqrAaB8mllNDiyG4Yceo3dirAt1ChNErzG6ikUhdW0Ut9GQ7ww6Z7a2LSQfb0PPYsBTDWJm2U6xQDvpqgySkgCsN+xQPZUMw+DeVDoolxOM/D/Z6ZW//j10MmAkO3ZrPmPwPW0UlEzg+ypahdE2b2arF5DDB6OrCliYQh5Fg5R7dId89Qcotwt1WIAk25ZCsjF8BvuHzKbNE14X6BX9ag9DvMD+xi/13MJOZnRs9phPmIOxDD+3ImbHWiTtQC15SFO6UeV7u2v5f07Xe4dwkH7h5T+efJwgf5U1aME56SEZnKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RS8ppJdVLQhrDqPtrigWBnclXjVsMSL2ukpQoSTMuec=;
 b=W6xWZuV5Srk9yTRBoxtbW3Fb9r3O4cDO2Jj4fNrmGcIHwke+eTNPZ+qVLjp1jEwSERZRm1mXeZ26OCeEE3zDTxKkh/jSn+lVYQayDA8LoHT3vwhIz5LcClLjwqV7U0gpohL/sSS78snyLRroU8y+i6hSPSUqFBJZiaNEn8CW9OnfAg5UchAtK3iLS0RvWgjtvtByo0N5e3ooxprZ5yPBLNOJBUHAIGG8twSDe7LM0bLPZHzFPjR3Ehk/t+caGSy+hSEVeYBB4R1D0k7jxylnAR+ePOHcUj9XSAWdTAv3lRrGES7B9mcke8QYcDVZ1uw6Da6DTKqaNLjhQBCGVyb5Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RS8ppJdVLQhrDqPtrigWBnclXjVsMSL2ukpQoSTMuec=;
 b=oUEVBbCzXhQFc5gMcYVbw3QgUhc1f9H/S+H/vuA2mt3hp6EBZuYhOwH7bFBpCvMYecZjYrjcl4+Jy7xKQ4IuTqNi0UatTnja1ZxPMcMwQ8xHESQMMseqScLrC6cHuR3IlgAr8sfOp3lc6FEexYlLyBrTWjp0bWvslFKGHlMdCoY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10208.eurprd04.prod.outlook.com (2603:10a6:102:454::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 21:08:24 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 21:08:24 +0000
Date: Thu, 6 Jun 2024 17:08:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/5] PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
Message-ID: <ZmIlO+kVWV+C1QiA@lizhi-Precision-Tower-5810>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <20240606-pci-deinit-v1-1-4395534520dc@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-pci-deinit-v1-1-4395534520dc@linaro.org>
X-ClientProxiedBy: BYAPR05CA0081.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10208:EE_
X-MS-Office365-Filtering-Correlation-Id: 57b188bb-ae03-4173-6833-08dc866ccd86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230031|366007|7416005|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?Cmp9kucf6joiw40WJjqx/DWOofgKQ8wuoVNX5FIBCM6jLCgTUwM1iWRhhXVV?=
 =?us-ascii?Q?mUG4T5lD4VyiboC9aAB+yLuj3nASw5FlFjqsglefQK2BEPRzdMIYDlu0A6cB?=
 =?us-ascii?Q?56u2eoO83QSDjogZy5gW81S0j8eCbEDRQrph8nvJ5u3V80NPUN35MmT1THhN?=
 =?us-ascii?Q?pcSurv0FD8/NOyLoIA7x8iz47Tn/FR0JcVbtbhRP5yMbVlx4qzIex0qBem5n?=
 =?us-ascii?Q?/4qAMPN+n9/SHWZXyf4rQEWOElUFB/VjeZDcuPm/ct6AQ7/Qt3boy8hu2VX+?=
 =?us-ascii?Q?hVSgzt6fLwgsdhfNLDLa99VLrhRFd0Cf/wApl+hKvb8uk+He5+AmYltfnb5r?=
 =?us-ascii?Q?oz2jSXSxCkfsI8+SXXkcHD+341CiD/TNBuALRRUxCR8ZXTYRqj95eL726VDL?=
 =?us-ascii?Q?YwI2rm7m/iiatQjiwg1H2PkXXZHUxYlOq5xRcDy3S/hVSpIL0tXtkiZIda6O?=
 =?us-ascii?Q?zhprnS2YasdppXpSXwbbFqJJNeErPPpDfH+O8rccp2xIZ8UzW2kO6l2ijEUX?=
 =?us-ascii?Q?jHocY7VOrwkcy/YxygzmXg2bFN6zbdotXnRw3zwUx2QUtsgv9O67E6O35jDs?=
 =?us-ascii?Q?EcAebNOZb4F4n5m0D7gPeElUs3BX58sVur0FXwQvf/UZwirNIJ8r3a1VLl+M?=
 =?us-ascii?Q?1kZ+MSjqU9yRcqb2Ix/9o0v9yc8RsRGeKz0HIUrTcC9b9ZvmTAI+VbqX/np3?=
 =?us-ascii?Q?zQ+m0TRzg+FzfK4NAzv2SdNV1jcDD1/1W51zr2+vb1+H0amZnKVCD44fuIOr?=
 =?us-ascii?Q?88RQ1kig/PSeI3wnzHCPaXyvR0tRV6W2lI5dw1x42vEMrctw06OwvMjDZ+xE?=
 =?us-ascii?Q?9IdxcnhesXUpJxhSnv+rNohiLGH1yViO310M/8BrDqgvM4MOutVkuLGkw0F/?=
 =?us-ascii?Q?AsldtjRDGKwp5ZVSy66QlbNROZRVV4otjMB+EVCOwCfI+WeOy2/NyUQPLLcK?=
 =?us-ascii?Q?CrNgQnTqd+Xryolcny3gry+T281knAHmh9wN/KDLdcANvDMhB1VjqmP/OBjv?=
 =?us-ascii?Q?/XNo9/xsMeHLTyhubEtwgYeEC0018Y3d286FHts8wXL/13S4X5cdHwci+Hd1?=
 =?us-ascii?Q?BCxk14QZDJNq9N7ht9+ZbnRXRduXybmO0eaEfKiuQcBnzVshp7edKN1FjTCy?=
 =?us-ascii?Q?phuzNUIH8WF5YMLZ3iCmi3RN2Yzf+EU+YjJxklUAJHNoo6FOYpeco6QpHmdv?=
 =?us-ascii?Q?e5Pb+LlIuGIttDWka7m+EjuBy5z7g+rQHJtlKaQHdSnh6WAC+a4Xrb9Nndv8?=
 =?us-ascii?Q?N+CPP5P+9tgYEkLU8UC7xtdsQgDvOMruh0/89srgGSVIul6b+wtf1pDk1zyl?=
 =?us-ascii?Q?Lu7ziatrrYcl1Th49NnRuL3kHbRi1Zp3YIan1OvbRBrvHFsmVaTEGbHwxa/i?=
 =?us-ascii?Q?tD7sY8Y=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?gO+aqO65ljzF9JhriNTewCs2lCm1zkQIiqPf8UQzjuIcDruY+nvirlsy9erP?=
 =?us-ascii?Q?8rKtDBzV2hZYGcM9NxGAm7HZ5MkefJ4VuLLZjsPZeqWMwgwzW7UJA2mP9Qk/?=
 =?us-ascii?Q?Z8RGpngyOuigbSFZac8et+fUxSNtYgTPnxVeKTQsp0TG2FefE4CVE/wwnmGg?=
 =?us-ascii?Q?zNUaQ7X4mCDfyz8zVh5cFsAGh7mNTx2mlo0JlzVRaEyRkTujv+mpLWJh4cxa?=
 =?us-ascii?Q?Ji8Lg4QCMrMPppDiOJ+5+1qw4z5UVDhIkjiuHaNcYFbZJc+N4MS6GuDg1uBs?=
 =?us-ascii?Q?qKykqG050ZFTdUUSLLJSoL/2l5ow8t8vkytVz6YCp3n4I2H584q1+04wH7ef?=
 =?us-ascii?Q?XYxMwu5onJ8PlF+kATmp7CvMA1DGQT1qqGYhOf+HmEy8yI476J3z83SOZHp6?=
 =?us-ascii?Q?aDs6APQhCgkL4vdsHpxBm/PhM0hOPN+nPBkBPxwQNpwEq1Mfraj0bQyIYr9/?=
 =?us-ascii?Q?UdInFS8CBcuflGskTaQ4NZL83EP6JLcIZvp3HC21fnVrqahBe2qVe/ahdCj6?=
 =?us-ascii?Q?gm6jmb0x9LQ1g+Ks+GzDra6gF4tawA2oUOVgqPMrcqAzcpogyY5NlfsGzqcv?=
 =?us-ascii?Q?jyGWLTwLKNgzOcErZzYOyAf2e0zJhebO8byHoFMtDtslEI60c5T3nhKnJTCm?=
 =?us-ascii?Q?ayByogVHQvX+OYTrXOVdhgNp6Qz8n2Bs67IpdDkW3m2sjSegQmtDdn9Lbs92?=
 =?us-ascii?Q?QxwL0YK3LMjnMrju0lfYB+8CpbM9RqqnoUg4036lOWkUkCLKJ+oFhc5+aQUf?=
 =?us-ascii?Q?dnHa2aj4Iz+5xrXu8QeExUtDe6pDVe0FokRWDrIYcEB+AzXw6afJ9NJ3Ttt6?=
 =?us-ascii?Q?7vfGiU0RMZ0Eal9GeLk6oqT+upoTtyUisLF/u4LkRGB2LQbRcMcMUi7x3hEy?=
 =?us-ascii?Q?15NJiGPu+E7uPUn2gB/sy7H8sOe5hffWfB+/bjO4DyKyGAlnn7V00QgCI/u7?=
 =?us-ascii?Q?A/MNZcjWA8fMBGlwLdj+A017BCGw/m+52+yQJWSBmF8upANbMVfQu8h7otUR?=
 =?us-ascii?Q?jcY7p1cj+MzmwyDVL9Emzvg0/kkYyHsPgH753LRqpUl8mYXJj2Kh7Uww3wFX?=
 =?us-ascii?Q?k33i4eGV6w5fCrpUus5R2PBsGXX9Z6kgDl3yKwRGJRqjfpN2upyHr8A3pwlf?=
 =?us-ascii?Q?+UbUsNa337G2zBiKu7BhbI1+UGdUTAOEWeYVnDqpUI4VTqIGv1+mClTYQLY9?=
 =?us-ascii?Q?ArG6vWZYRBiPaTpxKm4g+FXazsIeurzB7IGN0UYth9dDQ353vwMrOdbVD6l4?=
 =?us-ascii?Q?zT99rhsARnQCx1z/h89/14h62In9UaljX9aqqscwGMlF7NBoeWXvR0QVV+El?=
 =?us-ascii?Q?IZvoFfXrOGeG53eIvuqK7duY0Dz9lA33aTzRRu6Ey25hBg4oBOSnloGmIAWx?=
 =?us-ascii?Q?uHMo/9shoswEqG31el5hb6y+fdGRf0zLI0TZjTY9fVAiUA1Tr030i8xmiffz?=
 =?us-ascii?Q?UHxNfGZUtf4/T6bqBFhen9iy0X0Fvu/P2XL5FGOY6GAMtIMStFhZbPFTwojc?=
 =?us-ascii?Q?g/XQa9UBC2mY6TWKkvsMUUA17KAOWQfL9iiMM0SURKBrT5xvEaK+w3a28Nue?=
 =?us-ascii?Q?OMB/SO67CBY+5maDUU2jG3TkieDR4dGw64ICmBvl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57b188bb-ae03-4173-6833-08dc866ccd86
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:08:24.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bDTq7qRU3pMpwxMqjXkkuzHwRKY/OTUQRpwCsQon00Uz/7Fjb8y4AC6jYjUHgVvcwsBf58XyUV4LsrO524ZYFA==
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

On Thu, Jun 06, 2024 at 12:56:34PM +0530, Manivannan Sadhasivam wrote:
> Currently dw_pcie_ep_init_notify() wrapper just calls pci_epc_init_notify()
> directly. So this wrapper provides no benefit to the glue drivers.
> 
> So let's remove it and call pci_epc_init_notify() directly from glue
> drivers.
> 
> Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pci-dra7xx.c           |  2 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |  2 +-
>  drivers/pci/controller/dwc/pci-keystone.c         |  2 +-
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |  2 +-
>  drivers/pci/controller/dwc/pcie-artpec6.c         |  2 +-
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 12 ------------
>  drivers/pci/controller/dwc/pcie-designware-plat.c |  2 +-
>  drivers/pci/controller/dwc/pcie-designware.h      |  5 -----
>  drivers/pci/controller/dwc/pcie-keembay.c         |  2 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |  2 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  2 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |  2 +-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  2 +-
>  13 files changed, 11 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d2d17d37d3e0..e491d0ff3962 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -474,7 +474,7 @@ static int dra7xx_add_pcie_ep(struct dra7xx_pcie *dra7xx,
>  		return ret;
>  	}
>  
> -	dw_pcie_ep_init_notify(ep);
> +	pci_epc_init_notify(ep->epc);
>  
>  	return 0;
>  }
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 917c69edee1d..a876b8e6e741 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1131,7 +1131,7 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  		return ret;
>  	}
>  
> -	dw_pcie_ep_init_notify(ep);
> +	pci_epc_init_notify(ep->epc);
>  
>  	/* Start LTSSM. */
>  	imx6_pcie_ltssm_enable(dev);
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index d3a7d14ee685..ca1054f5c79a 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -1293,7 +1293,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  			goto err_ep_init;
>  		}
>  
> -		dw_pcie_ep_init_notify(&pci->ep);
> +		pci_epc_init_notify(pci->ep.epc);
>  
>  		break;
>  	default:
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index 7dde6d5fa4d8..35bb481564c7 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -286,7 +286,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	dw_pcie_ep_init_notify(&pci->ep);
> +	pci_epc_init_notify(pci->ep.epc);
>  
>  	return ls_pcie_ep_interrupt_init(pcie, pdev);
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-artpec6.c b/drivers/pci/controller/dwc/pcie-artpec6.c
> index a4630b92489b..dc8dd7f27b78 100644
> --- a/drivers/pci/controller/dwc/pcie-artpec6.c
> +++ b/drivers/pci/controller/dwc/pcie-artpec6.c
> @@ -452,7 +452,7 @@ static int artpec6_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> -		dw_pcie_ep_init_notify(&pci->ep);
> +		pci_epc_init_notify(pci->ep.epc);
>  
>  		break;
>  	default:
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 47391d7d3a73..2e69f81baf99 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -27,18 +27,6 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_ep_linkup);
>  
> -/**
> - * dw_pcie_ep_init_notify - Notify EPF drivers about EPC initialization complete
> - * @ep: DWC EP device
> - */
> -void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> -{
> -	struct pci_epc *epc = ep->epc;
> -
> -	pci_epc_init_notify(epc);
> -}
> -EXPORT_SYMBOL_GPL(dw_pcie_ep_init_notify);
> -
>  /**
>   * dw_pcie_ep_get_func_from_ep - Get the struct dw_pcie_ep_func corresponding to
>   *				 the endpoint function
> diff --git a/drivers/pci/controller/dwc/pcie-designware-plat.c b/drivers/pci/controller/dwc/pcie-designware-plat.c
> index 8490c5d6ff9f..771b9d9be077 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-plat.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-plat.c
> @@ -154,7 +154,7 @@ static int dw_plat_pcie_probe(struct platform_device *pdev)
>  			dw_pcie_ep_deinit(&pci->ep);
>  		}
>  
> -		dw_pcie_ep_init_notify(&pci->ep);
> +		pci_epc_init_notify(pci->ep.epc);
>  
>  		break;
>  	default:
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index f8e5431a207b..49ae845a3662 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -670,7 +670,6 @@ static inline void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus,
>  void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep);
> -void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
> @@ -698,10 +697,6 @@ static inline int dw_pcie_ep_init_registers(struct dw_pcie_ep *ep)
>  	return 0;
>  }
>  
> -static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
> -{
> -}
> -
>  static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
> index 98bbc83182b4..278205db60a2 100644
> --- a/drivers/pci/controller/dwc/pcie-keembay.c
> +++ b/drivers/pci/controller/dwc/pcie-keembay.c
> @@ -442,7 +442,7 @@ static int keembay_pcie_probe(struct platform_device *pdev)
>  			return ret;
>  		}
>  
> -		dw_pcie_ep_init_notify(&pci->ep);
> +		pci_epc_init_notify(pci->ep.epc);
>  
>  		break;
>  	default:
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 1ecf602c225a..4d2d7457dcb3 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -482,7 +482,7 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
>  	val &= ~PARF_MSTR_AXI_CLK_EN;
>  	writel_relaxed(val, pcie_ep->parf + PARF_MHI_CLOCK_RESET_CTRL);
>  
> -	dw_pcie_ep_init_notify(&pcie_ep->pci.ep);
> +	pci_epc_init_notify(pcie_ep->pci.ep.epc);
>  
>  	/* Enable LTSSM */
>  	val = readl_relaxed(pcie_ep->parf + PARF_LTSSM);
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index cfeccc2f9ee1..237a6a8818de 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -437,7 +437,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  		rcar_gen4_pcie_ep_deinit(rcar);
>  	}
>  
> -	dw_pcie_ep_init_notify(ep);
> +	pci_epc_init_notify(ep->epc);
>  
>  	return ret;
>  }
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 93f5433c5c55..432ed9d9a463 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -1903,7 +1903,7 @@ static void pex_ep_event_pex_rst_deassert(struct tegra_pcie_dw *pcie)
>  		goto fail_init_complete;
>  	}
>  
> -	dw_pcie_ep_init_notify(ep);
> +	pci_epc_init_notify(ep->epc);
>  
>  	/* Program the private control to allow sending LTR upstream */
>  	if (pcie->of_data->has_ltr_req_fix) {
> diff --git a/drivers/pci/controller/dwc/pcie-uniphier-ep.c b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> index a2b844268e28..d6e73811216e 100644
> --- a/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-uniphier-ep.c
> @@ -410,7 +410,7 @@ static int uniphier_pcie_ep_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	dw_pcie_ep_init_notify(&priv->pci.ep);
> +	pci_epc_init_notify(priv->pci.ep.epc);
>  
>  	return 0;
>  }
> 
> -- 
> 2.25.1
> 
