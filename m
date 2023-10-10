Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB17BFF08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 16:21:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AkDktHSw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4dPP6HSTz3clw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 01:21:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=AkDktHSw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::613; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on20613.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4dNT4P8Bz30hY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 01:20:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LsDcktF9GILGaLKnEkK8OAqFnjF5mzr5SF8zOqK8vFnD1EIftEdhfPi1QzR3Bw+C68zHYweJSwlVHvCZWCTWqBaCrHlIQ9925M4eB69D6xOkSgG0en0MhLlEpo826hbVzVBRS08AAbopXeFY/yOwbO3L4Zy1FPIMhGQ/hpB/d6bQ3OtWYM+AXqk7NIaGBe2JTyDh0IWVaZBOjY/SmJXLLvpIppo0n5ZnD0OQ2xJ+2LpiY9IHejQaaN88PvEGM9o7+jO0HzVOkaOGQcQKAmm2BWzEoSS7/f/LzZw9Dnkdx8VddzW6/EjB3siWebeSXmzymFqBC8zmpOxtNvvEA8Qldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=str5WewPPnqx932ARUdi3x5N4TsmQ6BTFaYOgUmdSpE=;
 b=A1gi1jbhGnYPe7av1BkBhFhJA7LYQWKllCfTUleULnZEqPH572v0pUWenbneVNyuvzfbCLIWzAtPKe3WqEbwAnuY9i7JJIV7r/Fg1mYg9Scnesf0hEoLX1xDEfshRTbw4GNRV7Ed9noJk4MXhLyhUMFCti/HQ4bixpdrx26cQXAfCgx/35Z+Cb1DtrBFF0dLjOLjBQeN8zX0htDxTsSklFHmphdOwmgNhUNy26A69D9k5GM7MEpMOw+xB0ws4AeT3WVtRm6S1N8NOLXXh8FF0Zw3l+de2yM+vo7+COiO5zPA3QT0E1ex+dLR/d8RfRaEeBzj7FsKGjs7Gower9kZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=str5WewPPnqx932ARUdi3x5N4TsmQ6BTFaYOgUmdSpE=;
 b=AkDktHSwhdOGOotdTvXHd94pTVUQFl2lZSjgJj0WvCX4WhDi66mWCTE4QE9sDkONLyOTOI61K/z8e7JPRY1u0qzsOXgZysuzPCrDzi2ZGvonzTkpmM1ixVuhugdy31bluAuq3rzq1Cp4OOv2c8OaE8OzMM8ig4y74GYoGS18n0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8997.eurprd04.prod.outlook.com (2603:10a6:10:2e0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 14:20:21 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 14:20:21 +0000
Date: Tue, 10 Oct 2023 10:20:12 -0400
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
Message-ID: <ZSVdnAsRQA2zHsF7@lizhi-Precision-Tower-5810>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
 <20230915184306.2374670-2-Frank.Li@nxp.com>
 <ZR10SVVBYvfMJPv1@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR10SVVBYvfMJPv1@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH8PR20CA0022.namprd20.prod.outlook.com
 (2603:10b6:510:23c::22) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 0afb5a55-a43e-4f10-6f1c-08dbc99c095c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xbZJvsJjD6PLcxMRyfccgiTzHNdLA6cwk8mI/gG+olsrBG+NiFpv+Czx6NmBbTpn5Xx+s6rZvBrfLlsXTrjR6wixXUwaZap0Hoore+khfY/to74cnjXvLMzPz+yNUbWy2iiM7IjPkcPzJmvb2XiKMeRruuPHJGzLZRyx3x7mx2P8c9I53SW6M7tFm7S6EFHQwXAl+KzA/Ts5mlswGqmB/u8cXKxb4xt3/w8I0GvOgO4qIZWzjhIxh57uTVo/Hf7DNrekQ9Yd5eMbZhI7UO62VjHhg2n4nSioT6eAP+xlRmMT1SgHHpBCKJKw+4Lafj5euLU1zTe02sM+jeBI8C0BfYE1lBFxmFkBc1R+tM1AaFC9pROqPnkD2RyBWeLJlRaqpnKeRWEKGbkZC8Afj1XXLuk2qKkt3vTh8M8mjzvf3nFhcuYPJm764CyLSnciL+vBkhMGek8flVHaz3HhEi4KpcSkSwfd+Li/+Vc5Eeym9yG45lcaGbz5/DlCMBhvZ+5n6QLdVyKQweFDQYMrzIAUlg/V3jhRTfBI+G6M06SZI1IiwhpEG2mFZbXQWlF0KHevZyXF1W7628ikstyuJk3fQbmlCRDTtufeqLBg6w0okDLEtXxu7yCtgzahf99BSeQRZ3FwF29S6Km88OA60u49kw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(346002)(136003)(366004)(396003)(39860400002)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(26005)(478600001)(6486002)(33716001)(6666004)(9686003)(6512007)(6506007)(86362001)(52116002)(41300700001)(38100700002)(38350700002)(5660300002)(66476007)(66556008)(66946007)(110136005)(316002)(2906002)(921005)(8936002)(4326008)(8676002)(15650500001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?G8t30BKJViMcOJApyJFgJHfnHnZEuzJN/jUqYkyZl0rNqu9QLxAYpcGiYIFs?=
 =?us-ascii?Q?ieCY9GeuV+ykwK2fWSL1JZoixOiI2Cpm+88vOvZMCApTP8pQrHQ6tqUcW9Aa?=
 =?us-ascii?Q?qwCJK6IhrABkF48OY+UuxSMj44SMIvphLFSEYd0DCYsgO5TSW/wxzG15nB1r?=
 =?us-ascii?Q?jeuLO+Vg2g0+ncVmZL3J+BxenbFUIGyuUSf2jsoOYMudj+ERM4eLx5FB0mra?=
 =?us-ascii?Q?ofGRRvn9SYlOKG6EG56/TKP63v9E/7PrUP1MB5Ee1WPXi4KeELzXJ7RqXr7j?=
 =?us-ascii?Q?3+YMDbmyz+KSb3HQ0/d5C/gk4JiVNVDS9ucTJ7oynDHfg+szvxmmgx1i8sh7?=
 =?us-ascii?Q?WzNyDu4H0ifGWcgjLH0zmZvUfwJtkzNhCyIk514JJWDvbWn4UvVpMZvkWFmj?=
 =?us-ascii?Q?Smj+Ao7OP73RW6Z1JtiEMZovcC5S2B+QVHBF2wrVHwE8njoQ4iAYZyQZ0BAy?=
 =?us-ascii?Q?du82pj7GZZp5yxILRJjovCovJrMlD9Fl1yOHhvjL02iNs3oEVB0YDbz0OaBk?=
 =?us-ascii?Q?v9PU3/pU0JLxk97wgzr6i340uy743rChUqNU/ZfUCV0FF9QTYEn6L514Zb/7?=
 =?us-ascii?Q?YSxgehDlccmbarsI/NeJ+FqPkiVaAI1Xch3IF7QjbedZ7DC9fhShHgUKyCCp?=
 =?us-ascii?Q?PoZYAchZFl8NeahAKnMX4tTtQbq/03Z3EmIV17fDq77ke/dRPVFoQzBT+Cn9?=
 =?us-ascii?Q?OhdhloEAWlgFdbF88c/SK+fqS0+hUtsuiJWeGX5tB9/PWzzBQNneC+8eLkRn?=
 =?us-ascii?Q?AxurFL8s6/Uq5J1zVVv5Dvo0cikNI6Qb7dFgSnaWE///5rxiKdgKQKD5v7Lc?=
 =?us-ascii?Q?dEGxifjeFGNwulfTy4ZGPHca0PXLDkneCdFhxGKCrn1ij3neU5IifWCEUj3z?=
 =?us-ascii?Q?BTHqrxL8PZ5453H8X0dztw9dQzBEIUdGEjnmW9uWBUSXeJGdGaBRuQaVGSYL?=
 =?us-ascii?Q?+YgdXaY7IfxpAs2+LSDJ4oQFMukKNUyktQs7Vq+wzsMotGQLijcUxC1dV74r?=
 =?us-ascii?Q?CyBrm/s/mHtmjfqmcA2Fj+bPWNBsOOMvj7oa3cSn5qNn6T8MVhWyFVqwnwae?=
 =?us-ascii?Q?AsCB1IXepi1hhM0j2UhtukTkjkM1dUJYMV4GSiQiRTXySta/qghG4YlAmnOA?=
 =?us-ascii?Q?60jqzqNoVVtgCpcdYoLZvnd0Zm02ek3Ft1LHoPRNJf+YBoUKBFzBjWAdr4Wl?=
 =?us-ascii?Q?glILnWqRU8tYsEp4RP8bD5PZVOOCbSnKvxuNraeVdH3o6W559QserkF+OJa3?=
 =?us-ascii?Q?STozaxf7AeRmc/F5xu3Z/Fof+52bIazvqQbTONiIEE1jHYZ/5qJqG5NGPnuH?=
 =?us-ascii?Q?98D9RIPa+4q3SRt/+1h7KhJhPCJ3yRPCTOAag/k7K1ZdJnC9Gmu2XTnVSvUp?=
 =?us-ascii?Q?ecwfnAjn8ANPlApYhcPWCszUuXT+A2sQ4gTj7is8VE6GXjB9aEUsX53nWlI3?=
 =?us-ascii?Q?3Nkyl7FXRRiaB76bnRXSMVYyI9tmzkjjaAvIfWFXueefOPrSqIek4uBUZMZe?=
 =?us-ascii?Q?nzxzaUPqueSt9lQaXCJ94lzUqd/erDCFXmcJBWRIBqHj1dKTpjx/v3TWrHRo?=
 =?us-ascii?Q?IXUjigZrYoZbKLhqznVXf2jezjIUxlk6PVBxNqwN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0afb5a55-a43e-4f10-6f1c-08dbc99c095c
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 14:20:21.4888
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lciSA6lUug11LaXans1FS7N9yA8Txn47D0KYO7lCcuB9BSMOtg3feFCXrzsLWxUHFT0mRdktaFGpMpCdm5vgiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8997
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

On Wed, Oct 04, 2023 at 10:23:51AM -0400, Frank Li wrote:
> On Fri, Sep 15, 2023 at 02:43:05PM -0400, Frank Li wrote:
> > ls1021a add suspend/resume support.
> > 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> ping
> 
> Frank

Ping

Frank

> 
> >  drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
> >  1 file changed, 87 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 20c48c06e2248..bc5a8ff1a26ce 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -35,6 +35,12 @@
> >  #define PF_MCR_PTOMR		BIT(0)
> >  #define PF_MCR_EXL2S		BIT(1)
> >  
> > +/* LS1021A PEXn PM Write Control Register */
> > +#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
> > +#define PMXMTTURNOFF		BIT(31)
> > +#define SCFG_PEXSFTRSTCR	0x190
> > +#define PEXSR(idx)		BIT(idx)
> > +
> >  #define PCIE_IATU_NUM		6
> >  
> >  struct ls_pcie_drvdata {
> > @@ -48,6 +54,8 @@ struct ls_pcie {
> >  	struct dw_pcie *pci;
> >  	const struct ls_pcie_drvdata *drvdata;
> >  	void __iomem *pf_base;
> > +	struct regmap *scfg;
> > +	int index;
> >  	bool big_endian;
> >  };
> >  
> > @@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> >  	return 0;
> >  }
> >  
> > +static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	if (!pcie->scfg) {
> > +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> > +		return;
> > +	}
> > +
> > +	/* Send Turn_off message */
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val |= PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +
> > +	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
> > +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> > +
> > +	/* Clear Turn_off message */
> > +	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
> > +	val &= ~PMXMTTURNOFF;
> > +	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
> > +}
> > +
> > +static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	u32 val;
> > +
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val |= PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +
> > +	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
> > +	val &= ~PEXSR(pcie->index);
> > +	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
> > +}
> > +
> > +static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
> > +{
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +	struct ls_pcie *pcie = to_ls_pcie(pci);
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 index[2];
> > +	int ret;
> > +
> > +	ret = ls_pcie_host_init(pp);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
> > +	if (IS_ERR(pcie->scfg)) {
> > +		ret = PTR_ERR(pcie->scfg);
> > +		dev_err(dev, "No syscfg phandle specified\n");
> > +		pcie->scfg = NULL;
> > +		return ret;
> > +	}
> > +
> > +	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
> > +	if (ret) {
> > +		pcie->scfg = NULL;
> > +		return ret;
> > +	}
> > +
> > +	pcie->index = index[1];
> > +
> > +	return ret;
> > +}
> > +
> >  static const struct dw_pcie_host_ops ls_pcie_host_ops = {
> >  	.host_init = ls_pcie_host_init,
> >  	.pme_turn_off = ls_pcie_send_turnoff_msg,
> >  };
> >  
> > +static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
> > +	.host_init = ls1021a_pcie_host_init,
> > +	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
> > +};
> > +
> >  static const struct ls_pcie_drvdata ls1021a_drvdata = {
> > -	.pm_support = false,
> > +	.pm_support = true,
> > +	.ops = &ls1021a_pcie_host_ops,
> > +	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
> >  };
> >  
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > -- 
> > 2.34.1
> > 
