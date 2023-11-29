Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4AD7FE245
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 22:47:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ccep8/hg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgXwg6vfJz3cbX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=Ccep8/hg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::60a; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgXt12pmJz2xm6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 08:44:57 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq8rDZtew6On8My8vGe71UwrPPrAL0JvbeTziozrf0T5+nF9jgu1htXM/6K/hVKt8CIyOFMVw1lBaQmgOgFDVACFFSjGYX7fWc2I2e5jqRQrJDHdg9+e36WQzgHWHeqW2aPc0PR9OJJ7RInmzgRv5XOlDQlteBpy6EIXkuTXGnL0f51mbrpWN91PmEo0+tEkJJVbQIKADEZUmV7kcFZYMUqXLGc6CO3jR9nerran+ioVItoOW61d83mLlON2UpuLTfzhD+ct7mt1DNHY5rJG2thhItdrEqAQleA0GbuBxUKJh0cw5OA5sMXMxvBlvnrWvfOP+wbiy7LUWog1p3mdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcurIAQ3u7MpL7xcZA3guDLS3Z9Y67uYVxYBkfJecTo=;
 b=hB6u65hnkh6lfiQ7RLz2widofyTEXyJULsv3bOl/+qocSHQjV3XGi0couSDWAykF6vDeK4mb3dMecpoEryaXStimWWNHmlOy/tthmgJDxGtJcFhh+IQZSEq4gh+39rz0HSF0tkLzRgVA2IxX8wGuOO8xNACA7/YqmI6zMHklmDFJzoCgK5odW57cnCl+wcXGyjtoky/7lfjGSUxKeXD4/hS4nJOv32dm2KH4D0azr+HVRqlaYL6H85q8e6qziPS4GYjrxvbRoiv2+tEWLRABpv7+ndUzHofq/HEcQUHv0ptQbOaqjiFKON2TxoWmKVke4grncHC0KH1ocCCM2E837w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcurIAQ3u7MpL7xcZA3guDLS3Z9Y67uYVxYBkfJecTo=;
 b=Ccep8/hgKEQvatDulHxiD1dbd2hkRt9e9QiMapZ/frrI1BV66XiQiLvQgHQbKqZzN1rrD8V6kp4SqBlzn69ceX4ljzgT81KjkcJBemepXbmAdhQnCqKtSY0DLmPdA/lBhDZoo1lJQRroIRwn0SOzxgRbO4aWNCFgUyiIVcaDhRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DBAPR04MB7416.eurprd04.prod.outlook.com (2603:10a6:10:1b3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.11; Wed, 29 Nov
 2023 21:44:37 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Wed, 29 Nov 2023
 21:44:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v4 2/4] PCI: layerscape: Add suspend/resume for ls1021a
Date: Wed, 29 Nov 2023 16:44:10 -0500
Message-Id: <20231129214412.327633-3-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9fb2c528-951d-4f01-d89b-08dbf1246216
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VvO7lunlLWTnHuY27/qJz4PR0m4Y76F0JsR6ZHQ1Zz5GSZH2ZU3EaVq/kdNBxA01P+QJRaBbUvt5JF1Kt7PKFY5AsMOnrgYuFDcfaUbEN670wMoPJVcKZJpxBHRWBVR77BREZZMerMP7bGx2YHKQrpIxwuoEnlb7FVz2AuZR7IQ0oq8t1rwVMkmw5pO4/9IzVXYHHmvMlJwpemnRjqSBn8bFfWMwtjoj8eLW/v8stI+z23D+Zr+pRbBTrEkAIxMKSlbrugvsDVD5qdTnulOl0QDSkAaTGt6ZXzTtZPTIB+RZC6UWyj9tOp2LIfElivLHa5U+6Q/ROibfbhJ0YWvwxks5iaPij4Pa5VX7l1nsW3vTZ33UgVCeB525pvGd5s10EHTWS+/aFRrBJf6sJ2fdJRUpsin6z6+IYjPYx7pQtEoljsCQH9PgdKNIROfPJMK7cUpq8unxjvqjGPc3lfxofidvI6zowvYj0YqnVy5vxOg8UBnvsVnSaYdcAf66Qaaz15n/Sre6Evjo/2qqoINkv9FsrOlL2mLyOYM2u3fhIIRDedLJaFT1cBvHixHTzKgRO5IhRQv1DbsdU5tg4n8lDFdYNkPU2lifoszAMEs0Xkko6rzgvlDSv+vektVyZWp/I7DnMgBu35mgKYWDN0UJ9igd2GjcT7n+nH6EzYuM4sM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(26005)(41300700001)(8936002)(8676002)(36756003)(478600001)(6486002)(316002)(86362001)(4326008)(6666004)(38350700005)(38100700002)(202311291699003)(1076003)(2616005)(6512007)(15650500001)(52116002)(66476007)(6916009)(66556008)(66946007)(2906002)(5660300002)(7416002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QQIXzHcnKIpgMT5GsAP1N7Gbbr77yE11RivSPl/MrDdttkzmcjYNl8iOzDVB?=
 =?us-ascii?Q?og5hMMfiO8yikUW95HbaTFZSRP8PrjREZLnKO9rkKKcNT8OGd/K2SzRU+JsO?=
 =?us-ascii?Q?dkIFywM0pnpWHwx+sham+YQ5qOO9gSe3bny+jHOpTiMQOEsRpRMRQOXuw5Wc?=
 =?us-ascii?Q?ZYIhEmalBhthuNxAAyGHvgoFQXrL/FiaJTXZfsscLGHLOgL4LA1FFoKvEr1W?=
 =?us-ascii?Q?xlBg6gqXNQYAkJdmuPDwWVmHXPJnujpNxRRXjR6OXL2DX593App9xgPCgXUi?=
 =?us-ascii?Q?y7bHRlLTM5YGEQEhLEg+bWq6YPGOgaBtXpcOYdmIVaS7sF6vEiRr4th4c+PR?=
 =?us-ascii?Q?8FnYDjmRinf2NVpY05QgYk/CvuNcwcV2ycg+Bqq4qL9LScVawyX8UZCLUEb0?=
 =?us-ascii?Q?xcgsCcPsoo4bmv8+1XKOLjnP3afhhSju7L/YD2SF49olxlLIIbqqGBAgB1yX?=
 =?us-ascii?Q?8ZlpdtC7pQMaP9aFwLAg4ReLjoJ1mUTdK7oyEnGRTouj/VYrNq5NNiqDoM3w?=
 =?us-ascii?Q?aOeIHtGR6CrIVGAv9ScJHguaSfBbIcCdOPc37jcTvT/YFKe+ui1zIpKRhLiK?=
 =?us-ascii?Q?OT4FM1PBQ/gDOo2NU3mYesW7jIVvQ8ntN8sVOZVRQmNbMtapvKfK7pmo/v9n?=
 =?us-ascii?Q?wbi4Q82EJpypcu0uShBi080bSsHwi/Un0E5gLbVKYWBoQDwghddVIW3VD80l?=
 =?us-ascii?Q?fR9yYqzu+QHvVL518Psz9RR0UpXv2QNUP2hjN9AgUSkPZrzjgqcSZ6ycaG6y?=
 =?us-ascii?Q?vxR3qdbragK/hzWDLa+bdB2lPCCPI4JiVxdwcHAH/tiJ7swrLfvZSKB1dzc/?=
 =?us-ascii?Q?szloye0uJdOnWUdVhnsd/rud/kERJqxeJgl9/snH5GCiChzlwtYf08P+3fIr?=
 =?us-ascii?Q?ARMF+kIVM5nGNwGMYQNPONK7sOfR/JDGLqwQcSMQNsrJKtxZ6cre0pyJQgmU?=
 =?us-ascii?Q?jhDOoV6MqGVqRImCal9Rel8XFsG6k3f95oB/y/izXqa/wgIoa/70hk2dvRkv?=
 =?us-ascii?Q?ApoRPBZ5gh1sr/vcsVbk5iEdH7arCTIYWeOTr740wLKnA0a9M6wv1qIoHsJK?=
 =?us-ascii?Q?IYApwotCzhcnipR+x3s2xA41A71J9CAEw52DmTJBI60PHUEqZlscMF05eNcj?=
 =?us-ascii?Q?Ok7FCPfqQW8uN5HV9i4FjntcTS7vr2HugA0ARYqaPV9aFZmpvckuvu7uD4TM?=
 =?us-ascii?Q?+CGeGUYZddkAGIqvqKLXmQ1HzwCr3QXPj3pyDUk/f4hUsFMH7EU8JR+9vd+X?=
 =?us-ascii?Q?FtmhMHEdZPAwHLfJRxC9Xeof9cpKB6otPfw7r1K+N179vie+tDNLYkL7OcpT?=
 =?us-ascii?Q?ZcpEuZEnSG7o1qBDaKgAu6zSFZjQeIl0XakZzKTMnfv8/bup/RHgXGzwWi01?=
 =?us-ascii?Q?kW/JaZn308SR3vuTuiOfok22N9kRJKtggDnmo6yaVuOOqMyddw0xL5r564PM?=
 =?us-ascii?Q?lFfffrCzehBDHM6T/ProqRTryzXw0AZX7/Fe7jLtg9zMnvdpB6/WriCuUmCm?=
 =?us-ascii?Q?BPAn+T/Wqa0ZTb1o9fvOaQEmEORbAv7vJfI2fke0zMOyaJrahAdFKGZ0xsw8?=
 =?us-ascii?Q?6+6yQpk2GwCRHu4MjwM+d1DngbTA+E0yfs0C8IrT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fb2c528-951d-4f01-d89b-08dbf1246216
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 21:44:37.1656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +89MQHUZpGJc5fmQw6UpVSwTmh++KcHoXi8I9/hpOUP19WU2+B0lZb5FVR8NitOzTjGH32xVIXWNiJXOhK6fMg==
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

ls1021a add suspend/resume support.

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
    - update commit message.
    - it is reset a glue logic part for PCI controller.
    - use regmap_write_bits() to reduce code change.
    
    Change from v2 to v3
    - update according to mani's feedback
    change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 83 ++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index aea89926bcc4f..42bca2c3b5c3e 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -35,11 +35,19 @@
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
 	const u32 pf_off;
+	const struct dw_pcie_host_ops *ops;
 	int (*exit_from_l2)(struct dw_pcie_rp *pp);
+	bool scfg_support;
 	bool pm_support;
 };
 
@@ -47,6 +55,8 @@ struct ls_pcie {
 	struct dw_pcie *pci;
 	const struct ls_pcie_drvdata *drvdata;
 	void __iomem *pf_base;
+	struct regmap *scfg;
+	int index;
 	bool big_endian;
 };
 
@@ -171,13 +181,65 @@ static int ls_pcie_host_init(struct dw_pcie_rp *pp)
 	return 0;
 }
 
+static void scfg_pcie_send_turnoff_msg(struct regmap *scfg, u32 reg, u32 mask)
+{
+	/* Send PME_Turn_Off message */
+	regmap_write_bits(scfg, reg, mask, mask);
+
+	/*
+	 * There is no specific register to check for PME_To_Ack from endpoint.
+	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
+	 */
+	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
+
+	/*
+	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
+	 * to complete the PME_Turn_Off handshake.
+	 */
+	regmap_write_bits(scfg, reg, mask, 0);
+}
+
+static void ls1021a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+
+	scfg_pcie_send_turnoff_msg(pcie->scfg, SCFG_PEXPMWRCR(pcie->index), PMXMTTURNOFF);
+}
+
+static int scfg_pcie_exit_from_l2(struct regmap *scfg, u32 reg, u32 mask)
+{
+	/* Only way exit from l2 is that do software reset */
+	regmap_write_bits(scfg, reg, mask, mask);
+
+	regmap_write_bits(scfg, reg, mask, 0);
+
+	return 0;
+}
+
+static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct ls_pcie *pcie = to_ls_pcie(pci);
+
+	return scfg_pcie_exit_from_l2(pcie->scfg, SCFG_PEXSFTRSTCR, PEXSR(pcie->index));
+}
+
 static const struct dw_pcie_host_ops ls_pcie_host_ops = {
 	.host_init = ls_pcie_host_init,
 	.pme_turn_off = ls_pcie_send_turnoff_msg,
 };
 
+static const struct dw_pcie_host_ops ls1021a_pcie_host_ops = {
+	.host_init = ls_pcie_host_init,
+	.pme_turn_off = ls1021a_pcie_send_turnoff_msg,
+};
+
 static const struct ls_pcie_drvdata ls1021a_drvdata = {
-	.pm_support = false,
+	.pm_support = true,
+	.scfg_support = true,
+	.ops = &ls1021a_pcie_host_ops,
+	.exit_from_l2 = ls1021a_pcie_exit_from_l2,
 };
 
 static const struct ls_pcie_drvdata layerscape_drvdata = {
@@ -205,6 +267,8 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	struct dw_pcie *pci;
 	struct ls_pcie *pcie;
 	struct resource *dbi_base;
+	u32 index[2];
+	int ret;
 
 	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
 	if (!pcie)
@@ -220,6 +284,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
 	pci->pp.ops = &ls_pcie_host_ops;
 
 	pcie->pci = pci;
+	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;
 
 	dbi_base = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
 	pci->dbi_base = devm_pci_remap_cfg_resource(dev, dbi_base);
@@ -230,6 +295,22 @@ static int ls_pcie_probe(struct platform_device *pdev)
 
 	pcie->pf_base = pci->dbi_base + pcie->drvdata->pf_off;
 
+	if (pcie->drvdata->scfg_support) {
+		pcie->scfg = syscon_regmap_lookup_by_phandle(dev->of_node, "fsl,pcie-scfg");
+		if (IS_ERR(pcie->scfg)) {
+			dev_err(dev, "No syscfg phandle specified\n");
+			return PTR_ERR(pcie->scfg);
+		}
+
+		ret = of_property_read_u32_array(dev->of_node, "fsl,pcie-scfg", index, 2);
+		if (ret) {
+			pcie->scfg = NULL;
+			return ret;
+		}
+
+		pcie->index = index[1];
+	}
+
 	if (!ls_pcie_is_bridge(pcie))
 		return -ENODEV;
 
-- 
2.34.1

