Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2D67A9597
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Sep 2023 17:38:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TCGOMFhz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rs0190W88z3ccM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 01:38:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TCGOMFhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::616; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rs00F19kgz303l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 01:37:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fIKHQoNi4/KNcdIad7O0NoKRFvzU33tp25thdmw2/hSkHLrv81IQMAvVZ8h2j8AeG4FfeS4MDY/zBc+XxDz0sBp3Y0TWgemWW30/C87gruIwvEfstGpygdJgw+4TNnyZYE+QC3U7mDExvyPDGHEI8hcO2Gkbh2Am3lh6dQ5bobsjgcDh/ZHdVlEZ+SaUyMd9JepIg1Y8fVcRy5lhgfkoNi7MDQ8zBvD9MUzgUP7FVsHUM0bCocGjoD8EC8DBRmNx1ufDtSTYrElohAgVemiESXEmo7ZaJTCbtOzZVpDwExN+JmsQPHPLek3VwLjWmwimCOeW8jdHOTkGF55kNfXzGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xoPOA8PdPEdc3whI2OL1rN+IbmmJYsfcBLtfm+rD4TA=;
 b=kRYMEMOwkhxNstNF7Lli/WF4EXVron2b3851Lqjq08vl/ek53RmzKGE5iCV0/CQ7DPDKcME/5vFMPu6yaa997OD417eBIPl2OchN5h0rrUxq9R7PK/xFj4RmIz9GSbzCwWdu+jV0LmncSELk3E2FOdB0yqmu843wP7ODpAM7RwBg6OAeqhh8COwu+OQ4m3klNdY8ZeMPslGIYmgsVShTvk7wYHj4RkWE0uVnn4uptucUhNMOpvqYHEVKFFM/26eVSmz0Rb71ivgy9OQXo5Bdta2i/7gjOAgGsDl9yP3pAeLCLFXn8xdtg3aYTdSYvpdQzwcRixSPK4qdDLZrY+hUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xoPOA8PdPEdc3whI2OL1rN+IbmmJYsfcBLtfm+rD4TA=;
 b=TCGOMFhzJDkiL57amMwS5c6yUqkJCiQnhBjPjp/PajrCH8jrTMnp9Zr7aCndOp/+bctDf4wk7nkuLfutR9+nX130dZHd7fibcH0wCJdV/kO9InfKfI8Kj3gmUkeLo2MlsuKIH1y5xPSjjEeVAaKVfUMYgwg5DBQSKU8q1WFM3Pc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by GVXPR04MB10021.eurprd04.prod.outlook.com (2603:10a6:150:112::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Thu, 21 Sep
 2023 15:37:23 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6792.026; Thu, 21 Sep 2023
 15:37:23 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape-ep: set 64-bit DMA mask
Date: Thu, 21 Sep 2023 11:37:02 -0400
Message-Id: <20230921153702.3281289-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27)
 To AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|GVXPR04MB10021:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee72aec-17a6-4f26-783c-08dbbab8a646
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UpdzYVz3qFUopoKH+vtGwAtWgM9QNHAo39owoYk8pw823cDJNp9uWRCnkKHtDUDN0w4kq+sKB2UGLIuRdXahLq6ll3Uu1BYKLi2bxFyp1rUgov39bdC7kSWuctpsACiBQyRPp9kbZgQCred6QiQczXZX882fGgwfk4vhCNmZqvkjT8d4tpWm/GC2pkEiKZ5uOzvvSeCBeC+jrPYMPvLXxT8fGGSDxViDvBI5EisVRkbCTMcv0bKwwJQs/5GnxIZlOXE9BLqgzNo+sYQiSa0lGpOc7QTsfhGhkuFmQfjOYQCmQ7Wsdcg9mg5HPKnEIOoDbqyQTK1yT2sYXjPHz68D0Ovvh4ydmV1gR8QeK4Xuj2naD2uHAv+aly10ahqeZcjRLGKxh0AdooSaFU/97X5DsEhWRr+xPN2BJ0rSLzctS5oDe2pKgYllt7+W1FaJkB/vEstr+3cwbfLbWUf6bmIjToubJqdwRGoALeY9mYrmVXFsNJAH9nLOD9UqET4dvp0dEN51LYVaDSxWIW3G1brFFtc8YSa+/1dGJACu/5z5dhlz55YKqAfF90EdfDGSh6aixFrZ9Mwxwu0n1n5Mxap2EdYrFsnJv4B8C2m4+ChTGcnUWAvFJCRywPb9F6Brf5OsbBuo0HLWw4WiOhfTcUldyA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(346002)(396003)(1800799009)(186009)(451199024)(52116002)(8936002)(478600001)(110136005)(66946007)(66476007)(66556008)(8676002)(6512007)(6506007)(6666004)(6486002)(316002)(5660300002)(38100700002)(36756003)(38350700002)(86362001)(4326008)(2906002)(1076003)(26005)(2616005)(41300700001)(921005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?93nuSsMfMTxcywNVQglFz+N9tYovUEH9t/gr/pGDWN0G5b4gYuwFDmTgyi8o?=
 =?us-ascii?Q?8tFASgR99EqKf8PEY+cutANvs6ZsweoL9QH7LRGoUCd/Jp49Vdg6XO1uGvXh?=
 =?us-ascii?Q?bQlYrK0EPW0VEc/n0Z71jnhd6hI/2YjURmV+bTXZ3ePechXf5uO+CC1fEpR6?=
 =?us-ascii?Q?IuoLeUGP1zQlW7FeJztJzw9bEDZppvtRO0/Cj44ge6Z6ObXjIddyECJmf8s2?=
 =?us-ascii?Q?e1is16tlbOwNd/JlPowp9GzQc+EmZKG7R1XP4HRKIARADrYbNAfrulZDhB5I?=
 =?us-ascii?Q?Il3I5DndyByHqXt2J/JSKP+Gm9nYJRdMhv653eEV4KG7jb6bGQ49+G766BHl?=
 =?us-ascii?Q?cIOWtjqSPa9t2s9CngNUew5deIcDNLPJ4LXzZAulwxGDbjHWMuFISGWDlBjk?=
 =?us-ascii?Q?aUhkHhuAux3lBsV/akfM6u60+KlPGtzO9JEe/vPcn8VW22vJw1n3J7AFBjD6?=
 =?us-ascii?Q?10/GLyhEFdsD7KsSKxQIWeDXFAF99+1WEh9/7FdOMIjOBsL7raAsAL7VLrXb?=
 =?us-ascii?Q?6BzLmRCOia8v5QZi7cnTtUzw4fHVbceUWldzj+iDNdomYVtyuglzDEZ51pt/?=
 =?us-ascii?Q?sz5MNwgFuvfmS01zbeqGG2of0R5m2Fyu3Jl5tsZ839+7jGfGS/O1FSYkVMmh?=
 =?us-ascii?Q?Td1npyAx+320jHZJJqcoTLx2FiiEgESdmM5xW7Far4bQfrfOzCLLwZrWOPYv?=
 =?us-ascii?Q?7j1qxN/t6Wy3xpCk/6ZVTccBZSoIK4RYo2SiA3Xq1N5fKBuq2qX/9KWBoOIi?=
 =?us-ascii?Q?fqVClMwl+BJZWsMdaJr3qcCvh0BD3s96dM1sSN4Th7ykQ/kEEJMLhU0Pw0Ix?=
 =?us-ascii?Q?EW70wtK4+GU3/bSYFRb2Mi3e3/Vgr09ZJ5VJqzbqJqa20dOXg7CNCqGKURL3?=
 =?us-ascii?Q?43F67ihKM+ryYqhl8QDjUH509VO6C9STvraePwaRQSD2XWX9Na5mc1IKchex?=
 =?us-ascii?Q?Z387/XJextTOeAoQ7WxSfGDOa/G0VkJQPXJeKiV6CPJZ75aXAAfAjllcU5HW?=
 =?us-ascii?Q?PN8R2KkHXWcuBRyT1OCx9oWn6IJb/2+ZL3vnwWji8AZtV88zTuH6hnSpj4Zt?=
 =?us-ascii?Q?iFHSovC+kdUdvRhOSl7d5Z7Dc6yXhrRoBKhSIikz/hiF7nEtFkNoOA1yjlM+?=
 =?us-ascii?Q?N/r+4OJFbpVmOoNVkvdfHFQEUMGeagQcjqVHCKrHYZFnqJArlescOY13YF/W?=
 =?us-ascii?Q?+0xdghvBQkewvVRfd1usCOB470FKwPtq/X5S+CaQTcccVLhuEbM5/m84eDGa?=
 =?us-ascii?Q?qZbWGimhVU7Xrf3lLxiKkbWGzyO6tHsjKKbVo8KHeBWcCoEEJHtX8mfJZhIZ?=
 =?us-ascii?Q?7fQ2tFEWajVwJxocvpzVsBd3Rp84Mrp/le1FH5w6l+diORzUcEtVc42lzqnk?=
 =?us-ascii?Q?0Y1PbSOimjfZ7n9KMsS3BoG8eg6GCChnoXavTPMMcW1D6H987esWOA/4M7sr?=
 =?us-ascii?Q?PnidFkx/FW7yLWpRWIUgxDGiCMjVzGELPgN1nu5Q4yb4RmytN0qBkknDMw/j?=
 =?us-ascii?Q?B9ERpULKDN+onJrkoEEdc665BWzQOihqVHpat3I6W5LXk6U9QLD7I1eMgW0+?=
 =?us-ascii?Q?ZFUt5nWn0PZZw9W1CUk14XD/6lYnQqYqt3I88BEj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee72aec-17a6-4f26-783c-08dbbab8a646
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 15:37:23.2623
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/IXUJDcvQMbwiyJP8wLhxtIClbOdUCxtQil6YwpZXfSusdz2iwXnjCyrGG0VkBkUh4UiRZxwiVCrhrazs0CtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10021
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

From: Guanhua Gao <guanhua.gao@nxp.com>

Set DMA mask and coherent DMA mask to enable 64-bit addressing.

Signed-off-by: Guanhua Gao <guanhua.gao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index de4c1758a6c33..6fd0dea38a32c 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -249,6 +249,11 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
+	/* set 64-bit DMA mask and coherent DMA mask */
+	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)))
+		if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32)))
+			return -EIO;
+
 	platform_set_drvdata(pdev, pcie);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.34.1

