Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CA77B8234
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 16:25:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P5ZJWILL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0xmZ3Tngz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 01:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=P5ZJWILL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::61e; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061e.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0xlf36gRz2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 01:24:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRZMpaw/kuK1k+D4VE/ERX9mhfK1sVm50ErwUg5G+xkCNU6kktM7yw/SBXDVtiRCzbgANtcbiiLSqxVcyEqUD2KAP0Z5WSA+ANVhrtgBGpZsvdCRGhPwrtZ6PNneSJtTdy6a7JbZOy7IRWE4AX+hAhAEpv0CeeSKl2LnBgxlosvU2BXxUp3n1HPXbaTvXmvYUWCnmQ1C99eWQKrsWWK8Q2b9yEBEIYIm+D8QEZDUxwfp4PSzkMO9lHRZl07G2TbaX2lJUr1tHXxqxo0pnSuU8pwee4fuODPW+RVknmBdePX6PLN2n4PI3Fqh0NUlyPPBo6uNYdwGperwtCNbh2l+tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYtu2oeC9KXNKCx3UoYi6l/fMlPWlLTDGlkVBfmcCi8=;
 b=hBWOwudo08hUooZEeh8FlYgWVppDYJq5+5jKars/YzkwgaoBQgBMXp2NTlvNcrLgDGa1tIsyhDZC9yAjVpuLlk3KaAVvCEONeCXB+aPatR959ACA8sZf1RruCM4iEE4YKcwpCTTfSOuLnCWzN983e8fa6jrxT5ulp74we26EFBbAsXIHofolDmfw7DGVNMYy4vVz5UWmsmzg3n/1Z0UhalStSKaVvAaBJjKcANtnLnD83D1htI+JvHZx8mpdHhFn5MdKwuese6u39w+anpkQFLOHzGjHUqlMIccC8Mdhix2Jok48hLA80gct5ZL9xC1xOM19mIjX4FkTPz63Mdge2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYtu2oeC9KXNKCx3UoYi6l/fMlPWlLTDGlkVBfmcCi8=;
 b=P5ZJWILLR8PHD9cIMsZwK8LduWLE6O+s6NQoT4fVGHanxYnDhv8eAwRGMKF8b4h2M9wIr12rLkdwkxNddFAPTDe3jbWzxnwhox/WpTmSRemnn0toSrRT+1BW2/Sar44nBi3rSubNalwTGFLoHUQWpxiOgjOR/ggkq2LeD5XmF28=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PR3PR04MB7483.eurprd04.prod.outlook.com (2603:10a6:102:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 14:24:04 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6813.027; Wed, 4 Oct 2023
 14:24:04 +0000
Date: Wed, 4 Oct 2023 10:23:51 -0400
From: Frank Li <Frank.li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] PCI: layerscape: add suspend/resume for ls1021a
Message-ID: <ZR10SVVBYvfMJPv1@lizhi-Precision-Tower-5810>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915184306.2374670-2-Frank.Li@nxp.com>
X-ClientProxiedBy: BY3PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::29) To AM6PR04MB4839.eurprd04.prod.outlook.com
 (2603:10a6:20b:10::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PR3PR04MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 52641c2f-17eb-458e-f17d-08dbc4e58f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PB9uNBKGObXc1WVWCKN30PEYP/UPu/6CrEaIMt/OtgnIVM33EftaqoQvgcDTjVWitrwWnySSf9KuFiWGciDnn4JxGWSlX86mu8TvhQk1LIAr+xX6R/5JmNU98RN5q6SSmtGRR41WfzoU7lMCekC+ARgKozJa5+gi1Rphe7R4f3WcFetknU0810O0LqMxjrhp9HVsp0o/RP/Ht85cBmUA3svEtceCA0aBBFkpQHWQxZCIR5smWoZ2IWG1j1hsqLANVnwX8D/YY9AAEh4gvWpim+FZwOFV3Ous1rxsGtnJkMvrvRa4Fk4Ismkay8ipGAygmoph5IixJtXRiraIK/gt4u4IIrTWYQ1SsVe/relOTpaxJXCwFSfP09Xb3lIkn9Q+/uuKHYjxuVlV8HiE36X3ffOsLK5MZGMbw1AK7Vy+n1letwC4FOxb+8jLiWUbSTK6iyaCiSKbmYroLvHLwEbUCF1xHFZfAogenmMM4af7U4HG0+PddqhHtMStxMcIsevqIBcs5rKEOk1Ml+UFd72THhbssgQQngPiazY1hqDtSRAxr18vyh1u9pGp0wTSRNz0dsqRUIvJTYfxbakv2k476sPFnY4J61elh3N/Mcvl7Laq0IiSYM80RKqmEL4D/5aYEvGWlaFjLZWvrTN+fLnK0w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(136003)(366004)(396003)(39860400002)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(921005)(83380400001)(26005)(38350700002)(86362001)(38100700002)(9686003)(66946007)(110136005)(6512007)(52116002)(66556008)(6666004)(6486002)(6506007)(2906002)(41300700001)(5660300002)(8676002)(4326008)(8936002)(15650500001)(478600001)(33716001)(66476007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?rNvXiN6wplQsfWqS1E02Hd8gLapLEBrfzkN3S+u2bZJ+amKrP81bn+mc0LKB?=
 =?us-ascii?Q?fZnzrZbSuYVBsfLnMmNPVpyG435yaXV9ttaeJLIgMfyQ8tweJ/zpmwXk5MDv?=
 =?us-ascii?Q?cOt8lL5hUTvdq58gKGQiOHAvr4/t86+kubgWAdDqd0VtgKVEIiGMECDcDj30?=
 =?us-ascii?Q?9NYGjO3Xo1VVDM07DK56PePA4p5tiHqp3WZH9gnIbSH6UUuJJPX1bYopv9fa?=
 =?us-ascii?Q?Cc0w6d/yACLgclLSLmYSyykoFcii8SyO3Nh4QyJiYm6MrzTL21yBrnFEHnTL?=
 =?us-ascii?Q?2HE0c4WdMAca74xebjrnTbImBmbaLH7smGISO5g/0LJAXkp0tkbEIAruKI+j?=
 =?us-ascii?Q?co+IuDHMaL1aM/5faO6kLrNUOTkKTWZt/SFh1r3arccszAFDMS2zTba8tsNH?=
 =?us-ascii?Q?80mxbDlGN1pPVhe4ulTM7hzQu2qqdpNmF3116v0/qqzZHfAwv0nCpo8GMZSe?=
 =?us-ascii?Q?8XilVoPdxZpYhXs77oVolohYlcMYPZvVGJ45H6lroseMPapneYl9Gq1VW4SQ?=
 =?us-ascii?Q?Mhx9g+qp6C+kqxYJn7YuET8WfivGp0bkOLrQGUKFHQER1n2aC9eZhl1Ix1ym?=
 =?us-ascii?Q?J5TBs1saa5FCdlr+gKsfyZyJzZpnhR7AI1v4oxTCY+dGrkm0HPrI7VwNO6pj?=
 =?us-ascii?Q?12pAanlQA8UI36O8oD0iO8SNcr1naEfGeH3/QJWgIqYlnBx4M8amaH3e7stT?=
 =?us-ascii?Q?EGV7ZXUn/N1EKjg2GDLx4AXhvxqxcSTCS9s0AmVwesn5acgfdE7F22x6jz/0?=
 =?us-ascii?Q?qIyCZtpVzYKlkw39u3NIH5p5i6m2z606iBy5cdmEIF1cOQ9M5ubZ5OBNH19x?=
 =?us-ascii?Q?z9wxSgPZRKDoQQxS8YmbcRtuNe2E8vXAhXFhCUz621y/xApbsx56WtSK+0oc?=
 =?us-ascii?Q?IUIfnDnV4hZVSNnap1P3o9StvFb3JG898ox+jDWaM3O5gZNCbUMV3VibSZ6N?=
 =?us-ascii?Q?lmyCwVecrYKURBly3RbttubDoJR1huvdwq70vIAjQCt1FzKhWPEXdlqD3yDi?=
 =?us-ascii?Q?KfffMIa5PHcD9h2hVkVkrXUu52hhjLWUpHgZcoARJLsLdIyMiZlSweXzWfq8?=
 =?us-ascii?Q?SeMUkB15zpA0rAac31hmJaOOsC6qjpixCooVURkGKCcwSoGlnLasUDuiX3Ae?=
 =?us-ascii?Q?eY3x+ckvOXP3GXoOFVupwZx59SX9Wa4jmpBrNi3o0E82sqnQyjiAdAC6EAko?=
 =?us-ascii?Q?xJZ7t3Zh7p0kyY76dQtxszOcJdRqSG9FTrm2y+ysrrSuFd8vu6liAivBN1aE?=
 =?us-ascii?Q?slumjkq9tjnI5FF4WPIAshdPaBHNKQPtDDtp9op5AYIooc6taN48HgBz6H4/?=
 =?us-ascii?Q?J2WYOEwd2+BjY70rrJJGLqyYSfMQ9jspT1Mmh2djHYvDmfQS2q4Sj80Vb3nh?=
 =?us-ascii?Q?bs0q9yuewqPrEeabQEvPFGlc/No+g8TYC3RAp7IOYStCViYyLvxIRBkhleVj?=
 =?us-ascii?Q?mUJN8fwWbwX4auEh9dbt35tQ/Gf2XP3So3WjXLQzIpx6A4ZNmuiMHwoWPgvd?=
 =?us-ascii?Q?pXLfa5nSD73fi+FKjiJX6xZMSFUTxA9FRWACdeWQts1yj1hfAo49vpifHtjI?=
 =?us-ascii?Q?YDcT9M9lUYH4Ymxp8/GBtDphT5ZmHigujIM09BiA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52641c2f-17eb-458e-f17d-08dbc4e58f09
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4839.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 14:24:03.7995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D1w8ekDqpzt0/MveuGgwH6oOd40ghieNZHnhEvcdSDuKLpNZjVy+ZXZu5fAXhe6EVIL3MwuTZ33Wn7ex6RdoDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7483
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> ls1021a add suspend/resume support.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

ping

Frank

>  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
>  1 file changed, 87 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 20c48c06e2248..bc5a8ff1a26ce 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -35,6 +35,12 @@
>  #define PF_MCR_PTOMR		BIT(0)
>  #define PF_MCR_EXL2S		BIT(1)
>  
> +/* LS1021A PEXn PM Write Control Register */
> +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> +#define PMXMTTURNOFF		BIT(31)
> +#define SCFG_PEXSFTRSTCR	0x190
> +#define PEXSR(idx)		BIT(idx)
> +
>  #define PCIE_IATU_NUM		6
>  
>  struct ls_pcie_drvdata {
> @@ -48,6 +54,8 @@ struct ls_pcie {
>  	struct dw_pcie *pci;
>  	const struct ls_pcie_drvdata *drvdata;
>  	void __iomem *pf_base;
> +	struct regmap *scfg;
> +	int index;
>  	bool big_endian;
>  };
>  
> @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {
> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}
> +
> +	/* Send Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val |= PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +
> +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/* Clear Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> +	val &= ~PMXMTTURNOFF;
> +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> +}
> +
> +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val |= PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +
> +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> +	val &= ~PEXSR(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> +}
> +
> +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	struct device *dev = pcie->pci->dev;
> +	u32 index[2];
> +	int ret;
> +
> +	ret = ls_pcie_host_init(pp);
> +	if (ret)
> +		return ret;
> +
> +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> +	if (IS_ERR(pcie->scfg)) {
> +		ret = PTR_ERR(pcie->scfg);
> +		dev_err(dev, "No syscfg phandle specified\n");
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> +	if (ret) {
> +		pcie->scfg = NULL;
> +		return ret;
> +	}
> +
> +	pcie->index = index[1];
> +
> +	return ret;
> +}
> +
>  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
>  	.host_init = ls_pcie_host_init,
>  	.pme_turn_off = ls_pcie_send_turnoff_msg,
>  };
>  
> +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> +	.host_init = ls1021a_pcie_host_init,
> +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> +};
> +
>  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> -	.pm_support = false,
> +	.pm_support = true,
> +	.ops = &ls1021a_pcie_host_ops,
> +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
>  };
>  
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
> -- 
> 2.34.1
> 
