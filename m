Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DE6769A59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jul 2023 17:08:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=a0AlKzYX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RF1nr4KzDz3brX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 01:08:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=a0AlKzYX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1a::61b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2061b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::61b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RF1mt5QmQz2y1d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 01:07:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kg/TFX/GjDtJzq8qAZs6x35dUGsDUOLOyo5TuyOq8fuwagnc0SVEBlR9wvx3/5zYmFx4Qq0x7zioY73eKpybeHJpErAarKPWncB8FmJ0ZsomLpjcWffCiwwcE55bGm0Gl4Vr95MpmykTmKre7ocynw9LbwAhc1uimrDpPqpySXHJBkmhLRuDVA3F/Wnp/cAjOKQPQhl12CuGBDCgfwVfYt618q9uAMTD37u3si3QTf6UfH/6hd4j4DGIsg1sGPJaco+Jb9GLpK2YFfNv91Wc0PErJSXkneg8MejPCrB2VAKf6WFj449DKotT98x+U6ixO006W12+WqCAYcCYhWNQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crcUh5M+29qWAqhs2HQiCtWclidSWg61ZXdah2qyiuk=;
 b=VS03mg1aGPK4Mldh1OjUzNQ2hnIaZXneXf3z2rzmbtD85rIBMk6+W+bg6coSdzHHPlnpfCX4Z9zoFhdCk1BOVB2PWjGWjr37PR1no7MY8kVWR1AmHx7t9Ob3TrOgKQW5Xj9lrxAaWEWmyitgm7hoNRXfx7dKxGmgnL3jhh8czUW4XypMp35ORhqGXlynYza5qe3UQ3FKWQbno9/vP53x6Q+HD5/k0NQJC4kxy7cwyDydthRIbfFxMsjTXk2LgzI6UTC7eKkMT7Xu2D/4mXB2Mdly6BzsDkMAlIf3/Rz9UtHcvDTHPN9BIhUbPATz2/dOVFH2yxPk+pLUjWJ6zui7kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=crcUh5M+29qWAqhs2HQiCtWclidSWg61ZXdah2qyiuk=;
 b=a0AlKzYXCjDsvuPAnby9GhfWpvEuDIB+ByjJCtb12XNjOYdOGUm3Uj9PSZfzP+uMd1tnJfOEfciEjKexFe2MyJMUU253LPy+9UvAzMOQsezPRquTiW4wiL3btmKyoBbEbQB4PiSr+Lbl+agbmtLP2mYwtnPdCSKtTyXNcFcjki0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AS8PR04MB7509.eurprd04.prod.outlook.com (2603:10a6:20b:23e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 15:06:46 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::d0d5:3604:98da:20b1%7]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 15:06:46 +0000
Date: Mon, 31 Jul 2023 11:06:31 -0400
From: Frank Li <Frank.li@nxp.com>
To: lpieralisi@kernel.org
Subject: Re: [PATCH v4 1/2] PCI: layerscape: Add support for Link down
 notification
Message-ID: <ZMfN9w6ixBFBmof7@lizhi-Precision-Tower-5810>
References: <20230720135834.1977616-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720135834.1977616-1-Frank.Li@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0204.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::29) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AS8PR04MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a84d578-d34c-4f8f-3110-08db91d7c21d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fjbBx9OTq1XUKe9FDQ5MsfsqcmPACxUomMgHrJDvBjE/sZ9VKCPimk63YuJkF4TZZMd//8lmI8f7Xip9rNbtpJUMQYfRxfYcQxU6/9JBRJKPp+cWuXoGO6FiadjDq6GKh2SAj8AXrJGhQtz1WCzf0szIhrK0sUgENtZAvJTCChTDD5zZe1CrAvfplSva+7AsB4Cy97SMxUHXqK4t4U+3L8ULAaNkgHRH2PNfjinVDLjGTVZVgqUP0ohplTHn+2C4iLrJYxqgFtBAbKR5H4HtWoRaqaum3lV5Hq9UNscM8vlIrlhoUnDwtQSWja1ZPmczcLcBkGjRVXBRxXEyIzu/ivOlGoIIC3JBeYm6F8H9luCobyaUhe3643E/Pv6jQJLmgCIFTk8P8U8+dhMEA7+CgfLJMBuYAt8fqHht/KrQzBrNW2UfR+IBP/XaWqZ0zlWA3w7TDKGswGExpYT2Yypn4h1yrH84pX8FMdRoLAwacD64SCquKuXbGVvQNAAHx3Rq3zI2OqoKTF5vA1UNj3BH5R4sOvbzUx35VUdVTu0+5LvMSjzq4UK4oVTGid+E4t2YrxKHGvo2LPO6P+pvL/yFAcByeMjqCPI0loAQzKZ8tNlRtyfS+L18OH9AWbJw1q6f
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(7916004)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(6512007)(9686003)(6666004)(52116002)(6486002)(186003)(83380400001)(86362001)(33716001)(38350700002)(38100700002)(26005)(6506007)(5660300002)(15650500001)(41300700001)(8936002)(8676002)(6916009)(66946007)(66556008)(66476007)(2906002)(316002)(7416002)(478600001)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?3UsIzxyjvzwE03eq87zPZA6C+kXddkDN15AtmMS20m1IPkusPDrP45c9TV5s?=
 =?us-ascii?Q?99FiSEKFX+25IHfu49p9DWPHdHVorRBkSUIfrHxOIT49zBd9ProumGnLVGt7?=
 =?us-ascii?Q?YH+zZMJYO4doXVvKcLprEJjpAgO9AjXo/uXThuqfpNlTLxoZlDp4I7qp7VSO?=
 =?us-ascii?Q?43veGPiiv9MoD7boBDfGXJQeIUV4u9Y7DbDWmHvtn+q2QTazzsKHTqebYNQI?=
 =?us-ascii?Q?5jp5LGmA9x4HvEqRCZ7373BW+I1QsAaVad/CSOLLA98dJC/jSSgWR1OWRdcE?=
 =?us-ascii?Q?0B5/z2BuZ6o3HVhZ9P4m+dKKV4xuXjqzH/632ghR2NEArIWNfDBKFrPDm6Ao?=
 =?us-ascii?Q?18dJFS7qhJAsMhO9FclY5gBFOXs+Kx0InVSq/aWYxmtLxjkPaXKofB6FT1Nx?=
 =?us-ascii?Q?cY0qlZLmfXZml9A8ad+CyM3JDIj/hDbRyOnkjWsOzcn0UHdndc8w1D+FBy5E?=
 =?us-ascii?Q?WLNrE+Wy2N4Ryb6oupZGzQO//ITAve33wiGTZkOiSSk96rg3NUNA0p8Ofsol?=
 =?us-ascii?Q?lboVVp0SYL7ejcMvyJSTZswM8ekyRaARh1S7q2zZ4WH5eWcMpOvBLIxV6oap?=
 =?us-ascii?Q?uHZfH8Q7Mn1Do00NsSKEjE3Yo1Zig2Ox6frpMgFym4JuSCW92EdoRISUo1Ki?=
 =?us-ascii?Q?oHFhZTaXThanrfjTfnVy3orlxDYgB/DYluafwKKk2toritXUAu74iF0EY14B?=
 =?us-ascii?Q?pqA/vF+yv2zmBBYgBmGNJTjGkYPe2h2rlqzLwLUCA2NEi9t3bT/jtFF9+S+S?=
 =?us-ascii?Q?uUuiBchnwubIQWPMdow8ht1zlbGVbZt3234a3nNwfO9fc4jZrUNS11esgboD?=
 =?us-ascii?Q?bhYNM018QJuC+kbUV6pCReWFEVyk+/1G71DHQLdX4ffGsEy711KBOnhZ/uk4?=
 =?us-ascii?Q?EK/BTB8U8B1vX3LKMazeudAW2vVTqXweE2NP48vHH4X2Pbknjr6rWk+9hO17?=
 =?us-ascii?Q?4esdl2uHG8j8G8ZJlfPj1iqCg498gZ/OiNbJpBUdUl6Yr6k93Y3IPALd7MGy?=
 =?us-ascii?Q?ERaE3sUF16nvqjktE9lGWxoWjrZOe85NrS+pJNXi96uI/KB8Rw3PfvH/5M/e?=
 =?us-ascii?Q?bTZtzVxc29XGYheNPC6EfnaxJxpXOEFyZFa3i5gHvL+nx3KlpTPB5cKVknKV?=
 =?us-ascii?Q?g6PSdMyJ6cdRAhjUS9oe0RiSLTfRgcOcMv8IF1/BmbobtK/JR4BnCsnrQeBn?=
 =?us-ascii?Q?IFUCd7Jqr4rO0C1TOIHKTEECSTAajp7H01ZOyO/n0V0Pbo2QkPo6c+131vZL?=
 =?us-ascii?Q?aW5UKSAvXiPcXCdUuFeMxOTSVaYLvT2dGgEo9zyZUH77CSFV/s92W9DZTRvU?=
 =?us-ascii?Q?Dkd955v7aVGoYwvd63UeozzkFA0c0jidstRXCmituYi1XscjceVqGFj9Eh50?=
 =?us-ascii?Q?6SkHc35FUBpVwMF5m5PJUdBYDCj2ELKpr1axAKC7oiqIpvTbIismCAdPe9IW?=
 =?us-ascii?Q?+uJvt4ec50mLFJz8eDEF6rQK1pAyGKEjgqMzUJVNK71v5SQ8mnLmJWKIfdJA?=
 =?us-ascii?Q?AiHureqrYfysQs4IIhBg8rfFJzJ5Xe+3w4OveqesRGDj5yVtL6zeOQvcG6Tl?=
 =?us-ascii?Q?G/YojlTm0M3ym92n5hQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a84d578-d34c-4f8f-3110-08db91d7c21d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 15:06:46.5880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pH1s5OphSUr8naTX8f5Pb7BaeVICXzg2yRgmTAmPavTg1bkKsHIUY9kXKc/u4eSgleAS5+OwR2Ev29zXH9Z0Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7509
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
Cc: imx@lists.linux.dev, xiaowei.bao@nxp.com, kw@linux.com, linux-pci@vger.kernel.org, Zhiqiang.Hou@nxp.com, mani@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, markus.elfring@web.de, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 20, 2023 at 09:58:33AM -0400, Frank Li wrote:
> Add support to pass Link down notification to Endpoint function driver
> so that the LINK_DOWN event can be processed by the function.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

@Lorenzo

Could you please consider pick both patches?
Manivannan already reviewed and only impact layerscape.

Frank

> Change from v2 to v4
>  - none
> Change from v1 to v2
> 
>  drivers/pci/controller/dwc/pci-layerscape-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> index de4c1758a6c3..e0969ff2ddf7 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
> @@ -89,6 +89,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
>  		dev_dbg(pci->dev, "Link up\n");
>  	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
>  		dev_dbg(pci->dev, "Link down\n");
> +		pci_epc_linkdown(pci->ep.epc);
>  	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
>  		dev_dbg(pci->dev, "Hot reset\n");
>  	}
> -- 
> 2.34.1
> 
