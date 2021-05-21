Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C213E38C312
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:28:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhB54pZSz30Gt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pd6+CT8z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pd6+CT8z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fmh9d11Gjz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:28:20 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9DoNd075405; Fri, 21 May 2021 05:28:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=w0E3E4AVY3KCTpUe8XtkiCkXDxyxEUyjCtRABnUD21M=;
 b=pd6+CT8zsEtE7Jo3aGZiTAD1yglcqM7RF/nBPZ+hEvbiW/ChJ9Wy+cgEQve+RQB03zOK
 4YmZv4kkqJ2/vWk0NRkT654xm2gX3PAjVQ/Ro7mnffKodVyIKhVkvpceSwS04Rfwllxq
 +FXWsMJG/C4NFbOJ4On+qI+2VJ70qg+aAzwNy2BvsepMN6+oBLqiWjaq3Zk413IIw/4q
 fRxWTsxtOSEpflMHS59bLTYm0isMAwEeLQ7lklgTVTLf0/qCmQ+W1qJ3z7CrPZtQnuui
 QHxkqrjKOE79OSW4a3TtBZjd68aK6+UtJOqsSyUAtJXwsgSPBI1iuhOAQw+R8rd7w78/ ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa2109uy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:28:14 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9EPlK076363;
 Fri, 21 May 2021 05:28:14 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38pa2109u6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:28:14 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9CiQJ005624;
 Fri, 21 May 2021 09:28:12 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 38j5x9xj2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:28:12 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9SBNZ10813794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:28:12 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E63E2136053;
 Fri, 21 May 2021 09:28:11 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78DAD136055;
 Fri, 21 May 2021 09:28:10 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:28:10 +0000 (GMT)
Message-ID: <5933dd793bf0d0d1389877715d936cc321ee86d1.camel@linux.ibm.com>
Subject: [PATCH v4 01/16] powerpc/vas: Move VAS API to book3s common platform
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:28:08 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O4GwibBLQnZS6sKJBVkBYK_5h6yRe9jn
X-Proofpoint-ORIG-GUID: RNJT-UYBPfiz1-jkkHiTUbWOJjusj2es
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210059
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
 arch/powerpc/include/asm/vas.h                    |  3 +++
 arch/powerpc/platforms/Kconfig                    |  1 +
 arch/powerpc/platforms/Makefile                   |  1 +
 arch/powerpc/platforms/book3s/Kconfig             | 15 +++++++++++++++
 arch/powerpc/platforms/book3s/Makefile            |  2 ++
 .../platforms/{powernv => book3s}/vas-api.c       |  2 +-
 arch/powerpc/platforms/powernv/Kconfig            | 14 --------------
 arch/powerpc/platforms/powernv/Makefile           |  2 +-
 8 files changed, 24 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/platforms/book3s/Kconfig
 create mode 100644 arch/powerpc/platforms/book3s/Makefile
 rename arch/powerpc/platforms/{powernv => book3s}/vas-api.c (99%)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index e33f80b0ea81..3be76e813e2d 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -162,6 +162,9 @@ int vas_copy_crb(void *crb, int offset);
  */
 int vas_paste_crb(struct vas_window *win, int offset, bool re);
 
+void vas_win_paste_addr(struct vas_window *window, u64 *addr,
+			int *len);
+
 /*
  * Register / unregister coprocessor type to VAS API which will be exported
  * to user space. Applications can use this API to open / close window
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
index 000000000000..bed21449e8e5
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
+	  VAS allows accelerators in co-processors like NX-GZIP and NX-842
+	  to be accessible to kernel subsystems and user processes.
+	  VAS adapters are found in POWER9 and later based systems.
+	  The user mode NX-GZIP support is added on P9 for powerNV and on
+	  P10 for powerVM.
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


