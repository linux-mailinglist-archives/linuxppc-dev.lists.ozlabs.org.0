Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A6754C16C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:01:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNF772X4cz3dqT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 16:01:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=etCNwQnw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hotmail.com (client-ip=2a01:111:f400:feab::813; helo=apc01-sg2-obe.outbound.protection.outlook.com; envelope-from=wenhu.wang@hotmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256 header.s=selector1 header.b=etCNwQnw;
	dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01olkn20813.outbound.protection.outlook.com [IPv6:2a01:111:f400:feab::813])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNF4L1Qwlz3c2B
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 15:59:14 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j106HbZMF6/nhjjP7QBqrJQvd+fZxNu941UgO5b1XE+R+ht4O+KLQHEEySIArzywdHfYql4HP77Or9CqR6OxGfKlmiXjOIwyLdIjXoDf/g6qD0uCfuFbd78ISkwvH3jS7wi/LkdG8PjazuERCDFOze1DD9ZwJn8f+6T+oeKl7oDFwnrqOixtAsoKMwU1UcFMktksQSTSMaNPXYSNeUhTEwvLpzN+uZHOgv0Jp1PcZdo+B1lj8U9w9DAUsUkVg3mb71pb6TJ9WBACBCkGQvFAZzkdrZzEPRahIE7JBlygOnYalF5CL0ReQlv6U+YITySXYlGLLoND57LF+8pAG++lZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tMgsA7ake/UqYeJWf7GEEORpMukkOfANMPh6nm+womA=;
 b=Mdr6XxRnmppquQB8nZwBZhoPZWoLw+WEIvLK7prxX/+rW0TxK/TweidYXB0qDNCXJm7MQ9PW8wwgCPzBUWpcjp1tt4SJ8dqyAZo2b1tINL4+4+UmiFvqGas/Ei787s7uTC1DJhtt+dXqWDbvkFlXCcfdZ/DHWxi7jq92T4lMzdWYHXtsw/sk//YHCJqDRnZFBLoqf9Ik6Q3wGYHSwto5+HYUmbiJPqiAPIr7V69kNrW9pEJ2rAdhsXGEhyDS4YW9UMXvHCO8vHIdnTs60UkIv4/8iAi2HBOh8+Vl5q+n91wvvwU908POdfaxg6kOa6/lMytO1ikPF25ghwlQ1pnJEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tMgsA7ake/UqYeJWf7GEEORpMukkOfANMPh6nm+womA=;
 b=etCNwQnwCLpPsubYpYyQa3y73HudZkANcvV/6IkzPY2Sims0jySk+WmZZERDQLZTNliJdaT1NY1zRni+b8AhV2F9evE4HP/PIej6IaVoSofXjqf81pTAMLDyCD442znfXsOvzX3aL+pwib6NmHfhL2uma49bwTBJDb8Qj9WMvCyyssKZH2vktrNDKRsGEoH74yoTugygqUlTCLuZkVfamPrjmREpSQsUJYOhioq7CGrNKSglCVFS76PBiAp9Nl5Wp8qgXw/OHz1ihbecOL6MfEIGO6GklPIYASMF69wiIyWIjXMv72l03d84d7Ea6oQfqJE7F2e3TkzRt4mb1dcy3Q==
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 (2603:1096:4:76::15) by PU1PR01MB1947.apcprd01.prod.exchangelabs.com
 (2603:1096:803:19::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.22; Wed, 15 Jun
 2022 05:58:57 +0000
Received: from SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12]) by SG2PR01MB2951.apcprd01.prod.exchangelabs.com
 ([fe80::a1f7:b32:baa1:3d12%7]) with mapi id 15.20.5332.022; Wed, 15 Jun 2022
 05:58:57 +0000
From: Wang Wenhu <wenhu.wang@hotmail.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de,
	hao.wu@intel.com,
	trix@redhat.com,
	mdf@kernel.org,
	yilun.xu@intel.com,
	bhelgaas@google.com,
	akpm@linux-foundation.org,
	linux-fpga@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCHv2 2/2] uio:powerpc:mpc85xx: l2-cache-sram uio driver implementation
Date: Tue, 14 Jun 2022 22:57:35 -0700
Message-ID:  <SG2PR01MB29513533A1EA32DCB00D10309FAD9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220615055735.53585-1-wenhu.wang@hotmail.com>
References: <YqHy1uXwCLlJmftr@kroah.com>
 <20220615055735.53585-1-wenhu.wang@hotmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Eo8sx1YNeFhz/7rmnJ2jPouTT0t29+JE]
X-ClientProxiedBy: SG2P153CA0018.APCP153.PROD.OUTLOOK.COM (2603:1096::28) To
 SG2PR01MB2951.apcprd01.prod.exchangelabs.com (2603:1096:4:76::15)
X-Microsoft-Original-Message-ID:  <20220615055735.53585-3-wenhu.wang@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72d383c5-cd4a-415a-121f-08da4e9422b6
X-MS-Exchange-SLBlob-MailProps: 	6rN1YWC+iUWsRh032Lw5Z0CQAJRF/Q/XDOIqlCS1VES3CQNWx1uzTB/DbDeaSlYXrTahZZa8/nt7oxf/vl6SXCHLAcMcL3v4SVQQYLkKQXsMemZ2BzinhJ+OtRpfD9IGvOXkFd4Pz6domT0HZ884WIo8DAHqjxIsMiMtgisctkX1KuHbWrobaVnKvV7KvxOTbbUv/JkIDj12BrtIyDvlKJmYsCzRl3Y5W70j8rM5YkCYuA2H3TUthSp0j0N6dFtI7kwRb7bq5dWwy7u5Mj//JBmnFwW1EAWl/kI2nr63hmZsNFxQs3OTD81GamZ2qXKGmvvuHljMNf45C96u5MijNqh7a6fEt5sxrPulJV4LKJQmr9vrjQjbtDrr865LDo5GDrhu1dfrPN6gk3ys6CCyt6zvMYMnvC2IO4/VMS09WDAX82Maxsr/DufPzbvva5JMOo+fSDZvrO9EEuZ+07BYOOABln+RNKlLK6MioU1ODYJH++R6EmvtexFYpxWVFYmof5qTxRJpDpm1L54MytG1jPFel2aJ8ZWqESPkV9LGoqH1X9et6K2cteeV+MuBl5cF8paQX6ZNb7zc7WyJNVy7kURIv0dZnsvbQ57xqb5JaRtrKS4Wmd59Dt9/FghVdIZtAp5YkXDN86dMqzWZtzLVqIt97G5pZQFTVJHigv/0f3JQ3larl5voRLPYM96/d2Qxg6QQqQoJry5m+sDTQ8dQADhy1Codr0pLIymdjCfF0GdTOm35mC007juyPfvvouv/ptZJ5DHXbzWy+GalB70ijCuI7jRGfFt7MXETd++XuO1vscq2C/nJm/brmNgjbtra
X-MS-TrafficTypeDiagnostic: PU1PR01MB1947:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cBjW0t1UfQFLCZSxSHvzO3EEyp63/5LDZyMio+KxeNTafh2fxDHhM/xbHlKXheO0uydVe9YmbqoG359kX34mGwOtmm9Gr9Y/p68No5ur6527suPnZsMPQsJHW5/CdItUxpNeJltZGkW+ll2gzsHqukSya/t3N1pYF3uzRCv6ffPzf2BvtsQfnsLSIGvV3QoWaXufOeRAdjJJczMrhzEyJfZf0SHCDAEw7KmVxLdbGLTbxhZoulgjKD32Uzhi0hZncUvVCwYvxdKPaSxgObAXb+tTKgr28f5Pu3y6JjyGO5+Ge0zhpu833d7qTthSBpOXw+2eqlguRALnpDacGanIPwdnPGHeY31gtA+eg1atC+7w6jL7KDMJ7PuVdNF3jUPD5hGewMf+2aaoGuW3d6zpiHl1Qb24KrTCk9mRagyjQ4ocDPvYkg7KeeN9b9xvshLWHIuZaimFKHGlflDoN4HewLtUvmInZWiswrjqCLJsqyTIYCZ4Nul44nz+sOsqSjAiLAz1inNqh1NM2j1Cjw71eG5nI3zLQEQ4Z5Gp4eUopAbTRu/NIPrkZWmXM84py5alo9R3Dzt920htyzehIANJrw9Dclm08bSCIOxAmZD/CHHxCs7X7xHBjQOy4la9BCwc
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ztxtYOKmHH7EVmEWRP2pMtr50CDB1HWL9+uiyosZRXU0/xOnVeJww3NGMuEC?=
 =?us-ascii?Q?vB+iHP8EZff3QTD3cNJ7Q5JoM3ftByZi0sRINEBMl2iwqQMcK0Y28IDZJ5mn?=
 =?us-ascii?Q?+C7dEOcNgq52MovLJzhm8RKaEHradHdB9KG5P5gYR73OPGsARKcppP3j3Cxk?=
 =?us-ascii?Q?BtIfYCaE7xgEHsdboY8qlXXK3hX7aOsqwYS8vBAckTJF1iWYGFoxTKEv6089?=
 =?us-ascii?Q?8BrPD47jEzQz1OK72yIRlmdkNgd0ycOxeYmoxM7ovlYVNrU4awk+v6ZcreS4?=
 =?us-ascii?Q?OXKMwxfSTcjCVxkd4h27GhF91tiC7yJobBL+FeaZXM9bCRpjX82sZsoP4CY/?=
 =?us-ascii?Q?NngfxqwTr6HrA88ACYa5ijmjoi8I7YWx2DJvVe6BDTsfXmkbF6i1SU4mrUyN?=
 =?us-ascii?Q?OtmR9KYk7CBLN4obwlQrNNtXIYl6rJpgdBu3EeuMrRZNLGHlO8gURSnTmqTZ?=
 =?us-ascii?Q?SxqW8waWm4lqryXhd5KzljZUwI2RxrJwPsabhcYa4r9U4BpCP1bStdpyRC0m?=
 =?us-ascii?Q?Y5z0DRvlHSixauaF4U6XvJyn3oQsLX9crpi9tv8HtbIYH1QEhWVgrPqgRhB/?=
 =?us-ascii?Q?wPDaYbsj8iHzC3bnAIi7Amo7cJ2MQI6ZyqPum/xlQkXVWpjIJXBFYzXFHyJR?=
 =?us-ascii?Q?OYGULJ5gB8KrwhCKv1uM+1JZeKxikMBcVTnSC2VJlY9GXPzlfND+cba4bcls?=
 =?us-ascii?Q?ypsCKNidLgJbayKBIeMt8udqFKewKiNbTGy7Qo+dF4pAR1bO6ZJghaj+tGAB?=
 =?us-ascii?Q?vuEMiBvR88tkqDLxh/uKMhYdt6qVz3EiQRBXPiPrEdeoDh/A7WhXMnJ4I4+t?=
 =?us-ascii?Q?Z6V8nP8TizYv0W46bSGdyfYOGAk+tCQmt45ULH6JDIFusJoJcpwU2076HPn0?=
 =?us-ascii?Q?7AJWTTkycyYbX52JMLVOoeqJm+6vsMsuNbo9CuFgnN+A4HEnlicVHCVS6lys?=
 =?us-ascii?Q?HuUfeAwT/dCDZuMuqSXHAN9bsbVZ8YnbTfa8ogo5URHkf1lafp9VvVmWkUve?=
 =?us-ascii?Q?NbdkVqdP1FFREN7JoupcOEtSLGJCaT3VxDaujB1wBs3wSx98s40gLagUIEYZ?=
 =?us-ascii?Q?J0psh0TAf0BoVejkxVEqoWl9CP+zus1+sAKzty+tuiqovA0/CRAFjX1FYsfd?=
 =?us-ascii?Q?8qhjJlDgn9t6+RNhb4j5Ryp+PJ7WuYoTkdCXauduyPOt8KvnQ87DryqodX6j?=
 =?us-ascii?Q?G1/pnE0p1wz0hjWTjgrA7QLY6nbsE8G4FwZ/nE84nYTGtNafIoQgPgxQImk0?=
 =?us-ascii?Q?b0mImimLVuKJ77Yw7gdYfnAIzkHmWBZQoX3bKbkSooiI7P6bFH05D6CAXdQO?=
 =?us-ascii?Q?PWIZyVjwoRyB8F2luj/t/Wupj4IwXYGK2sVxdpYG+mszavF/3kuS2V6KAl4S?=
 =?us-ascii?Q?sdB7VnkCCp/nchlPafM3bdv/EGG8Xtsh78vYJT2bIZ0Bjz4KIt623MQ+DHYs?=
 =?us-ascii?Q?Sry59/89vbE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-d8e84.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d383c5-cd4a-415a-121f-08da4e9422b6
X-MS-Exchange-CrossTenant-AuthSource: SG2PR01MB2951.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2022 05:58:57.3017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR01MB1947
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, wenhu.wang@hotmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Freescale mpc85xx l2-cache could be optionally configured as SRAM partly
or fully. Users can make use of it as a block of independent memory that
offers special usage, such as for debuging or other critical status info
storage, which keeps consistently even when the whole system crashed.
Applications can make use of UIO driver to access the SRAM from user level.

Once there was another driver version for the l2-cache-sram for SRAM access
in kernel space. It had been removed recently.
See: https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=dc21ed2aef4150fc2fcf58227a4ff24502015c03

Signed-off-by: Wang Wenhu <wenhu.wang@hotmail.com>
---
v2:
 - Use __be32 instead of u32 for big-endian data declarations;
 - Use generic ioremap_cache instead of ioremap_coherent;
 - Physical address support both 32 and 64 bits;
 - Addressed some other comments from Greg.
---
 drivers/uio/Kconfig                   |  14 ++
 drivers/uio/Makefile                  |   1 +
 drivers/uio/uio_fsl_85xx_cache_sram.c | 288 ++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)
 create mode 100644 drivers/uio/uio_fsl_85xx_cache_sram.c

diff --git a/drivers/uio/Kconfig b/drivers/uio/Kconfig
index 2e16c5338e5b..f7604584a12c 100644
--- a/drivers/uio/Kconfig
+++ b/drivers/uio/Kconfig
@@ -105,6 +105,20 @@ config UIO_NETX
 	  To compile this driver as a module, choose M here; the module
 	  will be called uio_netx.
 
+config UIO_FSL_85XX_CACHE_SRAM
+	tristate "Freescale 85xx L2-Cache-SRAM UIO driver"
+	depends on FSL_SOC_BOOKE && PPC32
+	help
+	  Driver for user level access of freescale mpc85xx l2-cache-sram.
+
+	  Freescale's mpc85xx provides an option of configuring a part of
+	  (or full) cache memory as SRAM. The driver does this configuring
+	  work and exports SRAM to user-space for access form user level.
+	  This is extremely helpful for user applications that require
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
index 000000000000..6f91b0aa946b
--- /dev/null
+++ b/drivers/uio/uio_fsl_85xx_cache_sram.c
@@ -0,0 +1,288 @@
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
+#define DRIVER_NAME	"uio_mpc85xx_cache_sram"
+#define UIO_INFO_VER	"0.0.1"
+#define UIO_NAME	"uio_cache_sram"
+
+#define L2CR_L2FI		0x40000000	/* L2 flash invalidate */
+#define L2CR_L2IO		0x00200000	/* L2 instruction only */
+#define L2CR_SRAM_ZERO		0x00000000	/* L2SRAM zero size */
+#define L2CR_SRAM_FULL		0x00010000	/* L2SRAM full size */
+#define L2CR_SRAM_HALF		0x00020000	/* L2SRAM half size */
+#define L2CR_SRAM_TWO_HALFS	0x00030000	/* L2SRAM two half sizes */
+#define L2CR_SRAM_QUART		0x00040000	/* L2SRAM one quarter size */
+#define L2CR_SRAM_TWO_QUARTS	0x00050000	/* L2SRAM two quarter size */
+#define L2CR_SRAM_EIGHTH	0x00060000	/* L2SRAM one eighth size */
+#define L2CR_SRAM_TWO_EIGHTH	0x00070000	/* L2SRAM two eighth size */
+
+#define L2SRAM_OPTIMAL_SZ_SHIFT	0x00000003	/* Optimum size for L2SRAM */
+
+#define L2SRAM_BAR_MSK_LO18	0xFFFFC000	/* Lower 18 bits */
+#define L2SRAM_BARE_MSK_HI4	0x0000000F	/* Upper 4 bits */
+
+enum cache_sram_lock_ways {
+	LOCK_WAYS_ZERO		= 0,
+	LOCK_WAYS_EIGHTH	= 1,
+	LOCK_WAYS_TWO_EIGHTH	= 2,
+	LOCK_WAYS_HALF		= 4,
+	LOCK_WAYS_FULL		= 8,
+};
+
+struct mpc85xx_l2ctlr {
+	__be32	ctl;		/* 0x000 - L2 control */
+	u8	res1[0xC];
+	__be32	ewar0;		/* 0x010 - External write address 0 */
+	__be32	ewarea0;	/* 0x014 - External write address extended 0 */
+	__be32	ewcr0;		/* 0x018 - External write ctrl */
+	u8	res2[4];
+	__be32	ewar1;		/* 0x020 - External write address 1 */
+	__be32	ewarea1;	/* 0x024 - External write address extended 1 */
+	__be32	ewcr1;		/* 0x028 - External write ctrl 1 */
+	u8	res3[4];
+	__be32	ewar2;		/* 0x030 - External write address 2 */
+	__be32	ewarea2;	/* 0x034 - External write address extended 2 */
+	__be32	ewcr2;		/* 0x038 - External write ctrl 2 */
+	u8	res4[4];
+	__be32	ewar3;		/* 0x040 - External write address 3 */
+	__be32	ewarea3;	/* 0x044 - External write address extended 3 */
+	__be32	ewcr3;		/* 0x048 - External write ctrl 3 */
+	u8	res5[0xB4];
+	__be32	srbar0;		/* 0x100 - SRAM base address 0 */
+	__be32	srbarea0;	/* 0x104 - SRAM base addr reg ext address 0 */
+	__be32	srbar1;		/* 0x108 - SRAM base address 1 */
+	__be32	srbarea1;	/* 0x10C - SRAM base addr reg ext address 1 */
+	u8	res6[0xCF0];
+	__be32	errinjhi;	/* 0xE00 - Error injection mask high */
+	__be32	errinjlo;	/* 0xE04 - Error injection mask low */
+	__be32	errinjctl;	/* 0xE08 - Error injection tag/ecc control */
+	u8	res7[0x14];
+	__be32	captdatahi;	/* 0xE20 - Error data high capture */
+	__be32	captdatalo;	/* 0xE24 - Error data low capture */
+	__be32	captecc;	/* 0xE28 - Error syndrome */
+	u8	res8[0x14];
+	__be32	errdet;		/* 0xE40 - Error detect */
+	__be32	errdis;		/* 0xE44 - Error disable */
+	__be32	errinten;	/* 0xE48 - Error interrupt enable */
+	__be32	errattr;	/* 0xE4c - Error attribute capture */
+	__be32	erradrrl;	/* 0xE50 - Error address capture low */
+	__be32	erradrrh;	/* 0xE54 - Error address capture high */
+	__be32	errctl;		/* 0xE58 - Error control */
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
+	if (IS_ENABLED(CONFIG_PHYS_64BIT))
+		out_be32(&l2ctlr->srbarea0, upper_32_bits(base) & L2SRAM_BARE_MSK_HI4);
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
+	.access = generic_access_phys,
+};
+
+static int uio_cache_sram_mmap(struct uio_info *info,
+			       struct vm_area_struct *vma)
+{
+	struct uio_mem *mem = info->mem;
+
+	if (mem->addr & ~PAGE_MASK)
+		return -ENODEV;
+
+	if ((vma->vm_end - vma->vm_start > mem->size) ||
+	    (mem->size == 0) ||
+	    (mem->memtype != UIO_MEM_PHYS))
+		return -EINVAL;
+
+	vma->vm_ops = &uio_cache_sram_vm_ops;
+	vma->vm_page_prot = pgprot_cached(vma->vm_page_prot);
+
+	return remap_pfn_range(vma,
+			       vma->vm_start,
+			       mem->addr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start,
+			       vma->vm_page_prot);
+}
+
+static int uio_cache_sram_probe(struct platform_device *pdev)
+{
+	struct device_node *node = pdev->dev.of_node;
+	struct uio_info *info;
+	struct uio_mem *uiomem;
+	const char *dt_name;
+	u32 mem_base_32;
+	u64 mem_base_64;
+	phys_addr_t mem_base;
+	u32 l2cache_size;
+	u32 mem_size;
+	u32 rem;
+	u8 ways;
+	int ret;
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
+
+	if (IS_ENABLED(CONFIG_PHYS_64BIT)) {
+		ret = of_property_read_u64(node, "cache-mem-base", &mem_base_64);
+		mem_base = mem_base_64;
+	} else {
+		ret = of_property_read_u32(node, "cache-mem-base", &mem_base_32);
+		mem_base = mem_base_32;
+	}
+
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
+	uiomem->internal_addr = ioremap_cache(mem_base, mem_size);
+	if (!uiomem->internal_addr) {
+		dev_err(&pdev->dev, "cache ioremap failed\n");
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
+MODULE_DESCRIPTION("Freescale MPC85xx Cache-SRAM UIO Platform Driver");
+MODULE_ALIAS("platform:" DRIVER_NAME);
+MODULE_LICENSE("GPL");
-- 
2.25.1

