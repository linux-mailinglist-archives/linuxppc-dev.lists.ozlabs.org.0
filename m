Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA6800FEC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 17:19:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fgHjD5b0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShdYl1sJnz3dSC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 03:19:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=fgHjD5b0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe13::615; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20615.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::615])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShdWw6hRhz2xdn
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 03:18:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h4enNaUtgCrSbmx/IbWIrrOP50av4DFN08wlPm8EF2+iS4NU0UXUkPOYn1Y1S2y6k4FAIhcy38fBzd/B91awe1QL3zyVQfN8fyJx31cKB955E7sW04VQTVG38elCCd+fdzTcMIlKA6MiCXB0uhI7eUtOeucg400SWf/CBMsmf/XhqKMKIjtA5bjN6iIEjkLOTbvCAcekx4oFHmkTi+/etp08voFSWxHhdeUe9cD4GiSdmv2amuKQSVWVyZCHp3+nakwrYGGRuE2YUudnGL/wa0rhvtpgoslxtdwlGXxNcUtpqTfpDQ0nKD1U2SOybU0WAOAvbuQGwbBZg3ZQdAxKUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNYVfd/bi3kgw9foq8T63xE5hNVb3oc+FIB96u4aF74=;
 b=KvY9LRbc5K5itU37plZJLlcr19d8+EaGzxn4MdO5YvqrcyMiO99rECt2qXVs/SxwB57IZYpQo1sEEFOTJuIdaj1sby2SJMzwZbDhNcXVXEgHIQSg60jHf7hKli0AjmASXd2DENLNSX5Lf12haxPXkxqn+nvWNYVqUVqSv/3xhfci+R6ZbtG2ARVuhtb3D1/EgOz70SMzlCsf7xr5gF/074pL8/OS7n2KgGCrxFcxYtK24Rykh2HaZZrVxpdzERcOMJ4lK8g3WTbykTiAroCrJEO4AYXPZZwq94q84DaC/8MmSwsPoC+IJOrRzzQmm/QUZc2KAo6Ywx8WLsiKb7sYKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNYVfd/bi3kgw9foq8T63xE5hNVb3oc+FIB96u4aF74=;
 b=fgHjD5b0ghIXW050uoqs/xI4L/+/24QwRqapgFYcPbedpvgOF1CGzGYD8Plcbo2oAQczgkhMvVQVZNf/Fbs8nmPTDMG+B0iJkoUNRdVsz16Xg4/Lt0Dko6bf9KmmzSfjPMjIMEFOICagnop/0+w6ozTDFycb7V65XHDGDQYJUFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com (2603:10a6:20b:4::16)
 by DU2PR04MB8695.eurprd04.prod.outlook.com (2603:10a6:10:2de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.13; Fri, 1 Dec
 2023 16:17:35 +0000
Received: from AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40]) by AM6PR04MB4838.eurprd04.prod.outlook.com
 ([fe80::95f5:5118:258f:ee40%6]) with mapi id 15.20.7046.015; Fri, 1 Dec 2023
 16:17:35 +0000
From: Frank Li <Frank.Li@nxp.com>
To: manivannan.sadhasivam@linaro.org
Subject: [PATCH v5 1/4] PCI: layerscape: Add function pointer for exit_from_l2()
Date: Fri,  1 Dec 2023 11:17:09 -0500
Message-Id: <20231201161712.1645987-2-Frank.Li@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5a8db370-fd28-49b8-88f4-08dbf289072f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	c2UinjZJQFvoIEnYSAFkN3MCSwNGw/SAo6AFXoT+rNZMe35DeeCyoEwu3yy/LW2gJigWmZFkqjcDDI0TkbDk4lk4z4e/0yp5mrTtLgAYIYkWNOhP6u1aLfodQcSjIp4W2dsqXamP2YmtALs/AiKj48rNS64NNQspR/Hv3EaROJgZ0KfrdDkM9n+uitWoPt6OWTd168pt/uKZ7Vh+VvyVTpFvCkNUsjRKVXf0MtVl211ZijlxJDwx/3i1ygIzdqHqqigteO3PCPbDazmUqQWGZulEJUd/2LhQvDRc5O0dDOlO7byRynxFWMDpXfN9lzsqTz0XsqWEjnZSqxJHaKhk8qib9F2oTCaatnhSbIogLTFaRXiOz4SQe+kH0U0Ui0tzP8wabDC/pWu0r54/kZ2YX9sRYSgIlpCoZr/cOBK8dtjPI1G/6FU9c22uo6rcdrcd6KwwLZNTD9iJY09BA8Fr7FMzs+iaNYs3Gxz5tZrdL7BB6UOXV8K3kdFrJeiVw/24A7m4+uSrpaa7o0IEr8mb9r3D2H1xZAy1xt/3ajZzjGUXYQEKn1rH2qiD7r8vKfFOKoyXwWLPQ0QeJUPjlPPQWNTRar5Juzch3V981b4TSX+k4fd0TD8YJuDuNLh2H9Mh
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4838.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(38100700002)(38350700005)(6512007)(41300700001)(83380400001)(2616005)(316002)(6486002)(6916009)(52116002)(66556008)(66946007)(6666004)(6506007)(66476007)(478600001)(36756003)(5660300002)(2906002)(7416002)(26005)(4326008)(8676002)(8936002)(86362001)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?192dW7QJOVcsM+SLyFS68RhyUfE3soq5dZAB2etvStBq8rcDVU/JvgxGOGGM?=
 =?us-ascii?Q?+/pzW3WmqmL4AYaK7/xnwitkF5S0LpWxOZyEj7WQtz/hHy7b4PQKphloI0bH?=
 =?us-ascii?Q?e2/PlXZ57rfhs73nUZR9a7VSqLTs8QSZa8+Jamhv4j+ATTaxJZclJOd/cH8O?=
 =?us-ascii?Q?kGNygyev3rDGolP0+iSZn6ar16v4O5xAtNvWiyXPEOkW22yxrrvECbmR79sa?=
 =?us-ascii?Q?6q1KGYff+pAqhxKmKz2meZO/luX49eEoS8B4i+1RnUT6+Y6S20AEX3arArhZ?=
 =?us-ascii?Q?ypBcQ7ysaWP1GbGEzqyigDO4PWKN0PbNWdoiofBhMyA+XN6Chmt3DmqwLxRW?=
 =?us-ascii?Q?ow45nIwUHcKo4QNiLDtKbWU9BtP86zfRWGFTOCVDETlTXix2GtWqQKFcra6D?=
 =?us-ascii?Q?2EuaqaQTnPi6FjsvfHJLzKe+TB7aLIIR7S3khFzQuADGwQpwzUDkX7IdzvHa?=
 =?us-ascii?Q?X7K0tWZhxgkfadcvZ6QtVfCbcTTL8vNdNIgw7VUAH9+oyhgJ0Rzq+g38Ugr4?=
 =?us-ascii?Q?dMBe9wjWu2d6e2eX+0nM95uTOfRZgBevHCwbpa7jf6f1nlwepo1Kl4AxNmX0?=
 =?us-ascii?Q?K7SoY6IouLavDb7AQLSNy2q8Or9mGdiD3s3iyEuYydp5zDaCF3nyBQeJD0G7?=
 =?us-ascii?Q?OIE5AheEA/lxsdKMEG6nvmcCM+4TaU26jq6ftcG3KwZBrztpo1GjNXIaEDOr?=
 =?us-ascii?Q?slVnbVPsS4TmiGnRa8nfFyfM4+K6aRyUdMNT/7qn2esO3rkJRmSJrfa72bg9?=
 =?us-ascii?Q?jI2PzAGgyt9Ehr2SKvi3QSHi5T9RiuD6rXJdvL+Wl7hjT1IFfbXeFEyLKl7Y?=
 =?us-ascii?Q?EzSRTh2zWHjjQ3bHHS118NjW0RWZ7Us2liTrFHDBDQnktrMl7Ha5TnScftwf?=
 =?us-ascii?Q?/YhktfV5qDepvM/yRE+IOHBxe/rvGLw3WJ5YZwmxzmrk6w5DOZptUNUowqn6?=
 =?us-ascii?Q?ltuWr8JjPzWjMbXJC1mrUhUa0pifjjI9vl/ddI+6kX+sxixe5Na0BJrfu2aU?=
 =?us-ascii?Q?E6+W4YX8bKmunVdB43bkIu4hlQVmFKZsmam3MWTG6ehvWhNkgagCPyoYM8JD?=
 =?us-ascii?Q?qN+ZBS+t/47v5LIaqUD5Ur1ruypBJ7/5HgHraMgv9QCQw3mRrMMqjL0QnOX0?=
 =?us-ascii?Q?byiIjJ+ktLSSIhVNbx9gSlSR0oF49/2EwgGI9yRphr7KMFMJoPP/q523j/Da?=
 =?us-ascii?Q?9K9Wq1Ut3uG9meiN8Z105CdJEEKHNIaKAwFxT++w3SXfB7ewkrttDMWfY7az?=
 =?us-ascii?Q?ejmouTBPsi+6ke5SD3oWLmQP5G/UAbFgnhBxStNQPbi4rICdvUo0yme+ypp7?=
 =?us-ascii?Q?1FPAS/nZXdethn9503RybDr1LV83N/y0mmGc2tGC/99ehcERrHoG1rBVaA6P?=
 =?us-ascii?Q?+oX4Zfhhs9gD2x2wVd7LH5hSXzAX3OL7cjgdC60vmDqR7BUKZYqt4M3ZLrLf?=
 =?us-ascii?Q?4UCjklAb3sugPo8RRBBLz/ifIHyyZ8qZcK9QF4ld/9TmWpA5dXeLzmdKVxqI?=
 =?us-ascii?Q?24zDYRhMG+TSzfEKd6MnZmcgidzhU6EsVOfM0w1fX8+ZqJSDdm+OdWasAfTI?=
 =?us-ascii?Q?KrhK11++C3IZUo55gS8kxy1/NjQRX5XB85ALry1o?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a8db370-fd28-49b8-88f4-08dbf289072f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4838.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 16:17:34.9604
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQyO7d91WG7DJl2l3dfmgSWitYsRDhLV6iYWZ9ezB6nUxomjpLWwlXRe5PRSSjTGXIAwxM8mCDN+a3zhCTQi9g==
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

Since difference SoCs require different sequence for exiting L2, let's add
a separate "exit_from_l2()" callback. This callback can be used to execute
SoC specific sequence.

Change ls_pcie_exit_from_l2() return value from void to int. Return error
if exit_from_l2() failure at exit resume flow.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---

Notes:
    Change from v4 to v5
    - none
    Change from v3 to v4
    - update commit message
      Add mani's review by tag
    Change from v2 to v3
    - fixed according to mani's feedback
      1. update commit message
      2. move dw_pcie_host_ops to next patch
      3. check return value from exit_from_l2()
    Change from v1 to v2
    - change subject 'a' to 'A'
    
    Change from v1 to v2
    - change subject 'a' to 'A'

 drivers/pci/controller/dwc/pci-layerscape.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 37956e09c65bd..aea89926bcc4f 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -39,6 +39,7 @@
 
 struct ls_pcie_drvdata {
 	const u32 pf_off;
+	int (*exit_from_l2)(struct dw_pcie_rp *pp);
 	bool pm_support;
 };
 
@@ -125,7 +126,7 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
 		dev_err(pcie->pci->dev, "PME_Turn_off timeout\n");
 }
 
-static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
+static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct ls_pcie *pcie = to_ls_pcie(pci);
@@ -150,6 +151,8 @@ static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
 				 10000);
 	if (ret)
 		dev_err(pcie->pci->dev, "L2 exit timeout\n");
+
+	return ret;
 }
 
 static int ls_pcie_host_init(struct dw_pcie_rp *pp)
@@ -180,6 +183,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
 static const struct ls_pcie_drvdata layerscape_drvdata = {
 	.pf_off = 0xc0000,
 	.pm_support = true,
+	.exit_from_l2 = ls_pcie_exit_from_l2,
 };
 
 static const struct of_device_id ls_pcie_of_match[] = {
@@ -247,11 +251,14 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 static int ls_pcie_resume_noirq(struct device *dev)
 {
 	struct ls_pcie *pcie = dev_get_drvdata(dev);
+	int ret;
 
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	ls_pcie_exit_from_l2(&pcie->pci->pp);
+	ret = pcie->drvdata->exit_from_l2(&pcie->pci->pp);
+	if (ret)
+		return ret;
 
 	return dw_pcie_resume_noirq(pcie->pci);
 }
-- 
2.34.1

