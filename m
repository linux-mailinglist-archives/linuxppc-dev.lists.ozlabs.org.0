Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6197FE247
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 22:49:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hbTT5bX7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgXyg5PcCz3vqX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hbTT5bX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgXt24T03z2ygZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 08:44:58 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUUHLCV5PuaKAt1oXAfC1Wss9pmZ9l+VCIHLovmTN7ECCZkaYbh+stcq2ABY9sAZ+RUwXxyccVzodfMFDcFkTsn09XWNoopepd4kakmx4Qms1I/IMJZYC9D6N/AvRPm/p/nPYP1gteO2TupUsFdz7r7yvx1wWP5UrY/bPmvyChLnsTSVWp4c128XXh7ZONgocwwv8gIHtDVlO1YEsmWyY589wC6wZsiRXeG0fZUwxmUYyZqJW8KRVE5SoJrYv6voZibd/nUcKCVejxeb0Qi8a5PnbhfSTNGR1wlixfMQmdv5VKrN3eWL4UbCkkUSLhqVDZvqG3xdOo38LEFTyROXyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENi4BObm6hUCle7hG/sI3aKr4l0G5+aghdecNzdpGvo=;
 b=PFmuJHF3hTHwvkBOgywxkwvOcyTVAf0lS5MHFA3KOCCyFZ6Uhx1enBzkZzzdbSpVlgHNdQ07W3oC0vF9FD3+1cIFJPxQZWGUJUxONVgW6sVRt1Fy+nnXBFMzvi1mCDp50skJ8qomYUllTmu93CSU5rV2xbH1jt9FQJ4BaQfgBwv4X8KYYIBAkiSASAEU6DXni1V6h3t51yhGWl2cuKAYAAxi/vlKSegSdznbYh2LCIcfXjmhMWGGFoGhuv+fppdunYWHrYEmW7CghWGnNjCvHLmGkDWX1uw4+Ud81aBArj3bF1eSLp4y7pydPRpSjZIk9tRjfOlmDFxGhz3jjM7pew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENi4BObm6hUCle7hG/sI3aKr4l0G5+aghdecNzdpGvo=;
 b=hbTT5bX7nkzs1wAy1C43UBLOjw3jbThwpiD5C+1YmWC/JNlCCGXkWJu9a4hSwqyOR3HijoeC5CdsqqhhPNQxIwKs/0cjwnR+nmKDNOYA6YAQO36M1i6f8C2IjZzqvv/K852Uesa5caA4Ax9J6O6tt2ev96+TWUjqRN+Ng6CNyb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Wed, 29 Nov
 2023 21:44:44 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:44:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v4 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Date: Wed, 29 Nov 2023 16:44:12 -0500
Message-Id: <20231129214412.327633-5-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231129214412.327633-1-Frank.Li@nxp.com>
References: <20231129214412.327633-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0136.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::21) To AM6PR04MB4838.eurprd04.prod.outlook.com
 (2603:10a6:20b:4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4838:EE_|DBAPR04MB7416:EE_
X-MS-Office365-Filtering-Correlation-Id: 120f70b8-0948-486f-8230-08dbf1246699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l0qj56seLC49at42ZaRsH+bXm2MFtjulInLki67JV5yK6jYH0lMmOt+K0OoMXXbqlUBtiJVBy2Z2406CjsGt5cn06gSxqGbb8TZoc1TOmekkutucN83NBxBIAKWyiuwJ1wSzqAOeIhFT9NDZOXw4jluDWIz/jNTto6lCSrZDgWE1ShJKvItA+0DLND+92ss9z32GlhC+163YZ9EQd3ICTBv9ba8484zz2xyaUFGVUT1woa1DuSvZz7DMDwfzgHKWPo/Yqj3X4C1ljyQ1bltHesYobz/Mau9fhLxdgND6trC1io79Xu6iUnx2Z207sK04Uzrkk0al3pOFEFe4I8z51+XPdPOSVizsHYOVFKmd0Q1jj9deWBi5aEvTtVRU+9Gx9/naPydKXl9kPho2qi9pzWK6oWHVjS9bm4BwZ8xJ3/dVdgesPHXbJlW9r5HRq2HAq/K43Ac1EMKNMyeTkfjysme9z4y7l4mM1CtBZRNyjHHd5IdnGcyYwWpI1XKj+OQXaluCyoQaLJhOP2RGsPAVN36OEDmlS+Bn/PPyFtI0s04p0+oN6f+SFAi1geJAo7L6gQxXdKW7fhB1eIRKvMlSXtttVfdB7qlHUvktzqH5mxi58AlNdkSRSZc2lvsTtBfdV6H9HcEwWLF0fM8wHCozaw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(26005)(41300700001)(8936002)(8676002)(36756003)(478600001)(6486002)(316002)(86362001)(4326008)(6666004)(38350700005)(38100700002)(202311291699003)(1076003)(2616005)(6512007)(15650500001)(52116002)(66476007)(6916009)(66556008)(66946007)(2906002)(5660300002)(7416002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?kNZvkY6D0WUb3GEAGFwtxIMo5lWLFN/XWWmeXHR4ce+FPq8n7jgKxFLODjiO?=
 =?us-ascii?Q?HO7XgpSSgBiuIkuCT/0V6gdHqroQ53Dn423odSpF/4S+gRRUtmHg916rWloT?=
 =?us-ascii?Q?pRYcnb/iT59+xko5E0yE/apAPPYhZDRPk6zQt3ALomrA4sl8jLjq33K7/cuf?=
 =?us-ascii?Q?g8k4sq1MCa76qiJJrSTemzERCIeEeAg7fuWj5a80nqFJC23ohFNJ5LM8V/3h?=
 =?us-ascii?Q?L9j52JMN6VwrbQnUTqeaWZpXnop5gFM4DOIkD9wvPsk6+0+mGzcQQQm1F7NY?=
 =?us-ascii?Q?ElExAolhOvsbPXm6niRS0uy7dzUOhzlzTzvG7wl4Y/dv0kgUT8SPyWJ/VXoF?=
 =?us-ascii?Q?l0UwSxExiDAWhdaxFNsst8m0dcQlNifMiuPW8cNlHuTXUTiz7doMcMIIuGzJ?=
 =?us-ascii?Q?tQBY4X4DrgUuEF5uDnknPUznAOtF6q1FjlXiQs/Sfp7ZVXb20sY8LgD51p1b?=
 =?us-ascii?Q?XIjVs3t3vm1480LQcim0v/Y/ba/wIAKP/jZZj11+ZX+63v0rvJnfxAuRCZmz?=
 =?us-ascii?Q?Lq73oUFgKfVb0dNzRAop//2VD8iG9MVbvwiogHWXj89rdaIYk4c39GpFxO+J?=
 =?us-ascii?Q?RgZ/ZPKS6dCQL8VG5EQYqBUXf/EKc0GJpWAiW/h6dm7L1Xpzcpqed6blbLro?=
 =?us-ascii?Q?QWIybsmL6+JjaYL9Q23/cNkacCsEv5RKkM9FgUjTRM6TJykYxF6WtJlfjdW8?=
 =?us-ascii?Q?rNOw9yAtAJGVr5Oe9T+J4vq4W6mOmeLTjs4XXuZ+1111K7oXZgaGZIpIYivj?=
 =?us-ascii?Q?wU8rR61TNZ4w0qJNTib5jUwG9ec9ljoqzFWT54ejnCxjy6A4VJMGghU4Z64V?=
 =?us-ascii?Q?9gNIro6SR9MinedCMTkFtv8U/YwqotEiPaoqEwgY4ZUaNcGcPdtpnwM+L2N0?=
 =?us-ascii?Q?eWnf5Sx/TFkd3HmLswOH+wR3sjn5y4Di3dncWc76VwFMW0N8gseVZwISCJA+?=
 =?us-ascii?Q?jdQvBhbEUlFWxd38Qd/9WxlG3SqwLVpIGvRM97XCPJnL5AQj0AsYu3E5EDBG?=
 =?us-ascii?Q?3/3MAd0pjkRkExluWWctSWV9fuHI4hM9TqjN7XaAkq2dydwt4alrfOtrLZfB?=
 =?us-ascii?Q?2L05nAHcCrBh7uE01NgkwC/xFf0bhPp85/ZFYE8jKwvBGxWkACuEcTCG1HdD?=
 =?us-ascii?Q?cOnMSnnc+IHoyiQoNKdTgAsclNLL1xfDrr5fVXP882wOlcW2TPnD0GOOgq4x?=
 =?us-ascii?Q?BjDfY5BjgbFMiYFbfyLl2I+dnPaytGQbR7rs4rLAU1YuqW2mly4CeYlyb/C3?=
 =?us-ascii?Q?DYGrz6GAVcCog4WnMAoAmzl1B7TdyNHPhU21EliQOzdBOWjdmcEID+74lLmf?=
 =?us-ascii?Q?/F3VOq/cKQg7aEaWtsDmVpb0X5p+cmWk9ZzuZ9+x/FqNHquGXHxx8A0n+Fpn?=
 =?us-ascii?Q?79ym9DKpE06G7J1CxlvutuqmkRKQPXVG0NfpTZQU3bvIaX+Ryq/GGAr+G7dE?=
 =?us-ascii?Q?DrEdC9OvZHGi3kRxJaSfwEzQwLvuDSSujZ5iHKmXBGehrcjxqGAfPNbaEMES?=
 =?us-ascii?Q?GPK8bACBgJe3CXLtRtzXnLuq/6zm5/GY3+8ezWDsjqim/kysLbcYx4pAs2mE?=
 =?us-ascii?Q?G+hXmc2/+PBf5gnDidU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 120f70b8-0948-486f-8230-08dbf1246699
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:44:44.7864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: voDQ3O9v9pgZu8BNm+qpB0oJNKiiE3jMn//dnOK7nPpiUkhU9I6Bb9y7C/ybrMkL1s/gvD0LXI0HqUf9Om6wqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7416
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

In the suspend path, PME_Turn_Off message is sent to the endpoint to
transition the link to L2/L3_Ready state. In this SoC, there is no way to
check if the controller has received the PME_To_Ack from the endpoint or
not. So to be on the safer side, the driver just waits for
PCIE_PME_TO_L2_TIMEOUT_US before asserting the SoC specific PMXMTTURNOFF
bit to complete the PME_Turn_Off handshake. This link would then enter
L2/L3 state depending on the VAUX supply.

In the resume path, the link is brought back from L2 to L0 by doing a
software reset.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
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
index 590e07bb27002..d39700b3afaaa 100644
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
@@ -225,6 +234,45 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
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
+	 * Only way let PEX module exit L2 is do a software reset.
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
@@ -242,6 +290,19 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
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

