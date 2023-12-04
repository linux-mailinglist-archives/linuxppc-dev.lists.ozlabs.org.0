Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2928039D8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 17:13:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PAkSx8ec;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkTH81Z6hz3vgJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 03:13:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=PAkSx8ec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60e; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060e.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkTBK68ttz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 03:09:13 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1LswuWNSbw0GnM4DGZ9h+gKTzFA2398BAcR0njB6i6MSl0jmKC7CJDa3EspBEZzoY8YMVUvCp7vYh9njaM34M0RagwgtRlaJfz2446yQiax+Q/W8F0/7KdPPk3dXGvcscOOGN4r39kM9SxasAfP3xvvw6JA1x9WZMqD2xH+tysrGOW5aQezzNjMsGiqu3NR3L8/wURcyQoSu8B+H0KbivLkgvMgx1vO1dI/xxkhwxCwVXBhU140iZAtPhY8h4ttdZW8aWR5bHHUdPc+2Gu1KSM98Ga9DRKrHZ5ARcOZRJ5fYTNv+sJdwSwFPaTczEKBQs2pa5w3RfRY3w5hQWZxKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twXB3m7Tim7njEZaZz/z5gMshLBBUVg2EBfjuL0WGag=;
 b=GBJ/dg1j9VEKVnaS8AfgNC97EpIKy6uhJV9pC9HKpU5FRjFRkGutFlULnbH2c0Dz/5dpgrCQ08MhcBX2LHlA9/heQ6+0xRcWm7qXMOOAOiaCfEneWxb2Q+lebdWuzi37rkdUPa0mrXG3vYdUPwKeh2EbM/Byw/3szQ3vOaYo3HuNdJ5Unomhr+9C6xIdwkBlyP3OiV5HVPR3VLqYAnZJAcOXGo+iJGbTtcEo8TQJ5Uu0w1Zzq4O5PccorokJHngWt1+uxv8qTQl2XTN0gVXsHgjkXgktYflU1HXpGZ3LOW0XL4xFhlf/QCnD7soMDXuChFeI2kaYXp+2RohXqtxB8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twXB3m7Tim7njEZaZz/z5gMshLBBUVg2EBfjuL0WGag=;
 b=PAkSx8ecZHqqW4FxWgl5rlKhc8w5y/q9nmvtHtApt3bP67frT3i9n1kgsp+Fcr2IH1DyJFxeC3kFnxxXE2JT4O3TVIx7s7kwGYCMky5mE/tBQBuTNJ+0zWIN2CWODWWvSbMXIejnn1OmJYwX4/y/sgd+/2JAymVrnqHZma6d+Jk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBBPR04MB8057.eurprd04.prod.outlook.com (2603:10a6:10:1f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.22; Mon, 4 Dec
 2023 16:09:03 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7068.022; Mon, 4 Dec 2023
 16:09:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v6 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Date: Mon,  4 Dec 2023 11:08:29 -0500
Message-Id: <20231204160829.2498703-5-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: c9d7ed75-10f3-475c-c2a7-08dbf4e35593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nXHqNjqZ+lxKeeeAWX2IPrPJinPpjVLIm1bDqSrI4ITLYoI3XAK+Mv/oXHZfdYrlFc3cAFyO33EMxL7dgsEKgIr6UsqyHiBaYCciluJkwyCOV/QIeL5Sx5Cj16+X1vqzAgGTvPCxHG/KH+5Fl4t+JWTEpBq4fmrU67KSZIRawBt8+vgV46QnRHQS/c40mQf/29m/HNM+sXVNuuzo23ixVDUvik2LBZuLv1kSnX2Z9lpyXgrb5/3p1di9q3x8Zib2ByhVVkt+nnyHbpcZ7awHtNo54i+SGmT6VV87FwLIaWC8d3MNiJPEG7kXAvnZgN5XddXq+Tbc5iVF86bJM0kq3OvaaumOljDM99PtpDML5AEa93BuvQ7QCwrpU/gRkVy5NaQCCHZVRZlm2mBQcSXUO4bSAdwogP3uvm+AyX69JFyJehJ8dwottFz4GkOZuo4Utyb9bEgB8X++adIgnrbFsc1muJG25k6o2uxfbX1CmWY1ivDdTyeu4uUHbcPRo+PizZLQYGLvzUCKkkfAkhfT+lx5u7+x1UDXG31BXSw3Sx7ZS1hwYR++Q5UhdMA8T/todfG5rfQd5a76FIKpFcXK4Kyoiz7IPqTrlJuvabLT2T+qmJqwdYjydsb0Ha5/iEhN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(39860400002)(366004)(376002)(346002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6916009)(66556008)(66476007)(8936002)(316002)(86362001)(8676002)(4326008)(6486002)(478600001)(66946007)(36756003)(41300700001)(38350700005)(15650500001)(2906002)(7416002)(5660300002)(26005)(2616005)(1076003)(6506007)(6512007)(52116002)(83380400001)(6666004)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?wazukdBV3FKFMAbcBiDbf33+ZJ/ToHfcd5dBck4iULRsBYSFUVAaWo5ehD0+?=
 =?us-ascii?Q?lhwLD09mZSLQwIQUL8kpPxG9yfs1wy+6Q3izdI+M7Ed681uWMYX3Csso9+zP?=
 =?us-ascii?Q?o056DY/sxkz68bH5t7W07XVwzAPJWZHtjQ1Ivw6e9oLZOlCiSVZZtpUPGFVJ?=
 =?us-ascii?Q?JcrkzwhZGwtQiMWVLiZJQji7IaDrNVxvjaRoaY844sm2jHB+22xY4pzBmNDU?=
 =?us-ascii?Q?m69WeUokuSJnxM4d7Ac/11LP/7K8rZqMQwm7+OaOxOHuSEMTAfyY/tvJQNdM?=
 =?us-ascii?Q?YFZHL+g5GIV2UNyo9M+UYpQXfXl9/okLJzY5lF3ImbBThdTX8u9oFWx4A//V?=
 =?us-ascii?Q?GP0xZiBdR+OQfW4lY22QbfYLP8cbh3e8sqmUNouLHPsSMzm+dFwHD1d3CZKr?=
 =?us-ascii?Q?VnoYXyVOnH9UaiPBTeYfyBtQLXD9sMLBA/Uc7wtMA/n8qiZ7pycTM9GuDCn/?=
 =?us-ascii?Q?l6Q2Um1yRu8+gFn+GwBukx54c137fB9TNmt9FJSVieUPPlvg3/8L63OOXNh0?=
 =?us-ascii?Q?TCzuOL10m98MrTp+4iQOQmRy6H3nuWtDkfzx9AzF65YdFCLNhmFrVDyvpxR8?=
 =?us-ascii?Q?n46HNx9w9wIKEeI4aDjjj5JVzbsuun9f76k1EpL1SaxIksRmL/jg9yttWvo9?=
 =?us-ascii?Q?5P2AvXfqbUoQ502bxh5Dh8TQbmKrpXPy+lO5gumhh3cwxyf8OkdpEooikfNc?=
 =?us-ascii?Q?OKTi2vFD57Rfu2LGqPiVi8MDo51nV44/7YMgIB8FvSD/Wk7tSmKATilp+mXa?=
 =?us-ascii?Q?sZOGQJXiu8E4zoVzTOLaVqeWKpgdqDb138jE0EIU9Fj8O6pvpT3+qDLBt2fR?=
 =?us-ascii?Q?G94TA3RVllZHOC9BtWZGDqU/lUOpqpufvVPmBO6cosqZcGYhWrdmAjhpF9o5?=
 =?us-ascii?Q?WkpRtYGjzVRI0p/SfiVeFMh2whpcjec615b7jEce273CMWy3hKlqgWkEIsyd?=
 =?us-ascii?Q?lY2JBtCM0lj0Dg5FYfH5YijZhbkM3VJffl2MQtk3x9JT2OTCEYq0TTd2YX8u?=
 =?us-ascii?Q?rKOnkBG5Yvcl/O2IutzNCtZf3r/K7sNdYAGTmPFNlhIVbNuKxJRAyW/HT9h7?=
 =?us-ascii?Q?JDI/LnAs9/ey9fF/8H2ZqKdEYZOlUEuly3106SgGxfBndEAqvena05H/z3XK?=
 =?us-ascii?Q?EAnmVMMfDmldcjJpsDUY/1UZuL/mnDAdtrlNb8TwdsDccHY2pOrX/B5Ons9o?=
 =?us-ascii?Q?yGkaS952+yfu57uEXz+bchMNE6RhyVkjV0ElVgRtJkd3WinGz5tFvBfDXt7O?=
 =?us-ascii?Q?OZBUXKFqpW2Ve6Vvdh6bUdgELtgZ18/QiZQCIz6tLwKVSGitu9iAP4iABE8R?=
 =?us-ascii?Q?xTHi04G5I+bTaqYQIW2JiLiZHkszc+rpZ7YeJI6AlfChF3fi5D81bXqrDlzJ?=
 =?us-ascii?Q?I6OTJGpaPzfUJ5WE3V1ExBOJ+9SvBRSS0hSjgdWOFQSwuEm2EMaZoyHsfkKF?=
 =?us-ascii?Q?meS+kl/opOq1qBYHSJ/W6hI3yjqtldJbhat8cyy6pBvtMREWnHn3cJYfC1vD?=
 =?us-ascii?Q?ACUoMUdDWvR/EamoefD5/KfkLACdQwkA2yg4ZfhFHqWifs072eXUlI/n5dVV?=
 =?us-ascii?Q?B0Uc14g5H/2F9kuEjDUJ6SSAGNw3/66K7M1xWayb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d7ed75-10f3-475c-c2a7-08dbf4e35593
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 16:09:03.5363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: warSZXDLyiFS6+GMyL6cXJVfI9dplmdgqUFKMCbgiXF0kVDPGOJE21Jwusp0hS1UNGWcweShiAl3HuXgciEz9g==
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

Acked-by: Roy Zang <Roy.Zang@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Chagne from v5 to v6
    - none
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
index f3dfb70066fb7..7cdada200de7e 100644
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

