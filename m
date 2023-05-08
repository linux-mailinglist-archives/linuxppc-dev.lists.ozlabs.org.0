Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEC06FBA4D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 23:54:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFZn253GWz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 07:53:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eTx9w+If;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::600; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=eTx9w+If;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0600.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFZm95mbXz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 07:53:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N1LNal4wTx/Tc0xdkNR6OBbR/oLkkgkLtVx65OxUIiCM9w+KCoiwDFerba4aAm15NZ+SGOyx754/vgNG78s+Stj+my/IWOP37yEabOeF+EhG/6C4vYohOXYSc+5X/C8yz31k0wZFSPIBZI9N1WbGY9ZpeS8a4UBN+ut/+2Hfl3WEYOdQWezYWeHJtlII0G9ySdPNDJrif5h6EQ7T4tpq1qHTu6BHZZcm+p86alc7NJCwDzFhkjhqYILpXPR681/h7Bz4ygIimNAY3FFk5+T7nxOKuhukZTqARiSo7ALcogvlJ8XkCr00LPPMFA3rnY3OSkYz2kDO7XW/23T/vNlI0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4qZYxl+LgAGFwIEgrMn7JTkJdlFkYk8bwwrX0ndO3Q=;
 b=DUSglFnRF/HMPOty1tFq5wEE4DE0M/dYQCn1oNbC0FVTlBLOfa2wMNvrVAm5FL5bOWNXruWobDJTVZiHEAMkJH5m/7+hbj/E3QG2fNiT1dSXaKdSpfpDXr2oI42s5oPacgFrEC/TkATq1cQL+lej0HJkwXzukMGjHFrnmOP3JHwJfyHnnrus+wH49nSJcWNI9BKIg/TbtewpEp4mryx9rrmEmwQ7FkxJ7s2cnQr52r7jmR/Jgcg6wI9IR2aRW4SObx0WmrL5UIcfdNK09d1l1mSn6haPk+uJi0VoeNikmxjvO6t+e5qaNZMo8Og6OqA8NLxKEgtUDXtQLGmtZnBlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4qZYxl+LgAGFwIEgrMn7JTkJdlFkYk8bwwrX0ndO3Q=;
 b=eTx9w+Ifm1yz07YwY7CXnmWdolmNg1SwGtQYJbbd5KzyLDAV6/Zd+QU9Ta8YNxvEi17p9WYhDIS3NWWcseIskhrNdptiKu/MLEUtIOU6ExUFGEVgHGdDKjjg/c0FVg+6dyBjgSgJPONkXfEdqtMHiy+cLHOsIl2CxVtJNhTeUzM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM7PR04MB6983.eurprd04.prod.outlook.com (2603:10a6:20b:102::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 21:52:53 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::bcdd:75c9:176c:39ed%4]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 21:52:53 +0000
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
Subject: [PATCH v3 1/1] PCI: layerscape: Add the endpoint linkup notifier support
Date: Mon,  8 May 2023 17:52:35 -0400
Message-Id: <20230508215235.1994348-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::33) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM7PR04MB6983:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b37225-fa76-48c4-23fc-08db500e9353
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iXjd9aN3zriVvn7rzGDXLcKIS7KmpEjtdUWvWYDVlDBNlOpU5croPXJLNmU0T9G9cQamkFy1u5lU+/6OzRrT7TzBH6eiIB66JIrkyP3uwfr+TeH3ab9B8rArpUyOqrnDOTVnXhkJK4PWjmcJjcWSHfI0hSon4+NAE5/naz33/112RJhyynCKBWES2iIVphOD+8K/LCTbe2Z8parYW0Iyar6IWpcTMKoQAVDV8aIzt21PNcIV7DgvUkSpSYDCtQ9jRKS+62mXCYKMosGmHhb4ACSojZG4nMFAYDEBhxlXYKI48TOOWtwlqYYdZUfXvso5YQEIzHN1lMXFOx2DJj8czrRATdK5qQwfQofW3EQzuzrWOHMIGUYEi1gGMi1fQpFYok9L0XJE9IXnVCz9Wyo0cD7q7wTtXJPJMxaTxrxsm7Zij34DVuue7itlG91VCqEnbZ+VnkudQXhtEaQTgRLPGB5Lq2ufAR490nj/ylpf0zrsde9I5Q1aWSn2tmorxu8ZrqmHA/2lPTJVnOhxvrxzQpmOMeapm3H7jQlMFJjyqL5a+ljQGmfUcIiMAPLaCm09vKwv56AFgxfILndKOaNKFDd7CQesQmUtu6u3LEbLuhBOy398L7H48fHdtYVubMbvLRiYKHMKsPdKuXmlEvsgVA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(83380400001)(316002)(66946007)(4326008)(66476007)(66556008)(478600001)(6486002)(6666004)(2616005)(52116002)(186003)(6512007)(6506007)(1076003)(26005)(110136005)(86362001)(2906002)(36756003)(41300700001)(921005)(5660300002)(8676002)(8936002)(38350700002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ukELYIx6zBhpNHFWknftDhvt6l9cHKQVM11suUYMHlLMqIYfqfqso9/o6rJg?=
 =?us-ascii?Q?CoN67BywPOhANNxWj7GoCgKxTQ5zE7Q+6JlZx+m4lI/F++c1L4uzk1LVAsNU?=
 =?us-ascii?Q?DA1j/gex67lT9PUZ3BxH7LT30dgOSONPMo9IGzf+TqLc2lmq9lA0GWWEfvHm?=
 =?us-ascii?Q?+gvcq4RRyomFgTvF+r2kNM7NEHihB54M9kiyG2Hr+9HATtcRAmvn2LpXPvL1?=
 =?us-ascii?Q?833xncf1+gsX5p4ubX/LYRmd7BHx747ousaCByBjiDGCf8VvM0q9WJuBpqcs?=
 =?us-ascii?Q?g8nt/cW1TF5kD0LDeaksZYDQL8x24P6l/1vs8HpFSwQvczpYFWXdpnnQereg?=
 =?us-ascii?Q?wAl+DLzlxeedyf9eRyrKjflElbwAnpYsLb8v88MhqYmNaeM8gJfL80DetW0q?=
 =?us-ascii?Q?s+2Ud5Bc1yKAm6jb37HILHgbklJeIgl8ySb963c8XADIwxSDP3NbkXw0ALYT?=
 =?us-ascii?Q?6BzXp9PeYXwcKmbjee2w+PvB6HF3bTTQGW1PO+aAqzkvMQjqbpHI8vLcP22w?=
 =?us-ascii?Q?cLkTdzmzVXShV1sQgZ1iS8vUNU+gAgcuJLX19Gx3A3vz0I7/Faxju8n9RLQk?=
 =?us-ascii?Q?2RArPl6DrVx77fi3DzGJaXYNCXtJkyJBpZJsa0bnmOpO0iN7fTnWi+d4Hp0S?=
 =?us-ascii?Q?n9da6uITD8HLS7v2R/JxI4dIQKhZs2e6r1xi62UlrvePbsDe8uAjZtsGx2eq?=
 =?us-ascii?Q?dJNeeawdjWwi4RLuW+rB/aXA5AnrVc6doFfqvpRIi6PjzM2dSaY5ilPMUf0r?=
 =?us-ascii?Q?M8Msx8//sYk8p/+QRiPlIuMWklWVrmrHZwsUxHTl/KO9qI0WOJBnAMWA9SZt?=
 =?us-ascii?Q?p0svBFBVXzXn7BkGC1GZiAMIbDIIfKLFDOlNv5Gs3XBmxOcBE8VzIvYpp1WF?=
 =?us-ascii?Q?xDmYhLaNgKai3dlyd6Pv79rTPX1NhC3B1lS3kZKF2T5XCyCDF7W2YRHe+wEZ?=
 =?us-ascii?Q?sl0UbBL9IqYScdzrSyobg+w4g10GP0u8hJpsbcldtOGCDrt2oGSQ3kw6R+LY?=
 =?us-ascii?Q?MdShqX9x3lzjyvkMpfBykOh0CiM9X/QLtVvfGLrCY+oN0DJOH2xjWILLVani?=
 =?us-ascii?Q?2Xq5DvWhKLTVZUruO3qHPy9fLi3ThFqNiKn0oChmWDieWuzjMBa7DN1D3N8N?=
 =?us-ascii?Q?93uUfRQjanRWTgoMeGQhA64n6cNxhPZvTc/ebJSSaoNDBAnqsgNjwbuuvzcf?=
 =?us-ascii?Q?ywFLPtLVS6AqmOpo4DqqSRjY2x1Aih+eIb7fT0z/eB0IVIMrfy7N5kOQ4q73?=
 =?us-ascii?Q?8S4kcS2rSqloBlkOVFruq/PW/1TPnpKTHfzGzP3cdzj8Qxp178IAEG6FAmIH?=
 =?us-ascii?Q?kJ2nB8MA9+X4mpaXNUf2vmTLpABlDGdClwRtAvSAcy5NCnf+5x+UukAiiu9A?=
 =?us-ascii?Q?kVJZP4DVuziM06GGikv59MXhrOesVFvyOxaTlBCnbCDiuBrAblyp4ShwjSCe?=
 =?us-ascii?Q?DqTuW2rrGF/KuKGUnbvF++S7UlQNKdiirhpHAjPk1/oLjjFIadnKAXZvDqX4?=
 =?us-ascii?Q?gA7x2AWxGwmdMP/OsdPNhGSmJKf+cvb6OYL7XG6LQ48fRV4CvcM64Hq0Bi7r?=
 =?us-ascii?Q?FXxgTe6s7TWGEYReo7Q=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b37225-fa76-48c4-23fc-08db500e9353
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 21:52:53.6576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1/8smuSQXbRaXHkO1DATLMFh5zRsnlN2GlVBk1KxBQPYJ1cAlp1iClch84A7L8svu7bA0FAL1ifbkZbTcOYkdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6983
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
Change from v2 to v3
 - align 80 column
 - clear irq firstly
 - dev_info to dev_dbg
 - remove double space
 - update commit message

Change from v1 to v2
- pme -> PME
- irq -> IRQ
- update dev_info message according to Bjorn's suggestion
- remove '.' at error message

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

