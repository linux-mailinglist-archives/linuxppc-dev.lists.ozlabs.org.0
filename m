Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B17A5AFF26
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 16:50:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T4b32mjlzF1xP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 00:50:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4VB0mYvzF2DQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:46:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4V96DgRz8t0n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:46:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4V94qHDz9s4Y; Thu, 12 Sep 2019 00:46:41 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4V90qx3z9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:46:40 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEhmEv108160
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:46:39 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy1n6bhn4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:46:37 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:46:28 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:46:26 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEkOJM49545272
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:46:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C04BA4060;
 Wed, 11 Sep 2019 14:46:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FDE2A4062;
 Wed, 11 Sep 2019 14:46:22 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:46:22 +0000 (GMT)
Subject: [PATCH v6 01/36] powerpc/fadump: move internal macros/definitions
 to a new header
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:16:21 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0016-0000-0000-000002AA0E84
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0017-0000-0000-0000330A9B5F
Message-Id: <156821313134.5656.6597770626574392140.stgit@hbathini.in.ibm.com>
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

Though asm/fadump.h is meant to be used by other components dealing
with FADump, it also has macros/definitions internal to FADump code.
Move them to a new header file used within FADump code. This also
makes way for refactoring platform specific FADump code.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Have arch/powerpc/include/asm/fadump-internal.h for internal definitions
    instead of arch/powerpc/kernel/fadump-common.h to avoid gross includes
    in platform code.


 arch/powerpc/include/asm/fadump-internal.h |   86 ++++++++++++++++++++++++++++
 arch/powerpc/include/asm/fadump.h          |   71 -----------------------
 arch/powerpc/kernel/fadump.c               |    1 
 3 files changed, 87 insertions(+), 71 deletions(-)
 create mode 100644 arch/powerpc/include/asm/fadump-internal.h

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
new file mode 100644
index 0000000..071f377
--- /dev/null
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Firmware-Assisted Dump internal code.
+ *
+ * Copyright 2011, Mahesh Salgaonkar, IBM Corporation.
+ * Copyright 2019, Hari Bathini, IBM Corporation.
+ */
+
+#ifndef _ASM_POWERPC_FADUMP_INTERNAL_H
+#define _ASM_POWERPC_FADUMP_INTERNAL_H
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
+#endif /* _ASM_POWERPC_FADUMP_INTERNAL_H */
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
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4eab972..7c55044 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -30,6 +30,7 @@
 #include <asm/prom.h>
 #include <asm/rtas.h>
 #include <asm/fadump.h>
+#include <asm/fadump-internal.h>
 #include <asm/setup.h>
 
 static struct fw_dump fw_dump;

