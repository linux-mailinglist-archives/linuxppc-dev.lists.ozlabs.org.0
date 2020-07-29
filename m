Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE82231DA4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 13:47:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGsGq0MnkzDqcL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jul 2020 21:47:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGs6T3hyLzDqtK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:40:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BGs6T23Jjz9CLb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jul 2020 21:40:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BGs6T0xf6z9sRN; Wed, 29 Jul 2020 21:40:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BGs6S4LzDz9sSd
 for <linuxppc-dev@ozlabs.org>; Wed, 29 Jul 2020 21:40:16 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06TBWnja100137; Wed, 29 Jul 2020 07:40:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2k6vh7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:40:11 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06TBXX8u105177;
 Wed, 29 Jul 2020 07:40:10 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jj2k6vg4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 07:40:10 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06TBZO0I013426;
 Wed, 29 Jul 2020 11:40:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 32gcy4n02e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Jul 2020 11:40:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06TBe5V927329022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Jul 2020 11:40:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3ACF7AE058;
 Wed, 29 Jul 2020 11:40:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E06E6AE057;
 Wed, 29 Jul 2020 11:40:01 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.79.217.86])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Jul 2020 11:40:01 +0000 (GMT)
Subject: [PATCH v6 03/11] powerpc/kexec_file: add helper functions for getting
 memory ranges
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 29 Jul 2020 17:10:00 +0530
Message-ID: <159602279194.575379.8526552316948643550.stgit@hbathini>
In-Reply-To: <159602259854.575379.16910915605574571585.stgit@hbathini>
References: <159602259854.575379.16910915605574571585.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-29_04:2020-07-29,
 2020-07-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007290071
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
Cc: Pingfan Liu <piliu@redhat.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mimi Zohar <zohar@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kexec case, the kernel to be loaded uses the same memory layout as
the running kernel. So, passing on the DT of the running kernel would
be good enough.

But in case of kdump, different memory ranges are needed to manage
loading the kdump kernel, booting into it and exporting the elfcore
of the crashing kernel. The ranges are exclude memory ranges, usable
memory ranges, reserved memory ranges and crash memory ranges.

Exclude memory ranges specify the list of memory ranges to avoid while
loading kdump segments. Usable memory ranges list the memory ranges
that could be used for booting kdump kernel. Reserved memory ranges
list the memory regions for the loading kernel's reserve map. Crash
memory ranges list the memory ranges to be exported as the crashing
kernel's elfcore.

Add helper functions for setting up the above mentioned memory ranges.
This helpers facilitate in understanding the subsequent changes better
and make it easy to setup the different memory ranges listed above, as
and when appropriate.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
Tested-by: Pingfan Liu <piliu@redhat.com>
Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
---

v5 -> v6:
* Dropped email address from copyright header of the new file being
  added: arch/powerpc/kexec/ranges.c
* Changed mrngs to mem_rngs. Using the convention mem_ranges for
  'struct crash_mem **' types & mem_rngs for 'struct crash_mem *'
  for easy readibility.
* Updated add_opal_mem_range() & add_rtas_mem_range() functions without
  goto statements.
* Moved implementation of all add_foo_mem_range(s)() functions to
  patch 04/11, where they are used.
* Fixed reference count leak in add_tce_mem_ranges() function and also
  updated error handling in reading tce table base & sizes.

v4 -> v5:
* Added Reviewed-by tag from Thiago.
* Added the missing "#ifdef CONFIG_PPC_BOOK3S_64" around add_htab_mem_range()
  function in arch/powerpc/kexec/ranges.c file.
* add_tce_mem_ranges() function returned error when tce table is not found
  in a pci node. This is wrong as pci nodes may not always have tce tables
  (KVM guests, for example). Fixed it by ignoring error in reading tce
  table base/size while returning from the function.

v3 -> v4:
* Updated sort_memory_ranges() function to reuse sort() from lib/sort.c
  and addressed other review comments from Thiago.

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Added an option to merge ranges while sorting to minimize reallocations
  for memory ranges list.
* Dropped within_crashkernel option for add_opal_mem_range() &
  add_rtas_mem_range() as it is not really needed.


 arch/powerpc/include/asm/kexec_ranges.h |   11 +
 arch/powerpc/kexec/Makefile             |    2 
 arch/powerpc/kexec/ranges.c             |  235 +++++++++++++++++++++++++++++++
 3 files changed, 247 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/kexec/ranges.c

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
new file mode 100644
index 000000000000..35ae31a7a4de
--- /dev/null
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_KEXEC_RANGES_H
+#define _ASM_POWERPC_KEXEC_RANGES_H
+
+#define MEM_RANGE_CHUNK_SZ		2048	/* Memory ranges size chunk */
+
+void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
+struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
+int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+
+#endif /* _ASM_POWERPC_KEXEC_RANGES_H */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 67c355329457..4aff6846c772 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -7,7 +7,7 @@ obj-y				+= core.o crash.o core_$(BITS).o
 
 obj-$(CONFIG_PPC32)		+= relocate_32.o
 
-obj-$(CONFIG_KEXEC_FILE)	+= file_load.o file_load_$(BITS).o elf_$(BITS).o
+obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS).o
 
 ifdef CONFIG_HAVE_IMA_KEXEC
 ifdef CONFIG_IMA
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
new file mode 100644
index 000000000000..dc3ce036f416
--- /dev/null
+++ b/arch/powerpc/kexec/ranges.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * powerpc code to implement the kexec_file_load syscall
+ *
+ * Copyright (C) 2004  Adam Litke (agl@us.ibm.com)
+ * Copyright (C) 2004  IBM Corp.
+ * Copyright (C) 2004,2005  Milton D Miller II, IBM Corporation
+ * Copyright (C) 2005  R Sharada (sharada@in.ibm.com)
+ * Copyright (C) 2006  Mohan Kumar M (mohan@in.ibm.com)
+ * Copyright (C) 2020  IBM Corporation
+ *
+ * Based on kexec-tools' kexec-ppc64.c, fs2dt.c.
+ * Heavily modified for the kernel by
+ * Hari Bathini, IBM Corporation.
+ */
+
+#define pr_fmt(fmt) "kexec ranges: " fmt
+
+#include <linux/sort.h>
+#include <linux/kexec.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+#include <asm/sections.h>
+#include <asm/kexec_ranges.h>
+
+/**
+ * get_max_nr_ranges - Get the max no. of ranges crash_mem structure
+ *                     could hold, given the size allocated for it.
+ * @size:              Allocation size of crash_mem structure.
+ *
+ * Returns the maximum no. of ranges.
+ */
+static inline unsigned int get_max_nr_ranges(size_t size)
+{
+	return ((size - sizeof(struct crash_mem)) /
+		sizeof(struct crash_mem_range));
+}
+
+/**
+ * get_mem_rngs_size - Get the allocated size of mem_rngs based on
+ *                     max_nr_ranges and chunk size.
+ * @mem_rngs:          Memory ranges.
+ *
+ * Returns the maximum size of @mem_rngs.
+ */
+static inline size_t get_mem_rngs_size(struct crash_mem *mem_rngs)
+{
+	size_t size;
+
+	if (!mem_rngs)
+		return 0;
+
+	size = (sizeof(struct crash_mem) +
+		(mem_rngs->max_nr_ranges * sizeof(struct crash_mem_range)));
+
+	/*
+	 * Memory is allocated in size multiple of MEM_RANGE_CHUNK_SZ.
+	 * So, align to get the actual length.
+	 */
+	return ALIGN(size, MEM_RANGE_CHUNK_SZ);
+}
+
+/**
+ * __add_mem_range - add a memory range to memory ranges list.
+ * @mem_ranges:      Range list to add the memory range to.
+ * @base:            Base address of the range to add.
+ * @size:            Size of the memory range to add.
+ *
+ * (Re)allocates memory, if needed.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
+{
+	struct crash_mem *mem_rngs = *mem_ranges;
+
+	if (!mem_rngs || (mem_rngs->nr_ranges == mem_rngs->max_nr_ranges)) {
+		mem_rngs = realloc_mem_ranges(mem_ranges);
+		if (!mem_rngs)
+			return -ENOMEM;
+	}
+
+	mem_rngs->ranges[mem_rngs->nr_ranges].start = base;
+	mem_rngs->ranges[mem_rngs->nr_ranges].end = base + size - 1;
+	pr_debug("Added memory range [%#016llx - %#016llx] at index %d\n",
+		 base, base + size - 1, mem_rngs->nr_ranges);
+	mem_rngs->nr_ranges++;
+	return 0;
+}
+
+/**
+ * __merge_memory_ranges - Merges the given memory ranges list.
+ * @mem_rngs:              Range list to merge.
+ *
+ * Assumes a sorted range list.
+ *
+ * Returns nothing.
+ */
+static void __merge_memory_ranges(struct crash_mem *mem_rngs)
+{
+	struct crash_mem_range *ranges;
+	int i, idx;
+
+	if (!mem_rngs)
+		return;
+
+	idx = 0;
+	ranges = &(mem_rngs->ranges[0]);
+	for (i = 1; i < mem_rngs->nr_ranges; i++) {
+		if (ranges[i].start <= (ranges[i-1].end + 1))
+			ranges[idx].end = ranges[i].end;
+		else {
+			idx++;
+			if (i == idx)
+				continue;
+
+			ranges[idx] = ranges[i];
+		}
+	}
+	mem_rngs->nr_ranges = idx + 1;
+}
+
+/* cmp_func_t callback to sort ranges with sort() */
+static int rngcmp(const void *_x, const void *_y)
+{
+	const struct crash_mem_range *x = _x, *y = _y;
+
+	if (x->start > y->start)
+		return 1;
+	if (x->start < y->start)
+		return -1;
+	return 0;
+}
+
+/**
+ * sort_memory_ranges - Sorts the given memory ranges list.
+ * @mem_rngs:           Range list to sort.
+ * @merge:              If true, merge the list after sorting.
+ *
+ * Returns nothing.
+ */
+void sort_memory_ranges(struct crash_mem *mem_rngs, bool merge)
+{
+	int i;
+
+	if (!mem_rngs)
+		return;
+
+	/* Sort the ranges in-place */
+	sort(&(mem_rngs->ranges[0]), mem_rngs->nr_ranges,
+	     sizeof(mem_rngs->ranges[0]), rngcmp, NULL);
+
+	if (merge)
+		__merge_memory_ranges(mem_rngs);
+
+	/* For debugging purpose */
+	pr_debug("Memory ranges:\n");
+	for (i = 0; i < mem_rngs->nr_ranges; i++) {
+		pr_debug("\t[%03d][%#016llx - %#016llx]\n", i,
+			 mem_rngs->ranges[i].start,
+			 mem_rngs->ranges[i].end);
+	}
+}
+
+/**
+ * realloc_mem_ranges - reallocate mem_ranges with size incremented
+ *                      by MEM_RANGE_CHUNK_SZ. Frees up the old memory,
+ *                      if memory allocation fails.
+ * @mem_ranges:         Memory ranges to reallocate.
+ *
+ * Returns pointer to reallocated memory on success, NULL otherwise.
+ */
+struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges)
+{
+	struct crash_mem *mem_rngs = *mem_ranges;
+	unsigned int nr_ranges;
+	size_t size;
+
+	size = get_mem_rngs_size(mem_rngs);
+	nr_ranges = mem_rngs ? mem_rngs->nr_ranges : 0;
+
+	size += MEM_RANGE_CHUNK_SZ;
+	mem_rngs = krealloc(*mem_ranges, size, GFP_KERNEL);
+	if (!mem_rngs) {
+		kfree(*mem_ranges);
+		*mem_ranges = NULL;
+		return NULL;
+	}
+
+	mem_rngs->nr_ranges = nr_ranges;
+	mem_rngs->max_nr_ranges = get_max_nr_ranges(size);
+	*mem_ranges = mem_rngs;
+
+	return mem_rngs;
+}
+
+/**
+ * add_mem_range - Updates existing memory range, if there is an overlap.
+ *                 Else, adds a new memory range.
+ * @mem_ranges:    Range list to add the memory range to.
+ * @base:          Base address of the range to add.
+ * @size:          Size of the memory range to add.
+ *
+ * (Re)allocates memory, if needed.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size)
+{
+	struct crash_mem *mem_rngs = *mem_ranges;
+	u64 mstart, mend, end;
+	unsigned int i;
+
+	if (!size)
+		return 0;
+
+	end = base + size - 1;
+
+	if (!mem_rngs || !(mem_rngs->nr_ranges))
+		return __add_mem_range(mem_ranges, base, size);
+
+	for (i = 0; i < mem_rngs->nr_ranges; i++) {
+		mstart = mem_rngs->ranges[i].start;
+		mend = mem_rngs->ranges[i].end;
+		if (base < mend && end > mstart) {
+			if (base < mstart)
+				mem_rngs->ranges[i].start = base;
+			if (end > mend)
+				mem_rngs->ranges[i].end = end;
+			return 0;
+		}
+	}
+
+	return __add_mem_range(mem_ranges, base, size);
+}


