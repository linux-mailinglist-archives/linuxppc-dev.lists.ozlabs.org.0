Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A3021DEBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:28:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B59bf2SwDzDqBW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 03:28:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B59Rg5JwDzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:21:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B59Rg3fHdz8tWb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 03:21:35 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B59Rg22B2z9sRW; Tue, 14 Jul 2020 03:21:35 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B59Rf6Lsqz9sR4
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Jul 2020 03:21:34 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06DH2lAT023491; Mon, 13 Jul 2020 13:21:28 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279x8a3qf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:21:28 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06DHH5Wp080634;
 Mon, 13 Jul 2020 13:21:27 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279x8a3pg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 13:21:27 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06DHLPhM032544;
 Mon, 13 Jul 2020 17:21:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 327527h7sq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 13 Jul 2020 17:21:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06DHLMV441222536
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jul 2020 17:21:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B5D6A404D;
 Mon, 13 Jul 2020 17:21:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1DE5EA4040;
 Mon, 13 Jul 2020 17:21:19 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.3.11])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jul 2020 17:21:18 +0000 (GMT)
Subject: [PATCH v3 03/12] powerpc/kexec_file: add helper functions for
 getting memory ranges
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 13 Jul 2020 22:51:18 +0530
Message-ID: <159466087136.24747.16494497863685481495.stgit@hbathini.in.ibm.com>
In-Reply-To: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-13_15:2020-07-13,
 2020-07-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007130120
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
 Nayna Jain <nayna@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>,
 Dave Young <dyoung@redhat.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In kexec case, the kernel to be loaded uses the same memory layout as
the running kernel. So, passing on the DT of the running kernel would
be good enough.

But in case of kdump, different memory ranges are needed to manage
loading the kdump kernel, booting into it and exporting the elfcore
of the crashing kernel. The ranges are exlude memory ranges, usable
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
---

v2 -> v3:
* Unchanged. Added Tested-by tag from Pingfan.

v1 -> v2:
* Added an option to merge ranges while sorting to minimize reallocations
  for memory ranges list.
* Dropped within_crashkernel option for add_opal_mem_range() &
  add_rtas_mem_range() as it is not really needed.


 arch/powerpc/include/asm/kexec_ranges.h |   18 +
 arch/powerpc/kexec/Makefile             |    2 
 arch/powerpc/kexec/ranges.c             |  397 +++++++++++++++++++++++++++++++
 3 files changed, 416 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/kexec/ranges.c

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
new file mode 100644
index 0000000..799dc40
--- /dev/null
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_KEXEC_RANGES_H
+#define _ASM_POWERPC_KEXEC_RANGES_H
+
+#define MEM_RANGE_CHUNK_SZ		2048	/* Memory ranges size chunk */
+
+struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
+int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
+int add_tce_mem_ranges(struct crash_mem **mem_ranges);
+int add_initrd_mem_range(struct crash_mem **mem_ranges);
+int add_htab_mem_range(struct crash_mem **mem_ranges);
+int add_kernel_mem_range(struct crash_mem **mem_ranges);
+int add_rtas_mem_range(struct crash_mem **mem_ranges);
+int add_opal_mem_range(struct crash_mem **mem_ranges);
+int add_reserved_ranges(struct crash_mem **mem_ranges);
+void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
+
+#endif /* _ASM_POWERPC_KEXEC_RANGES_H */
diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index 67c3553..4aff684 100644
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
index 0000000..a704819
--- /dev/null
+++ b/arch/powerpc/kexec/ranges.c
@@ -0,0 +1,397 @@
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
+ * Hari Bathini <hbathini@linux.ibm.com>.
+ */
+
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
+ * get_mem_rngs_size - Get the allocated size of mrngs based on
+ *                     max_nr_ranges and chunk size.
+ * @mrngs:             Memory ranges.
+ *
+ * Returns the maximum no. of ranges.
+ */
+static inline size_t get_mem_rngs_size(struct crash_mem *mrngs)
+{
+	size_t size;
+
+	if (!mrngs)
+		return 0;
+
+	size = (sizeof(struct crash_mem) +
+		(mrngs->max_nr_ranges * sizeof(struct crash_mem_range)));
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
+	struct crash_mem *mrngs = *mem_ranges;
+
+	if ((mrngs == NULL) || (mrngs->nr_ranges == mrngs->max_nr_ranges)) {
+		mrngs = realloc_mem_ranges(mem_ranges);
+		if (!mrngs)
+			return -ENOMEM;
+	}
+
+	mrngs->ranges[mrngs->nr_ranges].start = base;
+	mrngs->ranges[mrngs->nr_ranges].end = base + size - 1;
+	mrngs->nr_ranges++;
+	return 0;
+}
+
+/**
+ * __merge_memory_ranges - Merges the given memory ranges list.
+ * @mem_ranges:            Range list to merge.
+ *
+ * Assumes a sorted range list.
+ *
+ * Returns nothing.
+ */
+static void __merge_memory_ranges(struct crash_mem *mrngs)
+{
+	struct crash_mem_range *rngs;
+	int i, idx;
+
+	if (!mrngs)
+		return;
+
+	idx = 0;
+	rngs = &mrngs->ranges[0];
+	for (i = 1; i < mrngs->nr_ranges; i++) {
+		if (rngs[i].start <= (rngs[i-1].end + 1))
+			rngs[idx].end = rngs[i].end;
+		else {
+			idx++;
+			if (i == idx)
+				continue;
+
+			rngs[idx] = rngs[i];
+		}
+	}
+	mrngs->nr_ranges = idx + 1;
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
+	struct crash_mem *mrngs = *mem_ranges;
+	unsigned int nr_ranges;
+	size_t size;
+
+	size = get_mem_rngs_size(mrngs);
+	nr_ranges = mrngs ? mrngs->nr_ranges : 0;
+
+	size += MEM_RANGE_CHUNK_SZ;
+	mrngs = krealloc(*mem_ranges, size, GFP_KERNEL);
+	if (!mrngs) {
+		kfree(*mem_ranges);
+		*mem_ranges = NULL;
+		return NULL;
+	}
+
+	mrngs->nr_ranges = nr_ranges;
+	mrngs->max_nr_ranges = get_max_nr_ranges(size);
+	*mem_ranges = mrngs;
+
+	return mrngs;
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
+	struct crash_mem *mrngs = *mem_ranges;
+	u64 mstart, mend, end;
+	unsigned int i;
+
+	if (!size)
+		return 0;
+
+	end = base + size - 1;
+
+	if ((mrngs == NULL) || (mrngs->nr_ranges == 0))
+		return __add_mem_range(mem_ranges, base, size);
+
+	for (i = 0; i < mrngs->nr_ranges; i++) {
+		mstart = mrngs->ranges[i].start;
+		mend = mrngs->ranges[i].end;
+		if (base < mend && end > mstart) {
+			if (base < mstart)
+				mrngs->ranges[i].start = base;
+			if (end > mend)
+				mrngs->ranges[i].end = end;
+			return 0;
+		}
+	}
+
+	return __add_mem_range(mem_ranges, base, size);
+}
+
+/**
+ * add_tce_mem_ranges - Adds tce-table range to the given memory ranges list.
+ * @mem_ranges:         Range list to add the memory range(s) to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_tce_mem_ranges(struct crash_mem **mem_ranges)
+{
+	struct device_node *dn;
+	int ret;
+
+	for_each_node_by_type(dn, "pci") {
+		u64 base;
+		u32 size;
+
+		ret = of_property_read_u64(dn, "linux,tce-base", &base);
+		ret |= of_property_read_u32(dn, "linux,tce-size", &size);
+		if (!ret)
+			continue;
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * add_initrd_mem_range - Adds initrd range to the given memory ranges list,
+ *                        if the initrd was retained.
+ * @mem_ranges:           Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_initrd_mem_range(struct crash_mem **mem_ranges)
+{
+	u64 base, end;
+	int ret = 0;
+	char *str;
+
+	/* This range means something only if initrd was retained */
+	str = strstr(saved_command_line, "retain_initrd");
+	if (!str)
+		return 0;
+
+	ret = of_property_read_u64(of_chosen, "linux,initrd-start", &base);
+	ret |= of_property_read_u64(of_chosen, "linux,initrd-end", &end);
+	if (!ret)
+		ret = add_mem_range(mem_ranges, base, end - base + 1);
+	return ret;
+}
+
+/**
+ * add_htab_mem_range - Adds htab range to the given memory ranges list,
+ *                      if it exists
+ * @mem_ranges:         Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_htab_mem_range(struct crash_mem **mem_ranges)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	int ret;
+
+	if (!htab_address)
+		return 0;
+
+	ret = add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
+	return ret;
+#else
+	return 0;
+#endif
+}
+
+/**
+ * add_kernel_mem_range - Adds kernel text region to the given
+ *                        memory ranges list.
+ * @mem_ranges:           Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_kernel_mem_range(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_mem_range(mem_ranges, 0, __pa(_end));
+	return ret;
+}
+
+/**
+ * add_rtas_mem_range - Adds RTAS region to the given memory ranges list.
+ * @mem_ranges:         Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_rtas_mem_range(struct crash_mem **mem_ranges)
+{
+	struct device_node *dn;
+	int ret = 0;
+
+	dn = of_find_node_by_path("/rtas");
+	if (dn) {
+		u32 base, size;
+
+		ret = of_property_read_u32(dn, "linux,rtas-base", &base);
+		ret |= of_property_read_u32(dn, "rtas-size", &size);
+		if (ret)
+			return ret;
+
+		ret = add_mem_range(mem_ranges, base, size);
+	}
+	return ret;
+}
+
+/**
+ * add_opal_mem_range - Adds OPAL region to the given memory ranges list.
+ * @mem_ranges:         Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_opal_mem_range(struct crash_mem **mem_ranges)
+{
+	struct device_node *dn;
+	int ret = 0;
+
+	dn = of_find_node_by_path("/ibm,opal");
+	if (dn) {
+		u64 base, size;
+
+		ret = of_property_read_u64(dn, "opal-base-address", &base);
+		ret |= of_property_read_u64(dn, "opal-runtime-size", &size);
+		if (ret)
+			return ret;
+
+		ret = add_mem_range(mem_ranges, base, size);
+	}
+	return ret;
+}
+
+/**
+ * add_reserved_ranges - Adds "/reserved-ranges" regions exported by f/w
+ *                       to the given memory ranges list.
+ * @mem_ranges:          Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_reserved_ranges(struct crash_mem **mem_ranges)
+{
+	int i, len, ret = 0;
+	const __be32 *prop;
+
+	prop = of_get_property(of_root, "reserved-ranges", &len);
+	if (!prop)
+		return 0;
+
+	/*
+	 * Each reserved range is an (address,size) pair, 2 cells each,
+	 * totalling 4 cells per range.
+	 */
+	for (i = 0; i < len / (sizeof(*prop) * 4); i++) {
+		u64 base, size;
+
+		base = of_read_number(prop + (i * 4) + 0, 2);
+		size = of_read_number(prop + (i * 4) + 2, 2);
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			break;
+	}
+
+	return ret;
+}
+
+/**
+ * sort_memory_ranges - Sorts the given memory ranges list.
+ * @mem_ranges:         Range list to sort.
+ * @merge:              If true, merge the list after sorting.
+ *
+ * Returns nothing.
+ */
+void sort_memory_ranges(struct crash_mem *mrngs, bool merge)
+{
+	struct crash_mem_range *rngs;
+	struct crash_mem_range rng;
+	int i, j, idx;
+
+	if (!mrngs)
+		return;
+
+	/* Sort the ranges in-place */
+	rngs = &mrngs->ranges[0];
+	for (i = 0; i < mrngs->nr_ranges; i++) {
+		idx = i;
+		for (j = (i + 1); j < mrngs->nr_ranges; j++) {
+			if (rngs[idx].start > rngs[j].start)
+				idx = j;
+		}
+		if (idx != i) {
+			rng = rngs[idx];
+			rngs[idx] = rngs[i];
+			rngs[i] = rng;
+		}
+	}
+
+	if (merge)
+		__merge_memory_ranges(mrngs);
+}

