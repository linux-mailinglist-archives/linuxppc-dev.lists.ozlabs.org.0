Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD512C8001
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 09:34:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ckz6k4fjgzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 19:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Iwxt7RyO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ckz4x62GKzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 19:32:49 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AU8W7RE033042; Mon, 30 Nov 2020 03:32:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=hCT6x9NbbiTV8dWaym8OzlfnKc5TtvTbWkQtWQ8XCP0=;
 b=Iwxt7RyO1OwH/CEOSzTu1vHa/k/qvwrSsi5kmE+t6DMUNecxuHj1nmXgmu1KGuoyy9qs
 uwtr5Xz9Fwt7FG2hrcTC1EEsg2KjXuK+txvGhomOZ4AU8axdw0C7SWKXvIk9JyQ/mjNz
 Jvq1uvodh8lesWDPnYVZ/FhfGJKmKWBpPzU+flkvXKVNX3DXW8+onnBfO+sLrFnohdah
 8Bv41mskLytNDNoMKyvcAyMCCc0p1lrec2msQghJU6JY/ZZVeqgO7ukeg9UDcep47ra3
 tdnGmHp0h8+4hl2bHPpz9Ncbo61kJ0IhDxHoeDgx4p9JYzvaO7bee+tg5J2TWIcOwZ7F pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 354jntc5r6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 03:32:43 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AU8WER7033635;
 Mon, 30 Nov 2020 03:32:43 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 354jntc5qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 03:32:42 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AU8RZkO023114;
 Mon, 30 Nov 2020 08:32:41 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 353e681tey-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Nov 2020 08:32:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AU8Wcn12622176
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Nov 2020 08:32:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3CF354C04A;
 Mon, 30 Nov 2020 08:32:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 771A64C10D;
 Mon, 30 Nov 2020 08:32:27 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.214.133])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Nov 2020 08:32:26 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5] lkdtm/powerpc: Add SLB multihit test
Date: Mon, 30 Nov 2020 14:00:57 +0530
Message-Id: <20201130083057.135610-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-30_02:2020-11-30,
 2020-11-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 mlxscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011300053
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
Cc: msuchanek@suse.de, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 keescook@chromium.org, npiggin@gmail.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To check machine check handling, add support to inject slb
multihit errors.

Cc: Kees Cook <keescook@chromium.org>
Cc: Michal Suchánek <msuchanek@suse.de>
Co-developed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v5:
- Insert entries at SLB_NUM_BOLTED and SLB_NUM_BOLTED +1, remove index
  allocating helper function.
- Move mk_esid_data and mk_vsid_data helpers to asm/book3s/64/mmu-hash.h.
- Use mmu_linear_psize and mmu_vmalloc_psize to get page size.
- Use !radix_enabled() to check if we are in HASH mode.
- And other minor improvements.

v1-v4:
- No major changes here for this patch, This patch was initially posted
  along with the other patch which got accepted.
https://git.kernel.org/powerpc/c/8d0e2101274358d9b6b1f27232b40253ca48bab5
---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  28 +++-
 arch/powerpc/mm/book3s64/hash_utils.c         |   1 +
 arch/powerpc/mm/book3s64/slb.c                |  27 ----
 drivers/misc/lkdtm/Makefile                   |   1 +
 drivers/misc/lkdtm/core.c                     |   3 +
 drivers/misc/lkdtm/lkdtm.h                    |   3 +
 drivers/misc/lkdtm/powerpc.c                  | 120 ++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt       |   1 +
 8 files changed, 156 insertions(+), 28 deletions(-)
 create mode 100644 drivers/misc/lkdtm/powerpc.c

diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 683a9c7d1b03..8b9f07900395 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -842,6 +842,32 @@ static inline unsigned long get_kernel_vsid(unsigned long ea, int ssize)
 
 unsigned htab_shift_for_mem_size(unsigned long mem_size);
 
-#endif /* __ASSEMBLY__ */
+enum slb_index {
+	LINEAR_INDEX	= 0, /* Kernel linear map  (0xc000000000000000) */
+	KSTACK_INDEX	= 1, /* Kernel stack map */
+};
 
+#define slb_esid_mask(ssize)	\
+	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
+
+static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
+					 enum slb_index index)
+{
+	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | index;
+}
+
+static inline unsigned long __mk_vsid_data(unsigned long vsid, int ssize,
+					   unsigned long flags)
+{
+	return (vsid << slb_vsid_shift(ssize)) | flags |
+		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
+}
+
+static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
+					 unsigned long flags)
+{
+	return __mk_vsid_data(get_kernel_vsid(ea, ssize), ssize, flags);
+}
+
+#endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_MMU_HASH_H_ */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 24702c0a92e0..38076a998850 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -112,6 +112,7 @@ int mmu_linear_psize = MMU_PAGE_4K;
 EXPORT_SYMBOL_GPL(mmu_linear_psize);
 int mmu_virtual_psize = MMU_PAGE_4K;
 int mmu_vmalloc_psize = MMU_PAGE_4K;
+EXPORT_SYMBOL_GPL(mmu_vmalloc_psize);
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 int mmu_vmemmap_psize = MMU_PAGE_4K;
 #endif
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c30fcbfa0e32..985706acb0e5 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -28,35 +28,8 @@
 #include "internal.h"
 
 
-enum slb_index {
-	LINEAR_INDEX	= 0, /* Kernel linear map  (0xc000000000000000) */
-	KSTACK_INDEX	= 1, /* Kernel stack map */
-};
-
 static long slb_allocate_user(struct mm_struct *mm, unsigned long ea);
 
-#define slb_esid_mask(ssize)	\
-	(((ssize) == MMU_SEGSIZE_256M)? ESID_MASK: ESID_MASK_1T)
-
-static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
-					 enum slb_index index)
-{
-	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | index;
-}
-
-static inline unsigned long __mk_vsid_data(unsigned long vsid, int ssize,
-					 unsigned long flags)
-{
-	return (vsid << slb_vsid_shift(ssize)) | flags |
-		((unsigned long) ssize << SLB_VSID_SSIZE_SHIFT);
-}
-
-static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
-					 unsigned long flags)
-{
-	return __mk_vsid_data(get_kernel_vsid(ea, ssize), ssize, flags);
-}
-
 bool stress_slb_enabled __initdata;
 
 static int __init parse_stress_slb(char *p)
diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index c70b3822013f..f37ecfb0a707 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -10,6 +10,7 @@ lkdtm-$(CONFIG_LKDTM)		+= rodata_objcopy.o
 lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
 lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
 lkdtm-$(CONFIG_LKDTM)		+= cfi.o
+lkdtm-$(CONFIG_PPC64)		+= powerpc.o
 
 KASAN_SANITIZE_stackleak.o	:= n
 KCOV_INSTRUMENT_rodata.o	:= n
diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
index 97803f213d9d..538098dc5aec 100644
--- a/drivers/misc/lkdtm/core.c
+++ b/drivers/misc/lkdtm/core.c
@@ -176,6 +176,9 @@ static const struct crashtype crashtypes[] = {
 #ifdef CONFIG_X86_32
 	CRASHTYPE(DOUBLE_FAULT),
 #endif
+#ifdef CONFIG_PPC64
+	CRASHTYPE(PPC_SLB_MULTIHIT),
+#endif
 };
 
 
diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
index 6dec4c9b442f..79ec05c18dd1 100644
--- a/drivers/misc/lkdtm/lkdtm.h
+++ b/drivers/misc/lkdtm/lkdtm.h
@@ -102,4 +102,7 @@ void lkdtm_STACKLEAK_ERASING(void);
 /* cfi.c */
 void lkdtm_CFI_FORWARD_PROTO(void);
 
+/* powerpc.c */
+void lkdtm_PPC_SLB_MULTIHIT(void);
+
 #endif
diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
new file mode 100644
index 000000000000..077c9f9ed8d0
--- /dev/null
+++ b/drivers/misc/lkdtm/powerpc.c
@@ -0,0 +1,120 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include "lkdtm.h"
+#include <linux/slab.h>
+#include <linux/vmalloc.h>
+#include <asm/mmu.h>
+
+/* Inserts new slb entries */
+static void insert_slb_entry(unsigned long p, int ssize, int page_size)
+{
+	unsigned long flags;
+
+	flags = SLB_VSID_KERNEL | mmu_psize_defs[page_size].sllp;
+	preempt_disable();
+
+	asm volatile("slbmte %0,%1" :
+		     : "r" (mk_vsid_data(p, ssize, flags)),
+		       "r" (mk_esid_data(p, ssize, SLB_NUM_BOLTED))
+		     : "memory");
+
+	asm volatile("slbmte %0,%1" :
+			: "r" (mk_vsid_data(p, ssize, flags)),
+			  "r" (mk_esid_data(p, ssize, SLB_NUM_BOLTED + 1))
+			: "memory");
+	preempt_enable();
+}
+
+/* Inject slb multihit on vmalloc-ed address i.e 0xD00... */
+static int inject_vmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = vmalloc(PAGE_SIZE);
+	if (!p)
+		return -ENOMEM;
+
+	insert_slb_entry((unsigned long)p, MMU_SEGSIZE_1T, mmu_vmalloc_psize);
+	/*
+	 * This triggers exception, If handled correctly we must recover
+	 * from this error.
+	 */
+	p[0] = '!';
+	vfree(p);
+	return 0;
+}
+
+/* Inject slb multihit on kmalloc-ed address i.e 0xC00... */
+static int inject_kmalloc_slb_multihit(void)
+{
+	char *p;
+
+	p = kmalloc(2048, GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	insert_slb_entry((unsigned long)p, MMU_SEGSIZE_1T, mmu_linear_psize);
+	/*
+	 * This triggers exception, If handled correctly we must recover
+	 * from this error.
+	 */
+	p[0] = '!';
+	kfree(p);
+	return 0;
+}
+
+/*
+ * Few initial SLB entries are bolted. Add a test to inject
+ * multihit in bolted entry 0.
+ */
+static void insert_dup_slb_entry_0(void)
+{
+	unsigned long test_address = PAGE_OFFSET, *test_ptr;
+	unsigned long esid, vsid;
+	unsigned long i = 0;
+
+	test_ptr = (unsigned long *)test_address;
+	preempt_disable();
+
+	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
+	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
+
+	/* for i !=0 we would need to mask out the old entry number */
+	asm volatile("slbmte %0,%1" :
+			: "r" (vsid),
+			  "r" (esid | SLB_NUM_BOLTED)
+			: "memory");
+
+	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
+	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
+
+	/* for i !=0 we would need to mask out the old entry number */
+	asm volatile("slbmte %0,%1" :
+			: "r" (vsid),
+			  "r" (esid | (SLB_NUM_BOLTED + 1))
+			: "memory");
+
+	pr_info("%s accessing test address 0x%lx: 0x%lx\n",
+		__func__, test_address, *test_ptr);
+
+	preempt_enable();
+}
+
+void lkdtm_PPC_SLB_MULTIHIT(void)
+{
+	if (!radix_enabled()) {
+		pr_info("Injecting SLB multihit errors\n");
+		/*
+		 * These need not be separate tests, And they do pretty
+		 * much same thing. In any case we must recover from the
+		 * errors introduced by these functions, machine would not
+		 * survive these tests in case of failure to handle.
+		 */
+		inject_vmalloc_slb_multihit();
+		inject_kmalloc_slb_multihit();
+		insert_dup_slb_entry_0();
+		pr_info("Recovered from SLB multihit errors\n");
+	} else {
+		pr_err("XFAIL: This test is for ppc64 and with hash mode MMU only\n");
+	}
+}
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index 74a8d329a72c..18e4599863c0 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -68,3 +68,4 @@ USERCOPY_STACK_BEYOND
 USERCOPY_KERNEL
 STACKLEAK_ERASING OK: the rest of the thread stack is properly erased
 CFI_FORWARD_PROTO
+PPC_SLB_MULTIHIT Recovered
-- 
2.26.2

