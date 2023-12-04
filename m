Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12D8039D5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 17:12:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pRpI/4fB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkTGB1gFXz3vdw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:12:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=pRpI/4fB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkTBK1hY4z2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 03:09:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ON9vFi1WGnObsTgsbuBpyyco+UPLTyJZ13Tbq4siQNovO1L8HdJMrIGhGMEy/bKZMZZevO/DoXrQlxe3yXfd8MlJ4dFbZo/E6A9UiR6SY1qFNGsLyAJZWa2NrQGx7N59omJ6a/lDbQe6gZry2YFXs64OCpiEHhChRNpU66rDNDqMwn6C2wZYdXAjRZLYQ3UKsSaGxOIiDHHtkEaFb5JjFbxu36wqjCRN1s8T3a+B0aeytJ8rq5fKXerwEUhCyRVlaOzBF6xf2Km3Cbwuk6zwj9O5UCbxsLyrrJ53sUwGFr+oBjyO8/PTP6DWZ2Hbr+Vhuv4DwV+wtbVTHeRYCtAa3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=52Q8cSIA6WpMTgexlrADj4cf/ZE0hy46/PA2Hbstat4=;
 b=b/x1Odwk6ALUyd97OM7n58hHrW+OUUG9lQD50uRok1b060+2bBUlgFlE2QNw76ZK+7h3r1EVrtNbteRdE6qYMSPWBbXadJOxfZqFKo1fgWcJUWLHK0X2cxu3YZR8YfQuv3f0hJ2U8BchEZw/hejkmtxCqfbaWoN/pCEBNUV5pr+J7aUeb7Zzny0zadiUoYu5jrWbsyRExlVay5pnOCnXEvzl2T0rg8f24hHm9ftVApU7O9xORPWiWrJxXQ0n6D+5Ef3GRiHseeA7MxJHWZTo7CTzE44Ew6F5SFdszAp7u51Wo2Qkwi+Hzus4UlgJSlQ3AHbY82uUNdXmoOcsJrzp+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52Q8cSIA6WpMTgexlrADj4cf/ZE0hy46/PA2Hbstat4=;
 b=pRpI/4fBoHaT7Y/8x6KdD+B9jP0u8EhJQV8boEMZ+moHAf0EVwNyOwJq/svJoXsoCHHXvMMQhyI488q9H5e8Bb708L96EqgWq2Ln525p9RPB/MM68d46Hn6i87xC2CZtlsQa1lCBC6qhtSJjJIGbopJ9vPNyP9JGZyl8GiANnrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 16:09:00 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 16:09:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v6 3/4] PCI: layerscape(ep): Rename pf_* as pf_lut_*
Date: Mon,  4 Dec 2023 11:08:28 -0500
Message-Id: <20231204160829.2498703-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204160829.2498703-1-Frank.Li@nxp.com>
References: <20231204160829.2498703-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBBPR04MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: f52cf39d-ed16-4188-b624-08dbf4e3535e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	X/9C6RrOT4xZOYqDNj7kPcruITCnICb2fZAHc/TRXCTH1duESon4h8HoLRZkBLTt+IG5becixP2FCR3F9j6gHQ/q6Ui7ljV7gl4SJErb7du4q4mg0jNCG+41wRVxJOZ60/LW7+nRTlAVgUyGjD59c0GBTPB+CzZwjG7caOBjybray4yIKmaMU9G2SQm4frjVN+6XjwT18M0Zlq3XkjNlFmFJjJrIxMnATf+8w6AK3/KSrRHsXPbN3rtgc4Q+1K2utgF4M5KSwpP3jVbJa6svFasdY2T0zZc6+AfqaScNYWK32ezP6CMI4fiu9nMLzKdqMSwUHkWCYduEz5k2D7s7FTXNt2t30/LPc3rzHrQTsOrMCR4TWZMdGlEB7VbjwkMRn1W/DTJ6HQpZLNSYabbcfn1ZFJhC/yeawL8JigvMm6Ou2zxtQvQFjTRHCPpC2PK3JiMEw+1vydMbe9AeFvuBCODI0RaCroIxZEWfFVYF92w0IDG+O6r//qXMGygIalG612251jAJfUb56Y/KIlehYiO8+Nj5b8KUwGqzAJ6kQf3Sa+MS9t98qHwkSXaJVi8uIvPLe3jR4TRhGX9mmgTCNeO/Za+JZc6hGYElo2fWRXhdTTQlnDezHfnfV20eoV7j
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6916009)(66556008)(66476007)(8936002)(316002)(86362001)(8676002)(4326008)(6486002)(478600001)(66946007)(36756003)(41300700001)(38350700005)(2906002)(7416002)(5660300002)(26005)(2616005)(1076003)(6506007)(6512007)(52116002)(83380400001)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wMvVQSWTE8yBqx7NUabTWVcF7qsXGDSU8fTv2Q3JDIZMl3+zNdNPM/rBnehH?=
 =?us-ascii?Q?080eGFtV3jI3PgqIoAbelTfoK2f7jeP0Sr3dlNrhqNM0DtfjwjxIbdGwBEUA?=
 =?us-ascii?Q?qoN7ikSWijLBtCg55i5rzlmS4SEOfXgCQq5lmsz4VVt8kJaTRJScl3uTLa16?=
 =?us-ascii?Q?DjxwHV9YxR0/WBwsv35yEe8SKGug4QDcm6ULFjX1He0CAe0Z5s14sBrotbpe?=
 =?us-ascii?Q?F1RCqFd7oaSonTDnIOpT2x+F4xtzUT6rYjm6dS8PDybiRbjLGiQTRqDyYNg5?=
 =?us-ascii?Q?Ld/Y3+fdSlQFVf/g/S3fQPmw6CTy4MF3NPPxQPuBY5Otb9JscGUDSdXzl8gD?=
 =?us-ascii?Q?rc15WqUFU6sRJXx2kOLEYCQZnIygdxr0fvtN4LLxmFNvwADIbtowZTQrU7hq?=
 =?us-ascii?Q?Mdq+xGan49H/PX5hsh9HO0tiqLJp4n8/S+FDdUbbLgGKVspJeM2j4tJ+5Q4K?=
 =?us-ascii?Q?0+ckHtUA9bQkn+jsBNv+9TUa+d1wbBMNOzGgAiQe/FFirxdo8LIYYW5ceOrw?=
 =?us-ascii?Q?eEeFnOKg4itSZBo0BwZCyhMvRqM1tKlQsWSXb3BtWPk7jfPM5Tn+oD9v9HLO?=
 =?us-ascii?Q?ogCvwjJ0Qfssbpm0dNlf/s/ISQgRM29fdTLMpdA9Lr468qls7EgUrGjwVW6k?=
 =?us-ascii?Q?qD8gCM1576vDBNfxBvh0aB25X1525VVZzaMwkD5hvDBsZP5+TdsZ9nHAYJDT?=
 =?us-ascii?Q?9BLllBtP3CcFUsAIWu66ImYpZB8jLMprVikawkUcV0EzamskNmFecNVssMDQ?=
 =?us-ascii?Q?0OoMRl+3/8SF3vY2zMwoGAenVg6xHE+AQW4i9yFBLyparu1Wio3jTMNhgqdM?=
 =?us-ascii?Q?tDdC/5NGj59fI0RtxLWSnUa8FezjIGdGpr7vmCa8P7rqeZGvwvfpWkdYtkqf?=
 =?us-ascii?Q?OoPtpv04RrQHEQo/i5uGjeMIpgTYc7QKEtaf4LJTxR/eGKrvnw/GbpLHl25J?=
 =?us-ascii?Q?JZCnV6ydAVMFeOq1IVb4czB9gkQkV0D3i1hxWunwlJyJH5ZsW9BH6RR+bLRR?=
 =?us-ascii?Q?NyIOHIe3DleQtwy6F9jgKnFShI/i9cBiNkrxni+8sGl0LCudwPSy6yyLZTBl?=
 =?us-ascii?Q?kHEVSoxIUN3jXYJNTzZCJCiueelxJcaPVxxSgGLt98PeA7zRI72KJBZrmsKG?=
 =?us-ascii?Q?e9iX7PqomZk6dRn4GynWV0nifWlvdTHMux4eUygNhh07K5UE3q3srpmlSv8y?=
 =?us-ascii?Q?QCRjnudlGSfyYKHqvD3Fs5OcyuqIBVUfrT7f/np+qibebED7kTyTUWiJjrxg?=
 =?us-ascii?Q?dbZc2SXopDJBx6y7SQoJM+PMvw3/pvwPdaiNH/wUTE0dak/SuNgBZffAA8HO?=
 =?us-ascii?Q?G3F8mysy+qJyjR/MAFK9tLiDEslvEBiUVlwkQlHQ2iXNW/XTcUoEPZcaSNLL?=
 =?us-ascii?Q?EF6VhrP/GVPPaRUyPNoL4c51Q+g8Eoj4nTwBlSGPip0k8bNX8nVjycYiLMyP?=
 =?us-ascii?Q?KW00kdkHqW5DsWiCPlyarTZ/gMVmV2vHTo5Kxng2EighlTvETH/tKXe95Qoe?=
 =?us-ascii?Q?ZeoHSqSy7Gp3osJ/8nFiiV6mNt6vl4QTgbp232r52/60titDPmRIGgVwA8SP?=
 =?us-ascii?Q?O6/P1hHimWFqeonG6yv6gB7VMZOyPD+mxRfqUnMp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52cf39d-ed16-4188-b624-08dbf4e3535e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:08:59.9161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAIpsGIz1lTj94lUaMKDU+5yJMu0LeW937R/iULioVCB0HSyVhAIj84ixYDwuEpfv92Ln5DedB8LhKNGC9GWNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8057
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
Cc: imx@lists.linux.dev, kw@linux.com, linux-pci@vger.kernel.org, lpieralisi@kernel.org, Frank.Li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

'pf' and 'lut' is just difference name in difference chips, but basic it is
a MMIO base address plus an offset.

Rename it to avoid duplicate pf_* and lut_* in driver.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Acked-by: Roy Zang <Roy.Zang@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    pf_lut is better than pf_* or lut* because some chip use 'pf', some chip
    use 'lut'.
    
    Change from v5 to v6
    move to previous patch
    -> -	.ops = &ls_pcie_host_ops;
    > +	.ops = &ls_pcie_host_ops,
    
    Change from v4 to v5
    - rename layerscape-ep code also
    change from v1 to v4
    - new patch at v3

 .../pci/controller/dwc/pci-layerscape-ep.c    | 16 ++++-----
 drivers/pci/controller/dwc/pci-layerscape.c   | 34 +++++++++----------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 3d3c50ef4b6ff..2ca339f938a86 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -49,7 +49,7 @@ struct ls_pcie_ep {
 	bool				big_endian;
 };
 
-static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
+static u32 ls_pcie_pf_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
 {
 	struct dw_pcie *pci = pcie->pci;
 
@@ -59,7 +59,7 @@ static u32 ls_lut_readl(struct ls_pcie_ep *pcie, u32 offset)
 		return ioread32(pci->dbi_base + offset);
 }
 
-static void ls_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
+static void ls_pcie_pf_lut_writel(struct ls_pcie_ep *pcie, u32 offset, u32 value)
 {
 	struct dw_pcie *pci = pcie->pci;
 
@@ -76,8 +76,8 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 	u32 val, cfg;
 	u8 offset;
 
-	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
-	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
+	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_DR);
+	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
 
 	if (!val)
 		return IRQ_NONE;
@@ -96,9 +96,9 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
 		dw_pcie_dbi_ro_wr_dis(pci);
 
-		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
+		cfg = ls_pcie_pf_lut_readl(pcie, PEX_PF0_CONFIG);
 		cfg |= PEX_PF0_CFG_READY;
-		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
+		ls_pcie_pf_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
 		dw_pcie_ep_linkup(&pci->ep);
 
 		dev_dbg(pci->dev, "Link up\n");
@@ -130,10 +130,10 @@ static int ls_pcie_ep_interrupt_init(struct ls_pcie_ep *pcie,
 	}
 
 	/* Enable interrupts */
-	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_IER);
+	val = ls_pcie_pf_lut_readl(pcie, PEX_PF0_PME_MES_IER);
 	val |=  PEX_PF0_PME_MES_IER_LDDIE | PEX_PF0_PME_MES_IER_HRDIE |
 		PEX_PF0_PME_MES_IER_LUDIE;
-	ls_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
+	ls_pcie_pf_lut_writel(pcie, PEX_PF0_PME_MES_IER, val);
 
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 711563777aeba..f3dfb70066fb7 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -44,7 +44,7 @@
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
-	const u32 pf_off;
+	const u32 pf_lut_off;
 	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool scfg_support;
@@ -54,13 +54,13 @@ struct ls_pcie_drvdata {
 struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
-	void __iomem *pf_base;
+	void __iomem *pf_lut_base;
 	struct regmap *scfg;
 	int index;
 	bool big_endian;
 };
 
-#define ls_pcie_pf_readl_addr(addr)	ls_pcie_pf_readl(pcie, addr)
+#define ls_pcie_pf_lut_readl_addr(addr)	ls_pcie_pf_lut_readl(pcie, addr)
 #define to_ls_pcie(x)	dev_get_drvdata((x)->dev)
 
 static bool ls_pcie_is_bridge(struct ls_pcie *pcie)
@@ -101,20 +101,20 @@ static void ls_pcie_fix_error_response(struct ls_pcie *pcie)
 	iowrite32(PCIE_ABSERR_SETTING, pci->dbi_base + PCIE_ABSERR);
 }
 
-static u32 ls_pcie_pf_readl(struct ls_pcie *pcie, u32 off)
+static u32 ls_pcie_pf_lut_readl(struct ls_pcie *pcie, u32 off)
 {
 	if (pcie->big_endian)
-		return ioread32be(pcie->pf_base + off);
+		return ioread32be(pcie->pf_lut_base + off);
 
-	return ioread32(pcie->pf_base + off);
+	return ioread32(pcie->pf_lut_base + off);
 }
 
-static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
+static void ls_pcie_pf_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
 {
 	if (pcie->big_endian)
-		iowrite32be(val, pcie->pf_base + off);
+		iowrite32be(val, pcie->pf_lut_base + off);
 	else
-		iowrite32(val, pcie->pf_base + off);
+		iowrite32(val, pcie->pf_lut_base + off);
 }
 
 static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
@@ -124,11 +124,11 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 	u32 val;
 	int ret;
 
-	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
 	val |= PF_MCR_PTOMR;
-	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
 
-	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
+	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
 				 val, !(val & PF_MCR_PTOMR),
 				 PCIE_PME_TO_L2_TIMEOUT_US/10,
 				 PCIE_PME_TO_L2_TIMEOUT_US);
@@ -147,15 +147,15 @@ static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 	 * Set PF_MCR_EXL2S bit in LS_PCIE_PF_MCR register for the link
 	 * to exit L2 state.
 	 */
-	val = ls_pcie_pf_readl(pcie, LS_PCIE_PF_MCR);
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_PF_MCR);
 	val |= PF_MCR_EXL2S;
-	ls_pcie_pf_writel(pcie, LS_PCIE_PF_MCR, val);
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_PF_MCR, val);
 
 	/*
 	 * L2 exit timeout of 10ms is not defined in the specifications,
 	 * it was chosen based on empirical observations.
 	 */
-	ret = readx_poll_timeout(ls_pcie_pf_readl_addr, LS_PCIE_PF_MCR,
+	ret = readx_poll_timeout(ls_pcie_pf_lut_readl_addr, LS_PCIE_PF_MCR,
 				 val, !(val & PF_MCR_EXL2S),
 				 1000,
 				 10000);
@@ -242,7 +242,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-	.pf_off = 0xc0000,
+	.pf_lut_off = 0xc0000,
 	.pm_support = true,
 	.ops = &ls_pcie_host_ops,
 	.exit_from_l2 = ls_pcie_exit_from_l2,
@@ -291,7 +291,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
-	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
+	pcie->pf_lut_base = pci->dbi_base + pcie->drvdata->pf_lut_off;
 
 	if (pcie->drvdata->scfg_support) {
 		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
-- 
2.34.1

