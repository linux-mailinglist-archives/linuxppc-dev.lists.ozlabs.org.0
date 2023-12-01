Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A06C800FF8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:22:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TRSvzROO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShdcW5TjBz3dLM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:22:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=TRSvzROO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::615; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdWz0vkPz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:18:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgflryI4OQTmFAZsAU5pL0K4qCFAaCXg/6bIBy5Q5MS++3XLuKtvvAmJrkP+MJLz3PXkWz/7AdLYLrrvDp6ciGz28KyEnXXWLr4/R5D3SQOqpEkR0E/uImHReQjLbg9PMWtbSqZ/TZKcfV1vj68LAtJajAFu6+3X6WyFh4kzmT8KRXL1csLUeszUwjCCtMsSqBXKiuWykj8pCdNwSFWexbRVrb8rCy0FvIGissYM0HLs15oJaGM2OcfpuZ/vympG/fveh5UnQ4UZcgdQ1yJYEs3W0P0yt61z2I7aOymIB9knMXkUuKgohY4/iS6MX1D36+VeTNoIEsJ0DG1TOIcFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5/itE1CfJVNNbdpV0HoeFDYZuxVJSywlC6AVPVp2ON4=;
 b=YICUt6a39JSplZqqxxCBxzxIf5ksas5QlMGpqlbKDpsGmsA8DJcbXN9G8GmExyOXzlsUnO6NVasB+xBijvDeK0lHrZ1PVq2Cl298cEoWv4CA+GPP2FrTbIX0ts3ygY3VRbTO9URo7ilshaZIWLs6966yQ+IjjSeXTlKoGdPAhJRuQNoGDRAPj1dFXHaFe3uMZjRBUhnZ1SWjskijjHC0xvaIdLiMFtaSOv1xrOBZKSXl3wR+sDzDy56bOEDKchDp6KXo3L8dh5047Hbvf/17E9H1CeqI1DnTr2PdJTcvQK3xwcEFEjdzJLpINROd6j/YBVutXSumE2wJAegZZy3qsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/itE1CfJVNNbdpV0HoeFDYZuxVJSywlC6AVPVp2ON4=;
 b=TRSvzROO+Y2Xl0+ExCGd568tD1H/yPD7q+ad9xq3s5opprMDMH9EVS1dNfJmFI7iIsHzpld6C+ZX6Cr5okAVCZBJrctv/awNmEjeT3knKbziWvaVncjrEK6TITbo5dLqjdJdsk30WKXR9zc6DD4W7R8aT74c1SBnZiH4MBm2gB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 16:17:45 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 16:17:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v5 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Date: Fri,  1 Dec 2023 11:17:12 -0500
Message-Id: <20231201161712.1645987-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231201161712.1645987-1-Frank.Li@nxp.com>
References: <20231201161712.1645987-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0070.namprd17.prod.outlook.com
 (2603:10b6:a03:167::47) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DU2PR04MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: bef8c711-36c9-443a-1a8f-08dbf2890d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VAlqwGpT7IE7hWA5Iyg4jt/hEGDWhLJgq+9MEaoAfH8SusL0DmTL/V4bDErKzJId1pdNxURhtqHTMQysNoZE2U8djbi1sI+OD6HQxUHqdqwiY/nGtabpMV0JbCQh4porjReJ1iijKLSIOSX7w/ebHPuI7MjBwYJuGlUBVBxSI2t65RDXvpqQmWb1dGozv378udctLVdLII12z0NwwUB/pOiz2WCzD1iBFQWxfbmgvHl8vyrg6IhwX73rvXkuzlVn4CjceK+P+v1QNwm0Up0102mvCiGPPHgS0y955Sli6fo6VBusDy3PHVfzO0z7xek3cCqKN0IjEQ8Pp5f+HBOT2fiKacGaW8EAZlk+Wa9MmqYQeq8GTbk62iUb4YX36kYJW83tTmPWcwPWD9W64/Hpy9Pi8sISxaOmOMcSSqIhtNDb7VOMOJferbQpjxqKBNuAj4s4tfNpT1q/z/dpG+jAK9rwEOEre3KUdsdFZNOpXmpgYoEgpAt4qAY+vKiFcYdTTojUjnO463ZUwWacvz+54vPehjuDY+xfCyAKHq/uWFzWJ0A67UIkBKTS8RMv/9/g5KXLqazUadSouyelOOm35E5TIiqWGov3neJJpKb+J8os24yayGmDzYnOohITm3wd
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38350700005)(6512007)(41300700001)(83380400001)(2616005)(316002)(6486002)(6916009)(52116002)(66556008)(66946007)(6666004)(6506007)(66476007)(478600001)(36756003)(5660300002)(2906002)(7416002)(15650500001)(26005)(4326008)(8676002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?j/UcZxrp+TpWsNdxFTZpVAywkGk0XHhDmLfWJNtdjIymhFiX3bmsUwGJwQdV?=
 =?us-ascii?Q?E7tYCKFZo/idG2SNWMiiwdJqzEkZF0mpTgO3hDwipk56YesJfXFUPqvEijdd?=
 =?us-ascii?Q?u/RBfINLIbjClw2vn03xb3J8CiNzMugimKB12XOr8v11BHrAhga2ZsoMqYJi?=
 =?us-ascii?Q?gUHCCflTsyW8JnWfQV+SUA8d2DnKSZ6p+IfCHsZ1xoKgh6dchKD/lSxVosEw?=
 =?us-ascii?Q?pAtOecrp0H9HdzpVgtES9hhMksUUMELJcDZ+ei2JjQJBbKVuILnEj/ov5eB3?=
 =?us-ascii?Q?3gGyHmOZL0Cl85ozgNAdxW5HIfy0+BUn02ibcoJLmAxqJ+DotjHKwQ8Elpks?=
 =?us-ascii?Q?KEsGqBkpMfx9gjbi7Ah3uM2tBIsOZy7fHxNEv5JtCJr88I3plllD2Xg/JESV?=
 =?us-ascii?Q?XxjeV9qCXhu8mh2BGb//7k/Zq6g4lBZoe5uGZiCFE8q+cG6jv9lfGTrrexeE?=
 =?us-ascii?Q?aWTfRkUSt36d4r9tuE+ZmulDs1aTazq+UVNGfBWR0c5xOynxWx9XwyHSehns?=
 =?us-ascii?Q?xkekNiyMgOADqEAh24eKBIAjNsJVBfc0rvcbb5mEVfwrB3uk6Nkz5+nXFH1x?=
 =?us-ascii?Q?bBf3L/RCndoSMLbUHRqfcuH2OvMto05mgiwpqnUtCDZdfBQ0ibNtsEtPzuMJ?=
 =?us-ascii?Q?qZzLEW2j1HnF95z0WNy1u+7HUd1jFwAVV04FIqjnhpY68Q+bjxLBRIIvdW22?=
 =?us-ascii?Q?GMP7lc8uRfKU8JGSMzFrIJcyJnyBc6AL+xGLQq3O+HffnbFQL+hfG4KXgmbW?=
 =?us-ascii?Q?SLRfPJ/yGmBZqHSzGEwOfijWmzCqlH/UTNqmjmAnF499uMw88Hy1HYlDLrAL?=
 =?us-ascii?Q?WyYQ8fGYgm8407625kSj7de1PG8IdrI9SBwtJOz0WnhTfxVFZJURcuI8g9h1?=
 =?us-ascii?Q?Y3z8otIF4EI6d04lCKFbjpQQNoLwML6MphRMMeH/a+sfBS1eEYLAOu9fqtRV?=
 =?us-ascii?Q?/+gh5roUldQsQSeDAqWzeSR4pHb6mELHVns2jU9+1fKQf2XEY0yX3EkLePYN?=
 =?us-ascii?Q?L/tj6WivoDxAD+hwvVcHm5LncbSmfBh0uNw5us+bvv9wDrhexTpBQwyx/ooV?=
 =?us-ascii?Q?kMfhx4kFOyom34kVxqR+/Yp9I1vmX4guNAIGeLCvvPaNbPHq22HDjijoeudB?=
 =?us-ascii?Q?x8nvHX/R3JznFtzcI6w3JhyjykcWOnvhrSQbUdp9nzVaQWaa7xlGJOql9LPQ?=
 =?us-ascii?Q?P0BoG400l5GNLQQkw1wnZHotLow4ghPuMDna4p3JGp2Y7KNkTyP6eNmlYbm1?=
 =?us-ascii?Q?50HYmkTa+azfnLSfEhKBtklud9DqGQrc4VlbMvkEyo6euozHOYho8/iNs4xB?=
 =?us-ascii?Q?wfPCPzOxpkbOVqCuelShzSKPE+sAZIjPVXOcjkL/8jb+1XiL/za2i7/zyNdA?=
 =?us-ascii?Q?PSUlb0PvkJXXJ8yVsfuFP1ji5ed2w/v06vVvEArBI9xwrLmla3jZvEZuK5gE?=
 =?us-ascii?Q?mK+QbJ1GLWgruvN0HMfgj54ZDZRd4kmfTwYRfAMqB6wWBBt1paaZ9r/c34cB?=
 =?us-ascii?Q?p2i2+LWPjYJav9/8KcsBvbC3essB9sVo/JyYvEMdoXXqShiwCjt9kFCZDms7?=
 =?us-ascii?Q?nz2dg2hUBxyN6xHZ+/ojHBHnv49f0SfniFrkg0m5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bef8c711-36c9-443a-1a8f-08dbf2890d74
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 16:17:45.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 69YYGyPL8EkMJM79V/u0Fm/HT5/tQFxhbjGkSDdtoqfMtRKuSJmiGHJXXYYGHsBGB2pg1AWoS4DMNSWEr3AReQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8695
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

Add suspend/resume support for Layerscape LS1043a.

In the suspend path, PME_Turn_Off message is sent to the endpoint to
transition the link to L2/L3_Ready state. In this SoC, there is no way to
check if the controller has received the PME_To_Ack from the endpoint or
not. So to be on the safer side, the driver just waits for
PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
bit to complete the PME_Turn_Off handshake. Then the link would enter L2/L3
state depending on the VAUX supply.

In the resume path, the link is brought back from L2 to L0 by doing a
software reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v4 to v5
    - update commit message
    - use comments
    /* Reset the PEX wrapper to bring the link out of L2 */
    
    Change from v3 to v4
    - Call scfg_pcie_send_turnoff_msg() shared with ls1021a
    - update commit message
    
    Change from v2 to v3
    - Remove ls_pcie_lut_readl(writel) function
    
    Change from v1 to v2
    - Update subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 63 ++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index a9151e98fde6f..715365e91f8ef 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -41,6 +41,15 @@
 #define SCFG_PEXSFTRSTCR	0x190
 #define PEXSR(idx)		BIT(idx)
 
+/* LS1043A PEX PME control register */
+#define SCFG_PEXPMECR		0x144
+#define PEXPME(idx)		BIT(31 - (idx) * 4)
+
+/* LS1043A PEX LUT debug register */
+#define LS_PCIE_LDBG	0x7fc
+#define LDBG_SR		BIT(30)
+#define LDBG_WE		BIT(31)
+
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
@@ -224,6 +233,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
 }
 
+static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+
+	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMECR, PEXPME(pcie->index));
+}
+
+static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	/*
+	 * Reset the PEX wrapper to bring the link out of L2.
+	 * LDBG_WE: allows the user to have write access to the PEXDBG[SR] for both setting and
+	 *	    clearing the soft reset on the PEX module.
+	 * LDBG_SR: When SR is set to 1, the PEX module enters soft reset.
+	 */
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_WE;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_SR;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_SR;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_pf_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_WE;
+	ls_pcie_pf_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	return 0;
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
@@ -241,6 +289,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
+static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
+	.host_init = ls_pcie_host_init,
+	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
+};
+
+static const struct ls_pcie_drvdata ls1043a_drvdata = {
+	.pf_lut_off = 0x10000,
+	.pm_support = true,
+	.scfg_support = true,
+	.ops = &ls1043a_pcie_host_ops,
+	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
+};
+
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_lut_off = 0xc0000,
 	.pm_support = true,
@@ -252,7 +313,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
 	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
-	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
+	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
-- 
2.34.1

