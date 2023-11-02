Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B09AA7DF9D9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 19:22:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NrkY1CKL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLsfr4Twwz3d9W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 05:22:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NrkY1CKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::617; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLsdx2TlTz30MY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 05:21:40 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9q1lCZFMnc54dQTXn4k1AufOZdJWxT+W5hrPt2tp5hn5ujrUgEE9QtV0TZ9I9UH1OVBJeFCoy0ZpF5qwxaZMESCnujcd50TPM28nBVvGoFZE0617BahZwdfxPEDfLpod6/EexfZ9zIVu0UPy1HSyCY03IkTvba3d7cmP04k+KDSRa3Y/rG011EU+dcQzgjH/Yp8/RcH7Cac119r5okoVePpSnWldcECQlpBhSoQV0byABpvt9u2kuUBlJJtY5eV4Ne+zpM+7symok5XOTSU+4OjQ5uHMFWCYyibZ81R668Ya7pq7X92SNdn+ScfJIAmN4mQPh1Cpt/0m27IONg3UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJFvc4o85GBUIM4PoN0EJ0ULWIvNPJk+hr1Vjaoe+j4=;
 b=dPrPLi9cn/PoRVFkHq1nlACSEUKOfcFtdjmsJJMk+fmRifJd+QPwa8mu/3PKXBLDMH+Sf7nj8sMW6fjcXEyD1LXb6Jq/fELF95Rkx6g4P/EYjU9IIMZvSrMKddq35oPGPCbaHRGXO4FbDQ962nuJtU18Tt9f5jbl0v0idkPGUvQvBontHCD/J4qxFn4Nfgt4MNV3PVHC9kMkPyuWwIlJ6sfXDkhTEjrogXzJti3UjR013etV+uMUfGch08HSguMP3S5WPnDxku0umx6w2jufpzZhChoAfRlRQ4PbTUujcjl8K8WsHF8AIy9NKIcEOSmmtexixRKHWg/Xdr9EIT2g6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJFvc4o85GBUIM4PoN0EJ0ULWIvNPJk+hr1Vjaoe+j4=;
 b=NrkY1CKLN4Fd6rgZ7lgc8R1vtKRtuUqCDkFTjHmftC0rLZ9fQTwXie7b2A3s8FkUljtDuSDiu5KvwC+XZuYAMTHeVzytRRMTqvLeXNlYiwX9znQpxO9v3Nn8ONMua5w0j3Qu4IFfVC+JWLDQA6cJbQYeCN9sOuFMBZssto4zWRY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DB9PR04MB8219.eurprd04.prod.outlook.com (2603:10a6:10:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 2 Nov
 2023 18:21:21 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::97ca:a905:8e64:c098%7]) with mapi id 15.20.6954.017; Thu, 2 Nov 2023
 18:21:21 +0000
Date: Thu, 2 Nov 2023 14:21:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH v3 3/4] PCI: layerscape: Rename pf_* as pf_lut_*
Message-ID: <ZUPomPAwdjFS9HmC@lizhi-Precision-Tower-5810>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-4-Frank.Li@nxp.com>
 <20231102173314.GE20943@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231102173314.GE20943@thinkpad>
X-ClientProxiedBy: SJ0PR05CA0124.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::9) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DB9PR04MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 21ae8afe-e007-4f76-10e3-08dbdbd0838f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XtlUZ6XiS8+7xAJnC0TfMFDG9Z6aydVu6Hd3XRLf2cKlYwCWJ6mKGx4iPHTejXNofiNwKIXC1yoCbwjz+lNh8fef5sdLJ0mZHyIN77arqc7t4N9PmTNuYYjRsBe3b/S8zWVhrTX+r+IwABnzU+42rn6EFhkyYi/OmCArsFyDHerDLRfChFepdho0XvAD11XSaI5jvC+igiQE+U9T9RnEWtifi+1nDTP/3yh5xLOJ8ceog6Ds8HJ1ublcOof1KtqO9HqsLxLiBeE5elzsfMSlWSO1wMnYTBuSHNXm6lkJMv8TYFAGPrc8qkpE6+1458uXxpfAsaOPtBNGp0BaWDTTV79eim0JADMPTrZMTI2TQ5Qe7eiRfSrpDJjAWd94EbfygLjOAHZiTG7j0GaCjoaLtYG+i6B1YjxXDEbC+O1YNulldQ7H5G5+hZuNLrvCFE7PMKV/UwnFyeK0wWIgYE3vmxeptTHT1vT5Jloacc7Fl1ca4I9HgqIAqLBaWGV0V1XNT4JxC3Uzsdh8qoXQ2rjLddrM9J9zobleIsYb1L92eGKASZYR6FpTv2GXt/ayJt7ir73v2mrgseazhxFUeaq5QeX2DdG/D7SaVY7c7z9R+8lWshftvewaBOddihi8IjpX
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(346002)(366004)(376002)(39860400002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(33716001)(6666004)(8936002)(8676002)(4326008)(26005)(5660300002)(41300700001)(66946007)(7416002)(316002)(66476007)(66556008)(6506007)(2906002)(86362001)(478600001)(38100700002)(38350700005)(83380400001)(52116002)(6512007)(9686003)(6916009)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Y2RQTmcreDlKZGVUelF5M083TjlZcjh6akkxVCsrbHJ5ZE84bVhEUXVDV0tE?=
 =?utf-8?B?WmxGSGVZK1hQbXExSkNqd1NzLzdQdmtnZTI3N2lBazhLR3lkTG5acVpwaXI4?=
 =?utf-8?B?czVTdGdpT2RzLzF3UXM5ei9JeFZjNGU2UHNkcU85VmkxK1lNYlYvRFlLTG1P?=
 =?utf-8?B?UURBdnI5YW1hM2dBUkdUejlhaE40UkZmclF5SHNyMGZVS25tZ3Y0bFZlWm1M?=
 =?utf-8?B?dUxlR3pUTWM1K0R0bjFraElDYU9nOWNPMWUyaUJXQThGTzAyQkJiNi9RSlFv?=
 =?utf-8?B?ZndXS2Q3RDBYM2FzZ0llNW9RdDJiU21BT0ZJSkpydHR4cHhsL3pKenlIZDRi?=
 =?utf-8?B?NmFtcjNnR3Fvcm12eldWTVAwZFVlWTJqVlN0QXMvN0dGTVZQL0N4NVd6NUlj?=
 =?utf-8?B?a2JFTG45UjNXcEdqd01Jd3VKazdRaUp5b0pxOXRydG1HdWVIS2JwWDFGSS9K?=
 =?utf-8?B?Q3pIRm1lWi8zMTRtU3Jrd2JJRm9DdXFWY1BoMWYvSzhsUENPdG51c1d2aEly?=
 =?utf-8?B?bUFMVkdCU3l5TXd1bWRYckltUUhSVHppcitibzhYWGZ1SEFlMEpkb21GakNh?=
 =?utf-8?B?LzRoL1JSM0M4S3VGdlAyYldTN3ljTFNVbkhjWldDejNsaGphejRuUTdqSXhN?=
 =?utf-8?B?NmtwbmNIWkIxRlZ2WnloWHI0RXA1RjhwTGhIYzlUTUh4ZjBja0Q2YUtwUlpX?=
 =?utf-8?B?eUk3S2tzWE9LZkwwZDE1VHNoVDFzaVhVL1huOFkzdEhPckNHS2RoenlwRmRL?=
 =?utf-8?B?U3JZSVVKL2N2RERYNkhhbVhTMEZweVM2dVhEdVprYzBac3dqUmhQM054K3Jz?=
 =?utf-8?B?QnMrdWZCLy9KWVhsTXpmcHI1Z1lyandGNXhtUjd1L3J5eXZoWXNnQXJKTitU?=
 =?utf-8?B?RzNsUU5OWHkvdGZzbW95UTcwMkUzZmxINFp3NERSZVVwRGhkSVNvdzVSbHc0?=
 =?utf-8?B?eTBlMHdZUVdIZ3ZmQ1ZDTnB1a1hZMmIrUnI1YjQvbGw1L1YranNodS8rRDNm?=
 =?utf-8?B?YTdTSlNzelJNUmdMbVNYRFM4ZEN2M2RVQzJrYS82cWphbjlWSE5KcGxvMXZ0?=
 =?utf-8?B?L2VFZlVnWVNDTmlDckNYMlBCdWNBQVpMaG53MGFzL2Y4dzEwemdGL1FtZGlU?=
 =?utf-8?B?YU1FL3NFNmdtWFdzVHgySFlLVVpCYklnWG1rd1U1UmpsRFFkcjFJdUJyUldh?=
 =?utf-8?B?c2FsMG11S0REMWd6c1hHcUpOdHkzdU5yWlZhT1lHRXRYWE9UOUxGb0szcUdB?=
 =?utf-8?B?OGQ1M2JDYlJlMVlMTk1uRFhDUVdJTStzTkJ6ZVptWkJNWm9hZWszSjVqMFdr?=
 =?utf-8?B?R1Fkcll1NzU4akJXMGtITU9aSFVRb1BMVERZWUhXZlNCWTRFWGpXNldUZVBI?=
 =?utf-8?B?ZmRVTnZJeDhXb25KUGdoOWVuS1lIUGx0RjBmMGk0ZFE0aHJudnJ6Y0p6ajZD?=
 =?utf-8?B?TzdsMmNiSm5MYjlJcWZYUXA3VUxUSTNtbDM3R3diVVAvd0szMGt2ejdod3lQ?=
 =?utf-8?B?b2dKRjJxTUJEVmJDd3lRV1NNMmVYMFdtZGMxVHlJSDAzT21xWk5FMVR6VndR?=
 =?utf-8?B?WlJYcVczVWpEVk1FMSsrWEtkZGxTU1NQVmpUNEhLUk1Sc0tPREtMcURMOUZo?=
 =?utf-8?B?MklZQ2ZzQ0lBWEJ6cStqSDB2eG9ZcmNUUDJjOTcydWV3UjArL3FkNHFKb0dV?=
 =?utf-8?B?a0ZIRkdwNXF0aEJzZHFlVlhqdFgxVHVZM1lMYjd4b2JFaHhpU3QzMHBGL3RG?=
 =?utf-8?B?bW84TTlKT1grc0I0VXhUSnRxMHpEaXRtSUU2Mkh3OHI1N01Zd3JGNENsT1FJ?=
 =?utf-8?B?a3JxSm1qa0JhZkpkNlNiOFZFYWFET3RZN0Y0MWxLeUhEN2E4QXU4elVuTmJm?=
 =?utf-8?B?TXpzc1NOclcvWjIxREFHM1FydTE4aUMzbE84NnF0NTdmc09rVWM0cU9YeVFw?=
 =?utf-8?B?ajdCdFQzT1dkaTJBODQ3WmdzQVk2NFZ2eGg1cjkzLzdxd1ZISlJXeGRJYStH?=
 =?utf-8?B?Unk3TnE5TktOeXBaRWpGdjZzOUFZQWNKR0poU3c4ejJyeU1IZUc3eTNqRXpU?=
 =?utf-8?B?cUZCdzNiM1d3bzVMVVo4Ry9TZFp1L3RNTGM1NUQrQlE3aCtxZG9QdTNzajh6?=
 =?utf-8?Q?bKw4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ae8afe-e007-4f76-10e3-08dbdbd0838f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 18:21:21.1147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoJ7hYTEdga/gf31xrhnQ8jMgd7t4oHN/d8p6K68azCHDm6qZpEIh259IanIk5g34SfkpemBYbMAX6avMAvLgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 02, 2023 at 11:03:14PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Oct 17, 2023 at 03:31:44PM -0400, Frank Li wrote:
> > 'pf' and 'lut' is just difference name in difference chips, but basic it is
> > a MMIO base address plus an offset.
> > 
> > Rename it to avoid duplicate pf_* and lut_* in driver.
> > 
> 
> "pci-layerscape-ep.c" uses "ls_lut_" prefix and now you are using "pf_lut_". May
> I know the difference between these two? Can we just use a common name?

Some chip use name lut, some chip use name pf. I think ls_pcie_pf_lut_*()
is better name then 'ls_lut_' in pci-layerscape-ep.c to align with spec. 

If need, I can rename "ls_lut_" in "pci-layerscape-ep.c" later.

Frank

> 
> - Mani
> 
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > 
> > Notes:
> >     change from v1 to v3
> >     - new patch at v3
> > 
> >  drivers/pci/controller/dwc/pci-layerscape.c | 34 ++++++++++-----------
> >  1 file changed, 17 insertions(+), 17 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> > index 6f47cfe146c44..4b663b20d8612 100644
> > --- a/drivers/pci/controller/dwc/pci-layerscape.c
> > +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> > @@ -46,7 +46,7 @@
> >  #define LS_PCIE_DRV_SCFG	BIT(0)
> >  
> >  struct ls_pcie_drvdata {
> > -	const u32 pf_off;
> > +	const u32 pf_lut_off;
> >  	const struct dw_pcie_host_ops *ops;
> >  	int (*exit_from_l2)(struct dw_pcie_rp *pp);
> >  	int flags;
> > @@ -56,13 +56,13 @@ struct ls_pcie_drvdata {
> >  struct ls_pcie {
> >  	struct dw_pcie *pci;
> >  	const struct ls_pcie_drvdata *drvdata;
> > -	void __iomem *pf_base;
> > +	void __iomem *pf_lut_base;
> >  	struct regmap *scfg;
> >  	int index;
> >  	bool big_endian;
> >  };
> >  
> > -#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
> > +#define ls_pcie_pf_lut_readl_addr(addr)	ls_pcie_pf_lut_readl(pcie, addr)
> >  #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
> >  
> >  static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
> > @@ -103,20 +103,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
> >  	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
> >  }
> >  
> > -static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
> > +static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
> >  {
> >  	if (pcie->big_endian)
> > -		return ioread32be(pcie->pf_base + off);
> > +		return ioread32be(pcie->pf_lut_base + off);
> >  
> > -	return ioread32(pcie->pf_base + off);
> > +	return ioread32(pcie->pf_lut_base + off);
> >  }
> >  
> > -static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
> > +static void ls_pcie_pf_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
> >  {
> >  	if (pcie->big_endian)
> > -		iowrite32be(val, pcie->pf_base + off);
> > +		iowrite32be(val, pcie->pf_lut_base + off);
> >  	else
> > -		iowrite32(val, pcie->pf_base + off);
> > +		iowrite32(val, pcie->pf_lut_base + off);
> >  }
> >  
> >  static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> > @@ -126,11 +126,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> >  	u32 val;
> >  	int ret;
> >  
> > -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
> >  	val |= PF_MCR_PTOMR;
> > -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
> >  
> > -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> > +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
> >  				 val, !(val & PF_MCR_PTOMR),
> >  				 PCIE_PME_TO_L2_TIMEOUT_US/10,
> >  				 PCIE_PME_TO_L2_TIMEOUT_US);
> > @@ -149,15 +149,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> >  	 * Set PF_MCR_EXL2S bit in LS_PCIE_PF_MCR register for the link
> >  	 * to exit L2 state.
> >  	 */
> > -	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
> > +	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
> >  	val |= PF_MCR_EXL2S;
> > -	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
> > +	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
> >  
> >  	/*
> >  	 * L2 exit timeout of 10ms is not defined in the specifications,
> >  	 * it was chosen based on empirical observations.
> >  	 */
> > -	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
> > +	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
> >  				 val, !(val & PF_MCR_EXL2S),
> >  				 1000,
> >  				 10000);
> > @@ -245,7 +245,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
> >  };
> >  
> >  static const struct ls_pcie_drvdata layerscape_drvdata = {
> > -	.pf_off = 0xc0000,
> > +	.pf_lut_off = 0xc0000,
> >  	.pm_support = true,
> >  	.exit_from_l2 = ls_pcie_exit_from_l2,
> >  };
> > @@ -295,7 +295,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
> >  
> >  	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
> >  
> > -	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
> > +	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
> >  
> >  	if (pcie->drvdata->flags & LS_PCIE_DRV_SCFG) {
> >  
> > -- 
> > 2.34.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
