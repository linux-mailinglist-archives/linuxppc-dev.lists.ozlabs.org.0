Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 431025A5B5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 22:10:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b7Df5p3DzDqx2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 06:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b7BL0zZyzDqBh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 06:08:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45b7BK1nhhz8tDC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 06:08:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45b7BK0lz5z9s4V; Sat, 29 Jun 2019 06:08:41 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45b7BJ3w6Sz9sLt;
 Sat, 29 Jun 2019 06:08:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5SK6pgc088817; Fri, 28 Jun 2019 16:08:38 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tdqe84t8e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 16:08:38 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x5SK6xqv014201;
 Fri, 28 Jun 2019 20:08:37 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01wdc.us.ibm.com with ESMTP id 2t9by7fpy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jun 2019 20:08:37 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5SK8Z1l46727510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jun 2019 20:08:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB4B37805C;
 Fri, 28 Jun 2019 20:08:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6BBE78068;
 Fri, 28 Jun 2019 20:08:32 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.108])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jun 2019 20:08:32 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v4 2/8] powerpc: Introduce FW_FEATURE_ULTRAVISOR
Date: Fri, 28 Jun 2019 17:08:19 -0300
Message-Id: <20190628200825.31049-3-cclaudio@linux.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190628200825.31049-1-cclaudio@linux.ibm.com>
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906280230
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This feature tells if the ultravisor firmware is available to handle
ucalls.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
[ Device node name to "ibm,ultravisor" ]
Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h   |  5 +++--
 arch/powerpc/include/asm/ultravisor.h | 15 +++++++++++++++
 arch/powerpc/kernel/Makefile          |  1 +
 arch/powerpc/kernel/prom.c            |  4 ++++
 arch/powerpc/kernel/ultravisor.c      | 24 ++++++++++++++++++++++++
 5 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/ultravisor.h
 create mode 100644 arch/powerpc/kernel/ultravisor.c

diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
index 00bc42d95679..43b48c4d3ca9 100644
--- a/arch/powerpc/include/asm/firmware.h
+++ b/arch/powerpc/include/asm/firmware.h
@@ -54,6 +54,7 @@
 #define FW_FEATURE_DRC_INFO	ASM_CONST(0x0000000800000000)
 #define FW_FEATURE_BLOCK_REMOVE ASM_CONST(0x0000001000000000)
 #define FW_FEATURE_PAPR_SCM 	ASM_CONST(0x0000002000000000)
+#define FW_FEATURE_ULTRAVISOR	ASM_CONST(0x0000004000000000)
 
 #ifndef __ASSEMBLY__
 
@@ -72,9 +73,9 @@ enum {
 		FW_FEATURE_TYPE1_AFFINITY | FW_FEATURE_PRRN |
 		FW_FEATURE_HPT_RESIZE | FW_FEATURE_DRMEM_V2 |
 		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
-		FW_FEATURE_PAPR_SCM,
+		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_PSERIES_ALWAYS = 0,
-	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL,
+	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
 	FW_FEATURE_POWERNV_ALWAYS = 0,
 	FW_FEATURE_PS3_POSSIBLE = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
 	FW_FEATURE_PS3_ALWAYS = FW_FEATURE_LPAR | FW_FEATURE_PS3_LV1,
diff --git a/arch/powerpc/include/asm/ultravisor.h b/arch/powerpc/include/asm/ultravisor.h
new file mode 100644
index 000000000000..e5009b0d84ea
--- /dev/null
+++ b/arch/powerpc/include/asm/ultravisor.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Ultravisor definitions
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#ifndef _ASM_POWERPC_ULTRAVISOR_H
+#define _ASM_POWERPC_ULTRAVISOR_H
+
+/* Internal functions */
+extern int early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
+					 int depth, void *data);
+
+#endif	/* _ASM_POWERPC_ULTRAVISOR_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4aa3a20..f0caa302c8c0 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -154,6 +154,7 @@ endif
 
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
+obj-$(CONFIG_PPC_POWERNV)	+= ultravisor.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 4221527b082f..67a2c1b39252 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -59,6 +59,7 @@
 #include <asm/firmware.h>
 #include <asm/dt_cpu_ftrs.h>
 #include <asm/drmem.h>
+#include <asm/ultravisor.h>
 
 #include <mm/mmu_decl.h>
 
@@ -706,6 +707,9 @@ void __init early_init_devtree(void *params)
 #ifdef CONFIG_PPC_POWERNV
 	/* Some machines might need OPAL info for debugging, grab it now. */
 	of_scan_flat_dt(early_init_dt_scan_opal, NULL);
+
+	/* Scan tree for ultravisor feature */
+	of_scan_flat_dt(early_init_dt_scan_ultravisor, NULL);
 #endif
 
 #ifdef CONFIG_FA_DUMP
diff --git a/arch/powerpc/kernel/ultravisor.c b/arch/powerpc/kernel/ultravisor.c
new file mode 100644
index 000000000000..dc6021f63c97
--- /dev/null
+++ b/arch/powerpc/kernel/ultravisor.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Ultravisor high level interfaces
+ *
+ * Copyright 2019, IBM Corporation.
+ *
+ */
+#include <linux/init.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+
+#include <asm/ultravisor.h>
+#include <asm/firmware.h>
+
+int __init early_init_dt_scan_ultravisor(unsigned long node, const char *uname,
+					 int depth, void *data)
+{
+	if (depth != 1 || strcmp(uname, "ibm,ultravisor") != 0)
+		return 0;
+
+	powerpc_firmware_features |= FW_FEATURE_ULTRAVISOR;
+	pr_debug("Ultravisor detected!\n");
+	return 1;
+}
-- 
2.20.1

