Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EB36FB1FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 15:47:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFMzT3yvSz3fM0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:47:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VTsJQnZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::604; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=VTsJQnZb;
	dkim-atps=neutral
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on20604.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::604])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFMyX6jcCz3c9x
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 23:46:27 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUK/CNi31IwjY8uzhkJPkxWgxBmUEssanWi8qqkYE1FA2FgOh6AA26SzflCfwoLwjYor8Z2ZJ3npw5pB0jKc12nDWrQIJ2EifbcfkebKFJ/ISYkxJYtoPkldduXfWUnN8KuuTckqnlK6Z3UFgUReavUy72HDpO4QZcSY1dQ5FRMSfmL9yFH/krPlYAEwVu1uACByOi0K59EG80jfHzzZ+ZKB0drZei+E2t2xIcWCkJUJ8GkvQdDX2w1LL06wNaxblcI4Pr0jwBznOVoVHW/EQfSEHhLhKIBdMAXeBNjqvavLu5+AzkQ3zCM+0v/W/lOC/xOnEWJnSxU6WHIZ/d8tGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LoQ19bYXE2p8HA/ylDCP0SiXrlNu+lcWB8IPvKh+Lp4=;
 b=oXqVb9c5xi4Si9yrmWE25sGVLvg7jBB4Xe8vFrHPeYysol5GU7ZF43+BI9k97yh/HRZ4czn8OQew8cFWf+BNazMHY1HDqcmG7RzdgH3SJiXw+LakyL97uH/TjTCwau07VTHeGywEK2kq6RpNPb1UbvuzyGc09V6CXmu31s4mA8LeOivG5lrtiPWtja8tnFjBEmtJoMmEo2W/kq3Df/TNxIV/K3dfOJTFh5V2H2NBtY435tmh9oZWlTXa6MZvn45H05SmO3MopxbCBRCkisUPXTsfRbsiXhbczSpRbtBhgl6QwDE6JtAPpAUSkPCZeECd1C554Zqz6L00JMdRsYe0Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LoQ19bYXE2p8HA/ylDCP0SiXrlNu+lcWB8IPvKh+Lp4=;
 b=VTsJQnZb1+SFIqnO8m5IxlK3DU2F2TQMSSynzrJjdooisHk2zXFyjhdHd2nNxfd57yRwYWUy63SDZwaiFfNpRHDtDsFS/FAcarbY50LQ5Wso1keVL94Wg+I5ouq+aeCcOSVcCxt7ALMH5/1kjORf+koc8HvJ8xgHOi41DaVfAp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM8PR04MB7330.eurprd04.prod.outlook.com (2603:10a6:20b:1c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 13:46:07 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 13:46:07 +0000
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
Subject: [PATCH v2 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Mon,  8 May 2023 09:45:47 -0400
Message-Id: <20230508134548.1934970-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM8PR04MB7330:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d274ddc-f66a-44f6-d12f-08db4fca92f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	aeQZkocifZrWVCZ9hbCfC6MEYN7xn+YsdP9IiSniJBZn886JdjiyDuwv+GxUHPmCTssKQeNKKWxnW6r7cRDVJ1unjxSzj5y3EjvNHHs+Jfhs2T+fEMtywovl4YnT8zGVnFLC7QJrn3b8tXraSVt8ZEfqaJ8snlFJQLjtFn+b2+6pvOjtshDqMqi8umvaZkXmgQkb3iB4HFdzPrwqcI8qKlwID/aWB3qyyggnJ7yzHkzxYBJCpw+7AviwZse5az1P7ZnAjouR6nctK2gIO9sGCHD4F5efPbKcb1yPvOwIo5jpjKbtQnZ2xggA8OBht6QX5V+chWsa1nIPrBfU70kAEXpz/K1STnTDctsoSwnCx3jUikxrso9RNBUDCWVAfquVkUl4IV8mOeKxrIJjGkygP4szoc99d2eLWEKn1s6U3zTF4AJoTaQBy9K3+FVpgNnutQ/BH3wcdp6DcAyBR1nx4sHbZHWlkG3hHG50ATAeqatMwqV33NBjg6d8m1zjmubLgywqkzPUB6Yuy+d2/RWmvy76bVYp6CjwFMqRXYOVvwtZ85I/Brq2ogYGE6zKElYbOPoGatxhCZ8PdJXn+czhp63tTpGvmwOiUDtP0iH4KObIVWuPzB2PjpsePs5CkCmdSkvD5u2irkjPwDg7IgaRPA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199021)(6512007)(1076003)(26005)(6506007)(6486002)(52116002)(83380400001)(36756003)(2616005)(38100700002)(38350700002)(86362001)(921005)(186003)(110136005)(41300700001)(2906002)(5660300002)(4326008)(66476007)(66556008)(316002)(8936002)(8676002)(478600001)(66946007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YijV3bSytbxXcMZHImtI3GS8ihClVr+N/Y7VJWJ0KHlmeVTNk7l95HRFSBZg?=
 =?us-ascii?Q?qk7R1C3xcd8VEvX5Uk2z3SUCr2tfXBXhSidLOquHEciX0LJ8fDWq7gPl7Ht8?=
 =?us-ascii?Q?bVSSpNueII9G5DG7kl0je9mNtr0IEmeXC8LvBy1menL7mUBf1zYhQMuTA420?=
 =?us-ascii?Q?tcejt3PBZKAFtRvciHjkWqnh8K1eQgg9X3EnxJywvAe8HekU/y38KVAueKuG?=
 =?us-ascii?Q?X96dW5CqD9G7l42Tg8Is0W0PWuAxrjWMsIsnRuCMdxi8WaymPHJCYmDupLbf?=
 =?us-ascii?Q?+LV/ovV1Ib7p3WbbiC8ZF+5CDIYTMFDLa1ULUbCRD3dxQ+po4QUNRy4ZJ63n?=
 =?us-ascii?Q?jkz2YocaFpr5aROjl0OoCse+0iYMfzs5zDOcwQC+NOj8GimGeo4qkPkhi3QP?=
 =?us-ascii?Q?o4eXEw4BKEe96Ik4galHHotkS2h2jBe9Zczf5s/JEqd4G6cA7gRNOD2e1kUL?=
 =?us-ascii?Q?fnnrbp525r587PM8cj+AveekvUal85AavAXH3/2mxp5qqAmb9BBf73qaABdS?=
 =?us-ascii?Q?yyl812R3igS82TlgKFzCKqtWWCKvVT6dUWTWPzHIZJ92GVFeyHDoJkat95MY?=
 =?us-ascii?Q?MWbp+IB6e8prc8KS6SRJ2OmElN+tSI8lgildXH6v3mEa9krmZzLDYX+vaEIc?=
 =?us-ascii?Q?EnLR1CxAJsgKCUTN57FBGc03FWeOgYwNfVCALTEgyAgr2yIyPJDSgnELKU0M?=
 =?us-ascii?Q?wlWvJfrGbjvhhCKF+ybjqjwDoEkoskNHrsSazk466r+23VG4pPE0FzDE8oeM?=
 =?us-ascii?Q?cDlXejvbHdfTeniAOph4zuLfZvs70ADEseSpyljiUeUVNB390EJa4+SRv6TH?=
 =?us-ascii?Q?YbkxAwdcON6j04IOG1SlgizoGWtNZIqlwKHOxkDFYqceT+d8frwZy9iKUUgl?=
 =?us-ascii?Q?3X7Dvk2m2f6jLJ0R/EQf8b4YzFZRebag3d94USbSmJNLfRydNApiNkCXvFSV?=
 =?us-ascii?Q?frHuOb9Lj4B1G4I911jqlAaY37P8wfNXm5wTCxe0Ghw5lZq3UZlYFfKWVtxV?=
 =?us-ascii?Q?a6VjLdUbqnYCby3ZPZvRa8I3C70IkK4YtLc0CiP+uWou9t1XHarvS6/FjWsE?=
 =?us-ascii?Q?JDSpr/tQNLKYBHjksKNxhYShyG2RPXmWb9GymyJ1z5fHJELXf43YfwBv17rq?=
 =?us-ascii?Q?OzLEAG+cuT3E/zO5Rh/Z6Mz4zXiLfjFZPPII2I6m6Tb1xAR0i91lcgbiF+rc?=
 =?us-ascii?Q?yZhTw+wBplIMR/lOdJ1jGPxGcA1xkbHL8EPkcL9RV1PTa/SUVGHWVyjT7XRO?=
 =?us-ascii?Q?+tfi7ujyqILwoTUNgclvyrIUa9K7UN8USsjAgC42/ctnfE7d7MAOy0c1AFje?=
 =?us-ascii?Q?NQp+7tQzbnN6C840KJPpP2xI6Erlc3exVT4Yovi68pyjSoPNCHvkCwDmnOF5?=
 =?us-ascii?Q?W6RZi9FeieTzUmfh+ltQuUF5lwjL4Sn/O15/+B6mnBu55arEd73wayMsMRjf?=
 =?us-ascii?Q?y2Zbsj5h0UYBbYEcbgeeU/KYG8c/+suQfnZgSmmom5z2UQHbnD2NIhUDVo0i?=
 =?us-ascii?Q?7dnUa/DfaPP43jGQDSrlwfYw/rFXtXORpnIzXiNsHXZnURyDSjGv1nIxzrEf?=
 =?us-ascii?Q?G1dqXmOXvlZBLPxuwxl5xlPLRIGfxRHt4wonrPrF?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d274ddc-f66a-44f6-d12f-08db4fca92f7
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 13:46:07.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlFR9WkkG8JuiSjHtLnT87b9a+uAricSKP6ntHeuFqGoJ4u4m+99tEvZUqkQB5xwqugeQx9NO6YwFuYufXl2sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7330
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

Layerscape has PME interrupt, which can be used as linkup notifier.
Set CFG_READY bit of PEX_PF0_CONFIG to enable accesses from root complex
when linkup detected.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../pci/controller/dwc/pci-layerscape-ep.c    | 102 +++++++++++++++++-
 1 file changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index c640db60edc6..1a431a9be91e 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -18,6 +18,20 @@
 
 #include "pcie-designware.h"
 
+#define PEX_PF0_CONFIG			0xC0014
+#define PEX_PF0_CFG_READY		BIT(0)
+
+/* PEX PFa PCIE PME and message interrupt registers*/
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
@@ -30,8 +44,86 @@ struct ls_pcie_ep {
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
+static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
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
+	struct ls_pcie_ep *pcie = dev_id;
+	struct dw_pcie *pci = pcie->pci;
+	u32 val, cfg;
+
+	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+
+	if (!val)
+		return IRQ_NONE;
+
+	if (val & PEX_PF0_PME_MES_DR_LUD) {
+		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg |= PEX_PF0_CFG_READY;
+		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		dw_pcie_ep_linkup(&pci->ep);
+
+		dev_dbg(pci->dev, "Link up\n");
+	} else if (val & PEX_PF0_PME_MES_DR_LDD) {
+		dev_dbg(pci->dev, "Link down\n");
+	} else if (val & PEX_PF0_PME_MES_DR_HRD) {
+		dev_dbg(pci->dev, "Hot reset\n");
+	}
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
+		dev_err(&pdev->dev, "Can't get 'pme' IRQ\n");
+		return pcie->irq;
+	}
+
+	ret = devm_request_irq(&pdev->dev, pcie->irq, ls_pcie_ep_event_handler,
+			       IRQF_SHARED, pdev->name, pcie);
+	if (ret) {
+		dev_err(&pdev->dev, "Can't register PCIe IRQ\n");
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
@@ -125,6 +217,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -144,6 +237,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	pci->ops = pcie->drvdata->dw_pcie_ops;
 
 	ls_epc->bar_fixed_64bit = (1 << BAR_2) | (1 << BAR_4);
+	ls_epc->linkup_notifier = true;
 
 	pcie->pci = pci;
 	pcie->ls_epc = ls_epc;
@@ -155,9 +249,15 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	pci->ep.ops = &ls_pcie_ep_ops;
 
+	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
+
 	platform_set_drvdata(pdev, pcie);
 
-	return dw_pcie_ep_init(&pci->ep);
+	ret = dw_pcie_ep_init(&pci->ep);
+	if (ret)
+		return ret;
+
+	return ls_pcie_ep_interrupt_init(pcie, pdev);
 }
 
 static struct platform_driver ls_pcie_ep_driver = {
-- 
2.34.1

