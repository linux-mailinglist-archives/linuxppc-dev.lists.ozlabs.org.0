Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4737CAEF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:20:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EqDzOYOC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8MmB4HN0z3vZk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:20:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=EqDzOYOC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::623; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MjQ0rTdz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:18:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THZpzpAlaDHuE3qNmlTcFrYKgBdJ23HeqiStNRmXablCZ50i7js+PPY73jsTAOeeHJQ4uhQ8ucvHoRu7pXEmpmfZffU/QRE8RLh2nEPxkFHWD8lCHABReMcGLgxrtzCNq55H16mt6ILY3Gy7fneADr+LrKpL87kEZMBC220iHIOY8mgtxTG/igvRlVX63479rj79uJJ0HEcoihp6oyCfN3wdGeBSsyEtU/DHgG/tbUUKMfD+o5rSlsvUI7voYIMM3l3Vp/Vq9GwrGS1ccc68i8jObwfzGxKVeWgwdkwpStrJanP8B0eFJtVHarPAhTWTVxCrdKknn5q1kg8+EWaMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cynag1/V5uTtWsIVvhPPqNSHuBRIZdhGXGKLPAvbloQ=;
 b=XUFA31i+P4kUrTI2evSDAjEzMNG2nFv604Y+9Y9JIFA+Nj14D1De3dv6w4ySbrtGonKVRUgstiBiNGQvjC9tVh1P2POHvnDhK9AoP1oa0ReZidGJvSiAjSX3STVCx1WNe0vielSa3mdZ1txJsWT5HUD7f0y1y9Q3Zi6JLl3kMnys9+FGDMR3P9X9PTQIW2gBtPTHckqqKls93P+8f5BHlCikQSwCZbP/t2fm0/01Sp2H14RU0bDalfzy0Z9XKqyyBsiZhOBwgJm7vn98gdfnBilpSjOycEo8LAUVlrf5QXJY1Q47lUu1AwDiPlAnT9e1Tur9klWZVBLjbEPRWY+4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cynag1/V5uTtWsIVvhPPqNSHuBRIZdhGXGKLPAvbloQ=;
 b=EqDzOYOCri4LL6VdSUpJJ29RWtUcQptZfduIlBXmhGiT+DpzSC+jp5pE2nA7PMoxVqN+VdAB7ET3wp896t+p2P6WPn3NkHxkLs98G3UCQVYXQ058M7E6Pw7fRXqabWqDVoSwqEUb/HS/hOZKYOEtD7aLwFuvVWIFaCmm22pJwHs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7489.eurprd04.prod.outlook.com (2603:10a6:20b:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 16:18:04 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:18:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: lpieralisi@kernel.org
Subject: [PATCH v2 3/3] PCI: layerscape: Add suspend/resume for ls1043a
Date: Mon, 16 Oct 2023 12:17:38 -0400
Message-Id: <20231016161738.2854352-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016161738.2854352-1-Frank.Li@nxp.com>
References: <20231016161738.2854352-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0085.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::26) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|AM9PR04MB7489:EE_
X-MS-Office365-Filtering-Correlation-Id: 855b3b85-b9de-4706-bf4b-08dbce63796d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TyfiK3WvYW6alp0cV0cyR6UIisc91X/HE2ysmHwtWsyVnSTurpEXi4SfrzZMXp3ixf/DgeCEThUhfxR3HlEEyMOmIiVwoWOSnzYpTBdydgCJJoRUr+SBJx9IxXL98R4GWROiFT0ruJbwjOhMOn80K52IeZpM2Qdwyfv8X6yM2q1rODCyUdQzuyIvCxfiEpULHlYPjnLRLQ4ftmNj1NtcUu8qXFRyRxJZ9DLByQOfieAstkXip/XkQ6Ud+nYM4zG1j/zaVfPvGp3xk2FCNtJxTYlucvIZpw44g9oMJJzGq3h5e0WjMrtbRL8FoHAXMSqnbwzpEpfUKcIB2R9vnYP5HamJ8qbslkAmxrWY6klHuu9Unl4d5/5R9d1IWx6w19x4UUHzK0cCL0ssQzqW7oYt1NFTaH60xe+i2goKztD5EdfD+uPzIEeELg7NYK3gOrorbuJAuoeQD9esB/zDaW+J2aSk3gEfgsbUo7KIqtYMlmWm5AWMnHNPKTdA0aS+8qzftQ/NL4lHOsrgYQeawmsfRgxpmRdw+50BKAycjZHeSH7OQqZI2Y5wO2FxHnSrtlYvw/WXqF4i+7zlUuwNL5rrDUtyRLPIuHPm9TEr6n3XhnHcl2KsoW0bIhi44iYHmxIw
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(38350700005)(36756003)(478600001)(6486002)(41300700001)(52116002)(5660300002)(2906002)(6666004)(6506007)(38100700002)(2616005)(1076003)(26005)(66476007)(66946007)(8936002)(6916009)(316002)(66556008)(8676002)(4326008)(83380400001)(15650500001)(6512007)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?aO+xWI/3Eqq/4xdO63ZyW2Q4OwL9IDdfW6CbXBgCOXBrTU79blrEIjLicFSG?=
 =?us-ascii?Q?vfn7xFbLrYPQYQRHkSmYFeEXIstGEVuYyEDqtrFWoMAMYQdul5taS89gPJO3?=
 =?us-ascii?Q?DA8wg3CzVU3W0x+oN7+gewTrcXql5fJZbtKOhuGPBDM23TO9Acy6eHN1yb5M?=
 =?us-ascii?Q?xDMcqtinZzWhqh4VJa3/WYx3TmCA79yYWM+AV5vNE3ceMPe5owqDnwDxNh2j?=
 =?us-ascii?Q?6L1EUQKVsZZqILojX+VGoJ03yNvrgGeZAFoWlmX1lq4ZV40cYniGtXMRopzU?=
 =?us-ascii?Q?76vykWgXhbRadB2QlV+xyUF0pdnbWWJus2gJASQM9UudMgN5LhSqDVMPVfbI?=
 =?us-ascii?Q?ZxLDZeRIGUtEcQWhqfp/swHovNb4fB9l/mAhG8bUdKcC8mttrztZ3KeFN9rm?=
 =?us-ascii?Q?bTm7O6zXNyDETKHTpUpPa8vu9RnEkfJzIuSxIqn/FhnVb+Xh+9o4uV1RN2TF?=
 =?us-ascii?Q?+j3R9Y4Z4d0WtItn9haMtO0STK3tuHGh6VDFz8AlfW4+0hOXur2FPhvOiQK6?=
 =?us-ascii?Q?VjNb5/bsDLaRYaRJXdMqeo0m+6xw/QjT431f/bBC8EOkKy6pLYSdzp7utUAj?=
 =?us-ascii?Q?hJtvMi89RVkIWB1O3J61rPQRRkT7fk9kNHtPo/KtNPo3SG0DGUfc4N0B92kt?=
 =?us-ascii?Q?0yVXFLoMYLjF1zx22plhCQTI8ukxfn81DC+aIEujg504Yo2nwIgwZljjj1/C?=
 =?us-ascii?Q?2barrLeS68fNEF8iOEIA6u3TabDznpXnN1V6eZM9+HbMZE7xcSHxe3DkTp2U?=
 =?us-ascii?Q?JjuUf+SksrPQEFzSAx0KQWcr1XOxAJBUndHHCbz/rpO1LuIPqoVbZ3iZFzqR?=
 =?us-ascii?Q?P/YU5by4THG6ops9dcPEKhwQ6oY4C0DBexgMRf+r785MlVcKrluT7bjdThYE?=
 =?us-ascii?Q?seh6Uwzlglx8uWSTGX9Lj9vfsPjks3UJv+MBLCEWby5KIjvVYf6HQ3pQy/Xk?=
 =?us-ascii?Q?16JmpCW9/VEuLecCE4nlI24Xb7WZaoaLOk6Ioul36kAWJggvqebaEH++17Ab?=
 =?us-ascii?Q?gAVfGTWdUni6Q3jwj9RmC35bG1Hf43zSvG4JXPzga1Y2pIO2YUdjgPwXCnjy?=
 =?us-ascii?Q?fA+eu5QerqM+uWvB83mik3b+8L51zKWyMLgxLRBaEvP7FaYkpisMtthoQzCK?=
 =?us-ascii?Q?2b68iGOtMd7M+5fj4ucgypGiYSta3kd4rT/omOE6b8bT5Y8v2zttWir2Qp/J?=
 =?us-ascii?Q?MJYht2klzeK1lNk1Ic3+jKAnVQCfv2/hGfba3kcPuYIrwDQ6ZyU4TyE8koM4?=
 =?us-ascii?Q?c34KCXd+p7f206kvlF7cZrCDF8VRTPa8zC2fTjRjnmThvx7L1kODj6HywXZn?=
 =?us-ascii?Q?3OnPeWYhWjkF0BoTHdLHw/01l7jIR8PerkMd/rL18dA+lrME5/7T4xJA6k76?=
 =?us-ascii?Q?id6glD2gedANzrnH2ReKRapYbqmUai5gyfDMavk0JR0ZH2Ctwwzpks7VWWpY?=
 =?us-ascii?Q?vslpvesixufEJ05qxHpLo+h0YOsHKqdX0WUw+YiT0qBJD4xFZBoMbbZAVO+a?=
 =?us-ascii?Q?uPoe1BasoSe3H4ImAhrBmeA+3t8216zvpnNSFmad3Huob0UxXkwMt7253mlV?=
 =?us-ascii?Q?WNdA0aRtGpKQw/fIPDnwlWGmuxRYk8hvYMuUAG/s?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 855b3b85-b9de-4706-bf4b-08dbce63796d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:18:03.9270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aEWVfBX48zqUwTE8R1/yo5RznlP8ltGRShLtSlqfHUVnDeKgyRk8PHlv4wrWjhqrgqRhVm0+ucUwt9SIoNpETw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7489
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
Cc: kw@linux.com, imx@lists.linux.dev, linux-pci@vger.kernel.org, Frank.li@nxp.com, linux-kernel@vger.kernel.org, minghuan.Lian@nxp.com, helgaas@kernel.org, mingkai.hu@nxp.com, roy.zang@nxp.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org, robh@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ls1043a add suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v1 to v2
    - Change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 91 ++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index bc5a8ff1a26c..debabb9bb41f 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -41,10 +41,20 @@
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
 	const u32 pf_off;
+	const u32 lut_off;
 	const struct dw_pcie_host_ops *ops;
 	void (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
@@ -54,6 +64,7 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	void __iomem *lut_base;
 	struct regmap *scfg;
 	int index;
 	bool big_endian;
@@ -116,6 +127,23 @@ static void ls_pcie_pf_writel(struct ls_pcie *pcie, u32 off, u32 val)
 		iowrite32(val, pcie->pf_base + off);
 }
 
+static u32 ls_pcie_lut_readl(struct ls_pcie *pcie, u32 off)
+{
+	if (pcie->big_endian)
+		return ioread32be(pcie->lut_base + off);
+
+	return ioread32(pcie->lut_base + off);
+}
+
+static void ls_pcie_lut_writel(struct ls_pcie *pcie, u32 off, u32 val)
+{
+	if (pcie->big_endian)
+		iowrite32be(val, pcie->lut_base + off);
+	else
+		iowrite32(val, pcie->lut_base + off);
+}
+
+
 static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -249,6 +277,54 @@ static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
 	return ret;
 }
 
+static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	if (!pcie->scfg) {
+		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
+		return;
+	}
+
+	/* Send Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val |= PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+
+	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/* Clear Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
+	val &= ~PEXPME(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
+}
+
+static void ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_WE;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val |= LDBG_SR;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_SR;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+
+	val = ls_pcie_lut_readl(pcie, LS_PCIE_LDBG);
+	val &= ~LDBG_WE;
+	ls_pcie_lut_writel(pcie, LS_PCIE_LDBG, val);
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
@@ -265,6 +341,18 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
+static const struct dw_pcie_host_ops ls1043a_pcie_host_ops = {
+	.host_init = ls1021a_pcie_host_init, /* the same as ls1021 */
+	.pme_turn_off = ls1043a_pcie_send_turnoff_msg,
+};
+
+static const struct ls_pcie_drvdata ls1043a_drvdata = {
+	.lut_off = 0x10000,
+	.pm_support = true,
+	.ops = &ls1043a_pcie_host_ops,
+	.exit_from_l2 = ls1043a_pcie_exit_from_l2,
+};
+
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
@@ -275,7 +363,7 @@ static const struct of_device_id ls_pcie_of_match[] = {
 	{ .compatible = "fsl,ls1012a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls1021a-pcie", .data = &ls1021a_drvdata },
 	{ .compatible = "fsl,ls1028a-pcie", .data = &layerscape_drvdata },
-	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1021a_drvdata },
+	{ .compatible = "fsl,ls1043a-pcie", .data = &ls1043a_drvdata },
 	{ .compatible = "fsl,ls1046a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2080a-pcie", .data = &layerscape_drvdata },
 	{ .compatible = "fsl,ls2085a-pcie", .data = &layerscape_drvdata },
@@ -314,6 +402,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pcie->big_endian = of_property_read_bool(dev->of_node, "big-endian");
 
 	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
+	pcie->lut_base = pci->dbi_base + pcie->drvdata->lut_off;
 
 	if (!ls_pcie_is_bridge(pcie))
 		return -ENODEV;
-- 
2.34.1

