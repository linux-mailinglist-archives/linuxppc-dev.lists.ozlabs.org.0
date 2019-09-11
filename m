Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1EACAFF95
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:06:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4xM3DxlzF2NS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:06:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4Xk4PJPzF27h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:48:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4Xk0nXWz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:48:54 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4Xk0MrRz9sNT; Thu, 12 Sep 2019 00:48:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46T4Xj3xZdz9s4Y
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:48:53 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgehb136592
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:48:52 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1ryb7w9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:48:50 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:48:48 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:48:45 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEmhTu56361094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:48:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 509D95204F;
 Wed, 11 Sep 2019 14:48:43 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 6BF9752054;
 Wed, 11 Sep 2019 14:48:41 +0000 (GMT)
Subject: [PATCH v6 07/36] pseries/fadump: introduce callbacks for platform
 specific operations
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:18:40 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0DA9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09AE2
Message-Id: <156821330286.5656.15538934400074110770.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce callback functions for platform specific operations like
register, unregister, invalidate & such. Also, define place-holders
for the same on pSeries platform.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Drop using unnecessary return type for platform specific DT scan function.


 arch/powerpc/include/asm/fadump-internal.h   |   24 +++++
 arch/powerpc/kernel/fadump.c                 |   45 ----------
 arch/powerpc/platforms/pseries/Makefile      |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c |  122 ++++++++++++++++++++++++++
 4 files changed, 148 insertions(+), 44 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index f809751..8ecd234 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -77,6 +77,9 @@ struct fad_crash_memory_ranges {
 	unsigned long long	size;
 };
 
+/* Platform specific callback functions */
+struct fadump_ops;
+
 /* Firmware-assisted dump configuration details. */
 struct fw_dump {
 	unsigned long	reserve_dump_area_start;
@@ -99,6 +102,20 @@ struct fw_dump {
 	unsigned long	dump_active:1;
 	unsigned long	dump_registered:1;
 	unsigned long	nocma:1;
+
+	struct fadump_ops	*ops;
+};
+
+struct fadump_ops {
+	u64	(*fadump_init_mem_struct)(struct fw_dump *fadump_conf);
+	int	(*fadump_register)(struct fw_dump *fadump_conf);
+	int	(*fadump_unregister)(struct fw_dump *fadump_conf);
+	int	(*fadump_invalidate)(struct fw_dump *fadump_conf);
+	int	(*fadump_process)(struct fw_dump *fadump_conf);
+	void	(*fadump_region_show)(struct fw_dump *fadump_conf,
+				      struct seq_file *m);
+	void	(*fadump_trigger)(struct fadump_crash_info_header *fdh,
+				  const char *msg);
 };
 
 /* Helper functions */
@@ -109,4 +126,11 @@ void fadump_update_elfcore_header(char *bufp);
 bool is_fadump_boot_mem_contiguous(void);
 bool is_fadump_reserved_mem_contiguous(void);
 
+#ifdef CONFIG_PPC_PSERIES
+extern void rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node);
+#else
+static inline void
+rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node) { }
+#endif
+
 #endif /* _ASM_POWERPC_FADUMP_INTERNAL_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 03f2708..aa342ee 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -112,24 +112,10 @@ static int __init fadump_cma_init(void) { return 1; }
 int __init early_init_dt_scan_fw_dump(unsigned long node,
 			const char *uname, int depth, void *data)
 {
-	const __be32 *sections;
-	int i, num_sections;
-	int size;
-	const __be32 *token;
-
 	if (depth != 1 || strcmp(uname, "rtas") != 0)
 		return 0;
 
-	/*
-	 * Check if Firmware Assisted dump is supported. if yes, check
-	 * if dump has been initiated on last reboot.
-	 */
-	token = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump", NULL);
-	if (!token)
-		return 1;
-
-	fw_dump.fadump_supported = 1;
-	fw_dump.ibm_configure_kernel_dump = be32_to_cpu(*token);
+	rtas_fadump_dt_scan(&fw_dump, node);
 
 	/*
 	 * The 'ibm,kernel-dump' rtas node is present only if there is
@@ -139,35 +125,6 @@ int __init early_init_dt_scan_fw_dump(unsigned long node,
 	if (fdm_active)
 		fw_dump.dump_active = 1;
 
-	/* Get the sizes required to store dump data for the firmware provided
-	 * dump sections.
-	 * For each dump section type supported, a 32bit cell which defines
-	 * the ID of a supported section followed by two 32 bit cells which
-	 * gives teh size of the section in bytes.
-	 */
-	sections = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump-sizes",
-					&size);
-
-	if (!sections)
-		return 1;
-
-	num_sections = size / (3 * sizeof(u32));
-
-	for (i = 0; i < num_sections; i++, sections += 3) {
-		u32 type = (u32)of_read_number(sections, 1);
-
-		switch (type) {
-		case RTAS_FADUMP_CPU_STATE_DATA:
-			fw_dump.cpu_state_data_size =
-					of_read_ulong(&sections[1], 2);
-			break;
-		case RTAS_FADUMP_HPTE_REGION:
-			fw_dump.hpte_region_size =
-					of_read_ulong(&sections[1], 2);
-			break;
-		}
-	}
-
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index ab3d59a..e248724 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_IBMVIO)		+= vio.o
 obj-$(CONFIG_IBMEBUS)		+= ibmebus.o
 obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
 obj-$(CONFIG_PPC_SPLPAR)	+= vphn.o
+obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 ifdef CONFIG_PPC_PSERIES
 obj-$(CONFIG_SUSPEND)		+= suspend.o
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
new file mode 100644
index 0000000..9efe7b1
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -0,0 +1,122 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Firmware-Assisted Dump support on POWERVM platform.
+ *
+ * Copyright 2011, Mahesh Salgaonkar, IBM Corporation.
+ * Copyright 2019, Hari Bathini, IBM Corporation.
+ */
+
+#define pr_fmt(fmt) "rtas fadump: " fmt
+
+#include <linux/string.h>
+#include <linux/memblock.h>
+#include <linux/delay.h>
+#include <linux/seq_file.h>
+#include <linux/crash_dump.h>
+
+#include <asm/page.h>
+#include <asm/prom.h>
+#include <asm/rtas.h>
+#include <asm/fadump.h>
+#include <asm/fadump-internal.h>
+
+#include "rtas-fadump.h"
+
+static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
+{
+	return fadump_conf->reserve_dump_area_start;
+}
+
+static int rtas_fadump_register(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int rtas_fadump_unregister(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+/*
+ * Validate and process the dump data stored by firmware before exporting
+ * it through '/proc/vmcore'.
+ */
+static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
+{
+	return -EINVAL;
+}
+
+static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
+				    struct seq_file *m)
+{
+}
+
+static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
+				const char *msg)
+{
+	/* Call ibm,os-term rtas call to trigger firmware assisted dump */
+	rtas_os_term((char *)msg);
+}
+
+static struct fadump_ops rtas_fadump_ops = {
+	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
+	.fadump_register		= rtas_fadump_register,
+	.fadump_unregister		= rtas_fadump_unregister,
+	.fadump_invalidate		= rtas_fadump_invalidate,
+	.fadump_process			= rtas_fadump_process,
+	.fadump_region_show		= rtas_fadump_region_show,
+	.fadump_trigger			= rtas_fadump_trigger,
+};
+
+void __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
+{
+	int i, size, num_sections;
+	const __be32 *sections;
+	const __be32 *token;
+
+	/*
+	 * Check if Firmware Assisted dump is supported. if yes, check
+	 * if dump has been initiated on last reboot.
+	 */
+	token = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump", NULL);
+	if (!token)
+		return;
+
+	fadump_conf->ibm_configure_kernel_dump = be32_to_cpu(*token);
+	fadump_conf->ops		= &rtas_fadump_ops;
+	fadump_conf->fadump_supported	= 1;
+
+	/* Get the sizes required to store dump data for the firmware provided
+	 * dump sections.
+	 * For each dump section type supported, a 32bit cell which defines
+	 * the ID of a supported section followed by two 32 bit cells which
+	 * gives the size of the section in bytes.
+	 */
+	sections = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump-sizes",
+					&size);
+
+	if (!sections)
+		return;
+
+	num_sections = size / (3 * sizeof(u32));
+
+	for (i = 0; i < num_sections; i++, sections += 3) {
+		u32 type = (u32)of_read_number(sections, 1);
+
+		switch (type) {
+		case RTAS_FADUMP_CPU_STATE_DATA:
+			fadump_conf->cpu_state_data_size =
+					of_read_ulong(&sections[1], 2);
+			break;
+		case RTAS_FADUMP_HPTE_REGION:
+			fadump_conf->hpte_region_size =
+					of_read_ulong(&sections[1], 2);
+			break;
+		}
+	}
+}

