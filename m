Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FF7584B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 20:24:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NM+TGiiW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R56m25Ndrz30g9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 04:24:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=NM+TGiiW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7e1b::61a; helo=eur05-am6-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2061a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1b::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R56kD0tn1z2xdt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 04:22:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KZqqaCWV+Suze6kXPOrF9aS1XlCJ9+s0wSx86+uqdiDoSBSnecrf1+3RS/3L4gcnbPUqYDj1kAvC0aS9lCNrDAJtSk+nKxl89K8P1TLM/IspTNiMX0tizEM6Unm1WZNZz73u7r3JDJCFEAyh6xh+yDSAnl746IPeZ0SBfVdxbP15T1jwroA8D46CdQLL8oHdt8wGV79erIkolfdfIiQynboJk7VvPs91P+TukI0WC7+BX5/zBZ68pFntKYWGbDygtTJYEQPH90EvvrSHTmDHFmvQ8CvlNCdLA/eJolh9woutymXT9QkAKjZiIkIiLbavBNMWMJ0qpbZF69RvH1t9gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOlUGhcVml+LzCFGMvAde1bKSkEEwT8EzhKyegX+UXk=;
 b=Gt+58b16cZN8Ywq30iBTfBi/Ex3eQQhHBB5tgvQMUyS2xp3YKekLKeG8nGmG6JT+EXgybezc4ofQPtucRwhaa8h0VAqUQQ85MMMNbOkagec1IW6lwYAgExcWlfCDmV29HPa2BnA4UWE3XYORYuy7Q71BaZD8V77o0UBqDAasSsqb/EwZ6DSrAqFIKC4B2ZWvaSrZzgKsLh4xENYWkkDOLXUq3EM/OWlIhAWxjEPqKZ9FAnsBw7gLkRGGGdUgF/RQP8fkdcoL6RTH9Hu23d81VWZbYPC/3rOcDQo+lCwEO2T+R20vO/ZUSi6Z2sp9ezk0bam1IyvZr7N5iLcVZlQO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOlUGhcVml+LzCFGMvAde1bKSkEEwT8EzhKyegX+UXk=;
 b=NM+TGiiW61HKamuPo9u1j3RpUGfPExfwBozuvB5BrYnUBOKnhiw9liMIHRq9cAxhqqWg2ApKMIp+02xFh3IAL0E5YW35Fn0h4rTDG64Vgl8/LLkChKH/SbQKyDZaktug5XwkAdoAvC1ztWy5B6ANuvqNc2b2Y5ylpOJ/MsA/Sbc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by PAXPR04MB9572.eurprd04.prod.outlook.com (2603:10a6:102:24f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.32; Tue, 18 Jul
 2023 18:22:05 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::6cc2:14b2:ca51:6c0%4]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 18:22:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mani@kernel.org
Subject: [PATCH v2 2/2] PCI: layerscape: Add the workaround for lost link capablities during reset
Date: Tue, 18 Jul 2023 14:21:42 -0400
Message-Id: <20230718182142.1864070-2-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230718182142.1864070-1-Frank.Li@nxp.com>
References: <20230718182142.1864070-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|PAXPR04MB9572:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e881eaa-83b7-4738-1f6e-08db87bbe3cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	T+a8Rh06Zyk4u+kK9LM+80zSB7IkdV+YUMGsBWvftlvFIss4xpL/Q80wSGInPipbQL/10OC1gGDTI5/yEibQIn3odQe8YUKNeQXi44zAGa1GjBsfgYCxIrIDN9Eq8a/FwoK9zN+5yE5SEl+woPQYTTYeyESLGwdrpXoBUa5cj+esMw3Vp547q8txOJKm1M/wuIrxedE/i13ilIcFZvFp4K79Ro7jRtdY6qaOTipsQtdUvSt40gpPS7StTdVbNEEhRP8gfjq4dv+1/NKZC97ei79c6T/O6kTR5LagXURYb78krnDZTkPNOGizqJRc0j9b2EXoZFxdVW/5mhtrhCwb7aC1n628igT83+NoHYdKw8CNM7BGWvKpOI0EvQm3L31hMGJCxyQ2ZQMSMBwUMfnUOQBfGg5ALqLdrUG36qqas8W7Ju9JRNAaA1L6YboAoGlrT77iFu7TlomaxBOKc6hD94oGVjNmDh0kBD92ex6A26npSCR8OVB7+kToRF77FJLuP6L+PgtFrAbdhy0qBzDjK7KGtRtk6pc6YwNDKQYG0iMqRsPG+BhyYFjncnWjGwOznFwtTF/vq51uSzWt4NM1LUy3+3tvAGU1Z1xRGPzKsVzJKXkJaTK1wo0bfg7/GpgoYEpLW0RoxOakmSlZe3cp4ajVFHKhI+Mp02kTXdqfBiM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(451199021)(1076003)(478600001)(52116002)(6486002)(6666004)(83380400001)(6506007)(186003)(26005)(6512007)(2906002)(66556008)(6916009)(8936002)(7416002)(41300700001)(66946007)(4326008)(316002)(8676002)(5660300002)(38100700002)(38350700002)(66476007)(36756003)(86362001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?uO7tZzEFOHabv7LgIwkm56YQyoVZc5QVudwYkcTa1N3YpVlvQNFCruNRhsaU?=
 =?us-ascii?Q?SgPDwo0nW+NO5JtVz1q7M6UNEfUbHD1FzSyrRxR3mb6pa2s9OdZ1JbFYvdbJ?=
 =?us-ascii?Q?j0hW3KrcAaPJ2knEuaSfe2WDDVLZBeN4UP/UOopdZUmdc2OPqo0BKb8HphhT?=
 =?us-ascii?Q?H2Cn2fRsxk20ZR/OzIaqA1RJVIN1B/o4/de04wy/mq5tFbDy+taGt9lACUUT?=
 =?us-ascii?Q?n6rXTEI4000Gb9z62jLQd9y+dK/RMIqW4wXzVgWgsUejOhc0D2CDnrtPq9BR?=
 =?us-ascii?Q?SL/8DlpXOW3hY8k8g6dXz839nZDWmH3bycPVcxT6Aw6Y8c8dJVdhCnEq9Rhr?=
 =?us-ascii?Q?AOyAtc0bJue/3JWp5TSGqLPMKk6v+eOvilNQpmaz3XpYwBUu1eI8fFCoT25l?=
 =?us-ascii?Q?/ma7x3b3pY+OfLhJjzauCYDDCYbIixw3Nfmt2U64zgeZ3+RNv4D0y/RrSj5u?=
 =?us-ascii?Q?JxjQseO5YasKZXZRmzq8vPwbIgravOOmeJQFMCQ8Kbi6uA5EyBqYqZXQUlNG?=
 =?us-ascii?Q?PX7uDzi2mD+tSUbz+5JT4GZSFpf5JrTJOUb48YV/EZyOUHmbIKbgxfagXCTD?=
 =?us-ascii?Q?h09Rb5bJPYf1+KVxy2gPloQk0Qq6TkYUgsbAMNjW3twJCGwBqHNiHzzGMByw?=
 =?us-ascii?Q?APvQVXt1eOx4L8r3eTSckZQmasUYYRE4UYz4CZIiZE1REGLdJDG0oP7jFcHa?=
 =?us-ascii?Q?NS3d/RYPPa897MjrKUf6Pv9ELxbBSIQepkt0bW0E3UuAlsbbkOJBH5uokVHW?=
 =?us-ascii?Q?OdSJWZCcjzaKJwAhnpU7sSN4vAENgCIjvQeuf768oJGN8KcpXZ0cU6foTK1d?=
 =?us-ascii?Q?H7moP546igFe3Ch750P/2S8MLiZei7UYQooy4kmsvGRnjtuZ+o3Sq4O5dW1U?=
 =?us-ascii?Q?cqoSmLU0LxsTpe6MAETqDMwkTemzc1F3vyrDt7irGTXV15/YUMNr239ZGtif?=
 =?us-ascii?Q?35EiNDBRtF+lYn1bj4V0AEJBQptO/BOp4770RUBAgF43bbVBWUm+tPmsi0mk?=
 =?us-ascii?Q?ZqFnZYsUiaVS03tY+7pJVVag6LaHTQ3hjNf6XwAahdys9JuvpuWVs8H8JKHa?=
 =?us-ascii?Q?Kle32bESU7ef5Yyf8OX4xhj56BqNJOj1S/B1TsMBTooR6QAZ6CBIs7yhTrsJ?=
 =?us-ascii?Q?eRj+eYinwA4zdKvfIqQuOSlkLQfBGihnFMe0ycdRbOYvngHz+RB1adAGaU5a?=
 =?us-ascii?Q?TDth91nHUwHPiaObaaxw6tESci0Vhba304mW/s/2n6vbqGisVCN02bbR48nJ?=
 =?us-ascii?Q?ganw+mCBEXZ+f+LoVKZaMAO2wQ1s9aDvOOZQZmOyfak2lPeKwcObEXDgBlJr?=
 =?us-ascii?Q?OhEIwqSySzCLUrJrXXwyBzPemAL5/LZ6zw6WvW0mWBg1yaAwA/jSZrLXj+rL?=
 =?us-ascii?Q?KlfTijhCJqOgNUBwumVvtfZ7FZyeStD5Trf8+LappJbYguK4rsnXL3SXA8qj?=
 =?us-ascii?Q?osBLFlf/f7cyGAxDV7j5dj7WtgNY3QndmkRTV0dXKUkTuDLUyR3s1/iWgAYN?=
 =?us-ascii?Q?lDehR2uuyX49T03WBKDCVGecgsGT0E9cYIc4Ax3WgPilVFUwR4MjqrYdYX6a?=
 =?us-ascii?Q?XNfX2RqEvESc9F+ZLLm/xEsy6hU/CgncME+qlCpc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e881eaa-83b7-4738-1f6e-08db87bbe3cc
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2023 18:22:05.4761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dGNXB9PAG+qpq4dA//KxAaULkF8qhbVJQCNWACN8MnPviDTvCKtK+2eV+pOhB5DS9jRhJHOg3Sc/LAVmz3iQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9572
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

From: Xiaowei Bao <xiaowei.bao@nxp.com>

A workaround for the issue where the PCI Express Endpoint (EP) controller
loses the values of the Maximum Link Width and Supported Link Speed from
the Link Capabilities Register, which initially configured by the Reset
Configuration Word (RCW) during a link-down or hot reset event.

Fixes: a805770d8a22 ("PCI: layerscape: Add EP mode support")
Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2:
 - add comments at restore register
 - add fixes tag

 .../pci/controller/dwc/pci-layerscape-ep.c    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index e0969ff2ddf7..b1faf41a2fae 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -45,6 +45,7 @@ struct ls_pcie_ep {
 	struct pci_epc_features		*ls_epc;
 	const struct ls_pcie_ep_drvdata *drvdata;
 	int				irq;
+	u32				lnkcap;
 	bool				big_endian;
 };
 
@@ -73,6 +74,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 	struct ls_pcie_ep *pcie = dev_id;
 	struct dw_pcie *pci = pcie->pci;
 	u32 val, cfg;
+	u8 offset;
 
 	val = ls_lut_readl(pcie, PEX_PF0_PME_MES_DR);
 	ls_lut_writel(pcie, PEX_PF0_PME_MES_DR, val);
@@ -81,6 +83,19 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
+
+		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+
+		/*
+		 * The values of the Maximum Link Width and Supported Link
+		 * Speed from the Link Capabilities Register will be lost
+		 * during link down or hot reset. Restore initial value
+		 * that configured by the Reset Configuration Word (RCW).
+		 */
+		dw_pcie_dbi_ro_wr_en(pci);
+		dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, pcie->lnkcap);
+		dw_pcie_dbi_ro_wr_dis(pci);
+
 		cfg = ls_lut_readl(pcie, PEX_PF0_CONFIG);
 		cfg |= PEX_PF0_CFG_READY;
 		ls_lut_writel(pcie, PEX_PF0_CONFIG, cfg);
@@ -216,6 +231,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 	struct ls_pcie_ep *pcie;
 	struct pci_epc_features *ls_epc;
 	struct resource *dbi_base;
+	u8 offset;
 	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
@@ -252,6 +268,9 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
+	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
+
 	ret = dw_pcie_ep_init(&pci->ep);
 	if (ret)
 		return ret;
-- 
2.34.1

