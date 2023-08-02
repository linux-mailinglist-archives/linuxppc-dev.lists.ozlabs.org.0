Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D0076C4D0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 07:24:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nJZvsFGA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG0lz6pstz3cQd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 15:24:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=nJZvsFGA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::620; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on0620.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::620])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG0j62Ny1z2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 15:22:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lr3iTa/okHCkIE2vMA+pYXTlOIZqB8pQmwmajiec01O0AJhbWIZ9ns4ac5EqqYR+gECoezxXHlGKD6q+1zy7/1+9FKWf9h68Z1YjzwyRgifNfS2ayY4fwIypzgjzGjFuUx619GgUwHs4sTqGZOH8jxO5PWQWLevshHXl67CnHf7iw6/Z8XhHqcb6MzBEJlKa9bS8Av7bco0G6+RZ02Z8kHN5SclT7OkjeQQNkYWd2YGPcg3ggDatLJoz7IbJJ48HoEpDOXihuHeXl4xwwppB1W16I7YOJlCHmzDJXjESYGeWzMPms4eV83V9FiFSbKu5o5LvHMi7WA77AiSM5cgE/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ob6zfkfSxdhoM5cBdnx5fCLkmaSmm24sPinlzAYwBQ0=;
 b=fPoK8H654WyNvxu9x0HJDpeG6iNZxJXzOkrMgmAoO3LkbGhgp5Z7ybrP+HjNp7E1JD2nxYuV5La+rH0U8NuCH4WE0giIjPQcc0hEVmeaJ0tRys54E4uzUfEQF0EiabXURYZHovxQAM8g0W2uC7V4+/qm+SAyIz2nXFeIdRlsZuYMfG/xQWg5NgWB6HEcEIgjRpe6zRt9wcNWENFgrEYmlKpaFxp7IsB/nqd3Q+mjdEIcvvlq4SxQWiJFHv2UdyC1ayln9TQ1fNjBLL9ytLwFShhgFHD24oOpEUo0BWy68n/6vLqscC3mZHLCOxPsJLMq3gjUIIH6sKzghslnub3N7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ob6zfkfSxdhoM5cBdnx5fCLkmaSmm24sPinlzAYwBQ0=;
 b=nJZvsFGABbpHMyoyTsRGmivQZsOhg4twQ9+EypITrba8G8nQ4CG1igob+cBXPySKXjiait1ogCNquEEBLmyMMh5YkMUhFGBoAHq02vpPI/sMViqtm6FNmScKVLs+/HSXlZsESefS8hHS8AWMAveYKtvIaBfh20FcgClDlpImqeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 05:21:57 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:21:57 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] ASoC: fsl_micfil: Add fsl_micfil_use_verid function
Date: Wed,  2 Aug 2023 13:21:16 +0800
Message-Id: <20230802052117.1293029-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802052117.1293029-1-chancel.liu@nxp.com>
References: <20230802052117.1293029-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 581c9bf6-2c37-4552-0c6b-08db931863fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yWi0BzRDVUwdM7533oQ0VvijOf4qFq7F6cD4tIClBNw96QmIQRn88fUnPJm42lcoga2HAQrGE17a+oEEzQhxSFmwi4kA5LPYFGUQFhOML2+KRHIea2Czl1XQL8OJWEzhDBcRReoDrOfeXVLXeq16bkXDZBNUKcMLRXmCxoMaf4nbiAuk5AemwVhYemx/50SyszZSpS+JwIVam0FCMeAcMYa/nJlbKvucxVm+HIlIy31bmDieslBu3NHhQxxGFyt7YvpAE1glbREkRDnMf3GNuF7uE/Umpl5BxfzLpB3EVB7FmgBmndudv53CoakJlvgjeiIdJvcEo/TrGp7bYZPt8S8ah4//WuD1oRre+GZTIk/5Xl0NPCqqNtRCsf2F9iJ5akCinKUI83QOs/nFW19gUkyb+1BF5R0w7mFPI5mGmxX9IjjZxkbSGQ8WF3R3CcJw2IpiEsvbygiFdYxPkJrQMurulgZMghcQdUGbPo+YHs3c12qkuI1gPPcXGGyw7/cQjAKwjtLsQ06ru/d99sUKr1sv3PjDqlE8ZMBycqkUQomHzrWnQRCd0288jmOsnixlHxe97bAyNjlbR7R9UBASEHrNorUhwAOvPcp6S5mqwkF7+DX5UNB/t3fA1P7Wetr8BYMpq7+MYbaJ18V+/6qBLQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(44832011)(66556008)(66476007)(4326008)(66946007)(2906002)(38100700002)(38350700002)(2616005)(921005)(186003)(6506007)(1076003)(26005)(7416002)(83380400001)(86362001)(36756003)(478600001)(6512007)(52116002)(6666004)(6486002)(41300700001)(8936002)(8676002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?pfemD8cVcvTz2KSz7VjgKuWWUgaassWnoP9dJakP5Bm2Cw+hAowelGC/kvg0?=
 =?us-ascii?Q?afoMBqe0kGl9nC7zgjKNY15UfcjsAq9Ll4BvlDH0IuT5OSfNPUexf9R07qfT?=
 =?us-ascii?Q?IieTUsZSLaio2UBCKIuhrSdKT7RYG+d//E4QcbofZ3bHv0RCHC5Rxczw0NHi?=
 =?us-ascii?Q?7R3kOVoSJompaa/UQi7jkqIHmoxnN+TG+MHnMFMS7Hr/SgzQ4DCYOSu6W+s5?=
 =?us-ascii?Q?4R0bOyd5+q20TU9oUPa1bWct79A2SevMjujq8e/3WwK2jUMQBiLL5iJqL0Mn?=
 =?us-ascii?Q?cMrWV2t/Z4aT/s9jAhyeerNo5v4LRcuLHiKIacTKthJ6tPVtnDK47Nbuph7j?=
 =?us-ascii?Q?+AVh4/jbP7FnBEyrqBpiZ5JQNAT6H1YpP/1tHiE2/tk3RKs7B1nf5bgriQaV?=
 =?us-ascii?Q?KPh1722CLYbwfXtqK0IHKxbPZiJ40PhpQc77ZevvRqgKbOrgg57ZJTayzUkO?=
 =?us-ascii?Q?wolDd1sat3jXHM6eQxjO9WxeJlIzuRPcdFTT68gZXyK8GVsAxWVmwigQuG/e?=
 =?us-ascii?Q?eIJ2LOcLrrJ41ZSCRtgp3YvZU3qTKXkMYhHXnbFJNJKwAtxbcVIACOaZyL1I?=
 =?us-ascii?Q?f8wqIJK8jSmNtRsrLDxihSBWqEjVHhsEmvc5TSmLVjPGAIZCzI48nDu+Q1Z+?=
 =?us-ascii?Q?mTrdLdDurfdlH+FGFvxnM+marAlS5oJEIG4NIiebXJCrFJWCAq+PQCMqXKZL?=
 =?us-ascii?Q?46OHvazOv63hMF9LKu+/+QSCXASwJ3Z/hx+MuqKJJE7UCYoOI9vy/FY7NtRs?=
 =?us-ascii?Q?QfDCptqaLYYR8KZIRFQqYfZLB+d/VWR/WgJsPWPLJNkLjWry7FBho0Km6Q75?=
 =?us-ascii?Q?VgyEs0fyqLtj9S/XNpO+Inc2eB7Lm/4t+Avaeqbd923U5GmaOY9vw6UQONyt?=
 =?us-ascii?Q?f+i6zW5dqaK2byslNcJVVut05X1yfA2CWncbANRf5sPkwZt7agTHAGgpgsqT?=
 =?us-ascii?Q?Ikwd8P3pqYISvK9U+BKNBEfIfryxPscYPCo9uFE9zYYi1Lu5hXNFHWoRHpDv?=
 =?us-ascii?Q?f3giyYuV2wkT4+tTiMxwkiz5g+12jceXGw3lOrpE71oQTGFxSHzjRknXYnKC?=
 =?us-ascii?Q?8sPuNRCJ0ZDE3B4Jf95SP/zrofUy7ABHbceeALFPD8XyZQ6+Kujk6ownWGOJ?=
 =?us-ascii?Q?yrIG/8CfZxvI0X3C6oaiaC8tXKmAFXp8HYVFJIZWCbn0viJ19yR/ZoKhaFRS?=
 =?us-ascii?Q?Cb9LLC13c26wQDupyqZLAOMxQv4sWoMAbWGjunMV5613hl6Hgj8U0dAjpMWy?=
 =?us-ascii?Q?dmEeoL1w4RmeXvbuwmcV8yzJyi0wK7aJXZglw7ROi73Uro+DAruzBZqdKi9F?=
 =?us-ascii?Q?+kMf9eFyaiNSiB8SsJQRr1nGh72rLX43cQRDmgrHrwNma+xxmghXjjBEzype?=
 =?us-ascii?Q?3z2pzCShITjNxqj1rL9LolI+mfNeHtVfRDpatOOybKIUI8HIwMSaGaQrHtXm?=
 =?us-ascii?Q?D79Qg4+Ng9yZqQMxw8vPOxZM0Q5gOUs1Y1knk5R5G2BG+Z/jT4oyZr+YVweq?=
 =?us-ascii?Q?3ol8cc0PF0xE8/2x1C9Bx4pBefEXiNIMChQRTZfiBKFxsMizLZNGtyOKJIL4?=
 =?us-ascii?Q?t9RlVhKHZoLZCls4v5kbmTpjBBMw3dC0XSqn0ib5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 581c9bf6-2c37-4552-0c6b-08db931863fc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:21:57.0860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PiJXKMqXD6hY1cDhpfA5Hrq9DYAQNIp5r3E8MxIADTwa4lAy/O66V8mtLaIiMTCltbaEypksiOLRrb3RajXvrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

fsl_micfil_use_verid() can help to parse the version info in VERID and
PARAM registers. Since the two registers are added only on i.MX93
platform, a member flag called use_verid is introduced to soc data
structure which indicates acquiring MICFIL version.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 76 +++++++++++++++++++++++++++++++++++++-
 sound/soc/fsl/fsl_micfil.h | 36 ++++++++++++++++++
 2 files changed, 110 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index b15febf19c02..c4ff8ea49390 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -56,6 +56,8 @@ struct fsl_micfil {
 	int vad_init_mode;
 	int vad_enabled;
 	int vad_detected;
+	struct fsl_micfil_verid verid;
+	struct fsl_micfil_param param;
 };
 
 struct fsl_micfil_soc_data {
@@ -64,6 +66,7 @@ struct fsl_micfil_soc_data {
 	unsigned int dataline;
 	bool imx;
 	bool use_edma;
+	bool use_verid;
 	u64  formats;
 };
 
@@ -90,6 +93,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
 	.dataline =  0xf,
 	.formats = SNDRV_PCM_FMTBIT_S32_LE,
 	.use_edma = true,
+	.use_verid = true,
 };
 
 static const struct of_device_id fsl_micfil_dt_ids[] = {
@@ -356,6 +360,49 @@ static const struct snd_kcontrol_new fsl_micfil_snd_controls[] = {
 	SOC_SINGLE_BOOL_EXT("VAD Detected", 0, hwvad_detected, NULL),
 };
 
+static int fsl_micfil_use_verid(struct device *dev)
+{
+	struct fsl_micfil *micfil = dev_get_drvdata(dev);
+	unsigned int val;
+	int ret;
+
+	if (!micfil->soc->use_verid)
+		return 0;
+
+	ret = regmap_read(micfil->regmap, REG_MICFIL_VERID, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "VERID: 0x%016X\n", val);
+
+	micfil->verid.version = val &
+		(MICFIL_VERID_MAJOR_MASK | MICFIL_VERID_MINOR_MASK);
+	micfil->verid.version >>= MICFIL_VERID_MINOR_SHIFT;
+	micfil->verid.feature = val & MICFIL_VERID_FEATURE_MASK;
+
+	ret = regmap_read(micfil->regmap, REG_MICFIL_PARAM, &val);
+	if (ret < 0)
+		return ret;
+
+	dev_dbg(dev, "PARAM: 0x%016X\n", val);
+
+	micfil->param.hwvad_num = (val & MICFIL_PARAM_NUM_HWVAD_MASK) >>
+		MICFIL_PARAM_NUM_HWVAD_SHIFT;
+	micfil->param.hwvad_zcd = val & MICFIL_PARAM_HWVAD_ZCD;
+	micfil->param.hwvad_energy_mode = val & MICFIL_PARAM_HWVAD_ENERGY_MODE;
+	micfil->param.hwvad = val & MICFIL_PARAM_HWVAD;
+	micfil->param.dc_out_bypass = val & MICFIL_PARAM_DC_OUT_BYPASS;
+	micfil->param.dc_in_bypass = val & MICFIL_PARAM_DC_IN_BYPASS;
+	micfil->param.low_power = val & MICFIL_PARAM_LOW_POWER;
+	micfil->param.fil_out_width = val & MICFIL_PARAM_FIL_OUT_WIDTH;
+	micfil->param.fifo_ptrwid = (val & MICFIL_PARAM_FIFO_PTRWID_MASK) >>
+		MICFIL_PARAM_FIFO_PTRWID_SHIFT;
+	micfil->param.npair = (val & MICFIL_PARAM_NPAIR_MASK) >>
+		MICFIL_PARAM_NPAIR_SHIFT;
+
+	return 0;
+}
+
 /* The SRES is a self-negated bit which provides the CPU with the
  * capability to initialize the PDM Interface module through the
  * slave-bus interface. This bit always reads as zero, and this
@@ -1037,6 +1084,9 @@ static irqreturn_t hwvad_err_isr(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
+static int fsl_micfil_runtime_suspend(struct device *dev);
+static int fsl_micfil_runtime_resume(struct device *dev);
+
 static int fsl_micfil_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1156,6 +1206,25 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, micfil);
 
 	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_micfil_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
+
+	/* Get micfil version */
+	ret = fsl_micfil_use_verid(&pdev->dev);
+	if (ret < 0)
+		dev_warn(&pdev->dev, "Error reading MICFIL version: %d\n", ret);
+
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0 && ret != -ENOSYS)
+		goto err_pm_get_sync;
+
 	regcache_cache_only(micfil->regmap, true);
 
 	/*
@@ -1180,6 +1249,9 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 
 	return ret;
 
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_micfil_runtime_suspend(&pdev->dev);
 err_pm_disable:
 	pm_runtime_disable(&pdev->dev);
 
@@ -1191,7 +1263,7 @@ static void fsl_micfil_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
+static int fsl_micfil_runtime_suspend(struct device *dev)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 
@@ -1203,7 +1275,7 @@ static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)
+static int fsl_micfil_runtime_resume(struct device *dev)
 {
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int ret;
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index b3c392ef5daf..231a52aff024 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -174,4 +174,40 @@
 #define MICFIL_HWVAD_ENVELOPE_MODE	0
 #define MICFIL_HWVAD_ENERGY_MODE	1
 
+/**
+ * struct fsl_micfil_verid - version id data
+ * @version: version number
+ * @feature: feature specification number
+ */
+struct fsl_micfil_verid {
+	u32 version;
+	u32 feature;
+};
+
+/**
+ * struct fsl_micfil_param - parameter data
+ * @hwvad_num: the number of HWVADs
+ * @hwvad_zcd: HWVAD zero-cross detector is active
+ * @hwvad_energy_mode: HWVAD energy mode is active
+ * @hwvad: HWVAD is active
+ * @dc_out_bypass: points out if the output DC remover is disabled
+ * @dc_in_bypass: points out if the input DC remover is disabled
+ * @low_power: low power decimation filter
+ * @fil_out_width: filter output width
+ * @fifo_ptrwid: FIFO pointer width
+ * @npair: number of microphone pairs
+ */
+struct fsl_micfil_param {
+	u32 hwvad_num;
+	bool hwvad_zcd;
+	bool hwvad_energy_mode;
+	bool hwvad;
+	bool dc_out_bypass;
+	bool dc_in_bypass;
+	bool low_power;
+	bool fil_out_width;
+	u32 fifo_ptrwid;
+	u32 npair;
+};
+
 #endif /* _FSL_MICFIL_H */
-- 
2.25.1

