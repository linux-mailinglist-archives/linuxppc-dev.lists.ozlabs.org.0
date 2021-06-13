Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E92BC3A57C3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 12:56:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G2s2V3zN3z3bvh
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Jun 2021 20:56:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ihwk95Jq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ihwk95Jq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G2s212lJnz2xZB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 20:55:52 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15DAZS47045634; Sun, 13 Jun 2021 06:55:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=4YzWBzx8T31TY6rRAfTP8kj7Ctsgsqr8WS0XbsF25Z0=;
 b=ihwk95JqHxutaMmnR3HXesOBoGwjIIqXIf0jjv7Rgz3ZONAdmDQEHHrmVyoYkBHMIMi9
 5OnkpYkm4lRo33rtOkR9FZtz+xa/ppmRTnAlIXJTYK/gYmsQe77Jml4UoaTalocJ6drW
 rwpQIClE7rrzaAHcgvYuXfAXd9WKIV7fAIaody74ZgasbfpqHFs2jlrjLMglDhae0/fG
 xZJJzIG6K/VIVazRrdSVOEHl1ChBl7PAlxdAbh+DnaqegXH/myOZvKcRjP4tBUJf8leS
 EKwZLsQ02Q3JmnDnvLxBx+c8XsRzCn3akw+r7qmpG7+zZo1ITomDq7CLsxZZSLAQfNPb bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 395eaxt9ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 06:55:45 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15DAZqi2046920;
 Sun, 13 Jun 2021 06:55:44 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 395eaxt9a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 06:55:44 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15DApgTL020510;
 Sun, 13 Jun 2021 10:55:44 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 394mj929w5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Jun 2021 10:55:44 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15DAtgwc29950390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 13 Jun 2021 10:55:42 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B80236E04E;
 Sun, 13 Jun 2021 10:55:42 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B8196E04C;
 Sun, 13 Jun 2021 10:55:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 13 Jun 2021 10:55:40 +0000 (GMT)
Message-ID: <ab39540c383d93a0a4dec847fe21586450decf5f.camel@linux.ibm.com>
Subject: [PATCH v5 02/17] powerpc/vas: Move VAS API to book3s common platform
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sun, 13 Jun 2021 03:55:38 -0700
In-Reply-To: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eI2CJCI0jFpsQuG3gERdsQfxI9TAIvpy
X-Proofpoint-GUID: 7I_9ZxuppsaiS6CWYlGTkCJ0YRccVP_E
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-13_04:2021-06-11,
 2021-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106130078
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Using the same /dev/crypto/nx-gzip interface for both powerNV and
pseries. So this patch creates platforms/book3s/ and moves VAS API
to that directory. The actual functionality is not changed.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/Kconfig                    |  1 +
 arch/powerpc/platforms/Makefile                   |  1 +
 arch/powerpc/platforms/book3s/Kconfig             | 15 +++++++++++++++
 arch/powerpc/platforms/book3s/Makefile            |  2 ++
 .../platforms/{powernv => book3s}/vas-api.c       |  2 +-
 arch/powerpc/platforms/powernv/Kconfig            | 14 --------------
 arch/powerpc/platforms/powernv/Makefile           |  2 +-
 7 files changed, 21 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/platforms/book3s/Kconfig
 create mode 100644 arch/powerpc/platforms/book3s/Makefile
 rename arch/powerpc/platforms/{powernv => book3s}/vas-api.c (99%)

diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 7a5e8f4541e3..594544a65b02 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -20,6 +20,7 @@ source "arch/powerpc/platforms/embedded6xx/Kconfig"
 source "arch/powerpc/platforms/44x/Kconfig"
 source "arch/powerpc/platforms/40x/Kconfig"
 source "arch/powerpc/platforms/amigaone/Kconfig"
+source "arch/powerpc/platforms/book3s/Kconfig"
 
 config KVM_GUEST
 	bool "KVM Guest support"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 143d4417f6cc..0e75d7df387b 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -22,3 +22,4 @@ obj-$(CONFIG_PPC_CELL)		+= cell/
 obj-$(CONFIG_PPC_PS3)		+= ps3/
 obj-$(CONFIG_EMBEDDED6xx)	+= embedded6xx/
 obj-$(CONFIG_AMIGAONE)		+= amigaone/
+obj-$(CONFIG_PPC_BOOK3S)	+= book3s/
diff --git a/arch/powerpc/platforms/book3s/Kconfig b/arch/powerpc/platforms/book3s/Kconfig
new file mode 100644
index 000000000000..34c931592ef0
--- /dev/null
+++ b/arch/powerpc/platforms/book3s/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0
+config PPC_VAS
+	bool "IBM Virtual Accelerator Switchboard (VAS)"
+	depends on (PPC_POWERNV || PPC_PSERIES) && PPC_64K_PAGES
+	default y
+	help
+	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
+
+	  VAS devices are found in POWER9-based and later systems, they
+	  provide access to accelerator coprocessors such as NX-GZIP and
+	  NX-842. This config allows the kernel to use NX-842 accelerators,
+	  and user-mode APIs for the NX-GZIP accelerator on POWER9 PowerNV
+	  and POWER10 PowerVM platforms.
+
+	  If unsure, say "N".
diff --git a/arch/powerpc/platforms/book3s/Makefile b/arch/powerpc/platforms/book3s/Makefile
new file mode 100644
index 000000000000..e790f1910f61
--- /dev/null
+++ b/arch/powerpc/platforms/book3s/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_PPC_VAS)	+= vas-api.o
diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
similarity index 99%
rename from arch/powerpc/platforms/powernv/vas-api.c
rename to arch/powerpc/platforms/book3s/vas-api.c
index 98ed5d8c5441..cfc9d7dd65ab 100644
--- a/arch/powerpc/platforms/powernv/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -10,9 +10,9 @@
 #include <linux/fs.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
+#include <linux/io.h>
 #include <asm/vas.h>
 #include <uapi/asm/vas-api.h>
-#include "vas.h"
 
 /*
  * The driver creates the device node that can be used as follows:
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 619b093a0657..043eefbbdd28 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -33,20 +33,6 @@ config PPC_MEMTRACE
 	  Enabling this option allows for runtime allocation of memory (RAM)
 	  for hardware tracing.
 
-config PPC_VAS
-	bool "IBM Virtual Accelerator Switchboard (VAS)"
-	depends on PPC_POWERNV && PPC_64K_PAGES
-	default y
-	help
-	  This enables support for IBM Virtual Accelerator Switchboard (VAS).
-
-	  VAS allows accelerators in co-processors like NX-GZIP and NX-842
-	  to be accessible to kernel subsystems and user processes.
-
-	  VAS adapters are found in POWER9 based systems.
-
-	  If unsure, say N.
-
 config SCOM_DEBUGFS
 	bool "Expose SCOM controllers via debugfs"
 	depends on DEBUG_FS
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index be2546b96816..dc7b37c23b60 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -18,7 +18,7 @@ obj-$(CONFIG_MEMORY_FAILURE)	+= opal-memory-errors.o
 obj-$(CONFIG_OPAL_PRD)	+= opal-prd.o
 obj-$(CONFIG_PERF_EVENTS) += opal-imc.o
 obj-$(CONFIG_PPC_MEMTRACE)	+= memtrace.o
-obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o vas-api.o
+obj-$(CONFIG_PPC_VAS)	+= vas.o vas-window.o vas-debug.o vas-fault.o
 obj-$(CONFIG_OCXL_BASE)	+= ocxl.o
 obj-$(CONFIG_SCOM_DEBUGFS) += opal-xscom.o
 obj-$(CONFIG_PPC_SECURE_BOOT) += opal-secvar.o
-- 
2.18.2


