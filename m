Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D147CAEEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 18:19:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hyP5aQX4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8MlC6QWgz3vXw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 03:19:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hyP5aQX4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0e::623; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on0623.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::623])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8MjP3GkTz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 03:18:17 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mm/7XOQtmLbE2t1S4zT09aNL+T/JQdDjs2GS6hSDb7P/bDd+VIfyAGZ2LpewkOTEPhVJVl2aAgEn6sEUyOXY0aHryM0odufhQgQqxqW+NSQk6CZexvB3criqz6YtJ2gF070Dq4/WLf8he+k1q/IXz/35eS+4Tg0262eeEng1J5Hc4bg7yHjRk7ZeGimh17nRzRhPnSMysPa+zA2CJNsZtL3ZHCg0S5wf6xQ/rMneabse1EVXLIaPX3kBmWfQcEXUCo8iOGfEp60VyamnOCbR4C2gKa6sxd3iQ5gxhTrgIbzT21ASlaI9X84nbROCB0tdxaQXJSbL+GeXyKgPfbMAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOR1gcPXA5TFwOrIuNws68vaKmjJdzXEgvOYYEXiSLk=;
 b=DEbvDkUQZIam9BgJ53qDrStNKWu99Sby1TUU4xXM0QNxGHB6N8onj58i3LuT0CLhza88KblOHgHZU5jUjbrvNnG1hY2jf5UiE3xs1BV0vplUuRcoqY+wJnyE2Chp8YrSRcdAnLkrnSGXr1KkARyfQ70zb/jrou5ag+t8OuDyetL95McRmxahGVEbxstQeNRMMjyn5Hkl8ZS2JluE/UYHWSPDX3+csEssZ7EErdAmtkB6FAX79uvTvaav6L0i3Ubwzw72GJENc4qufBpAFqvDj06yJuL94RzWcOAkDP8asKHRefgWb2MBoC1tEEn3o771gTBNX2BryqFukzFKhFBdKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOR1gcPXA5TFwOrIuNws68vaKmjJdzXEgvOYYEXiSLk=;
 b=hyP5aQX4qhoLwp4tMPEM0AVmDhDKOHMcsM6QlcfNbCaEgr686mTAXINKJp8rycgwX0FrQyJ1pZZkolx+QRUzzE/W5v0ME26rpJYtkxpYO75yrcTOxJsRsfJ1uULCw9cbmgpi26VapE5dnBT8VyhXHGLucpC6Xz5DOEIew2C8UMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by AM9PR04MB7489.eurprd04.prod.outlook.com (2603:10a6:20b:281::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 16:18:00 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::1774:e25f:f99:aca2%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 16:18:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: lpieralisi@kernel.org
Subject: [PATCH v2 2/3] PCI: layerscape: Add suspend/resume for ls1021a
Date: Mon, 16 Oct 2023 12:17:37 -0400
Message-Id: <20231016161738.2854352-2-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6e701675-722c-46e6-ec70-08dbce637752
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	nW3/1lfACoXRwxhEY2Y+dK9JzAv3IwJWJZWO9oYzHxZyw/PAdO3Cdfxtoqg2jnGQFSsUrfMTLIXKiQm61ns1iJYvHtY2Vn2fkdjK+p6QPNopuVI0E3k+YV4+JCTnpfHFfGNlrL6aWjxcQSJpdzNfcARiUHYr2uzqRKYSo4imqXdDDLTEZa1+vSSt9Yzd4C6c4m+KRJMYFOo5+H8sFV/ssmVFvZFbpFCQXbLW33E7zoFD2qgi8TRzWeh1zNtQXGRqIdn0AJo4Dm9IrX9syZ2v7o5hadyLjCyCpT9LmwRRfuNPIfZv9IZsxW9Uo9NXPfrRTb9jWxL5WTnL/u/y0TWGPqdog0bnX3YiibmL6IscDrslO4kbKzAhHMbgaJxeUUxntYiAUqwp7TOo/NtUBCemypm5eRGCkmvx6NvM6EKxmcmhMXjsTJswkyLWEzqtZjhdyEh/NjsIqbiN5EzD7iBX+5u1iOX5goX5Q/YzhbKiUyEeCHph62ZUiG0R4qvqEm0ag8Fa2LuVKZqb1RHifcw7IY+V/qcu6Azjlgeqlyj5pacT9+sb6RA9xeep6mcsXuOVqot7lZ9JyS1K75gfaNly7VEqxveYDecHEpf1Yxd84QWOLmCNNKKM2Pfo0cUgnOli
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(396003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(86362001)(38350700005)(36756003)(478600001)(6486002)(41300700001)(52116002)(5660300002)(2906002)(6666004)(6506007)(38100700002)(2616005)(1076003)(26005)(66476007)(66946007)(8936002)(6916009)(316002)(66556008)(8676002)(4326008)(83380400001)(15650500001)(6512007)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?9OcQmUVjxC9JrhHrHqTXUeR/jVxK7ZSky8S0zULVDYfexT49hyb4TodJ9vAX?=
 =?us-ascii?Q?5J5FCcfJoq9RQBc424UeJflPot2j4DykwWr8PQzRchQH36wH3otRGYi6GrLy?=
 =?us-ascii?Q?4vjN3QI0lhXrO41g4cnxAbf95H5Zb9xLggGCDQ9e1NgqBie3ZcU6mJZCprMp?=
 =?us-ascii?Q?8hpKyJWyyhm2NlSsiXH8EOnh0Fj4VK1qFslVOjJ8LYq7RAW5nzR4rqaFaJCk?=
 =?us-ascii?Q?zyc2YZpbkeXPiQ3hPSBDwJ1RhCgVfBJrojxMWndXvXXJ7Ca62/sdR+n1ZFU7?=
 =?us-ascii?Q?OI47LsScWRmvQy8e+7IOhDNurnUgB+zdaym0f8SvUyto3rE11sMrKr5dlc3m?=
 =?us-ascii?Q?pUCkP3GENPRbq7+TflEQSlgyUZw3M0iDgU6QTwZbmD48LzdgWLZnAgc5quvA?=
 =?us-ascii?Q?PggZUIK7bzVVIHgKhvPcvw8Cy5jTxV7FRFhyxIakU7fb5G52ZFDutTZzvDN4?=
 =?us-ascii?Q?SrD5AKwwdAliCtW18kRxMAWnQ+kXDikYnZ9x8JtnVYhcRVtu3MKDxb7SNhjZ?=
 =?us-ascii?Q?PLnoVUWn/VUOlRC6ImrM5hEtC7euNJ7mMnB029/0l+DgvoiXrb6iu4DfW1RL?=
 =?us-ascii?Q?JEv8iHIdVhC1c+jIDTkgW94lVHyh75Vqtj4Eq1GaGaPvP0jvq2IBfjBO/44L?=
 =?us-ascii?Q?Be3Wp8rYpxEgdstUqpi312yT/pUQANRnEFyXIPYzj3PdNDqlLf2zaLPYUo0+?=
 =?us-ascii?Q?/6xMhzD/PLzM9uAGBav3xVVlO+lMdZ1MFLW30C1ybQY1XFjLUPm8unrpTBxv?=
 =?us-ascii?Q?RF9HQVhtgF5eDPqau9oOrcF3WXTrqjfsCEm1zNAw96Hl94GdlSXxhbaVCRi5?=
 =?us-ascii?Q?L9rsU7ReCX4OkATCY7kT/tGJbl4XuJAcGh5coCBVSe7kKK4Yju5FxMoLYowb?=
 =?us-ascii?Q?X6n15Pwzjiec3wtV5mUkrREmkdf2gKX2mdfJXJA4dHyLMAMdY5O2jA17It++?=
 =?us-ascii?Q?eil9GLVzVi/5DYE0DNwEVZLD5wy7qi0xiezc1oVlODw6KKbZ5dWpedhAAYHS?=
 =?us-ascii?Q?tb8z5LMb2feOv7REuVDAz/nHJojtrGFFOSTVK74xZmL6k1/8kJX0iQIRuAX2?=
 =?us-ascii?Q?Ks1S+nSK/q7/j5IWx9HBIXdDI3cmZeQpIwMeSLXUSBh5QN5isCnpWYzMgrkb?=
 =?us-ascii?Q?TjTmAC4bPuH0rXmjX7vtgeSnpTJ0olx5RrQ3acot+aui0HHwa73VfrOTzN+9?=
 =?us-ascii?Q?NrEOOhN+V6q85WhFwm67268Cw9B67g8P/Cwl/hPyLHFjFHF3fq+G8XGm9ip6?=
 =?us-ascii?Q?MOR5c+aITRVWfSPPr+iSNpzLhinhbTqOsa/xBM6JFLwaCAWPKp1Opd0Q+zll?=
 =?us-ascii?Q?u8KDXjEB0Pj9NP/4CPf+3bCTFgJqD5TqztEDJjHx/HRwSPIK3VQQfRTFiO4G?=
 =?us-ascii?Q?ILtNbJqE7zXCV3B0KVFTyGm0mXs5/vV6ndcW8fhLCcBOONOhHUYeiLYxq3gF?=
 =?us-ascii?Q?N+dJ/g9lLftACjDKmEI5mpTSQSwZ98bi2hGS8CeZVfeXGZHIJtkr31aQN6KQ?=
 =?us-ascii?Q?2bQSv0yNC48x3+xo7J1WBhZCI1E56smm6q32CWhlWZIWizzONG6sb+0p3MEE?=
 =?us-ascii?Q?q0IK6N6pnuWksMrkLDTa8etf+Pvh49+mash8UicI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e701675-722c-46e6-ec70-08dbce637752
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 16:18:00.3686
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24afOsP9vrI8nizjKOB3ySN2tHIJDFI/ktk7YUclTO8CtBph1EfKD6RzWIptyOfcJxD87Jc3PPnc/jBqfbd4GQ==
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

ls1021a add suspend/resume support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 88 ++++++++++++++++++++-
 1 file changed, 87 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 20c48c06e224..bc5a8ff1a26c 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -35,6 +35,12 @@
 #define PF_MCR_PTOMR		BIT(0)
 #define PF_MCR_EXL2S		BIT(1)
 
+/* LS1021A PEXn PM Write Control Register */
+#define SCFG_PEXPMWRCR(idx)	(0x5c + (idx) * 0x64)
+#define PMXMTTURNOFF		BIT(31)
+#define SCFG_PEXSFTRSTCR	0x190
+#define PEXSR(idx)		BIT(idx)
+
 #define PCIE_IATU_NUM		6
 
 struct ls_pcie_drvdata {
@@ -48,6 +54,8 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	struct regmap *scfg;
+	int index;
 	bool big_endian;
 };
 
@@ -170,13 +178,91 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
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
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val |= PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
+
+	/* There are not register to check ACK, so wait PCIE_PME_TO_L2_TIMEOUT_US */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/* Clear Turn_off message */
+	regmap_read(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), &val);
+	val &= ~PMXMTTURNOFF;
+	regmap_write(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), val);
+}
+
+static void ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	u32 val;
+
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val |= PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+
+	regmap_read(pcie->scfg, SCFG_PEXSFTRSTCR, &val);
+	val &= ~PEXSR(pcie->index);
+	regmap_write(pcie->scfg, SCFG_PEXSFTRSTCR, val);
+}
+
+static int ls1021a_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+	struct device *dev = pcie->pci->dev;
+	u32 index[2];
+	int ret;
+
+	ret = ls_pcie_host_init(pp);
+	if (ret)
+		return ret;
+
+	pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+	if (IS_ERR(pcie->scfg)) {
+		ret = PTR_ERR(pcie->scfg);
+		dev_err(dev, "No syscfg phandle specified\n");
+		pcie->scfg = NULL;
+		return ret;
+	}
+
+	ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
+	if (ret) {
+		pcie->scfg = NULL;
+		return ret;
+	}
+
+	pcie->index = index[1];
+
+	return ret;
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
 };
 
+static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
+	.host_init = ls1021a_pcie_host_init,
+	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
+};
+
 static const struct ls_pcie_drvdata ls1021a_drvdata = {
-	.pm_support = false,
+	.pm_support = true,
+	.ops = &ls1021a_pcie_host_ops,
+	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
-- 
2.34.1

