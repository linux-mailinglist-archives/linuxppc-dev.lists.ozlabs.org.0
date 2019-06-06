Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE337B42
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2019 19:41:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45KXyC1fgSzDqkq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 03:41:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45KXrx3wTbzDqcJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45KXrw58V1z8wGk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 03:36:32 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45KXrw0sLCz9sPQ; Fri,  7 Jun 2019 03:36:32 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45KXrv2KkCz9sPF
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 03:36:30 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x56HUQKF177388
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Jun 2019 13:36:29 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sy66mkbw3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Jun 2019 13:36:28 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Thu, 6 Jun 2019 18:36:27 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 6 Jun 2019 18:36:24 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x56HaNPT41746914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jun 2019 17:36:23 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23F2CAC05E;
 Thu,  6 Jun 2019 17:36:23 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 52115AC059;
 Thu,  6 Jun 2019 17:36:21 +0000 (GMT)
Received: from rino.br.ibm.com (unknown [9.18.235.79])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jun 2019 17:36:21 +0000 (GMT)
From: Claudio Carvalho <cclaudio@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v3 3/9] powerpc: Introduce FW_FEATURE_ULTRAVISOR
Date: Thu,  6 Jun 2019 14:36:08 -0300
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606173614.32090-1-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19060617-0040-0000-0000-000004F9A3F5
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011224; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214149; UDB=6.00638204; IPR=6.00995229; 
 MB=3.00027209; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-06 17:36:25
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060617-0041-0000-0000-00000905C3C8
Message-Id: <20190606173614.32090-4-cclaudio@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-06_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906060117
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
 Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauermann@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This feature tells if the ultravisor firmware is available to handle
ucalls.

Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
[Device node name to "ibm,ultravisor"]
Signed-off-by: Michael Anderson <andmike@linux.ibm.com>
---
 arch/powerpc/include/asm/firmware.h   |  5 +++--
 arch/powerpc/include/asm/ultravisor.h | 15 +++++++++++++++
 arch/powerpc/kernel/Makefile          |  1 +
 arch/powerpc/kernel/prom.c            |  6 ++++++
 arch/powerpc/kernel/ultravisor.c      | 24 ++++++++++++++++++++++++
 5 files changed, 49 insertions(+), 2 deletions(-)
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
index 0ea6c4aa3a20..c8ca219e54bf 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -154,6 +154,7 @@ endif
 
 obj-$(CONFIG_EPAPR_PARAVIRT)	+= epapr_paravirt.o epapr_hcalls.o
 obj-$(CONFIG_KVM_GUEST)		+= kvm.o kvm_emul.o
+obj-$(CONFIG_PPC_UV)		+= ultravisor.o
 
 # Disable GCOV, KCOV & sanitizers in odd or sensitive code
 GCOV_PROFILE_prom_init.o := n
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 4221527b082f..8a9a8a319959 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -59,6 +59,7 @@
 #include <asm/firmware.h>
 #include <asm/dt_cpu_ftrs.h>
 #include <asm/drmem.h>
+#include <asm/ultravisor.h>
 
 #include <mm/mmu_decl.h>
 
@@ -713,6 +714,11 @@ void __init early_init_devtree(void *params)
 	of_scan_flat_dt(early_init_dt_scan_fw_dump, NULL);
 #endif
 
+#if defined(CONFIG_PPC_UV)
+	/* Scan tree for ultravisor feature */
+	of_scan_flat_dt(early_init_dt_scan_ultravisor, NULL);
+#endif
+
 	/* Retrieve various informations from the /chosen node of the
 	 * device-tree, including the platform type, initrd location and
 	 * size, TCE reserve, and more ...
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

