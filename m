Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C622E258
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 21:44:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFD0N0CnTzDqVx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 05:44:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFCrw5XY0zF0YY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:37:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BFCrw1fsXz8tRl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 05:37:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BFCrw00Ycz9sRR; Mon, 27 Jul 2020 05:37:52 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4BFCrv3ynfz9sRN
 for <linuxppc-dev@ozlabs.org>; Mon, 27 Jul 2020 05:37:51 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06QJYGqE038175; Sun, 26 Jul 2020 15:37:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gdmbtuhs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:37:42 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06QJZXeH039869;
 Sun, 26 Jul 2020 15:37:42 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32gdmbtuhb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 15:37:42 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06QJb5rM016212;
 Sun, 26 Jul 2020 19:37:39 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 32gcpx1fgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 26 Jul 2020 19:37:39 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06QJbabN50266236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 26 Jul 2020 19:37:36 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 98F7942042;
 Sun, 26 Jul 2020 19:37:36 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C8D34203F;
 Sun, 26 Jul 2020 19:37:33 +0000 (GMT)
Received: from [192.168.0.8] (unknown [9.85.82.224])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun, 26 Jul 2020 19:37:32 +0000 (GMT)
Subject: [RESEND PATCH v5 03/11] powerpc/kexec_file: add helper functions for
 getting memory ranges
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 27 Jul 2020 01:07:31 +0530
Message-ID: <159579222211.5790.10294144969496171475.stgit@hbathini>
In-Reply-To: <159579157320.5790.6748078824637688685.stgit@hbathini>
References: <159579157320.5790.6748078824637688685.stgit@hbathini>
User-Agent: StGit/0.21
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-26_12:2020-07-24,
 2020-07-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007260154
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
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, Dave Young <dyoung@redhat.com>,
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


 arch/powerpc/include/asm/kexec_ranges.h |   25 ++
 arch/powerpc/kexec/Makefile             |    2 
 arch/powerpc/kexec/ranges.c             |  417 +++++++++++++++++++++++++++++++
 3 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/kexec_ranges.h
 create mode 100644 arch/powerpc/kexec/ranges.c

diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
new file mode 100644
index 000000000000..78f3111e4e74
--- /dev/null
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -0,0 +1,25 @@
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
+#ifdef CONFIG_PPC_BOOK3S_64
+int add_htab_mem_range(struct crash_mem **mem_ranges);
+#else
+static inline int add_htab_mem_range(struct crash_mem **mem_ranges)
+{
+	return 0;
+}
+#endif
+int add_kernel_mem_range(struct crash_mem **mem_ranges);
+int add_rtas_mem_range(struct crash_mem **mem_ranges);
+int add_opal_mem_range(struct crash_mem **mem_ranges);
+int add_reserved_ranges(struct crash_mem **mem_ranges);
+void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
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
index 000000000000..21bea1b78443
--- /dev/null
+++ b/arch/powerpc/kexec/ranges.c
@@ -0,0 +1,417 @@
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
+#undef DEBUG
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
+ * get_mem_rngs_size - Get the allocated size of mrngs based on
+ *                     max_nr_ranges and chunk size.
+ * @mrngs:             Memory ranges.
+ *
+ * Returns the maximum size of @mrngs.
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
+	pr_debug("Added memory range [%#016llx - %#016llx] at index %d\n",
+		 base, base + size - 1, mrngs->nr_ranges);
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
+	int ret = 0;
+
+	for_each_node_by_type(dn, "pci") {
+		u64 base;
+		u32 size;
+		int rc;
+
+		/*
+		 * It is ok to have pci nodes without tce. So, ignore
+		 * any read errors here.
+		 */
+		rc = of_property_read_u64(dn, "linux,tce-base", &base);
+		rc |= of_property_read_u32(dn, "linux,tce-size", &size);
+		if (rc)
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
+	char *str;
+	int ret;
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
+#ifdef CONFIG_PPC_BOOK3S_64
+/**
+ * add_htab_mem_range - Adds htab range to the given memory ranges list,
+ *                      if it exists
+ * @mem_ranges:         Range list to add the memory range to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int add_htab_mem_range(struct crash_mem **mem_ranges)
+{
+	if (!htab_address)
+		return 0;
+
+	return add_mem_range(mem_ranges, __pa(htab_address), htab_size_bytes);
+}
+#endif
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
+	return add_mem_range(mem_ranges, 0, __pa(_end));
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
+			goto out;
+
+		ret = add_mem_range(mem_ranges, base, size);
+	}
+
+out:
+	of_node_put(dn);
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
+			goto out;
+
+		ret = add_mem_range(mem_ranges, base, size);
+	}
+
+out:
+	of_node_put(dn);
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
+	int n_mem_addr_cells, n_mem_size_cells, i, len, cells, ret = 0;
+	const __be32 *prop;
+
+	prop = of_get_property(of_root, "reserved-ranges", &len);
+	if (!prop)
+		return 0;
+
+	of_node_get(of_root);
+	n_mem_addr_cells = of_n_addr_cells(of_root);
+	n_mem_size_cells = of_n_size_cells(of_root);
+	cells = n_mem_addr_cells + n_mem_size_cells;
+
+	/* Each reserved range is an (address,size) pair */
+	for (i = 0; i < (len / (sizeof(*prop) * cells)); i++) {
+		u64 base, size;
+
+		base = of_read_number(prop + (i * cells), n_mem_addr_cells);
+		size = of_read_number(prop + (i * cells) + n_mem_addr_cells,
+				      n_mem_size_cells);
+
+		ret = add_mem_range(mem_ranges, base, size);
+		if (ret)
+			break;
+	}
+
+	of_node_put(of_root);
+	return ret;
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
+ * @mem_ranges:         Range list to sort.
+ * @merge:              If true, merge the list after sorting.
+ *
+ * Returns nothing.
+ */
+void sort_memory_ranges(struct crash_mem *mrngs, bool merge)
+{
+	int i;
+
+	if (!mrngs)
+		return;
+
+	/* Sort the ranges in-place */
+	sort(&(mrngs->ranges[0]), mrngs->nr_ranges, sizeof(mrngs->ranges[0]),
+	     rngcmp, NULL);
+
+	if (merge)
+		__merge_memory_ranges(mrngs);
+
+	/* For debugging purpose */
+	pr_debug("Memory ranges:\n");
+	for (i = 0; i < mrngs->nr_ranges; i++) {
+		pr_debug("\t[%03d][%#016llx - %#016llx]\n", i,
+			 mrngs->ranges[i].start,
+			 mrngs->ranges[i].end);
+	}
+}


