Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F207B6A780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:36:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nyyc5stKzDqbv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyt642pXzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyt62K0Lz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:14 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyt623VBz9sNC; Tue, 16 Jul 2019 21:32:14 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyt55rPNz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:32:13 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMGnB112903
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:10 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsd0gj2yk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:09 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:32:07 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:32:04 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6GBVn7D40763888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:31:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 207F0A404D;
 Tue, 16 Jul 2019 11:32:03 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 95127A4040;
 Tue, 16 Jul 2019 11:32:01 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:32:01 +0000 (GMT)
Subject: [PATCH v4 01/25] powerpc/fadump: move internal macros/definitions
 to a new header
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:02:00 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0020-0000-0000-000003540510
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0021-0000-0000-000021A7D0F1
Message-Id: <156327672082.27462.6309970021080268079.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Though asm/fadump.h is meant to be used by other components dealing
with FADump, it also has macros/definitions internal to FADump code.
Move them to a new header file used within FADump code. This also
makes way for refactoring platform specific FADump code.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h   |   71 ---------------------------
 arch/powerpc/kernel/fadump-common.h |   93 +++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/fadump.c        |    2 +
 3 files changed, 95 insertions(+), 71 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.h

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index 17d9b6a..75179497 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -11,34 +11,6 @@
 
 #ifdef CONFIG_FA_DUMP
 
-/*
- * The RMA region will be saved for later dumping when kernel crashes.
- * RMA is Real Mode Area, the first block of logical memory address owned
- * by logical partition, containing the storage that may be accessed with
- * translate off.
- */
-#define RMA_START	0x0
-#define RMA_END		(ppc64_rma_size)
-
-/*
- * On some Power systems where RMO is 128MB, it still requires minimum of
- * 256MB for kernel to boot successfully. When kdump infrastructure is
- * configured to save vmcore over network, we run into OOM issue while
- * loading modules related to network setup. Hence we need aditional 64M
- * of memory to avoid OOM issue.
- */
-#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
-			+ (0x1UL << 26))
-
-/* The upper limit percentage for user specified boot memory size (25%) */
-#define MAX_BOOT_MEM_RATIO			4
-
-#define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
-
-/* Alignement per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order))
-
 /* Firmware provided dump sections */
 #define FADUMP_CPU_STATE_DATA	0x0001
 #define FADUMP_HPTE_REGION	0x0002
@@ -47,11 +19,6 @@
 /* Dump request flag */
 #define FADUMP_REQUEST_FLAG	0x00000001
 
-/* FAD commands */
-#define FADUMP_REGISTER		1
-#define FADUMP_UNREGISTER	2
-#define FADUMP_INVALIDATE	3
-
 /* Dump status flag */
 #define FADUMP_ERROR_FLAG	0x2000
 
@@ -112,29 +79,6 @@ struct fadump_mem_struct {
 	struct fadump_section		rmr_region;
 };
 
-/* Firmware-assisted dump configuration details. */
-struct fw_dump {
-	unsigned long	cpu_state_data_size;
-	unsigned long	hpte_region_size;
-	unsigned long	boot_memory_size;
-	unsigned long	reserve_dump_area_start;
-	unsigned long	reserve_dump_area_size;
-	/* cmd line option during boot */
-	unsigned long	reserve_bootvar;
-
-	unsigned long	fadumphdr_addr;
-	unsigned long	cpu_notes_buf;
-	unsigned long	cpu_notes_buf_size;
-
-	int		ibm_configure_kernel_dump;
-
-	unsigned long	fadump_enabled:1;
-	unsigned long	fadump_supported:1;
-	unsigned long	dump_active:1;
-	unsigned long	dump_registered:1;
-	unsigned long	nocma:1;
-};
-
 /*
  * Copy the ascii values for first 8 characters from a string into u64
  * variable at their respective indexes.
@@ -153,7 +97,6 @@ static inline u64 str_to_u64(const char *str)
 #define STR_TO_HEX(x)	str_to_u64(x)
 #define REG_ID(x)	str_to_u64(x)
 
-#define FADUMP_CRASH_INFO_MAGIC		STR_TO_HEX("FADMPINF")
 #define REGSAVE_AREA_MAGIC		STR_TO_HEX("REGSAVE")
 
 /* The firmware-assisted dump format.
@@ -178,20 +121,6 @@ struct fadump_reg_entry {
 	__be64		reg_value;
 };
 
-/* fadump crash info structure */
-struct fadump_crash_info_header {
-	u64		magic_number;
-	u64		elfcorehdr_addr;
-	u32		crashing_cpu;
-	struct pt_regs	regs;
-	struct cpumask	online_mask;
-};
-
-struct fad_crash_memory_ranges {
-	unsigned long long	base;
-	unsigned long long	size;
-};
-
 extern int is_fadump_memory_area(u64 addr, ulong size);
 extern int early_init_dt_scan_fw_dump(unsigned long node,
 		const char *uname, int depth, void *data);
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
new file mode 100644
index 0000000..ba65e69
--- /dev/null
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -0,0 +1,93 @@
+/*
+ * Firmware-Assisted Dump internal code.
+ *
+ * Copyright 2011, IBM Corporation
+ * Author: Mahesh Salgaonkar <mahesh@linux.ibm.com>
+ *
+ * Copyright 2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef __PPC64_FA_DUMP_INTERNAL_H__
+#define __PPC64_FA_DUMP_INTERNAL_H__
+
+/*
+ * The RMA region will be saved for later dumping when kernel crashes.
+ * RMA is Real Mode Area, the first block of logical memory address owned
+ * by logical partition, containing the storage that may be accessed with
+ * translate off.
+ */
+#define RMA_START	0x0
+#define RMA_END		(ppc64_rma_size)
+
+/*
+ * On some Power systems where RMO is 128MB, it still requires minimum of
+ * 256MB for kernel to boot successfully. When kdump infrastructure is
+ * configured to save vmcore over network, we run into OOM issue while
+ * loading modules related to network setup. Hence we need additional 64M
+ * of memory to avoid OOM issue.
+ */
+#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
+			+ (0x1UL << 26))
+
+/* The upper limit percentage for user specified boot memory size (25%) */
+#define MAX_BOOT_MEM_RATIO			4
+
+#define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
+
+/* Alignment per CMA requirement. */
+#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
+				 max_t(unsigned long, MAX_ORDER - 1,	\
+				 pageblock_order))
+
+/* FAD commands */
+#define FADUMP_REGISTER			1
+#define FADUMP_UNREGISTER		2
+#define FADUMP_INVALIDATE		3
+
+#define FADUMP_CRASH_INFO_MAGIC		str_to_u64("FADMPINF")
+
+/* fadump crash info structure */
+struct fadump_crash_info_header {
+	u64		magic_number;
+	u64		elfcorehdr_addr;
+	u32		crashing_cpu;
+	struct pt_regs	regs;
+	struct cpumask	online_mask;
+};
+
+struct fad_crash_memory_ranges {
+	unsigned long long	base;
+	unsigned long long	size;
+};
+
+/* Firmware-assisted dump configuration details. */
+struct fw_dump {
+	unsigned long	reserve_dump_area_start;
+	unsigned long	reserve_dump_area_size;
+	/* cmd line option during boot */
+	unsigned long	reserve_bootvar;
+
+	unsigned long	cpu_state_data_size;
+	unsigned long	hpte_region_size;
+	unsigned long	boot_memory_size;
+
+	unsigned long	fadumphdr_addr;
+	unsigned long	cpu_notes_buf;
+	unsigned long	cpu_notes_buf_size;
+
+	int		ibm_configure_kernel_dump;
+
+	unsigned long	fadump_enabled:1;
+	unsigned long	fadump_supported:1;
+	unsigned long	dump_active:1;
+	unsigned long	dump_registered:1;
+	unsigned long	nocma:1;
+};
+
+#endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a784695..4c3b874 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -32,6 +32,8 @@
 #include <asm/fadump.h>
 #include <asm/setup.h>
 
+#include "fadump-common.h"
+
 static struct fw_dump fw_dump;
 static struct fadump_mem_struct fdm;
 static const struct fadump_mem_struct *fdm_active;

