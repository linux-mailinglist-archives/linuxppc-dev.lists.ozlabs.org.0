Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677097C011A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 18:04:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=iYqEpVbi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4gh929qJz3cRk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 03:04:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=iYqEpVbi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1e::624; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0624.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::624])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4gg55PWJz3cQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 03:03:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvYB+tu94G/KwNRaA4JMkVXoty8hFo4mVpyUCCbR2ARYpE0Zf3yzq83u7MLb4CBP9gNUkJcA8RfApO/QjcfrDiItI4hXpXFDRU8TZyOKW8oXE054b4On9s7r/x6h6EQVoBnd6N2+G84WNMHxx5QphQ0LEZpWptX+aLAgmkGu6fDS7A925gXO7S7YJYHf3yCBz5/Q2u2qVUfpOa/2i4xSPWEfEDvlopUSL7MuBSHnMmXqZC51MkN9JS3GLb+EnhUzCJ3GuA/VhkLwB+Uq4Yhp1AhqPBLcGqxlBiCz9QIODDeYsaHaplVxK4Q2XA/+miQHEzgH4JcgiGnShofKpaxLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ipg9p20F3+8v6FSXXLuGS/+nbNyPLkLEcrm6HhSyKpo=;
 b=e5e+KyAtomhqRLdyvuCVXcfvJIvQ96Zhaukdx8HpsFpJUrI811stYvkP5YqCJpZRY1dqkAjQ5GFfEuJmX7yEvJ8kGQLTUTWwly3VNdzoVbsrROma1n9Nz8NgGf7hIn6DC/vqlX852vGszGV3moRvaKm+2ggwoRa1oRGwMMfVCWqyCBxGfJb1NOhTaVEI7ARkzvwhCWY4mZBuqCz6taeH9NcEV9aw4grFDwDBPRYYpT4k7bHfN4nS+ZVE80ckOyC3vXy2yQujFKNQcDMDfEbHBYKYM4actXozMraJg6SeWkc280VNzVmE3I5F6Ft+cqbPtrJM+deVDvScV0GKApSywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ipg9p20F3+8v6FSXXLuGS/+nbNyPLkLEcrm6HhSyKpo=;
 b=iYqEpVbiHCeLMQH8MAB/hwRP6+/8O61/7+vAnbTU5wdgvySk+1CU6Hm8QFK3Jop6R5v+lz5wlBoHRu+Fi/sD9T7h55sHyyGWOGW+HVbD2NxrOsNUNC9Ye7CVEB6L8ruDo6Nueu2LljQNG1MHh3rJYNwjH6UYTxriVBJzThuCzZg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM8PR04MB8020.eurprd04.prod.outlook.com (2603:10a6:20b:244::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 16:03:05 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6863.032; Tue, 10 Oct 2023
 16:03:04 +0000
Date: Tue, 10 Oct 2023 12:02:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH v3 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Message-ID: <ZSV1sINV/2GrAYFr@lizhi-Precision-Tower-5810>
References: <20230926140445.3855365-1-Frank.Li@nxp.com>
 <169695244699.95067.12901655371819245761.b4-ty@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169695244699.95067.12901655371819245761.b4-ty@kernel.org>
X-ClientProxiedBy: BY3PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::13) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM8PR04MB8020:EE_
X-MS-Office365-Filtering-Correlation-Id: 16880fa5-f364-4a33-55ad-08dbc9aa6317
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	xSWDK2QRKHFr73B1HBSQXAZMrVBIxrWK/SLj4P9fqXC/SV7DKGf9p/ywh9o/1+NssliQEYOB1f0SLxFhTl37hT2o6+UYZb4muzRnrGqT88Hw0/YeILGLcReKHCACQmWh1ZZcdFkFrBZ6RRrXiNjQMXFelQhEZuWlE+8qBMCAj/mYicZEPRTizs08YUa3PGRz8pUe54ggtLqYoI0q0RvfbX+ty6pV4WNTeI433s2ys1STuZW9NSisXyw2OY+7qksjlXGofB7VS23kvKjFT7OqjlzYkoGxaLeZy9ooJmVPz8HMsAukh4V4PdDp4mEnRuC5cShS6KOtQZl9IBxGumlWtqySOh7P/JbhVqCa0wuUGlfGME5q6aD9mkJ6FAPKGk7TK+iUrprGiz6Wm+5is4i3QAwgp+C2aQP4iQpf9OqYXd3RKywXtyJxRWqvZnY5pHFiHkB+/saBmZTVpDfOAwmmVk2ggPpO9WQYCO9lZfnEko59CtNFZ2JTZVo0n4kttCIvot4Je5UhlDoYYz7dhTb5UQzUADg57aWSnJ7XeW9Pv1THLIkxB/pReaTg4qpnEXK9iQyFeg7QadcKHdyrJYHDjKWZreGIsK/b+9xjflJQ5j4=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(39860400002)(366004)(346002)(396003)(376002)(230922051799003)(451199024)(186009)(64100799003)(1800799009)(316002)(66476007)(66556008)(66946007)(6916009)(966005)(6486002)(41300700001)(5660300002)(7416002)(8936002)(4326008)(8676002)(4744005)(2906002)(33716001)(52116002)(6512007)(9686003)(86362001)(26005)(38350700002)(38100700002)(478600001)(6666004)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?7UOE7Emq+QjSvPA0zzTnSeiv9fbCjllTpXLzyz2hSEWuzXBXjW9y4eL6t/Yt?=
 =?us-ascii?Q?6IkoqbGUKLUEm/zCUVgFh8ci4CjXxMF6VF186X6xSWB0zA71h9zcI6v6RUVL?=
 =?us-ascii?Q?9mckPZhtwuYtHg6Xyj0PLCLhIOiWPxhGH1iJ46Ap3xRJc8xYk3zGLVxjiZ1o?=
 =?us-ascii?Q?ATCwMAeHihF+1Zs96FM9f7BfhgxGMXlFGzjSYvxeDv/36r7qFE61fWTkY1zu?=
 =?us-ascii?Q?sgObKdx7E2x4QTX6laXaDYaX5QVc7UrIPWYRKmfx+7b+GjrHeD/yuBl94uZR?=
 =?us-ascii?Q?Ut7ZzOS60Eba0AlfCbe+V2LPLuPkpAFLBDqrztoQI5GFAStt/O5oSmBN4RHp?=
 =?us-ascii?Q?XymwrtOYt5GfZekOoaRJ8uCSAk9AtL9E90cCrmeLn/Tt2Uo/gMa/FUIQ3gva?=
 =?us-ascii?Q?03mvGMoq/8YNKRgCKOb+XioXPpF2poDG7Vfi+2QoJeNb73zvId1+neg1tJfE?=
 =?us-ascii?Q?QdOmPXwub0e72BzE1QAsLxu67/gf3ws1x4mhdEOo+QElsvtjlvbbonbgDFya?=
 =?us-ascii?Q?KHp0SYKiDyI8af9KssSZzXYL5K/5UiQsihqWITOkahY1bDn0/NVsVFgqrMNp?=
 =?us-ascii?Q?vCBUNo6RuwScEWgQGH0k1skvVKCJZIfmszAGi1zmiJfjjMe1j7nIGpP1WqEX?=
 =?us-ascii?Q?XvEp+1Yd39ezARDtyvf8qy0hojXfItEAcuE0fHcR32gXiJS9Z2DPJu9TvrSp?=
 =?us-ascii?Q?q+2rygpbXiqqSjOn3ToRnPWsdBtVXkNCmrEqWxJXuhtxTxaD9V7ws1Zkyo4Z?=
 =?us-ascii?Q?v9EdHS3xUe5KKmCNopWvyp8q/IDcUfcBn/lW6MRaiRQajUKpBK96eL4gYM7F?=
 =?us-ascii?Q?uiYGr2OtIBQCZI2QU+ddvW95uBKggM21VCi1D72/6F1CGLgJheFtwXoLOG5I?=
 =?us-ascii?Q?JYNgBtvVA3MOjtulBWVv/sFW16IhSjv+e8FBjK1juY7DDlVZ54CloFz4XUrO?=
 =?us-ascii?Q?NDbBW3U95k3J2LtPrKuvfd7iQuTTcy9GyX5eYqgA6GhV5dHg8ZOwi/W9V1D/?=
 =?us-ascii?Q?asn4vXWESxt4yZuqKSDfa1qgy4nHkTHYpAeBbj12gvHZCflMrBBwGfqGaXrt?=
 =?us-ascii?Q?J/CVJ/tJcUvkfe49/hz4CAisiy6rDN77V0xp9kkpiU0nb+UxBufDQsdnGmpt?=
 =?us-ascii?Q?dcGvJ0PQZPVHhxFWDTHqxUilzyhxryRl3P3zvqU/rJL/vXwQtxCkiAwG9+/S?=
 =?us-ascii?Q?eEuXXHXjuhzNbwYpdy7zgHj+2H87oNGoFkt9sJav6f+ye3LgnKCHXWYddNdR?=
 =?us-ascii?Q?S0P4DUSi/R8nE4aXo4nUPMWvGc4UvzqQp+fuqZ5I4yX5u0hLa43zGcOIvxO3?=
 =?us-ascii?Q?ID0HqI59BvbhcGNt5/PI7kPl2v160dXbukENQp+GG4MthCkAiOTpIWuUwMzV?=
 =?us-ascii?Q?2BQwk0X5BBiTePKhTT2Oe0lCrQJyNtKXc5YGmtkTWJjokaqdlHOe7zZ+6GSU?=
 =?us-ascii?Q?7hrSLm3r6sZDpw78Vvk2GSaAZXLKIgIHHxEY9t65RRJrkC1wlrOWr4RL+X/U?=
 =?us-ascii?Q?LmHVgyULRk+rnf3oWUu8ptAfoduvKMeGD+yunA8PUiTT3tHziKx2x0DEkhv/?=
 =?us-ascii?Q?NX6yTRZtcH11QlpvtrI4MKkrQBhFvZY8KSriNtYA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16880fa5-f364-4a33-55ad-08dbc9aa6317
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 16:03:04.8310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoFCt/0PlHcYIDxLXUj0yEkop+N0YIxm/aoBVIsQPMUA3XAKhw/OKcD+XX0aSQvoUEzaUINAD5OFaiAJU8OT7A==
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, hch@infradead.org, minghuan.Lian@nxp.com, christophe.jaillet@wanadoo.fr, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 10, 2023 at 05:44:23PM +0200, Lorenzo Pieralisi wrote:
> On Tue, 26 Sep 2023 10:04:45 -0400, Frank Li wrote:
> > Set DMA mask and coherent DMA mask to enable 64-bit addressing.
> > 
> > 
> 
> Read this:
> https://lore.kernel.org/linux-pci/20171026223701.GA25649@bhelgaas-glaptop.roam.corp.google.com
> 
> Find the issue with the commit log (that I fixed).

Do you means "set" should be "Set"?

Frank

> 
> This does not apply to v6.6-rc1 so I tweaked it,
> check that everything is OK please.
> 
> Applied to controller/layerscape, thanks!

Thanks, everthing is good!

> 
> [1/1] PCI: layerscape-ep: set 64-bit DMA mask
>       https://git.kernel.org/pci/pci/c/81ef01bc5934
> 
> Thanks,
> Lorenzo
