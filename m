Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C052176C4CF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 07:23:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rEFk9Fw2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RG0kt4Dysz3bYc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 15:23:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rEFk9Fw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0c::62f; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on062f.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RG0j040fMz2xq1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 15:22:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Etf9PThzc0sxG+MLhNYgDKVM9UqzS6EI7zq2+ONpzXOoOzBCm/O7yh9gkOKSNJWX9t9+AeLv8CM4mNIPIsv5s57DGs10JxOiKCk+phZSmyLLg9S67TZzw/eV0Nmr36dl3OzwseSH1mo7L5j5N7FjXCy9YhC1EaOW1lqJzMuR4Wayruz6FWb+X6BMJCQcC6frU8SQfgjEMsiX08CmJkGqsfwmsSrcRYz9+mQPXG05/z+AZc3pCxk6nLkcZS/hj1ENA48EbC6sUOdbyi0c2RFqVw4x9tqNJPjvS8mDsEVlhGglqNTQMUrlH+q4bf/h+K1XFsMV3LnFUvxjXNMYNaKR6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rusdyh1WKkrdaep8m2fBU7OV+3d1BgCX3Rmavs7o8A=;
 b=fa3e/Lx4UfSTxLajv8+KDxmjswuXi6SDtKCOKPJ2HFH6el0MVTcvIRIK5EUIW0gxhtOU/F6CIR5sLKngauX8pqFjlc7U9b94UgbYo9Ogim9+B0uNFz4/SzQun8k+zvaeLXtMfZTCkjdGvYlNEFbm0F+y8LnMz5XVxX09dXu+SmuVaL5ndBu1chGGpB4MEzuyWIZeaR6dfcnhYi672OUQvCL5Lg1urg7BwX9dr+0y+3JKudz7IC7qaA2gKSjZDJx2yeyshn1N7WcJfcNfWygtXvxoS1JRH4jxW5s0bmbHb594TsXtPYjK9d0zV6SoGoM1vF+gyP56DwhQY7VNkPJBMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rusdyh1WKkrdaep8m2fBU7OV+3d1BgCX3Rmavs7o8A=;
 b=rEFk9Fw2nZFlGs00nAykwl3Y/EN3CYJnlqdTkI0q4xhaqTpbtBN3POaqKl1lKBvuwT9PTZtKFMOb/yAKhBLbemcKgRqPi/A84gFndx+RrLDWO+WDtyKwZRNnew/UK+oZcRON4a+ANh99kPdLQDdhVUSt67cajiOl6CDce245XPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DUZPR04MB9946.eurprd04.prod.outlook.com (2603:10a6:10:4db::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.44; Wed, 2 Aug
 2023 05:21:53 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:21:53 +0000
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
Subject: [PATCH v2 1/3] ASoC: fsl_micfil: Add new registers and new bit definition
Date: Wed,  2 Aug 2023 13:21:15 +0800
Message-Id: <20230802052117.1293029-2-chancel.liu@nxp.com>
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DUZPR04MB9946:EE_
X-MS-Office365-Filtering-Correlation-Id: 23bdfe56-3d14-4555-43fb-08db931861af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	0Ip3J8AAWmPVLZq650XYSNvVATvFTeL2X/gJSlQ3j9n4/qPPLX7FQ4FRzZeiPoPSaZBylfjdhhyxDaJbWw/dN64UuvZ60XkrPGstnDFCNkuLKSQ1H1udq7DYtQIYI/PYB7erl3xc1djYfMczhXRQkQY3GU2FHP9KOH8NDNzYDuCEoft7yUjQvejBMcfDfx9d4DPTPYjO/WKpuqqGByerzeoUQEckR3m8b3bqhr0A6td0vFJKVwc0Bc3JXD9+55d0Qp3PykC0c2bVy3i3I2Wqo7fHQAO9kbbrp9fkx6tG2Fb1hjtcF8dLpdmld+9faWAA8RhQe/3m0fGUra2QUbhhad6sGAB2K5GUPyDGvn2i/SsHTB+IURm2TcL8yOlrsST2iKCdJpvA6TXqxWIOXQ0UFhIsBuy4omtShNrGWUi9DX74jXpN6kokNMyUwyevCSkh94yHzkGLBp7fKbe4JuMWLBfP8HRfzOlbzN/C3OYOtn6TSVvPQc1L7XiimN0NnGUFR9H6vhDgo5gH3rqQ1fIg6/cKw5rAu8tRUHkwATZ4q8VJTOnfCI48omQDGp33hsMjav96JB8Trr6lHh7FtMDSotkHd9m5m/JMptdKWmH5ImPi8yqOB3APpffa32O+/J1XFmqdlUpq+IEk6RCcCA1jyw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(6512007)(7416002)(6666004)(5660300002)(186003)(66946007)(4326008)(66476007)(66556008)(478600001)(52116002)(6486002)(44832011)(316002)(41300700001)(8936002)(8676002)(26005)(38350700002)(38100700002)(86362001)(921005)(6506007)(36756003)(2906002)(83380400001)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?X4BD+P6bH/YZmgQWJFwLVA+BG3rp2lILXsq19iBXE+D6ykv4wOQt/YlchL+Y?=
 =?us-ascii?Q?p3aThxF102MPqcoJpKE/uhWSZNGlNhoGkj6Xybz5ivRAqLH6SzBYtdr9WCIl?=
 =?us-ascii?Q?Qn2zlBbHKy9VA1LjW6/8drfBwTuNP9Xs4hObpClZ+dCrgVcBevskWK+C2EBC?=
 =?us-ascii?Q?InEDm9+kI1zeLv0uULh7nKaSN65V80FVfZlF0FmrzVfCKAantJWxnLmXTDgO?=
 =?us-ascii?Q?b7YApAPUwRZ2jfF6h7XG4I1cbRkb4LMUlWkoGBxFZ9nXYhQkCUNVra1tGt4e?=
 =?us-ascii?Q?2mE7kBvOhXUM1T+UPGG2BgZLu+V6EcwhCgDmJpr9Bk6uVq+TFX7fQhgclWE6?=
 =?us-ascii?Q?Sa93fL5F4nUmr/7ygPW0QleAQclnbwTq8dcTgBsB1LWu53q907y1xe913rgA?=
 =?us-ascii?Q?OhvAjrbO924R3nHl/THnVuSXE3Cxf3PCG6aA6e/DGt4TwmAA+xtcvqvUldS8?=
 =?us-ascii?Q?HvkJu3xOplrqZ8izqlpczmM/We4pdlcWxujs5zh05kudl98DgazmptWvr50S?=
 =?us-ascii?Q?Mo+VomlOchJu2JIus5zsSTQOJrMSwmHQ6o6F/9asmcIG03MW1CujqZS4zDTA?=
 =?us-ascii?Q?q5kuGWlbq9Wqev0NIrJOu3Clro1qFP47w51tkSwGl9A0vyznbFnGwnFSfIuL?=
 =?us-ascii?Q?MIhdl2f6Dav1ZpQHepagbbhNSnw+vyXkdAqlGUzvoF28tGDMo4QtTwS3WN+e?=
 =?us-ascii?Q?YEwxIFJXWjkK9XpTSVIDXpqveC/qzJAa5YvqQSLy4KzKijbN8IemO8KDYKOy?=
 =?us-ascii?Q?MUklMPwIaGlqOEpO+bn6yPRWt0ShzEOiCMVLniWsBpt0M0rMFcThqz6rK60D?=
 =?us-ascii?Q?jKhyPupQHU66oCCgahD9KUENJ3bhoIXT94Ax7tYPc8iKy6Ho8ZRuMpzhxncr?=
 =?us-ascii?Q?ySqNXT4CtDraZtmEUOgcZGQ8fB76SaNcj4RnPI7GPri4I6e/qzlbHtNSEInu?=
 =?us-ascii?Q?ObA2ohEQ3YUbl1kME5DkzIdZTD8fom9vCbcPfd7HT5sXQ83up/oHQWYHWI7h?=
 =?us-ascii?Q?9URutyT9jEwE37JFFfFDjxlAOJCMxiViJB6eFKqKrwcMvDeQ4gc/1lToWzE/?=
 =?us-ascii?Q?G/GIpLfbBRDPcqGWYw4kLzF4sdFuV6347MLW5Dfbbvl+x34k+3FF6eaZ4uMQ?=
 =?us-ascii?Q?OHv0TtSVI9ecMS1y9oWW8O8JcCACTVgbVln0qTI228y7cSH73Jif4aGFoy9o?=
 =?us-ascii?Q?9lbASpwZeoS3dqO7HWHWx53fA0dkCgGSM+yFKJYEhifhb51e3qlqGVMCiWLA?=
 =?us-ascii?Q?1E43DZ2RG5sCAQ47UeaK2Ks99balTC9yN0xbVv7hyMqv9BR3RCUHGNgJL6mQ?=
 =?us-ascii?Q?wBSjfU8FFlewOGOgT7LiliDYzLcn5oPgq6iJqT8wZHth7iTCXiw+N4RFHzx6?=
 =?us-ascii?Q?6XmCQ2/0pbo/4IvUBnaDVgFwMjBahoyD660UtFGlDWj++4I7lg6ifNgTJ28Y?=
 =?us-ascii?Q?diZqgSB5P58WeNLterhiF40FVcymaFEF/6DY+vjpQeOEp64a3EEeSI7Tg+Ef?=
 =?us-ascii?Q?nffxx6QzULutdDeZdYn95vo1g96W8nLWFQe6ldNBJBTJ8ZvY3AShLnB4pWSb?=
 =?us-ascii?Q?irzW9Jaj2djK5EwfzfCKB9wVZsSDwrgx0kg0/Gkk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23bdfe56-3d14-4555-43fb-08db931861af
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:21:53.2101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MCZi/NPuwO4IT08DR8U908E+NeTcBbHDI/HYqVc0DlLRNSbTdVF8Z/hS28w1CqMvNWtjygMpTglRxeJb68QgXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9946
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

MICFIL IP is upgraded on i.MX93 platform. These new registers and new
bit definition are added to complete the register list.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c |  6 ++++++
 sound/soc/fsl/fsl_micfil.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 3f08082a55be..b15febf19c02 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -825,6 +825,9 @@ static bool fsl_micfil_readable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:
+	case REG_MICFIL_FSYNC_CTRL:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:
@@ -849,6 +852,7 @@ static bool fsl_micfil_writeable_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DC_CTRL:
 	case REG_MICFIL_OUT_CTRL:
 	case REG_MICFIL_OUT_STAT:	/* Write 1 to Clear */
+	case REG_MICFIL_FSYNC_CTRL:
 	case REG_MICFIL_VAD0_CTRL1:
 	case REG_MICFIL_VAD0_CTRL2:
 	case REG_MICFIL_VAD0_STAT:	/* Write 1 to Clear */
@@ -873,6 +877,8 @@ static bool fsl_micfil_volatile_reg(struct device *dev, unsigned int reg)
 	case REG_MICFIL_DATACH5:
 	case REG_MICFIL_DATACH6:
 	case REG_MICFIL_DATACH7:
+	case REG_MICFIL_VERID:
+	case REG_MICFIL_PARAM:
 	case REG_MICFIL_VAD0_STAT:
 	case REG_MICFIL_VAD0_NDATA:
 		return true;
diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
index 9237a1c4cb8f..b3c392ef5daf 100644
--- a/sound/soc/fsl/fsl_micfil.h
+++ b/sound/soc/fsl/fsl_micfil.h
@@ -24,6 +24,9 @@
 #define REG_MICFIL_DC_CTRL		0x64
 #define REG_MICFIL_OUT_CTRL		0x74
 #define REG_MICFIL_OUT_STAT		0x7C
+#define REG_MICFIL_FSYNC_CTRL		0x80
+#define REG_MICFIL_VERID		0x84
+#define REG_MICFIL_PARAM		0x88
 #define REG_MICFIL_VAD0_CTRL1		0x90
 #define REG_MICFIL_VAD0_CTRL2		0x94
 #define REG_MICFIL_VAD0_STAT		0x98
@@ -39,6 +42,8 @@
 #define MICFIL_CTRL1_DBG		BIT(28)
 #define MICFIL_CTRL1_SRES		BIT(27)
 #define MICFIL_CTRL1_DBGE		BIT(26)
+#define MICFIL_CTRL1_DECFILS		BIT(20)
+#define MICFIL_CTRL1_FSYNCEN		BIT(16)
 
 #define MICFIL_CTRL1_DISEL_DISABLE	0
 #define MICFIL_CTRL1_DISEL_DMA		1
@@ -82,6 +87,29 @@
 #define MICFIL_DC_CUTOFF_152Hz         2
 #define MICFIL_DC_BYPASS               3
 
+/* MICFIL VERID Register -- REG_MICFIL_VERID */
+#define MICFIL_VERID_MAJOR_SHIFT        24
+#define MICFIL_VERID_MAJOR_MASK         GENMASK(31, 24)
+#define MICFIL_VERID_MINOR_SHIFT        16
+#define MICFIL_VERID_MINOR_MASK         GENMASK(23, 16)
+#define MICFIL_VERID_FEATURE_SHIFT      0
+#define MICFIL_VERID_FEATURE_MASK       GENMASK(15, 0)
+
+/* MICFIL PARAM Register -- REG_MICFIL_PARAM */
+#define MICFIL_PARAM_NUM_HWVAD_SHIFT    24
+#define MICFIL_PARAM_NUM_HWVAD_MASK     GENMASK(27, 24)
+#define MICFIL_PARAM_HWVAD_ZCD          BIT(19)
+#define MICFIL_PARAM_HWVAD_ENERGY_MODE  BIT(17)
+#define MICFIL_PARAM_HWVAD              BIT(16)
+#define MICFIL_PARAM_DC_OUT_BYPASS      BIT(11)
+#define MICFIL_PARAM_DC_IN_BYPASS       BIT(10)
+#define MICFIL_PARAM_LOW_POWER          BIT(9)
+#define MICFIL_PARAM_FIL_OUT_WIDTH      BIT(8)
+#define MICFIL_PARAM_FIFO_PTRWID_SHIFT  4
+#define MICFIL_PARAM_FIFO_PTRWID_MASK   GENMASK(7, 4)
+#define MICFIL_PARAM_NPAIR_SHIFT        0
+#define MICFIL_PARAM_NPAIR_MASK         GENMASK(3, 0)
+
 /* MICFIL HWVAD0 Control 1 Register -- REG_MICFIL_VAD0_CTRL1*/
 #define MICFIL_VAD0_CTRL1_CHSEL		GENMASK(26, 24)
 #define MICFIL_VAD0_CTRL1_CICOSR	GENMASK(19, 16)
-- 
2.25.1

