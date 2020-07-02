Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46576212D91
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 22:04:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yTb14XsGzDr6d
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 06:04:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yTND1FxNzDr1g
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:55:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49yTNC4x9yz9CvR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 05:55:23 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49yTNC0VTCz9sRk; Fri,  3 Jul 2020 05:55:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49yTNB1rVsz9sPF
 for <linuxppc-dev@ozlabs.org>; Fri,  3 Jul 2020 05:55:22 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062JqKNL091134; Thu, 2 Jul 2020 15:55:12 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320xb07ryc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:55:11 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062JqNuP091495;
 Thu, 2 Jul 2020 15:55:11 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 320xb07rxj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 15:55:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062JkjGQ031346;
 Thu, 2 Jul 2020 19:55:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 31wwr8egnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 19:55:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 062JrjV858065282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 19:53:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD3EFA4055;
 Thu,  2 Jul 2020 19:55:05 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87B84A4051;
 Thu,  2 Jul 2020 19:55:02 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.21.221])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jul 2020 19:55:02 +0000 (GMT)
Subject: [PATCH v2 04/12] ppc64/kexec_file: avoid stomping memory used by
 special regions
From: Hari Bathini <hbathini@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 03 Jul 2020 01:25:01 +0530
Message-ID: <159371969596.21555.1528829517874029614.stgit@hbathini.in.ibm.com>
In-Reply-To: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
References: <159371956443.21555.18251597651350106920.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_09:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 cotscore=-2147483648 suspectscore=0 impostorscore=0 priorityscore=1501
 mlxscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007020129
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
 Petr Tesarik <ptesarik@suse.cz>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, lkml <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@ozlabs.org>, Mimi Zohar <zohar@linux.ibm.com>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

crashkernel region could have an overlap with special memory regions
like  opal, rtas, tce-table & such. These regions are referred to as
exclude memory ranges. Setup this ranges during image probe in order
to avoid them while finding the buffer for different kdump segments.
Override arch_kexec_locate_mem_hole() to locate a memory hole taking
these ranges into account.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Did arch_kexec_locate_mem_hole() override to handle special regions.
* Ensured holes in the memory are accounted for while locating mem hole.
* Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
  the new prototype for these functions.


 arch/powerpc/include/asm/crashdump-ppc64.h |   10 +
 arch/powerpc/include/asm/kexec.h           |    7 -
 arch/powerpc/kexec/elf_64.c                |    7 +
 arch/powerpc/kexec/file_load_64.c          |  324 ++++++++++++++++++++++++++++
 4 files changed, 344 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/include/asm/crashdump-ppc64.h

diff --git a/arch/powerpc/include/asm/crashdump-ppc64.h b/arch/powerpc/include/asm/crashdump-ppc64.h
new file mode 100644
index 0000000..90deb46
--- /dev/null
+++ b/arch/powerpc/include/asm/crashdump-ppc64.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_POWERPC_CRASHDUMP_PPC64_H
+#define _ASM_POWERPC_CRASHDUMP_PPC64_H
+
+/* min & max addresses for kdump load segments */
+#define KDUMP_BUF_MIN		(crashk_res.start)
+#define KDUMP_BUF_MAX		((crashk_res.end < ppc64_rma_size) ? \
+				 crashk_res.end : (ppc64_rma_size - 1))
+
+#endif /* __ASM_POWERPC_CRASHDUMP_PPC64_H */
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 7008ea1..bf47a01 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -100,14 +100,16 @@ void relocate_new_kernel(unsigned long indirection_page, unsigned long reboot_co
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_elf64_ops;
 
-#ifdef CONFIG_IMA_KEXEC
 #define ARCH_HAS_KIMAGE_ARCH
 
 struct kimage_arch {
+	struct crash_mem *exclude_ranges;
+
+#ifdef CONFIG_IMA_KEXEC
 	phys_addr_t ima_buffer_addr;
 	size_t ima_buffer_size;
-};
 #endif
+};
 
 int setup_purgatory(struct kimage *image, const void *slave_code,
 		    const void *fdt, unsigned long kernel_load_addr,
@@ -125,6 +127,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 			unsigned long initrd_load_addr,
 			unsigned long initrd_len, const char *cmdline);
 #endif /* CONFIG_PPC64 */
+
 #endif /* CONFIG_KEXEC_FILE */
 
 #else /* !CONFIG_KEXEC_CORE */
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index 23ad04c..c695f94 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -22,6 +22,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <asm/crashdump-ppc64.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
@@ -46,6 +47,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out;
 
+	if (image->type == KEXEC_TYPE_CRASH) {
+		/* min & max buffer values for kdump case */
+		kbuf.buf_min = pbuf.buf_min = KDUMP_BUF_MIN;
+		kbuf.buf_max = pbuf.buf_max = KDUMP_BUF_MAX;
+	}
+
 	ret = kexec_elf_load(image, &ehdr, &elf_info, &kbuf, &kernel_load_addr);
 	if (ret)
 		goto out;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e6bff960..932e0e5 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -17,6 +17,9 @@
 #include <linux/kexec.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/memblock.h>
+#include <asm/kexec_ranges.h>
+#include <asm/crashdump-ppc64.h>
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&kexec_elf64_ops,
@@ -24,6 +27,240 @@ const struct kexec_file_ops * const kexec_file_loaders[] = {
 };
 
 /**
+ * get_exclude_memory_ranges - Get exclude memory ranges. This list includes
+ *                             regions like opal/rtas, tce-table, initrd,
+ *                             kernel, htab which should be avoided while
+ *                             setting up kexec load segments.
+ * @mem_ranges:                Range list to add the memory ranges to.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
+{
+	int ret;
+
+	ret = add_tce_mem_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_initrd_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_htab_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_kernel_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_rtas_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_opal_mem_range(mem_ranges);
+	if (ret)
+		goto out;
+
+	ret = add_reserved_ranges(mem_ranges);
+	if (ret)
+		goto out;
+
+	/* exclude memory ranges should be sorted for easy lookup */
+	sort_memory_ranges(*mem_ranges, true);
+out:
+	if (ret)
+		pr_err("Failed to setup exclude memory ranges\n");
+	return ret;
+}
+
+/**
+ * __locate_mem_hole_top_down - Looks top down for a large enough memory hole
+ *                              in the memory regions between buf_min & buf_max
+ *                              for the buffer. If found, sets kbuf->mem.
+ * @kbuf:                       Buffer contents and memory parameters.
+ * @buf_min:                    Minimum address for the buffer.
+ * @buf_max:                    Maximum address for the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
+				      u64 buf_min, u64 buf_max)
+{
+	int ret = -EADDRNOTAVAIL;
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range_rev(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			       MEMBLOCK_NONE, &start, &end, NULL) {
+		if (start > buf_max)
+			continue;
+
+		/* Memory hole not found */
+		if (end < buf_min)
+			break;
+
+		/* Adjust memory region based on the given range */
+		if (start < buf_min)
+			start = buf_min;
+		if (end > buf_max)
+			end = buf_max;
+
+		start = ALIGN(start, kbuf->buf_align);
+		if (start < end && (end - start + 1) >= kbuf->memsz) {
+			/* Suitable memory range found. Set kbuf->mem */
+			kbuf->mem = ALIGN_DOWN(end - kbuf->memsz + 1,
+					       kbuf->buf_align);
+			ret = 0;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * locate_mem_hole_top_down_ppc64 - Skip special memory regions to find a
+ *                                  suitable buffer with top down approach.
+ * @kbuf:                           Buffer contents and memory parameters.
+ * @buf_min:                        Minimum address for the buffer.
+ * @buf_max:                        Maximum address for the buffer.
+ * @emem:                           Exclude memory ranges.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int locate_mem_hole_top_down_ppc64(struct kexec_buf *kbuf,
+					  u64 buf_min, u64 buf_max,
+					  const struct crash_mem *emem)
+{
+	int i, ret = 0, err = -EADDRNOTAVAIL;
+	u64 start, end, tmin, tmax;
+
+	tmax = buf_max;
+	for (i = (emem->nr_ranges - 1); i >= 0; i--) {
+		start = emem->ranges[i].start;
+		end = emem->ranges[i].end;
+
+		if (start > tmax)
+			continue;
+
+		if (end < tmax) {
+			tmin = (end < buf_min ? buf_min : end + 1);
+			ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
+			if (!ret)
+				return 0;
+		}
+
+		tmax = start - 1;
+
+		if (tmax < buf_min) {
+			ret = err;
+			break;
+		}
+		ret = 0;
+	}
+
+	if (!ret) {
+		tmin = buf_min;
+		ret = __locate_mem_hole_top_down(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
+/**
+ * __locate_mem_hole_bottom_up - Looks bottom up for a large enough memory hole
+ *                               in the memory regions between buf_min & buf_max
+ *                               for the buffer. If found, sets kbuf->mem.
+ * @kbuf:                        Buffer contents and memory parameters.
+ * @buf_min:                     Minimum address for the buffer.
+ * @buf_max:                     Maximum address for the buffer.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
+				       u64 buf_min, u64 buf_max)
+{
+	int ret = -EADDRNOTAVAIL;
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &memblock.memory, NULL, NUMA_NO_NODE,
+			   MEMBLOCK_NONE, &start, &end, NULL) {
+		if (end < buf_min)
+			continue;
+
+		/* Memory hole not found */
+		if (start > buf_max)
+			break;
+
+		/* Adjust memory region based on the given range */
+		if (start < buf_min)
+			start = buf_min;
+		if (end > buf_max)
+			end = buf_max;
+
+		start = ALIGN(start, kbuf->buf_align);
+		if (start < end && (end - start + 1) >= kbuf->memsz) {
+			/* Suitable memory range found. Set kbuf->mem */
+			kbuf->mem = start;
+			ret = 0;
+			break;
+		}
+	}
+
+	return ret;
+}
+
+/**
+ * locate_mem_hole_bottom_up_ppc64 - Skip special memory regions to find a
+ *                                   suitable buffer with bottom up approach.
+ * @kbuf:                            Buffer contents and memory parameters.
+ * @buf_min:                         Minimum address for the buffer.
+ * @buf_max:                         Maximum address for the buffer.
+ * @emem:                            Exclude memory ranges.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+static int locate_mem_hole_bottom_up_ppc64(struct kexec_buf *kbuf,
+					   u64 buf_min, u64 buf_max,
+					   const struct crash_mem *emem)
+{
+	int i, ret = 0, err = -EADDRNOTAVAIL;
+	u64 start, end, tmin, tmax;
+
+	tmin = buf_min;
+	for (i = 0; i < emem->nr_ranges; i++) {
+		start = emem->ranges[i].start;
+		end = emem->ranges[i].end;
+
+		if (end < tmin)
+			continue;
+
+		if (start > tmin) {
+			tmax = (start > buf_max ? buf_max : start - 1);
+			ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
+			if (!ret)
+				return 0;
+		}
+
+		tmin = end + 1;
+
+		if (tmin > buf_max) {
+			ret = err;
+			break;
+		}
+		ret = 0;
+	}
+
+	if (!ret) {
+		tmax = buf_max;
+		ret = __locate_mem_hole_bottom_up(kbuf, tmin, tmax);
+	}
+	return ret;
+}
+
+/**
  * setup_purgatory_ppc64 - initialize PPC64 specific purgatory's global
  *                         variables and call setup_purgatory() to initialize
  *                         common global variable.
@@ -89,6 +326,67 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 }
 
 /**
+ * arch_kexec_locate_mem_hole - Skip special memory regions like rtas, opal,
+ *                              tce-table, reserved-ranges & such (exclude
+ *                              memory ranges) as they can't be used for kexec
+ *                              segment buffer. Sets kbuf->mem when a suitable
+ *                              memory hole is found.
+ * @kbuf:                       Buffer contents and memory parameters.
+ *
+ * Assumes minimum of PAGE_SIZE alignment for kbuf->memsz & kbuf->buf_align.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
+{
+	struct crash_mem **emem;
+	u64 buf_min, buf_max;
+	int ret;
+
+	/*
+	 * Use the generic kexec_locate_mem_hole for regular
+	 * kexec_file_load syscall
+	 */
+	if (kbuf->image->type != KEXEC_TYPE_CRASH)
+		return kexec_locate_mem_hole(kbuf);
+
+	/* Look up the exclude ranges list while locating the memory hole */
+	emem = &(kbuf->image->arch.exclude_ranges);
+	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
+		pr_warn("No exclude range list. Using the default locate mem hole method\n");
+		return 0;
+	}
+
+	/* Segments for kdump kernel should be within crashkernel region */
+	buf_min = (kbuf->buf_min < crashk_res.start ?
+		   crashk_res.start : kbuf->buf_min);
+	buf_max = (kbuf->buf_max > crashk_res.end ?
+		   crashk_res.end : kbuf->buf_max);
+
+	if (buf_min > buf_max) {
+		pr_err("Invalid buffer min and/or max values\n");
+		return -EINVAL;
+	}
+
+	if (kbuf->top_down)
+		ret = locate_mem_hole_top_down_ppc64(kbuf, buf_min, buf_max,
+						     *emem);
+	else
+		ret = locate_mem_hole_bottom_up_ppc64(kbuf, buf_min, buf_max,
+						      *emem);
+
+	/* Add the buffer allocated to the exclude list for the next lookup */
+	if (!ret) {
+		add_mem_range(emem, kbuf->mem, kbuf->memsz);
+		sort_memory_ranges(*emem, true);
+	} else {
+		pr_err("Failed to locate memory buffer of size %lu\n",
+		       kbuf->memsz);
+	}
+	return ret;
+}
+
+/**
  * arch_kexec_kernel_image_probe - Does additional handling needed to setup
  *                                 kexec segments.
  * @image:                         kexec image being loaded.
@@ -100,9 +398,31 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
 int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 				  unsigned long buf_len)
 {
-	/* We don't support crash kernels yet. */
-	if (image->type == KEXEC_TYPE_CRASH)
+	if (image->type == KEXEC_TYPE_CRASH) {
+		int ret;
+
+		/* Get exclude memory ranges needed for setting up kdump segments */
+		ret = get_exclude_memory_ranges(&(image->arch.exclude_ranges));
+		if (ret)
+			pr_err("Failed to setup exclude memory ranges for buffer lookup\n");
+		/* Return this until all changes for panic kernel are in */
 		return -EOPNOTSUPP;
+	}
 
 	return kexec_image_probe_default(image, buf, buf_len);
 }
+
+/**
+ * arch_kimage_file_post_load_cleanup - Frees up all the allocations done
+ *                                      while loading the image.
+ * @image:                              kexec image being loaded.
+ *
+ * Returns 0 on success, negative errno on error.
+ */
+int arch_kimage_file_post_load_cleanup(struct kimage *image)
+{
+	kfree(image->arch.exclude_ranges);
+	image->arch.exclude_ranges = NULL;
+
+	return kexec_image_post_load_cleanup_default(image);
+}

