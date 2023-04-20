Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC36E9EA2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 00:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2X3D0nPtz3fSg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 08:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IdFkAuiM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::613; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=IdFkAuiM;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0613.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::613])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2X2L2c4nz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 08:12:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EfdsZrvYUIyAtz//CAzfGYfg0yqXLVxtMUEE8jNKWswLabxx05MZvSPXN9yJjraYHJylixXR9MKySxE49C8tAqW3q+tZ8oM8kuDg7dvoiX5oNXriYEpLt3mFJhk4vZWdVS7g47wBX3Bv9w4W0fPzPiQvIf8wUt7nxXusVdnZz2o0HAnvw03R9u9rzcryJOTILmLsuOI7rRBSaittFVInmVKapjfu76qot4EyXpBuDDYvvkkmTGVv1rehzuv5qf+rN38gmhVH9P18UQNLeHg7Khdu6RCUyul4fKdQGRZJ6cqg9H1A6xjfkZ1nmEvDfkPLquqX24RvND1UaxmLZb3xPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JurXJTK5rtQMU+vd09hmOdrldOFWde9+YSSB0tqKlSM=;
 b=mNKzGpQEW/QxKeq/zE+xcYp/ZRMo4Jtk3xDQ6tohpIx8SXoqxDadvmvhgbySIFLa2p8PNeXljgGJsWcwXovJ/rlR8gWRki/DlwDHDr+hek+ukmzYqJLqlU429jmYl812DeGwvNuojjEJT4rCjVbCv1MBtQtcLlT2R5mJf8AMH6cLZHeZGtaeeImivILVycPZH4Uqd4i1DTl2vz5QughcyMNYBbgLjSD11KMS+8Po37tGIn+I27XM64m0+TqYG8a1YczNMfZ301xKrf9dFB7gBqT7SjlC17ypyKWDQP/g7Jclxq5qzchCMhVR+rbI7H0BWYYkxtIC3eN0KW/MatmDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JurXJTK5rtQMU+vd09hmOdrldOFWde9+YSSB0tqKlSM=;
 b=IdFkAuiMiEOoMG5pS2phPXqU3TU3PUVCH0x3YlOW8pL68lomFTubmSq6QDV5pcFZIpvsASLNWLhUhg/JHgWpqbS+w6m7lk5ZxEt+EcbiM/dhcprZ7jDrMTh7H/4uqK2Qq9dsbK+duEjMdhV//5LY7arVsm1+kdRBpP83LBXSUCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 22:11:45 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::f1d6:f05f:b8c6:4353]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::f1d6:f05f:b8c6:4353%6]) with mapi id 15.20.6319.021; Thu, 20 Apr 2023
 22:11:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Thu, 20 Apr 2023 18:11:17 -0400
Message-Id: <20230420221117.692173-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::22) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d23fec3-a7a4-4736-d825-08db41ec3a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7ZiT1Ca1p4VUP3u0J/1WtK1GDQfeXIRn61HJdz3zX34vaMGJ/v0Ma+m6mL7Dt8kHmyFXBLOxLctllFYgVBRN/rtVFgX12PISXpOXItzXHHOx+8LvrG2012OwYgcbcCrsN6I9loVknOb71r7aMm1LwrL3GyfNKr7XircCi67WO7Q0PJJBAxAPm/hkrNLgdGaXQ59Pjp8cum9ONJ+AWfEb5EdPe90EIvl2p+5jFOc8v8s4zlY5QSfbVr+qkRmvJtC7y6WZkPF+hKsNpoOxFjs3svoXA3FCQd6kkx+T4SDBEZlMvPRVy5XcBq3D4FgZmECs7YG0lS0cFgJSeOqB89m46R+zJUmHUA/XzvMyEG4/QPPMUdJxqH3ER4ceASTfKTubGLOAoIE1ecZMoIbobVMM6027yG1HmkoEYss9hGlSjMbwcuxjdJJhJ0aZ8qmtL7ODaJCndYxQV1VOg499OKAj5ZhdaVtfx5YupF1Wmw4FQBi/vw02rLR9r/Pv6fJnNxEnKdlKK08sU8EF6VUIBELBU4mMWaM2UcF3jN11utGG33uUbjM5SDiSE9VPD4JaLbmX86koWIxSwEqBYwgOTGnoJG9SrniiRR5sic7ehRAqg0FUARlQjNByTjfD+N+hSNkqrmx8cZN6L5OVNN5IDrXGFw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(451199021)(38100700002)(38350700002)(26005)(1076003)(6506007)(6512007)(186003)(921005)(5660300002)(2616005)(8676002)(8936002)(2906002)(83380400001)(36756003)(478600001)(110136005)(86362001)(52116002)(6486002)(6666004)(66946007)(66476007)(66556008)(41300700001)(4326008)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?eyfmHJNvcE5VRVlCW5euX4FnEa5CYjPEnVHzlK3excO50sOa/iwwefJzMmHf?=
 =?us-ascii?Q?5B1rVmDobgjJVihYMj7IWXnk/kA4lGlN5OQsjyUrWJgpjqckRfzIefmoYt/d?=
 =?us-ascii?Q?xOu3x7W+Bk0rYJXJP9L+sYFVHM+IuiDvk7dev+PhTCQMN7Bb3T0pbpEm0EEP?=
 =?us-ascii?Q?SOL1yIKlc3EXkuzjx2YE/9SrBLCLHJNb6ZAA+/nDBkS6iARBnxwDv7Y95gJv?=
 =?us-ascii?Q?rw1K65v8CQGRA6mZ2VFFSTBH45QxAUeRAaHxnWQNubDMKkzoptMyhgQewBwv?=
 =?us-ascii?Q?OZEnWgEMU2PY4OuI7FMrk8p610EaQ1TcXoCr0WHYMAEIE5EamHK9JnNoTQJG?=
 =?us-ascii?Q?zjnkPrgatPRQgv5h2hJk2MoOkVcpjX1rJzrV+Vx1Bzf95XfTbtfc1kLlVOJm?=
 =?us-ascii?Q?aArI+3LPHB0Br90hfwQGorSjnBAIksJbqiHraFizcjEAVT+omN6ptr67k6oC?=
 =?us-ascii?Q?H3wvTeJmHpB6nu3tISxHt+bqBuvx8FwRPY5JVzfgg+QOhdpWbB8kPvWpUEaR?=
 =?us-ascii?Q?P+cGzqRPdYy8c2FOkjl3worwApmzSfoTUhyv5piDCwv96wE5Z7A7EeM6Is9S?=
 =?us-ascii?Q?P+bNkTpm18iAlkhDmbd4azCEYdHcy9xwIoQNqz5w6642YcFmYMfmNtBKLQ2S?=
 =?us-ascii?Q?H7MKlQqfxX2kkjxdWmZbb6hqNrI0Yo3Adsr1uzLyqZOC1bGs5tnxWpiqDKVN?=
 =?us-ascii?Q?cYgXFMxStYh6GnrpORy9Coboad16p6udUHdSrQ4FzW1SsyAfMUXykqcfvqEu?=
 =?us-ascii?Q?OAAIWQQZ2PjNZRpTn3nDhOD/7KI5iCoi25Y7AihMHn27Ivls3qJS8dIXuEc7?=
 =?us-ascii?Q?6ca6/7mwh/6HgAy0fiF4UO5C7o1nDJM3E11zudwu7ulTHedsLLjtq0EwTZ7b?=
 =?us-ascii?Q?YIymoWGZGibmeq4Iv3jnBwKqLkZW5HST5P/6GkqVWN1/YutajyeQ6Fl3/my8?=
 =?us-ascii?Q?VhIedni00V5ymNW661Us+PtH0fJDgX1flAOrbbAPKwZXQXcwJ9pMTtI7zl1f?=
 =?us-ascii?Q?2zR4+SWGUmwTFt2EYX5btZ6WkS6FspcGCe6PtZSdtMcpxT+D5hnXj87JDZCs?=
 =?us-ascii?Q?KPevFOUQa/oUHVq4EH8MqSA9JWF00NqduTwAKLHXoJOKCC/N1UiYwofc8XUc?=
 =?us-ascii?Q?sSA0jo8wURvThLpX0CHMKiJtn0/oA91SZQ5r7qC5moqLuq9cdkHa+LldNq9A?=
 =?us-ascii?Q?gp1UtRUsFtwxgTqaBcKqVWfC9YsjUj89QDFA+1HiWiND5dENrNp/o01ZU48h?=
 =?us-ascii?Q?Fb49hYIcThzU0XmDzCjwPFAjTjZg0Hl1lS5mAfQxPcZ1nERHH3QFnZt+h/bv?=
 =?us-ascii?Q?jg2YM9+XfHdrSownE1OsaE45mEhyIWg21nWLB1LEWCMn/pAoqwQDA6RWx7+z?=
 =?us-ascii?Q?NgnSuUAry+lfC8AYex0nzyqIlUWoY7VIioUIKq/R2UmbRl+PNG2WSM0YXN5m?=
 =?us-ascii?Q?KJ17fQNQksXKwuIYoWk1AQ9Rb+flEOEHFUpFcYFaKABcobyhCQKATc/yJOqE?=
 =?us-ascii?Q?B0a5RU2kJHPeFnzQS/Pl2Cs6+G+Et+F5DYnzuKz5jeqG0M9LW+wW7nvThDtp?=
 =?us-ascii?Q?dan6pwBLNXAcR/UfLYhnhtNuAH8YNgfsDPq0pgdK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d23fec3-a7a4-4736-d825-08db41ec3a20
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 22:11:44.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V08zSY3wYncKUsvjDFbk7oxjfmqb3jlyqyk7xKibHBc1WEzlGBZLtqtZzSzns5vZtLxjCluM4UH17cKLcjJCfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918
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

Layerscape has PME interrupt, which can be use as linkup notifer.
Set CFG_READY bit when linkup detected.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../pci/controller/dwc/pci-layerscape-ep.c    | 104 +++++++++++++++++-
 1 file changed, 103 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index c640db60edc6..66d4a78a30a4 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -18,6 +18,20 @@
 
 #include "pcie-designware.h"
 
+#define PEX_PF0_CONFIG			0xC0014
+#define PEX_PF0_CFG_READY		BIT(0)
+
+/* PEX PFa PCIE pme and message interrupt registers*/
+#define PEX_PF0_PME_MES_DR		0xC0020
+#define PEX_PF0_PME_MES_DR_LUD		BIT(7)
+#define PEX_PF0_PME_MES_DR_LDD		BIT(9)
+#define PEX_PF0_PME_MES_DR_HRD		BIT(10)
+
+#define PEX_PF0_PME_MES_IER		0xC0028
+#define PEX_PF0_PME_MES_IER_LUDIE	BIT(7)
+#define PEX_PF0_PME_MES_IER_LDDIE	BIT(9)
+#define PEX_PF0_PME_MES_IER_HRDIE	BIT(10)
+
 #define to_ls_pcie_ep(x)	dev_get_drvdata((x)->dev)
 
 struct ls_pcie_ep_drvdata {
@@ -30,8 +44,88 @@ struct ls_pcie_ep {
 	struct dw_pcie			*pci;
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
+	bool				big_endian;
+	int				irq;
 };
 
+static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
+{
+	struct dw_pcie *pci = pcie->pci;
+
+	if (pcie->big_endian)
+		return ioread32be(pci->dbi_base + offset);
+	else
+		return ioread32(pci->dbi_base + offset);
+}
+
+static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset,
+			  u32 value)
+{
+	struct dw_pcie *pci = pcie->pci;
+
+	if (pcie->big_endian)
+		iowrite32be(value, pci->dbi_base + offset);
+	else
+		iowrite32(value, pci->dbi_base + offset);
+}
+
+static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
+{
+	struct ls_pcie_ep *pcie = (struct ls_pcie_ep *)dev_id;
+	struct dw_pcie *pci = pcie->pci;
+	u32 val, cfg;
+
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	if (!val)
+		return IRQ_NONE;
+
+	if (val & PEX_PF0_PME_MES_DR_LUD) {
+		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg |= PEX_PF0_CFG_READY;
+		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		dw_pcie_ep_linkup(&pci->ep);
+
+		dev_info(pci->dev, "Detect the link up state !\n");
+	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
+		dev_info(pci->dev, "Detect the link down state !\n");
+	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
+		dev_info(pci->dev, "Detect the hot reset state !\n");
+	}
+
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+
+	return IRQ_HANDLED;
+}
+
+static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
+				     struct platform_device *pdev)
+{
+	u32 val;
+	int ret;
+
+	pcie->irq = platform_get_irq_byname(pdev, "pme");
+	if (pcie->irq < 0) {
+		dev_err(&pdev->dev, "Can't get 'pme' irq.\n");
+		return pcie->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pcie->irq,
+			       ls_pcie_ep_event_handler, IRQF_SHARED,
+			       pdev->name, pcie);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't register PCIe IRQ.\n");
+		return ret;
+	}
+
+	/* Enable interrupts */
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
+	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
+		PEX_PF0_PME_MES_IER_LUDIE;
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
+
+	return 0;
+}
+
 static const struct pci_epc_features*
 ls_pcie_ep_get_features(struct dw_pcie_ep *ep)
 {
@@ -125,6 +219,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -144,6 +239,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
 	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
+	ls_epc->linkup_notifier = true;
 
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
@@ -155,9 +251,15 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pci->ep.ops = &ls_pcie_ep_ops;
 
+	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
+
 	platform_set_drvdata(pdev, pcie);
 
-	return dw_pcie_ep_init(&pci->ep);
+	ret = dw_pcie_ep_init(&pci->ep);
+	if (ret)
+		return  ret;
+
+	return  ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
 static struct platform_driver ls_pcie_ep_driver = {
-- 
2.34.1

