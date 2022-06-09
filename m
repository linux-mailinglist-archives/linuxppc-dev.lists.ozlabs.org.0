Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73210546553
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:17:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJMl21Bzz3dQx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:17:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=lbGTVU8Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feae::803; helo=apc01-psa-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=lbGTVU8Q;
	dkim-atps=neutral
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn20803.outbound.protection.outlook.com [IPv6:2a01:111:f400:feae::803])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJgNM593tz3bls
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 20:30:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YVJJ15AKFZ6ZjCykggFBInC9t++R20a7QmCBVca5kHy7BkY2kPTxMqk+bNpjY6BgPMSYmOPfnY01Y5JmR0DQ9VctkzeGcaXcJNx50VAS/PE6zxqUYITG/56X7hflA9UaMIDfCdkLvuuRNSAnKXkdZa72xOsUtdozils1RJy4FVyNGYaHJHOCJLtzOpFpQmVgYmYRvCeQDk6PcW/XiPp00XzXTDPy1q8B4Raej9E1er3Iwg9E8Etuha9G5j9PHUqqR4i1NGoDbhF0fahtyPO3SFIj8/e0DOi+OMQVC5sc26/n2bH+oDuQF8YpLyD5LFXrTj76cHhwZizMYRSoLEwLrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPG5hfE3VW6eySm+2iA4mBmk/VfZKMo/B6dOU8PbDvw=;
 b=Hi4UyJwRA0UD9BdGSNdB7DUJpk+ZcjQU0hgX+iLHnD1nSec44KRO+fsDaQBScfPRLTM4xXIO98J8fJh5MqoW9YVJ8JXTeNRPpA6/sxzRPSmkOs+Xg8ists0G+ww3is0xrI0jln0DGGAlFsc+uMXaQwKJC5lULJ0+RsDiFtz3APeRNG3npI3LMhzEC3m7MFxpip1bnBSJxzimwZPYEmUDibBPmzkzO9bk8Q5q6nRWGkxqh4o9Hpbz2nzey1WMkXaldawujCDfZXhaHaM0OK+609ciG2RDsMMsa9xBGYT4WW0RaAbcFppb9VFUrNr/eaYESYzom+18XUYUzYL4wC5Ubw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPG5hfE3VW6eySm+2iA4mBmk/VfZKMo/B6dOU8PbDvw=;
 b=lbGTVU8Qvdu/k4C7nLp0pAM8sJLdKEbGksWYpLe0q2A4Zaeh/Wi0isrD1/uszMrKSm0yZAOVRLUng5EiOXpWR9q6ikphlU3f2TEWit93fE1NDNaOpt/eGZINPHn+AT4EcKoEWGbp1jEhCJ5EvDZsO716rxf5cJzrHETfqbZlUfYZABCal3gTgEPdeJ8cmG2WJrJI25W6ixDSSSKq3xP06i630mZOsvjFI+yRkBML2p6onYP+EciH/J1wDHSeeRhz5184NyB5pCt+MNqIa5rI+sSGIAipw0aiJMnBNqd6jiCZvfStRXErlPvdclC0X9KS689KHT3m3tbMgur+UTrpcg==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by TY2PR0101MB2607.apcprd01.prod.exchangelabs.com
 (2603:1096:404:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Thu, 9 Jun
 2022 10:30:31 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 10:30:31 +0000
From: Wang Wenhu <wenhu.wang@hotmail.com>
To: gregkh@linuxfoundation.org,
	christophe.leroy@csgroup.eu
Subject: [PATCH 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver implementation
Date: Thu,  9 Jun 2022 03:28:55 -0700
Message-ID:  <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609102855.272270-1-wenhu.wang@hotmail.com>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [zp3Nn47AaqZVJ5hRiJk+/b5hEd2TthAd]
X-ClientProxiedBy: OS3PR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:604:db::12) To SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15)
X-Microsoft-Original-Message-ID:  <20220609102855.272270-3-wenhu.wang@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 253eba4c-b30d-42a0-31c7-08da4a031413
X-MS-Exchange-SLBlob-MailProps: 	cm8w5WKCntHegjoC0CGkA7Sho6OkbUdhRtDBKZ0Zk/V/NlW2wVbEubjDSsNuRP5nlu5vc0p12qzkz+redO3WLxmGNgKJUrVtKJYjT1p9Kj+cxndHL/x2f650QmazhKAaWp3zuYTB1cdO1rNwKaN1I3L/ja4Tp5C08qWN0aG1/x9gGBvfWePM266TxUjguI5b74BvP7s2He+SJlGYsbI7WY2c9hr+vw1fAe5Q+1VYazxSu4MGKKIXixD/5DcnUEFRD0wNo8Zsn1fO/4ZblkcN9rWlXJZ9NUBGeSw8RtIxAAdtHzfVr7ol/Lx08OH+t+P7wVug/+eSBxxtZdqCVvcGsjjeJReE+GS8k8jLnl5c2kqj6Shl3wnhqdxjzqifEn1wRRxoMhTnTANesCvXvZQA8qEqgGpXDu/Fc24CtHqAtZafCIVNiXgQPK4ZOLGAcBqSH3ESrfH5Mug/7ndF5sDtUcPN0UveGTGraJQBoE80qBGaknihM9CcMhb1VJp3Xw+ltBOJupeOSWIe/bzbRgBeEnhcF8YrX8H0jeK0h+NLVxS8axRVcuOQGBDZElSjJgU6RzPMiyMH3yl70w6+JNH7+KELsWZM5m3IGV0GQE9dSaCs8pWuoFbR8MlPr6lRkZKPPWE2Uk+LgCivKhiYNZtykMXik1PKV7gUseFBhPV8PdMFm/gEO9JVYvMYVt9I69y6tEgF2EP6X/fsLwG6kqgxnfXYrYPVt00wuEilDuBS3YtZJwZYqYGMQIc0s9NHr5VICaTG7pqbINtt6Fdq1PA31V6/6m5QZsbDZeGGLA3ibSmEN3ryASWyuA==
X-MS-TrafficTypeDiagnostic: TY2PR0101MB2607:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	eemdLPyxxjX7oic/lz3+Fz30hW6/IIeZ+VvSMaKkv4syakDnZxlyjV6b2c2uEqYM8yJ672uIyXCuPq+PKop2dzE6k8yB/E/Z42pBtfNeyYo351aXOAbBbKksLpfxVI18jw1LW+9wFxJJrZCHeu1cRk4ytNdcP5gYg+GBCACZPJr5VOo2hznfLeF3Q96OyAH27PgeB5pQvjAOQz+bSaQlZzRbrrzbxpdXnGcARq2zLMZnKxJKSkHdS52uHh46tTfGhrtJkwyhKOQgXmDiWNQKYdIz9JtFc3YaJ+ubiNi4ixHrmB9ZtcP2XdicMWOWw4wHOvsVhjWaT9vV35lJP2AcOah3r+tq+IBSJln/Tos3ILYLSb8N4gGnaxYg6aHylaY4iB9mOrGFe2iSinhqrDuHeQ9nfpF1j9niDGl1TyxJ3ikNR4SFw6q+sx8pY0IKuBkO5p7FntyOh9bLU0aUT5EpHePRDB1169XgWH8Ze421vOdRrUznY4dhGZk55oiZP3FOxoMPdE4f61QwMdsoEU2SegWsH6S+7Ro9ppXqfzs+pQF46uMGD4VNyD4cJ+uzxK9A8aJ0vpTZAMhRbmik3xXdde1DNFfCfZ8lI8AfRSFm6LX37udcNTA3UKQt2aJ9L7Tl
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?JX5tqs/zhdlhGcE/g6BHPt3PeppUx3zjyxY5uQEs3rnR8e6aczJOLO1OItTT?=
 =?us-ascii?Q?lYUYPKjiwC4NhPuIIhB2EIbixffjABFHtwQnsDcbQneBW+vmIEDuaEiPDdEv?=
 =?us-ascii?Q?/wlH2dZPg94ePk1fTVkoh+1cONx6a8Zzb0NGxP/5GcIBYyOz6rG8Ahh/mBa5?=
 =?us-ascii?Q?pTj1nPKZ3QkBfK7ZKLjvUOD1EA7um2dlQOQP32GNw3hGMOdpmFaPQ+CVaV1E?=
 =?us-ascii?Q?VejgqffR8IVR1igygJj/Ro/UIP30cwT6U/vh0TSYQ7nu2R5dwIORSXBewHI3?=
 =?us-ascii?Q?jaiwk50dLHfSXOaZ2XoJ1Mn+K7dEJss5UQuVWtdy62iozSpf3m1HVmm2QJs9?=
 =?us-ascii?Q?Dc+joe8ZEK7TRRC/8B1wF4OIFzBEYn0iiborca+w3CP6f0MhL+qi092CXlhS?=
 =?us-ascii?Q?beDMNqC7mXETe9d4Ys/Fqh2mo4ZtXd2HSfqVWnfDIIfp2aUd+vn1vid/zHLv?=
 =?us-ascii?Q?Ak22HOFZ0aDxfYqB1pYj7T1pA5kRYKc6CfGQG+PnlY+b6UBXQzawW6cpjY1n?=
 =?us-ascii?Q?5qzz3Vm8wst92yMvvwfFEwU6wTNvMTYPOW9A7At9qLtz7+ublWOnuSeBrfZ0?=
 =?us-ascii?Q?6jmFFYMwPgWVlYDbEE0pzsOx+ZqKan24LpkLslLZLaqVbE2NtP853I66fTim?=
 =?us-ascii?Q?p8WueVFagA8+c+QfvJxEftmgk4+LvPV4hTIOu0k7i0YBYmKoAVjvi5+PGOvS?=
 =?us-ascii?Q?FFz7AXVtfP6grrzIK7P00dFTBgzZHmFneZogb8M8Vl3VGenTpalYrdUqb1Oh?=
 =?us-ascii?Q?GHRtJycWSbgq3VBB8mRJi5GnWRIFnFTll8pyfz1pF9J3o6WfUbNh61tiAGli?=
 =?us-ascii?Q?rO4ddpA8WuacWzyRDtAboPyBxnA5warn7KNus7k2XWItms9+uU1qrfkMc81I?=
 =?us-ascii?Q?zh4gc+zpxvtWgra9pAYDA7Npu03J1lYm3h8pE5WsRI7k1aj8Sb8rbSkSs48T?=
 =?us-ascii?Q?nffaZangomCMfHMeb9aK89Au6bSn3oIDwS+uSVi8TtBeMFqVT7WbOY2cDG6y?=
 =?us-ascii?Q?latOhBSMgvNHFp8m3mNrJ18Bs3NCwlnrXzhozjWaZGRtjo6Th30u4W1fkIjG?=
 =?us-ascii?Q?LUcYezvPCfk72gCVDFDFuyxtKIMT4B0iQPEGqgV884v92xV7SYCqdwRxbHy8?=
 =?us-ascii?Q?gGUS5sNGHQ6w28ZQXDEQT6KMRPz4FcvvteKdondMA6/Kwwaxb5ARGmhuq4dF?=
 =?us-ascii?Q?IZm4RNCsEOHP2HGAlJl+61gZWMgXpaIcO04gr1KHpUgm6n2rR5DMD+N75SxW?=
 =?us-ascii?Q?NA7V+hdsweYx8lF9PkSVqEaSQSmHeJu+ETEp8P0q5u2DlRp7kTr6/UJx0foj?=
 =?us-ascii?Q?BR4+l+MF3QZnOVeGB95+GvNQiamrSz+4wPK/3rlnJRet7ynPExDkXCSwbsfU?=
 =?us-ascii?Q?au+2gN8WubLxWBrud1TvCAbCjmsc0XFdp7j9TY3SMD0lMI9R4H1a6AkvgawU?=
 =?us-ascii?Q?XvU3kHVICUc=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 253eba4c-b30d-42a0-31c7-08da4a031413
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 10:30:31.3818
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR0101MB2607
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Wang Wenhu <wenhu.wang@hotmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The l2-cache could be optionally configured as SRAM partly or fully.
Users can make use of it as a block of independent memory that offers
special usage, such as for debuging or other cratical status info
storage which keeps consistently even when the whole system crashed.

The hardware related configuration process utilized the work of the
earlier implementation, which has been removed now.
See: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=dc21ed2aef4150fc2fcf58227a4ff24502015c03

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
---
 drivers/uio/Kconfig                   |  10 +
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c | 286 ++++++++++++++++++++++++++
 3 files changed, 297 insertions(+)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 2e16c5338e5b..9199ced03880 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -105,6 +105,16 @@ config UIO_NETX
 	  To compile this driver as a module, choose M here; the module
 	  will be called uio_netx.
 
+config UIO_FSL_85XX_CACHE_SRAM
+	tristate "Freescale 85xx Cache-Sram driver"
+	depends on FSL_SOC_BOOKE && PPC32
+	help
+	  Generic driver for accessing the Cache-Sram form user level. This
+	  is extremely helpful for some user-space applications that require
+	  high performance memory accesses.
+
+	  If you don't know what to do here, say N.
+
 config UIO_FSL_ELBC_GPCM
 	tristate "eLBC/GPCM driver"
 	depends on FSL_LBC
diff --git a/drivers/uio/Makefile b/drivers/uio/Makefile
index f2f416a14228..1ba07d92a1b1 100644
--- a/drivers/uio/Makefile
+++ b/drivers/uio/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_UIO_MF624)         += uio_mf624.o
 obj-$(CONFIG_UIO_FSL_ELBC_GPCM)	+= uio_fsl_elbc_gpcm.o
 obj-$(CONFIG_UIO_HV_GENERIC)	+= uio_hv_generic.o
 obj-$(CONFIG_UIO_DFL)	+= uio_dfl.o
+obj-$(CONFIG_UIO_FSL_85XX_CACHE_SRAM)	+= uio_fsl_85xx_cache_sram.o
diff --git a/drivers/uio/uio_fsl_85xx_cache_sram.c b/drivers/uio/uio_fsl_85xx_cache_sram.c
new file mode 100644
index 000000000000..d363f9d2b179
--- /dev/null
+++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2022 Wang Wenhu <wenhu.wang@hotmail.com>
+ * All rights reserved.
+ */
+
+#include <linux/platform_device.h>
+#include <linux/uio_driver.h>
+#include <linux/stringify.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/of_address.h>
+#include <linux/io.h>
+
+#define DRIVER_NAME		"uio_mpc85xx_cache_sram"
+#define UIO_INFO_VER	"0.0.1"
+#define UIO_NAME		"uio_cache_sram"
+
+#define L2CR_L2FI				0x40000000	/* L2 flash invalidate */
+#define L2CR_L2IO				0x00200000	/* L2 instruction only */
+#define L2CR_SRAM_ZERO			0x00000000	/* L2SRAM zero size */
+#define L2CR_SRAM_FULL			0x00010000	/* L2SRAM full size */
+#define L2CR_SRAM_HALF			0x00020000	/* L2SRAM half size */
+#define L2CR_SRAM_TWO_HALFS		0x00030000	/* L2SRAM two half sizes */
+#define L2CR_SRAM_QUART			0x00040000	/* L2SRAM one quarter size */
+#define L2CR_SRAM_TWO_QUARTS	0x00050000	/* L2SRAM two quarter size */
+#define L2CR_SRAM_EIGHTH		0x00060000	/* L2SRAM one eighth size */
+#define L2CR_SRAM_TWO_EIGHTH	0x00070000	/* L2SRAM two eighth size */
+
+#define L2SRAM_OPTIMAL_SZ_SHIFT	0x00000003	/* Optimum size for L2SRAM */
+
+#define L2SRAM_BAR_MSK_LO18		0xFFFFC000	/* Lower 18 bits */
+#define L2SRAM_BARE_MSK_HI4		0x0000000F	/* Upper 4 bits */
+
+enum cache_sram_lock_ways {
+	LOCK_WAYS_ZERO,
+	LOCK_WAYS_EIGHTH,
+	LOCK_WAYS_TWO_EIGHTH,
+	LOCK_WAYS_HALF = 4,
+	LOCK_WAYS_FULL = 8,
+};
+
+struct mpc85xx_l2ctlr {
+	u32	ctl;		/* 0x000 - L2 control */
+	u8	res1[0xC];
+	u32	ewar0;		/* 0x010 - External write address 0 */
+	u32	ewarea0;	/* 0x014 - External write address extended 0 */
+	u32	ewcr0;		/* 0x018 - External write ctrl */
+	u8	res2[4];
+	u32	ewar1;		/* 0x020 - External write address 1 */
+	u32	ewarea1;	/* 0x024 - External write address extended 1 */
+	u32	ewcr1;		/* 0x028 - External write ctrl 1 */
+	u8	res3[4];
+	u32	ewar2;		/* 0x030 - External write address 2 */
+	u32	ewarea2;	/* 0x034 - External write address extended 2 */
+	u32	ewcr2;		/* 0x038 - External write ctrl 2 */
+	u8	res4[4];
+	u32	ewar3;		/* 0x040 - External write address 3 */
+	u32	ewarea3;	/* 0x044 - External write address extended 3 */
+	u32	ewcr3;		/* 0x048 - External write ctrl 3 */
+	u8	res5[0xB4];
+	u32	srbar0;		/* 0x100 - SRAM base address 0 */
+	u32	srbarea0;	/* 0x104 - SRAM base addr reg ext address 0 */
+	u32	srbar1;		/* 0x108 - SRAM base address 1 */
+	u32	srbarea1;	/* 0x10C - SRAM base addr reg ext address 1 */
+	u8	res6[0xCF0];
+	u32	errinjhi;	/* 0xE00 - Error injection mask high */
+	u32	errinjlo;	/* 0xE04 - Error injection mask low */
+	u32	errinjctl;	/* 0xE08 - Error injection tag/ecc control */
+	u8	res7[0x14];
+	u32	captdatahi;	/* 0xE20 - Error data high capture */
+	u32	captdatalo;	/* 0xE24 - Error data low capture */
+	u32	captecc;	/* 0xE28 - Error syndrome */
+	u8	res8[0x14];
+	u32	errdet;		/* 0xE40 - Error detect */
+	u32	errdis;		/* 0xE44 - Error disable */
+	u32	errinten;	/* 0xE48 - Error interrupt enable */
+	u32	errattr;	/* 0xE4c - Error attribute capture */
+	u32	erradrrl;	/* 0xE50 - Error address capture low */
+	u32	erradrrh;	/* 0xE54 - Error address capture high */
+	u32	errctl;		/* 0xE58 - Error control */
+	u8	res9[0x1A4];
+};
+
+static int uio_cache_sram_setup(struct platform_device *pdev,
+				phys_addr_t base, u8 ways)
+{
+	struct mpc85xx_l2ctlr __iomem *l2ctlr = of_iomap(pdev->dev.of_node, 0);
+
+	if (!l2ctlr) {
+		dev_err(&pdev->dev, "can not map l2 controller\n");
+		return -EINVAL;
+	}
+
+	/* write bits[0-17] to srbar0 */
+	out_be32(&l2ctlr->srbar0, lower_32_bits(base) & L2SRAM_BAR_MSK_LO18);
+
+	/* write bits[18-21] to srbare0 */
+#ifdef CONFIG_PHYS_64BIT
+	out_be32(&l2ctlr->srbarea0, upper_32_bits(base) & L2SRAM_BARE_MSK_HI4);
+#endif
+
+	clrsetbits_be32(&l2ctlr->ctl, L2CR_L2E, L2CR_L2FI);
+
+	switch (ways) {
+	case LOCK_WAYS_EIGHTH:
+		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_EIGHTH);
+		break;
+
+	case LOCK_WAYS_TWO_EIGHTH:
+		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_QUART);
+		break;
+
+	case LOCK_WAYS_HALF:
+		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_HALF);
+		break;
+
+	case LOCK_WAYS_FULL:
+	default:
+		setbits32(&l2ctlr->ctl, L2CR_L2E | L2CR_L2FI | L2CR_SRAM_FULL);
+		break;
+	}
+	eieio();
+
+	return 0;
+}
+
+static const struct vm_operations_struct uio_cache_sram_vm_ops = {
+#ifdef CONFIG_HAVE_IOREMAP_PROT
+	.access = generic_access_phys,
+#endif
+};
+
+static int uio_cache_sram_mmap(struct uio_info *info,
+				struct vm_area_struct *vma)
+{
+	struct uio_mem *mem = info->mem;
+
+	if (mem->addr & ~PAGE_MASK)
+		return -ENODEV;
+
+	if ((vma->vm_end - vma->vm_start > mem->size) ||
+		(mem->size == 0) ||
+		(mem->memtype != UIO_MEM_PHYS))
+		return -EINVAL;
+
+	vma->vm_ops = &uio_cache_sram_vm_ops;
+	vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
+
+	return remap_pfn_range(vma,
+						   vma->vm_start,
+						   mem->addr >> PAGE_SHIFT,
+						   vma->vm_end - vma->vm_start,
+						   vma->vm_page_prot);
+}
+
+static int uio_cache_sram_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct uio_info *info;
+	struct uio_mem *uiomem;
+	const char *dt_name;
+	phys_addr_t mem_base;
+	u32 l2cache_size;
+	u32 mem_size;
+	u32 rem;
+	u8 ways;
+	int ret;
+
+	if (!node) {
+		dev_err(&pdev->dev, "device's of_node is null\n");
+		return -EINVAL;
+	}
+
+	/* alloc uio_info for one device */
+	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	/* get optional uio name */
+	if (of_property_read_string(node, "uio_name", &dt_name))
+		dt_name = UIO_NAME;
+
+	info->name = devm_kstrdup(&pdev->dev, dt_name, GFP_KERNEL);
+	if (!info->name)
+		return -ENOMEM;
+
+	ret = of_property_read_u32(node, "cache-mem-size", &mem_size);
+	if (ret) {
+		dev_err(&pdev->dev, "missing cache-mem-size\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(node, "cache-mem-base", &mem_base);
+	if (ret) {
+		dev_err(&pdev->dev, "missing cache-mem-base\n");
+		return -EINVAL;
+	}
+
+	if (mem_size == 0) {
+		dev_err(&pdev->dev, "cache-mem-size should not be 0\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(node, "cache-size", &l2cache_size);
+	if (ret) {
+		dev_err(&pdev->dev, "missing l2cache-size\n");
+		return -EINVAL;
+	}
+
+	rem = l2cache_size % mem_size;
+	ways = LOCK_WAYS_FULL * mem_size / l2cache_size;
+	if (rem || (ways & (ways - 1))) {
+		dev_err(&pdev->dev, "illegal cache-sram-size parameter\n");
+		return -EINVAL;
+	}
+
+	ret = uio_cache_sram_setup(pdev, mem_base, ways);
+	if (ret)
+		return ret;
+
+	if (!request_mem_region(mem_base, mem_size, "fsl_85xx_cache_sram")) {
+		dev_err(&pdev->dev, "uio_cache_sram request memory failed\n");
+		ret = -ENXIO;
+	}
+
+	info->irq = UIO_IRQ_NONE;
+	info->version = UIO_INFO_VER;
+	info->mmap = uio_cache_sram_mmap;
+	uiomem = info->mem;
+	uiomem->memtype = UIO_MEM_PHYS;
+	uiomem->addr = mem_base;
+	uiomem->size = mem_size;
+	uiomem->name = devm_kstrdup(&pdev->dev, node->name, GFP_KERNEL);
+	uiomem->internal_addr = ioremap_coherent(mem_base, mem_size);
+	if (!uiomem->internal_addr) {
+		dev_err(&pdev->dev, "cache ioremep_coherent failed\n");
+		ret = -ENOMEM;
+	}
+
+	/* register uio device */
+	if (uio_register_device(&pdev->dev, info)) {
+		dev_err(&pdev->dev, "error uio,cache-sram registration failed\n");
+		ret = -ENODEV;
+		goto err_out;
+	}
+
+	platform_set_drvdata(pdev, info);
+	return 0;
+
+err_out:
+	iounmap(info->mem[0].internal_addr);
+	return ret;
+}
+
+static int uio_cache_sram_remove(struct platform_device *pdev)
+{
+	struct uio_info *info = platform_get_drvdata(pdev);
+
+	uio_unregister_device(info);
+	iounmap(info->mem[0].internal_addr);
+
+	return 0;
+}
+
+static const struct of_device_id uio_cache_sram_of_match[] = {
+	{ .compatible = "fsl,p2020-l2-cache-sram-uio", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, uio_cache_sram_of_match);
+
+static struct platform_driver uio_fsl_85xx_cache_sram = {
+	.probe = uio_cache_sram_probe,
+	.remove = uio_cache_sram_remove,
+	.driver = {
+		.name = DRIVER_NAME,
+		.of_match_table	= uio_cache_sram_of_match,
+	},
+};
+
+module_platform_driver(uio_fsl_85xx_cache_sram);
+
+MODULE_AUTHOR("Wang Wenhu <wenhu.wang@hotmail.com>");
+MODULE_DESCRIPTION("Freescale MPC85xx Cache-Sram UIO Platform Driver");
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_LICENSE("GPL");
-- 
2.25.1

