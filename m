Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B714675A1D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 00:24:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=GbD4Zk75;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5r3W3f59z3c3v
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 08:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=GbD4Zk75;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::622; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20622.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::622])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5r2d5CPhz2yGK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 08:24:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXdz4pGJR+iclkyccvuu7KyQrZkl1017shUWbIoxlPRN6ZCagmZol9VCJkfeR7YMyo7FtJSSl3RS/dc75sEVDxeNEzAjY+4kVY0eKuG1YuDy+T/DgKnQZL/2n3zWtVrvjfgRfbxq+kzRQ/1ispIEn/GMJkMCrJbQWGlpqPuJ6dhz91NbCRYJ8y2o2++2s9QiKgw0fu8vfbgL+0DcjUxsD/3ysgBKS7fBc4p23AaPT/4oBBXLDbtTq68WdVeWgyly1DllAez47wfETal55ziixh+EFeaEVoEf0XToMlnFjeHaRfZtu27nCijCOUFZxfSZh4LH6STsLsdoD7LpII4Prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlTac8UWYOQNqCDF95w/NOP/2osJeI3ODZUMySGenuA=;
 b=ShToZxKfgLLbIvfJgj4tqa32ecbNoDLVoTmFlYjr6IRyGl3b9VA6HP95HzD90vxgcr81TN1xA/05wL6/asBacx5dkt116r6pJ5XB5yHv5ri2gXqOAY0i+5pdcB/Ks+CMpX+HlRvhcQr5sBOK/fY+AuXOR7+oWnn0xRRWr12j+HWc29qBhxuqU9+tVdrX+KyByNEeL4GrAA97b4AP7Hs3s6VhZg97ICPTDKUDIZABNJu8hgdpIlgHUmsPwFIugg5BpFKzYswl8v7otSgUCHwF3s/gF6ruh45OAfeBoGB3nspTvAcMGai32U3O4IG62kp0KDNxdQ1NR9Sl+w2rnIy6nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlTac8UWYOQNqCDF95w/NOP/2osJeI3ODZUMySGenuA=;
 b=GbD4Zk75JYoZm4UDJ+LqozvSVQ/89KC1NyOelpyfjCYDqJEXNnjocr8pKtxf5QFqgGtC0CwfWqKJBD+vXQREwdekf0QeIlcH59y/NE1Bzs8owjMW9BuPfzqvDqtaGraD2YiTKQOPIt4SGh6k/cslCB8ZZeeqkQydOnGHXAH8R3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB8119.eurprd04.prod.outlook.com (2603:10a6:20b:3f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 22:23:44 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6609.024; Wed, 19 Jul 2023
 22:23:44 +0000
Date: Wed, 19 Jul 2023 18:23:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: markus.elfring@web.de, lpieralisi@kernel.org
Subject: Re: [PATCH v3 2/2] PCI: layerscape: Add the workaround for lost link
 capabilities during reset.
Message-ID: <ZLhiYlGBHX6ra5zf@lizhi-Precision-Tower-5810>
References: <20230719155707.1948698-1-Frank.Li@nxp.com>
 <20230719155707.1948698-2-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230719155707.1948698-2-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::27) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB8119:EE_
X-MS-Office365-Filtering-Correlation-Id: e5059eba-156a-429a-88f7-08db88a6cfed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	YM0szZ56huCpcZg+JdwyWi28pjXbEtSCUO+Miyov7vktFYhkNyyGN7LmGUjsi76rqMfEuDwM4e8+tz3FUrNCg3d/KR+dhlZ4krkBkuHxkwYF8HX3u8h94EOXyYBj0G4CKbE+rJ0J0INcQxJpW0VAkCpnPKHDGATtu3EALaJ5C26YpltV74LicBnjZ6DdZ3FAYXKm7XumS5YxTAMw4bxVtFL0Uk8aa0FdHjEJwOWfSQl9U7G6TBfAhk/drojPG4fZ+G8F8BxNgNl3y9j6cwHys660sUfT8CapnEcQ/ri5/MXmnBP1EcHtwn6DyTvFbjl4RwiG1ejWxDR/Ick2dq+piNagAAubV0trDZVTsUkcb7JXzYvaW4C0Nih/xSl/zZuzA82oaDkv4nMhtOzq+DWKw+/KjKSeY7JFgjrzS1ij8nB8sa+RhFQ/286S+Ub7k1TdPTrqppNrxiUwMoiB5WGnbwWcXF+PkJGXGehv9XDk8YbKeNNfkw/A05dV8ik4T4jdba3sYkCWVDa4bra3Aos9goJa90jZX2lGJCoEjykvHH9APgzHojSxpEeLXtNKuxQ9VKB27QvwSj/Q5X22x0WsE1FEFkUcG3L3Ng4DI0zRJC7cVNzwpW+++F968A0UfD1u
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(451199021)(86362001)(478600001)(83380400001)(38100700002)(186003)(41300700001)(26005)(8676002)(8936002)(7416002)(316002)(2906002)(4326008)(6512007)(9686003)(66556008)(66946007)(33716001)(6486002)(66476007)(6666004)(6506007)(52116002)(38350700002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ql0XC57igOZ/mFJHSASyZHnJ9J+e8onCiMDFkgIImZBhzzx5BmRGU/TZmNOU?=
 =?us-ascii?Q?WuDg0hOYuTf4R2oIyDy7bplEH6FVsGHbLIwyUGZ2Y1RvdfwO/zyci7RprJyn?=
 =?us-ascii?Q?AuiCWzd27jiYoYGg01VCkvkXHPwZhGCaTlsZUgJKMkTFyBdcgahAjkRqAGLH?=
 =?us-ascii?Q?hvqsemMycGS2AE7tZoGlczDaeHQnOi8lIZDfgHgdEOqP1oLKGCiPGKja7tJA?=
 =?us-ascii?Q?6Rb2KF7VBPqZJJEVuRGxfBkqWHjkUGsAL30sWPmbABI34xZMWKSZL+rjHtDz?=
 =?us-ascii?Q?dkY+lXXIN6NiMIPNxSC589QSSiGmNSEo9JxFSqhazACQr+QioMKquGM3DioB?=
 =?us-ascii?Q?c15JaoTQ5pzhPgugj9aw6nmw8PjjQmXE9KWwTBSql2zitFMbCOr6sS3gi/SE?=
 =?us-ascii?Q?OoZO4ZkpTNGNEtaiQFUVSvKVbVbEscLOPrmqBCVoDPmRPpz/ndLSD3XpfCs5?=
 =?us-ascii?Q?zn+VZcTKeHja0hHMCU3NFa5v+27C+tk2HwAsYOJ3BV4XCRsKQzoS7w+NAR9O?=
 =?us-ascii?Q?eLM9noVYij7FXUH0KNIoLDVQQU8O9CZe6ojEkg5hGgpyfV0pDtMxaiwG4seN?=
 =?us-ascii?Q?8dcbi/vADOnhSm5fMIBmdRDJDD3HGKtA/5GMbtakmkyuWB5DaR+Vv/NVJjuL?=
 =?us-ascii?Q?hN+0im1/SHpPcS+Gp4kH5UPpHD9go08PaI7yZGkRsc0R661CQDND34Wl3hCO?=
 =?us-ascii?Q?h2y3qQB+OIbM6O1eSrEevtUurVJEIuVpHzl3sMT1rrtmOrppfLxDqNRuiSQB?=
 =?us-ascii?Q?twv7kPiz9pVxcpANv1eAxnDIBA+gJo5E+NY+aX/Lwo1PseB6Ru7kLjxteYSU?=
 =?us-ascii?Q?aUi++lYNRSdHKpesatyT4PxIKhLWcqPoVdBc77ZnNiIvnuiSAwfnT7xmffjZ?=
 =?us-ascii?Q?emj7UWCHz5JFJlOkLIOx+zJ72lxVFE6gnVGGAU1nzrQ0r2m+m1RFQWUoirFa?=
 =?us-ascii?Q?39vhf3W8eA72ba/Ui8tU5TSAuEUeHTmghetGbTJ25OYbJ6og/dzOJ84VcwSt?=
 =?us-ascii?Q?vrNB3SjK2CnlF58sGVqSd5NKBbFAzdxZulvQwhDM/gL9+aYl3U9Tlvw9guuK?=
 =?us-ascii?Q?QHFg3AOwY7dtrEkLYUHXGw9Khvp5VCJk5fbF9kGRhuAJzEpWA6Yi6/gQXjbM?=
 =?us-ascii?Q?8yIUUDh5DSaS0VySLOsn3zh5OJjZz0bg22awy1GIRNQuN2qQJ3MkP4aYS56V?=
 =?us-ascii?Q?JmUDO0v4/e0WDYCRayhbWnLN2X6ZYsySkokuHqFd+tm5dO/omaB6JFhIRO/6?=
 =?us-ascii?Q?2NWqL9A46fDGSaGqRAVNxG5IjceOwqB7CPo+zTOj0gQhs+EpBwi49iKGUreN?=
 =?us-ascii?Q?9hZAUcgrOhpZq7BZ0RlyvMMPr/cDFE8Fh201GQQ/X86GuUTGuJ9cAk9HvmGv?=
 =?us-ascii?Q?K4seF36vuM2Rj1bCQ7FmOYs5N7CfkG+9wm8AhQeEjxRO23A9Ksu1N53+auGx?=
 =?us-ascii?Q?J5t/EQZ5xx+nuAw/dp7h2NeiwXHgqE1K32mwdcmn7JlK1w1gHGK9OA6j5nV7?=
 =?us-ascii?Q?CuZfsGy1QX3LlaE343u2kTYwr2peLTB5H2XE89NjDN50FEKRzcc3uABCMJ4n?=
 =?us-ascii?Q?Qqp7Wqc7P3/J9PHO+ZEpa4SpLeq67Ub+7F+7xKi7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5059eba-156a-429a-88f7-08db88a6cfed
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 22:23:43.9708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mIuUKGKNi789mfZzwqz/EBiTXZSzk11Hfv34un2tBJGPE95kAyIrFKD4tH1RsWboT9sUJ9qdP7tR8Ixqsij3VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8119
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 19, 2023 at 11:57:07AM -0400, Frank Li wrote:
> From: Xiaowei Bao <xiaowei.bao@nxp.com>
> 
> A workaround for the issue where the PCI Express Endpoint (EP) controller
> loses the values of the Maximum Link Width and Supported Link Speed from
> the Link Capabilities Register, which initially configured by the Reset
> Configuration Word (RCW) during a link-down or hot reset event.
> 
> Fixes: a805770d8a22 ("PCI: layerscape: Add EP mode support")
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
>  - fix subject typo capabilities
> change from v1 to v2:
>  - add comments at restore register
>  - add fixes tag
>  - dw_pcie_writew_dbi to dw_pcie_writel_dbi
> 
>  .../pci/controller/dwc/pci-layerscape-ep.c    | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index e0969ff2ddf7..39dbd911c3f8 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -45,6 +45,7 @@ struct ls_pcie_ep {
>  	struct pci_epc_features		*ls_epc;
>  	const struct ls_pcie_ep_drvdata *drvdata;
>  	int				irq;
> +	u32				lnkcap;
>  	bool				big_endian;
>  };
>  
> @@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  	struct ls_pcie_ep *pcie = dev_id;
>  	struct dw_pcie *pci = pcie->pci;
>  	u32 val, cfg;
> +	u8 offset;
>  
>  	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
>  	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
> @@ -81,12 +83,25 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		return IRQ_NONE;
>  
>  	if (val & PEX_PF0_PME_MES_DR_LUD) {
> +
> +		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +		/*
> +		 * The values of the Maximum Link Width and Supported Link
> +		 * Speed from the Link Capabilities Register will be lost
> +		 * during link down or hot reset. Restore initial value
> +		 * that configured by the Reset Configuration Word (RCW).
> +		 */
> +		dw_pcie_dbi_ro_wr_en(pci);
> +		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
> +		dw_pcie_dbi_ro_wr_dis(pci);
> +
>  		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
>  		cfg |= PEX_PF0_CFG_READY;
>  		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
>  		dw_pcie_ep_linkup(&pci->ep);
>  
> -		dev_dbg(pci->dev, "Link up\n");
> +		dev_err(pci->dev, "Link up\n");

Sorry, Just found that. mistake merge a debug code.
It should be dev_dbg here, will send update patch soon

Frank

>  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
>  		dev_dbg(pci->dev, "Link down\n");
>  		pci_epc_linkdown(pci->ep.epc);
> @@ -216,6 +231,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  	struct ls_pcie_ep *pcie;
>  	struct pci_epc_features *ls_epc;
>  	struct resource *dbi_base;
> +	u8 offset;
>  	int ret;
>  
>  	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
> @@ -252,6 +268,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, pcie);
>  
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +
>  	ret = dw_pcie_ep_init(&pci->ep);
>  	if (ret)
>  		return ret;
> -- 
> 2.34.1
> 
